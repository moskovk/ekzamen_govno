# Определяем тип данных Vector_2D для хранения координат точек
struct Vector_2D{T}
    x::T
    y::T
end

# Конструктор для создания вектора 2D
function Vector_2D(x::T, y::T) where T
    return Vector_2D{T}(x, y)
end

# Функция для вычисления ориентированной площади многоугольника
function oriented_area(polygon::Vector{Vector_2D{T}}) where T
    n = length(polygon)
    if n < 3
        error("Многоугольник должен иметь минимум три вершины")
    end

    area = zero(T)

    for i in 1:n
        x1, y1 = polygon[i].x, polygon[i].y
        x2, y2 = polygon[mod1(i+1, n)].x, polygon[mod1(i+1, n)].y
        area += (x1 * y2 - x2 * y1)
    end

    return area / 2
end

# Тестирование функции oriented_area
polygon = [Vector_2D(0.0, 0.0), Vector_2D(4.0, 0.0), Vector_2D(4.0, 3.0), Vector_2D(0.0, 3.0)]

area = oriented_area(polygon)
println("Ориентированная площадь многоугольника: $area")

# Проверка для другого многоугольника
polygon2 = [Vector_2D(0.0, 0.0), Vector_2D(4.0, 0.0), Vector_2D(2.0, 2.0)]

area2 = oriented_area(polygon2)
println("Ориентированная площадь многоугольника: $area2")
