"Написать функцию, возвращающую площадь (ориентированную)
многоугольника, заданного последовательностью своих вершин,
вычисляемую методом трапеций"

struct Vector2D
    x::Float64
    y::Float64
end

function polygon_area(vertices::Vector{Vector2D})
    n = length(vertices)
    if n < 3
        return 0.0
    end

    area = 0.0
    for i in 1:n
        x1, y1 = vertices[i].x, vertices[i].y
        x2, y2 = vertices[mod1(i+1, n)].x, vertices[mod1(i+1, n)].y
        area += x1 * y2 - x2 * y1
    end

    return area / 2.0
end

# Пример использования
vertices = Vector{Vector2D}([
    Vector2D(0.0, 0.0),
    Vector2D(4.0, 0.0),
    Vector2D(4.0, 3.0),
    Vector2D(0.0, 3.0)
])

area = polygon_area(vertices)
println("Oriented area of the polygon: ", area)
