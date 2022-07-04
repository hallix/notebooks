using CSV, GLM, DataFrames, Pipe, Plots, StatsPlots


df = DataFrame(CSV.File("kc_house_data.csv")) |> dropmissing

finalDf = @pipe df |> select(_,[:price, :sqft_living]) |> first(_,100)

@df finalDf scatter(:sqft_living,:price)
ols = lm(@formula(price ~ sqft_living), finalDf)

@df finalDf plot!(:sqft_living,predict(ols), color=:green,linewidth=3)


#x
actual_sqft =  finalDf[:,:sqft_living]
slope=0.0 #slope
intercept=0.0 #intercept

#y=mx+b
approxFunc(X) = intercept .+ slope * X

sample_size = length(actual_sqft)

prtcd_price = approxFunc(actual_sqft)
actual_price = finalDf[:,:price]

@df finalDf plot!(:sqft_living,prtcd_price, color=:blue,linewidth=3)


costFunc(act_price) = (1 / (2 * sample_size)) * sum((prtcd_price - act_price) .^ 2) # (1 / (2 * m)) * sum((y_hat - Y).^2)

cost = costFunc(actual_price)


for i in range(1,10)
    pdFunc_intercept(act_price) = (1 / sample_size) * sum((prtcd_price - act_price))

    pdFunc_slope(act_sqft, act_price) = (1 / sample_size) * sum((prtcd_price - act_price) .* act_sqft)

    #learning rate:
    learn_rt_intercept = 0.09
    learn_rt_slope = 0.00000008

    #temp parameters
    temp_slope = pdFunc_slope(actual_sqft, actual_price)

    temp_intercept = pdFunc_intercept(actual_price)

    slope -= learn_rt_slope * temp_slope
    intercept -= learn_rt_intercept * temp_intercept
    println(`cost: $cost`)
    println(`slope: $slope`)
    println(`intercept: $intercept`)

    prtcd_price = approxFunc(actual_sqft)
    cost = costFunc(actual_price)
    println(`recalc cost: $cost`)
end