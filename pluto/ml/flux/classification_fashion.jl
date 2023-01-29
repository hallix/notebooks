using DataFrames,CSV,Pipe, Arrow, Random,Flux, Statistics
using Flux:onehot,onecold,Dense,sigmoid,Chain,onehotbatch

df = DataFrame(CSV.File("../datasets/Myntra_Fasion_Clothing.csv")) |> dropmissing
dfv = @view df[!,:]
select!(dfv,[:BrandName,:Category,:Individual_category,:category_by_Gender])

labelObs(df,feature::Symbol, offset::Int) = @pipe groupby(df, feature) |> combine(_,nrow => :count) |> 
_[:,feature] |> sort |> enumerate |> [(v => i + offset) for (i,v) in _ ] |> Dict

getObsNoCart(dfv,feature::Symbol) = @pipe groupby(df, feature) |> combine(_,nrow => :count)|> subset(_,:count => ByRow( x -> x == 1))[!,feature]

extractSortedLables(feature::Symbol) = @pipe groupby(df,feature) |> combine(_,nrow) |> _[:,1] |> sort!
#Label obs to int
offset = 0
brandLabels = labelObs(df,:BrandName, offset)
offset = maximum(brandLabels)[end]
categoryLables = labelObs(df,:Category, offset)
offset = maximum(categoryLables)[end]
subCategoryLabel = labelObs(df,:Individual_category,offset)
vocaburarySize = maximum(subCategoryLabel)[end]
genderLabel = extractSortedLables(:category_by_Gender)

removeBrandObs = getObsNoCart(dfv,:BrandName)
removeIndCartObs = getObsNoCart(dfv,:Individual_category)

subset!(df,:BrandName => b -> map(x -> !(x in removeBrandObs), b))
subset!(df,:Individual_category => b -> map(x -> !(x in removeIndCartObs), b))

#select
dataset = transform!(df,:BrandName => n -> map(x -> brandLabels[x],n),:Category => n -> map(x -> categoryLables[x],n),:Individual_category => n -> map(x -> subCategoryLabel[x],n),renamecols = false)
dataset = transform!(df,:category_by_Gender =>ByRow( r-> onehot(r, ["Men","Women"]) .|> Float16) => [:Men,:Women],renamecols=true)
select!(df,Not(:category_by_Gender))

describe(df)
shuffled_ds = dataset[shuffle(1:nrow(dataset)),:]

datasetSize = nrow(df)
validationsetStartIndex = datasetSize * 0.7 |> round |> Int
testDatasetStartIndex = datasetSize * 0.85 |> round |> Int

trainData = shuffled_ds[1:validationsetStartIndex-1,:]
validationData = shuffled_ds[validationsetStartIndex:testDatasetStartIndex-1,:]
testData = shuffled_ds[testDatasetStartIndex:end,:]

totalCols = ncol(df)
featureIndexRange = 1:totalCols-2
labelIndexRange = totalCols-1:totalCols

trainDfX = @pipe trainData |> _[:,featureIndexRange]
trainDfY = @pipe trainData |> _[:,labelIndexRange]

validationDfX = @pipe validationData |> _[:,featureIndexRange]
validationDfY = @pipe validationData |> _[:,labelIndexRange]

testDfX = @pipe testData |> _[:,featureIndexRange]
testDfY = @pipe testData |> _[:,labelIndexRange]

trainX = @pipe trainDfX |> Matrix |> transpose
trainY = @pipe trainDfY |> Matrix |> transpose

validationX = @pipe validationDfX |> Matrix |> transpose
validationY = @pipe validationDfY |> Matrix |> transpose

testX = @pipe testDfX |> Matrix |> transpose
testY = @pipe testDfY |> Matrix |> transpose

#Write to arrow
Arrow.write("../datasets/trainX.arrow",vcat(trainDfX,validationDfX))
Arrow.write("../datasets/trainY.arrow",vcat(trainDfY,validationDfY))
Arrow.write("../datasets/testX.arrow", testDfX)
Arrow.write("../datasets/testY.arrow", testDfY)

#model
model = Chain(Embedding(vocaburarySize => 4),Flux.flatten,Dense(12 => 12, relu),Dense(12=>2),softmax)

ps=Flux.params(model)

loss(x,y) = Flux.Losses.binarycrossentropy(model(x), y)

trainY
trainX
loss(trainX, trainY)
trainX[1:3,1:2]
trainY[1:2,1]

opt=Adam(0.01)

data = Flux.Data.DataLoader((trainX, trainY),batchsize=500, shuffle=false)
loss_history = []

epoch=1:50
for i in epoch
    Flux.train!(loss,ps,data,opt)
    loss_value = loss(trainX, trainY)
    push!(loss_history, loss_value)
    println("Epoch:",i, " Loss:", loss_value)
end

#calculate accuracy again test samples
Ytest_hat = @pipe [[x[1],x[2]] for x in eachcol(model(testX))] .|> onecold(_,["Men","Women"])
Ytest =  @pipe [[x[1],x[2]] for x in eachcol(testY)] .|> onecold(_,["Men","Women"])

accuracy = mean(Ytest .== Ytest_hat)

println("Train loss:",loss(trainX, trainY))
println("Validation loss:", loss(testX, testY))
println("Test loss:", loss(validationX, validationY))

println("accuracy:",accuracy)

println("Random example test:")
println("X",testX[1:3,3:3])
println("Y",testY[:,3])
println("Y'",model(testX[1:3,3:3]))