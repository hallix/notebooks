using Plots, Flux,StatsPlots, DataFrames, Pipe, CSV, Plots

df = @pipe DataFrame(CSV.File("../datasets/wolfspider.csv"))|> 
select(_,[:feature,:class],:class => ByRow(x -> x == "present" ? 1 : 0) , renamecols=false) |> dropmissing 

#Plot data distribution
@df df plot(:feature,:class, seriestype=:scatter)

#Convert training data to from vector to matrix for Flux.train(...) compatibility
x_train = reduce(hcat,df[:,:feature])
y_train = reduce(hcat, df[:,:class])


# initialize parameters
theta_0 = 0.0   

theta_1 = 1.0    

# define hypothesis function
z(x) = theta_0 .+ theta_1 * x
h(x) = 1 ./ (1 .+ exp.(-z(x)))


# use cost function from Andrew Ng

m = length(x_train)

y_hat = h(x_train)

function cost()
    (-1 / m) * sum(
        y_train .* log.(y_hat) +
        (1 .- y_train) .* log.(1 .- y_hat)
    )
end

cost_value = cost()
@show "Intial cost value:", cost_value

# define batch gradient descent algorithm

# use partial derivative formulae from Andrew Ng

function pd_theta_0()
    sum(y_hat - y_train)
end

function pd_theta_1()
    sum((y_hat - y_train) .* x_train)
end

# set learning rate (alpha)

alpha = 0.01

################################################################################
# begin iterations (repeat until convergence)
################################################################################

#Train hypothesis function
for i in 1:4000

    # calculate partial derivatives

    theta_0_temp = pd_theta_0()

    theta_1_temp = pd_theta_1()
    

    # adjust parameters by the learning rate

    theta_0 -= alpha * theta_0_temp

    theta_1 -= alpha * theta_1_temp

    # recalculate cost

    y_hat = h(x_train)
end

cost_value = cost()
@show "Gradient theta_0:", pd_theta_0()
@show "Gradient theta_1:", pd_theta_1()
@show "Final cost value:", cost_value
@show "Test prediction:", h([0.234])
