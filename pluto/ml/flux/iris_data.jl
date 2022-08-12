using Plots, Flux, RDatasets, StatsPlots, Pipe
colorCat = Dict("setosa" => :green ,"versicolor" => :red, "virginica" => :orange)
numCat = Dict("setosa" => [1,0,0] ,"versicolor" => [0,1,0], "virginica" => [0,0,1])
iris = @pipe dataset("datasets", "iris") |> transform!(_, :Species => ByRow(x -> String(x)), renamecols = false)
x_train = (select(iris,[:SepalLength,:SepalWidth,:PetalLength,:PetalWidth]) |> Matrix)'
y_train = @pipe select(iris, :Species => ByRow(x -> numCat[x]), renamecols=false)[:,:Species] |> hcat(_...)



getColor(key) = colorCat[key]
#Sepal
@df iris plot(:PetalWidth,:SepalLength, seriestype = :scatter, color=getColor.(:Species))

#Petal
@df iris plot(:PetalWidth,:PetalLength, seriestype = :scatter, color=getColor.(:Species))



#model 
model = Chain(Dense(4 => 3, sigmoid), Dense(3 => 3,sigmoid))

ps = Flux.params(model)

data = [(x_train, y_train)]

opt= Descent(0.8)

loss(x,y) = Flux.Losses.binarycrossentropy(model(x), y)


x_test = x_train[1:4,[1,7,42,150,90]]
y_test = y_train[1:3,[1,7,42,150,90]]
loss(x_train,y_train)

Flux.@epochs 2000 Flux.train!(loss,ps,data,opt)

model(x_test)
y_test


#Generate training data samples
# x_train = hcat([[0,0],[0,1],[1,0],[1,1]]...)
# y_train = hcat([0,1,1,0]...)


# #model
# model = Chain(Dense(2=>2,tanh),Dense(2=>1))

# ps=Flux.params(model)

# loss(x,y) = Flux.Losses.binarycrossentropy(model(x), y)

# loss(x_train, y_train)

# opt=Descent(0.0001)
# x_train
# data=[(x_train, y_train)]

# Flux.@epochs 500 Flux.train!(loss,ps,data,opt)

# #Generate test data
# model([1,0])