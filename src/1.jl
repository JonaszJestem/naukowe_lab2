#=
zad5:
- Julia version: 1.0.1
- Author: Jonasz Wiącek
- Date: 2018-10-07
=#
n = 5

"Defining vectors"
x64 = Float64[Float64(2.718281828), Float64(-3.141592654),
    Float64(1.414213562), Float64(0.577215664), Float64(0.301029995)]
y64 = Float64[Float64(1486.2497), Float64(878366.9879),
    -Float64(22.37492), Float64(4773714.647), Float64(0.000185049)]

x32 = Float32[Float32(2.718281828), Float32(-3.141592654),
    Float32(1.414213562), Float32(0.577215664), Float32(0.301029995)]
y32 = Float32[Float32(1486.2497), Float32(878366.9879),
    -Float32(22.37492), Float32(4773714.647), Float32(0.000185049)]

function forward(precision, x, y)
    sum = precision(0)
    for i = 1:n
        sum += precision(x[i] * y[i])
    end

    return sum
end


function backwards(precision, x, y)
    sum = precision(0)
    for i = n:-1:1
        sum += precision(x[i] * y[i])
    end

    return sum
end

function biggestToLowest(precision, x, y)
    positiveProducts = []
    negativeProducts = []

    "Calculates product and pushes to proper array - array depends on sign of the number"
    for i = n:-1:1
        result = precision(x[i] * y[i])
        if(result > 0)
            push!(positiveProducts, result)
        else
            push!(negativeProducts, result)
        end
    end

    "Sorts negative sums in increasing order, positive sum in decreasing"
    sort!(negativeProducts)
    reverse!(sort!(positiveProducts))

    "Calculates sums positive and negative products in proper order then returns whole sum"
    sumPositive = precision(0)
    for elt in positiveProducts
        sumPositive += elt
    end

    sumNegative = precision(0)
    for elt in negativeProducts
        sumNegative += elt
    end


    return sumNegative + sumPositive
end

"The same function as biggestToLowest, different sorting order"
function lowestToBiggest(precision, x, y)
    positiveProducts = []
    negativeProducts = []

    for i = n:-1:1
        result = precision(x[i] * y[i])
        if(result > 0)
            push!(positiveProducts, result)
            else
            push!(negativeProducts, result)
            end
    end

    reverse!(sort!(negativeProducts))
    sort!(positiveProducts)

    sumPositive = precision(0)
    for elt in positiveProducts
        sumPositive += elt
    end

    sumNegative = precision(0)
    for elt in negativeProducts
        sumNegative += elt
    end


    return sumNegative + sumPositive
end

println("Forward")
println(forward(Float32, x32, y32))
println(forward(Float64, x64, y64))
println("Backwards")
println(backwards(Float32, x32, y32))
println(backwards(Float64, x64, y64))
println("Biggest to lowest")
println(biggestToLowest(Float32, x32, y32))
println(biggestToLowest(Float64, x64, y64))
println("Lowest to biggest")
println(lowestToBiggest(Float32, x32, y32))
println(lowestToBiggest(Float64, x64, y64))
