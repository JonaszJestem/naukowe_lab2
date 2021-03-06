#=
3:
- Julia version: 1.0.2
- Author: jonasz
- Date: 2018-11-11
=#
include("matcond.jl")
include("hilb.jl")

println("Hilbert: ")
for i=2:50
    A = hilb(i)
    b = copy(A)

#     println(b)
#     println(A)
    gaussian = A \ b
    inverse = inv(A) * b

    g_error = 0
    matrix_size = length(gaussian)
    for i=0:matrix_size
        g_error += abs(gaussian[i] - 1) / matrix_size
    end
    println("Gaussian Error: ", g_error / matrix_size)
    i_error = 0
    for i=0:matrix_size
        i_error += abs(inverse[i] - 1) / matrix_size
    end
    println("Inverse Error: ", i_error / matrix_size)
    println()

    println(abs(g_error - i_error))
    println()
end

cs = Float64[1, 10, 10^3, 10^7, 10^12, 10^16]
ns = [5, 10, 20]

println("Matcond: ")
for n in ns
    println("N: ", n)
    for c in cs
        A = matcond(n, c)
        b = copy(A)

        gaussian = A \ b
        inverse = inv(A) * b

        g_error = 0
        matrix_size = length(gaussian)
        for i=0:matrix_size
            g_error += abs(gaussian[i] - 1) / matrix_size
        end
        println("Gaussian Error: ", g_error / matrix_size)
        i_error = 0
        for i=0:matrix_size
            i_error += abs(inverse[i] - 1) / matrix_size
        end
        println("Inverse Error: ", i_error / matrix_size)
        println()

    println(abs(g_error - i_error))
    println()
    end
end