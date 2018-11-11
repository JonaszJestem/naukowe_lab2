#=
3:
- Julia version: 1.0.2
- Author: jonasz
- Date: 2018-11-11
=#
include("matcond.jl")
include("hilb.jl")

println("Hilbert: ")
for i=1:50
    A = hilb(i)
    b = copy(A)

#     println(b)
#     println(A)
    gaussian = A \ b
    inverse = inv(A) * b

    error = 0
    matrix_size = length(gaussian)
    for i=0:matrix_size
        error += abs(gaussian[i] - 1) / matrix_size
    end
    println("Gaussian Error: ", error/matrix_size)
    error = 0
    for i=0:matrix_size
        error += abs(inverse[i] - 1) / matrix_size
    end
    println("Inverse Error: ", error/matrix_size)
    println()
end

cs = Float64[1,10,10^3, 10^7, 10^12, 10^16]
ns = [5,10,20]

println("Matcond: ")
for c in cs
    for n in ns
        A = matcond(n, c)
        b = copy(A)

        gaussian = A \ b
        inverse = inv(A) * b

        error = 0
        matrix_size = length(gaussian)
        for i=0:matrix_size
            error += abs(gaussian[i] - 1) / matrix_size
        end
        println("Gaussian Error: ", error/matrix_size)
        error = 0
        for i=0:matrix_size
            error += abs(inverse[i] - 1) / matrix_size
        end
        println("Inverse Error: ", error/matrix_size)
        println()
    end
end