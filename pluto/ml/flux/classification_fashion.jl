using DataFrames,CSV,Pipe,Flux

df = DataFrame(CSV.File("../datasets/Myntra_Fasion_Clothing.csv")) |> dropmissing
dfv = @view df[!,:]
select!(dfv,[:BrandName,:Category,:Individual_category,:category_by_Gender])

labelObs(df,feature::Symbol, bias::Float64) = @pipe groupby(df, feature) |> combine(_,nrow => :count)|> 
subset(_,:count => ByRow( x -> x > 1))[:,feature] |> enumerate |> [(v => i + bias) for (i,v) in _ ] |> Dict


getObsNoCart(dfv,feature::Symbol) = @pipe groupby(df, feature) |> combine(_,nrow => :count)|> subset(_,:count => ByRow( x -> x == 1))[!,feature]

#Label obs to int
brandLabels = labelObs(dfv,:BrandName, 0.222)
categoryLables = labelObs(dfv,:Category, 0.555)
subCategoryLabel = labelObs(dfv,:Individual_category, 0.888)
genderLabel = labelObs(dfv,:category_by_Gender,-1.0)

removeBrandObs = getObsNoCart(dfv,:BrandName)
removeIndCartObs = getObsNoCart(dfv,:Individual_category)

subset!(df,:BrandName => b -> map(x -> !(x in removeBrandObs), b))
subset!(df,:Individual_category => b -> map(x -> !(x in removeIndCartObs), b))

#select
dataset = transform!(df,:BrandName => n -> map(x -> brandLabels[x],n),:Category => n -> map(x -> categoryLables[x],n),:Individual_category => n -> map(x -> subCategoryLabel[x],n), :category_by_Gender => n -> map(x -> genderLabel[x],n),renamecols = false)
df
intersectionRowId = length(df[!,:BrandName]) - 1000

trainData = dataset[1:intersectionRowId,:] |> Matrix
testData = dataset[intersectionRowId:end,:] |> Matrix


trainX = trainData[:,1:3]'
trainY = trainData[:,4:4]'

testX = testData[:,1:3]'
testY = testData[:,4:4]'

#model
model = Chain(Dense(3=>3),Dense(3=>1, sigmoid))

ps=Flux.params(model)

loss(x,y) = Flux.Losses.mse(model(x), y)

loss(trainX, trainY)

opt=Adam()

data=[(trainX, trainY)]
loss_history = []

epoch=1:700
for i in epoch
    Flux.train!(loss,ps,data,opt)
    loss_value = loss(trainX, trainY)
    push!(loss_history, loss_value)   
end


#calculate accuracy again test samples
inferY = []
length(eachcol(testX))

for i in 1:length(eachcol(testX))
    push!(inferY,Int(round(model(testX[:,i])[1])))
end  

testYVec = vec(testY)


res = []
for i in eachindex(inferY)
    push!(res,testYVec[i] == inferY[i] ? 1 : 0)
end


model(testX[:,900])
testY[:,900]

df
loss_history
sum(res)
accuracy = sum(res) * (100 / length(inferY))
