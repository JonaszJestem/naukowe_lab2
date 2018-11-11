#=
5:
- Julia version: 1.0.2
- Author: jonasz
- Date: 2018-11-11
=#

p0 = Float32(0.01)
r = 3

next(pn, r) = pn + (r * pn * (1.0 - pn))

current = p0
for i=1:40
    global current
    current = Float32(next(current, r))
#     if i == 10
#         current = 0.722
#     end
    println(i, ": ", current)
end

p0 = Float64(0.01)
r = 3

next(pn, r) = pn + (r * pn * (1.0 - pn))

current = p0
for i=1:40
    global current
    current = Float32(next(current, r))
    println(i, ": ", current)
end