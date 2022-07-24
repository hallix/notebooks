using Plots, Flux

actual(x) = 2x .+ 1

x_train = hcat(1:7...)

y_train = actual(x_train)

model = Flux.Dense(1 => 1)

opt = Flux.Descent(0.028)

loss(x, y) = Flux.Losses.mse(model(x), y)

loss(x_train, y_train)

model.weight
model.bias

params=Flux.params(model)

data = [(x_train, y_train)]

#intial prediction
actual([1])
model([1])


#actual function approx.
plot(vec(x_train),vec(y_train))


Flux.@epochs 400 Flux.train!(loss, params,data, opt)

model([1])

model.weight
model.bias