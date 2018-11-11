#=
6:
- Julia version: 1.0.2
- Author: jonasz
- Date: 2018-11-11
=#

next(xn, c) = xn^2 + c

test_data = [
    (-2, 1),
    (-2, 2),
    (-2, 1.99999999999999),
    (-1, 1),
    (-1, -1),
    (-1, 0.75),
    (-1, 0.25)]

for test_subject in test_data
    println(test_subject)
    current_c = Float64(test_subject[1])
    current_x = Float64(test_subject[2])

    for i=1:40
        current_x = next(current_x, current_c)
        println(i, " ", current_x)
    end
end