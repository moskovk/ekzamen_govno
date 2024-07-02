# Определяем тип данных Vector_2D
struct Vector_2D{T}
    x::T
    y::T
end

# Конструктор для создания вектора 2D
function Vector_2D(x::T, y::T) where T
    return Vector_2D{T}(x, y)
end

# Функция для нахождения точки с наименьшей y-координатой
function find_lowest_point(points::Vector{Vector_2D{T}}) where T
    lowest = points[1]
    for point in points
        if (point.y < lowest.y) || (point.y == lowest.y && point.x < lowest.x)
            lowest = point
        end
    end
    return lowest
end

# Функция для вычисления угла между двумя векторами
function angle(p1::Vector_2D{T}, p2::Vector_2D{T}) where T
    return atan(p2.y - p1.y, p2.x - p1.x)
end

# Функция для вычисления векторного произведения двух векторов (определяет поворот)
function cross_product(p1::Vector_2D{T}, p2::Vector_2D{T}, p3::Vector_2D{T}) where T
    return (p2.x - p1.x) * (p3.y - p1.y) - (p2.y - p1.y) * (p3.x - p1.x)
end

# Основная функция для построения выпуклой оболочки
function graham_scan(points::Vector{Vector_2D{T}}) where T
    if length(points) < 3
        error("Для построения выпуклой оболочки требуется минимум три точки")
    end

    # Шаг 1: Найти начальную точку
    start = find_lowest_point(points)

    # Шаг 2: Отсортировать точки по углу относительно начальной точки
    sorted_points = sort(points, by = p -> angle(start, p))

    # Шаг 3: Пройти по отсортированным точкам и построить выпуклую оболочку
    hull = Vector{Vector_2D{T}}()
    push!(hull, start)

    for point in sorted_points
        while length(hull) > 1 && cross_product(hull[end-1], hull[end], point) <= 0
            pop!(hull)
        end
        push!(hull, point)
    end

    return hull
end

# Тестирование функции graham_scan
points = [Vector_2D(0.0, 3.0), Vector_2D(2.0, 2.0), Vector_2D(1.0, 1.0), Vector_2D(2.0, 1.0),
          Vector_2D(3.0, 0.0), Vector_2D(0.0, 0.0), Vector_2D(3.0, 3.0)]

hull = graham_scan(points)

println("Выпуклая оболочка точек:")
for point in hull
    println(point)
end
