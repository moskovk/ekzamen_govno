"Написать функцию, реализующую алгоритм Джарвиса построения выпуклой
оболочки заданного набора (множества) точек плоскости."

struct Vector2D
    x::Float64
    y::Float64
end

function cross_product(o::Vector2D, a::Vector2D, b::Vector2D)
    return (a.x - o.x) * (b.y - o.y) - (a.y - o.y) * (b.x - o.x)
end

function jarvis_march(points::Vector{Vector2D})
    n = length(points)
    if n < 3
        return points
    end

    hull = Vector{Vector2D}()

    # Найдем самую левую точку
    l = 1
    for i in 2:n
        if points[i].x < points[l].x
            l = i
        end
    end

    p = l
    while true
        push!(hull, points[p])
        q = mod1(p + 1, n)

        for i in 1:n
            if cross_product(points[p], points[i], points[q]) > 0
                q = i
            end
        end

        p = q

        if p == l
            break
        end
    end

    return hull
end

# Пример использования
points = Vector{Vector2D}([
    Vector2D(0.0, 3.0),
    Vector2D(2.0, 3.0),
    Vector2D(1.0, 1.0),
    Vector2D(2.0, 1.0),
    Vector2D(3.0, 0.0),
    Vector2D(0.0, 0.0),
    Vector2D(3.0, 3.0)
])

hull = jarvis_march(points)
println("Convex hull points:")
for point in hull
    println("(", point.x, ", ", point.y, ")")
end
