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


cost(obs_price) = (1 / (2 * m)) * sum((prd_price - obs_price) .^ 2) # (1 / (2 * m)) * sum((y_hat - Y).^2)

#intial cost value
init_cost = cost(obs_price)
println("Intila cost:$init_cost")

#Partial derivatives of the cost function
pdFunc_intercept(obs_price) = (1 / m) * sum((prd_price - obs_price))
pdFunc_slope(obs_sqft, obs_price) = (1 / m) * sum((prd_price - obs_price) .* obs_sqft)

 #learning rate:
 learn_rt_intercept = 0.09
 learn_rt_slope = 0.0008


for i in range(1,500)
    #temp parameters
    temp_slope = pdFunc_slope(obs_sqft, obs_price)

    temp_intercept = pdFunc_intercept(obs_price)

    slope -= learn_rt_slope * temp_slope
    intercept -= learn_rt_intercept * temp_intercept

    prd_price = h(obs_sqft)
    #Improved cost value
    cost_value = cost(obs_price)
    print("Cost:")
    println(cost_value)  
end
@df df plot!(:sqft_living, prd_price, color=:yellow,linewidth=3)
println("Done....")

h([20])


