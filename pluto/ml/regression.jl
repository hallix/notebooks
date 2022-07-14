using CSV, GLM, DataFrames, Pipe, Plots, StatsPlots


df = @pipe DataFrame(CSV.File("kc_house_data.csv")) |> dropmissing |> select!(_,[:price, :sqft_living], :price => x-> x/10000,:sqft_living => x-> x/100,renamecols=false) |> first(_,100)


@df df plot(:sqft_living,:price,seriestype = :scatter)

ols = lm(@formula(price ~ sqft_living), df)

@df df plot!(:sqft_living,predict(ols), color=:green,linewidth=3)

#x
obs_sqft = df[:,:sqft_living]

#parameters
slope=0.0 #slope
intercept=0.0 #intercept

#y=mx+b, hypothesis
h(X) = intercept .+ slope * X

#Initial hypothesis valuation
prd_price = h(obs_sqft)

@df df plot!(:sqft_living, prd_price, color=:blue,linewidth=3)

m = length(obs_sqft)

obs_price = df[:,:price]

#cost function
cost(obs_price) = (1 / (2 * m)) * sum((prd_price - obs_price) .^ 2) # (1 / (2 * m)) * sum((y_hat - Y).^2)

#intial cost value
init_cost = cost(obs_price)
println("Intila cost:$init_cost")

#Partial derivatives of the cost function
pdFunc_intercept(obs_price) = (1 / m) * sum((prd_price - obs_price))
pdFunc_slope(obs_sqft, obs_price) = (1 / m) * sum((prd_price - obs_price) .* obs_sqft)

 #Learning rate, will require manual ajustments to find the best rate to minimize the cost function
 learn_rt_intercept = 0.00555
 learn_rt_slope = 0.000003

cost_history = []
slope_history = []
intercept_history = []
for i in range(1,1000)
    
    #Temp parameters
    temp_slope = pdFunc_slope(obs_sqft, obs_price)

    temp_intercept = pdFunc_intercept(obs_price)

    #Update parameters
    slope -= learn_rt_slope * temp_slope
    intercept -= learn_rt_intercept * temp_intercept

    push!(slope_history, slope)
    push!(intercept_history, intercept)
    #Recalculate the values of predicted price with new parameters applied to the hypothesis function
    prd_price = h(obs_sqft)
    #Improved cost value
    cost_value = cost(obs_price)
    push!(cost_history, cost_value)
    print("Cost:")
    println(cost_value)  
end

@df df plot(:sqft_living, prd_price, color=:yellow,linewidth=3)

#Plot learning performance for each parameters(slope and intercept) against the cost function
plot(cost_history, slope_history , color=:yellow,linewidth=1)
plot(cost_history, intercept_history , color=:yellow,linewidth=1)

#Test prediction
h([19.8])
println("Done....")
