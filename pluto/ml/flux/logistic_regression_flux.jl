using Plots, Flux,StatsPlots, DataFrames, Pipe, CSV, Plots

#Create training data
df = @pipe DataFrame(CSV.File("../datasets/wolfspider.csv"))|> 
select(_,[:feature,:class],:class => ByRow(x -> x == "present" ? 1 : 0) , renamecols=false) |> dropmissing 

#Plot data distribution
@df df plot(:feature,:class, seriestype=:scatter)

#Convert training data to from vector to matrix for Flux.train(...) compatibility
x_train = reduce(hcat,df[:,:feature])
y_train = reduce(hcat, df[:,:class])

#Prediction model
model = Chain(Dense(1 => 1), Dense(1 => 1, sigmoid))

#Cost function for sigmoid
loss(x, y) = Flux.Losses.binarycrossentropy(model(x), y)

cost_value = loss(x_train, y_train)
@show "Intial cost value: $cost_value"

#intial prediction
model([1])

#Gradient descent with learning rate 0.08
opt = Flux.Descent(0.08)

#Train model
ps=Flux.params(model)
data = [(x_train, y_train)]
Flux.@epochs 4000 Flux.train!(loss, ps,data, opt)

#Print gradient for parameters W and b
gs = gradient(() -> loss(x_train,y_train), ps)
@show "Gradient for Weight:" gs[ps[1]][1]
@show "Gradient for bias:" gs[ps[2]][1]

cost_value = loss(x_train, y_train)
@show "Final cost value: $cost_value"

#Test prediction should be around 38%
@show "Test prediction" model([0.234])