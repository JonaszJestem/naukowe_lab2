#=
4:
- Julia version: 1.0.2
- Author: jonasz
- Date: 2018-11-11
=#
using Polynomials

polynomial_values = [2432902008176640000, -8752948036761600000, 13803759753640704000, -12870931245150988800, 8037811822645051776,
-3599979517947607200, 1206647803780373360, -311333643161390640, 63030812099294896, -10142299865511450,
1307535010540395, -135585182899530,11310276995381,-756111184500,40171771630,-1672280820,53327946,
-1256850, 20615, -210, 1]

actual_zeros = Int64[]
for i=20:-1:1
    push!(actual_zeros, Int(i))
end

polynomial = Poly(polynomial_values)

zeros = roots(polynomial)
actual_polynomial = poly(actual_zeros)

for i = 1:20
    println("P(z",i,") = ", polynomial(i))
    println("p(z",i,") = ", actual_polynomial(i))
    println("zk - k = ", abs(zeros[20-i+1] - i))
end

polynomial_values = [2432902008176640000, -8752948036761600000, 13803759753640704000, -12870931245150988800, 8037811822645051776,
-3599979517947607200, 1206647803780373360, -311333643161390640, 63030812099294896, -10142299865511450,
1307535010540395, -135585182899530,11310276995381,-756111184500,40171771630,-1672280820,53327946,
-1256850, 20615, -210-2^23, 1]

actual_zeros = Int64[]
for i=20:-1:1
    push!(actual_zeros, Int(i))
end

polynomial = Poly(polynomial_values)

zeros = roots(polynomial)
actual_polynomial = poly(actual_zeros)



for i = 1:20
    println("P(z",i,") = ", polynomial(i))
    println("p(z",i,") = ", actual_polynomial(i))
    println("zk - k = ", abs(zeros[20-i+1] - i))
end