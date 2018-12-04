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
    println(i, ": ", current)
end


p0 = Float32(0.01)
r = 3

next(pn, r) = pn + (r * pn * (1.0 - pn))

current = p0
for i=1:40
    global current
    current = Float32(next(current, r))
    if i == 10
        current = 0.722
    end
    println(i, ": ", current)
end

p0 = Float32(0.01)
r = 3

next(pn, r) = pn + (r * pn * (1.0 - pn))

current_32 = p0
current_64 = p0
for i=1:40
    global current_32, current_64
    current_32 = Float32(next(current_32, r))
    current_64 = Float64(next(current_64, r))
    println(i, ": ", current_32, ": ", current_64)
end
