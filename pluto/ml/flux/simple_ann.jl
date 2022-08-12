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
model = Chain(Dense(3=>3),Dense(3=>1))

ps=Flux.params(model)

loss(x,y) = Flux.Losses.mse(model(x), y)

loss(x_train, y_train)

opt=Adam()

data=[(x_train, y_train)]
loss_history = []

epoch=1:6000
for i in epoch
    Flux.train!(loss,ps,data,opt)
    loss_value = loss(x_train, y_train)
    push!(loss_history, loss_value)

    if(model([2000,3000,1000])[1] == 5999.9995)
        println("perfect learning")
        break
    end    
end

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

model([2000,3000,1000])[1]

#plot(epoch, loss_history)