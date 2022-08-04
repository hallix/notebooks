using Plots, Flux

#function to add 3 numbers
addFunc(X) = X[1] + X[2] + X[3]

getRandom3Numbers() = rand(Int16,3) ./1000

#Generate training data samples
x_train = []

for i in 1:15000
    push!(x_train,getRandom3Numbers())
end

x_train = (hcat(x_train...))
y_train_vec = []

for col in eachcol(x_train)
    push!(y_train_vec,addFunc(col))
end

y_train = hcat(y_train_vec...)

#model
model = Chain(Dense(3=>6),Dense(6=>1))

ps=Flux.params(model)

loss(x,y) = Flux.Losses.mse(model(x), y)

loss(x_train, y_train)

opt=Adam()

data=[(x_train, y_train)]

Flux.@epochs 5000 Flux.train!(loss,ps,data,opt)

#Generate test data
x_test =[]
for i in 1:5
    push!(x_test,getRandom3Numbers())
end

#test model
for x in x_test
    @show x
    @show model(x)
    println("---------------------------")
end