# Определяем тип данных Vector_2D
struct Vector_2D{T}
    x::T
    y::T
end

# Конструктор для создания вектора 2D
function Vector_2D(x::T, y::T) where T
    return Vector_2D{T}(x, y)
end

# Определяем тип данных Polygon
struct Polygon{T}
    vertices::Vector{Vector_2D{T}}
end

# Конструктор для создания многоугольника
function Polygon(vertices::Vector{Vector_2D{T}}) where T
    return Polygon{T}(vertices)
end

# Функция для проверки, лежит ли заданная точка внутри многоугольника
function is_point_in_polygon(point::Vector_2D{T}, polygon::Polygon{T}) where T
    n = length(polygon.vertices)
    inside = false
    j = n  # Последний вершина индекс

    for i in 1:n
        xi = polygon.vertices[i].x
        yi = polygon.vertices[i].y
        xj = polygon.vertices[j].x
        yj = polygon.vertices[j].y

        if ((yi > point.y) != (yj > point.y)) &&
           (point.x < (xj - xi) * (point.y - yi) / (yj - yi) + xi)
            inside = !inside
        end
        j = i
    end

    return inside
end

# Тестирование функции is_point_in_polygon
polygon = Polygon([Vector_2D(0.0, 0.0), Vector_2D(4.0, 0.0), Vector_2D(4.0, 4.0), Vector_2D(0.0, 4.0)])
point_inside = Vector_2D(2.0, 2.0)
point_outside = Vector_2D(5.0, 5.0)

println("Точка $point_inside внутри многоугольника: ", is_point_in_polygon(point_inside, polygon))
println("Точка $point_outside внутри многоугольника: ", is_point_in_polygon(point_outside, polygon))

polygon_non_convex = Polygon([Vector_2D(0.0, 0.0), Vector_2D(4.0, 0.0), Vector_2D(2.0, 2.0), Vector_2D(4.0, 4.0), Vector_2D(0.0, 4.0)])
point_inside_non_convex = Vector_2D(3.0, 3.0)
point_outside_non_convex = Vector_2D(1.0, 3.0)

println("Точка $point_inside_non_convex внутри невыпуклого многоугольника: ", is_point_in_polygon(point_inside_non_convex, polygon_non_convex))
println("Точка $point_outside_non_convex внутри невыпуклого многоугольника: ", is_point_in_polygon(point_outside_non_convex, polygon_non_convex))
