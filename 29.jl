" Написать функцию, определяющую (возвращающую значение типа
True ), является ли заданный многоугольник (задается вектором типа
Vector{Vector_3D} ) выпуклым."

struct Vector3D
    x::Float64
    y::Float64
    z::Float64
end

function cross_product(a::Vector3D, b::Vector3D)
    return Vector3D(
        a.y * b.z - a.z * b.y,
        a.z * b.x - a.x * b.z,
        a.x * b.y - a.y * b.x
    )
end

function dot_product(a::Vector3D, b::Vector3D)
    return a.x * b.x + a.y * b.y + a.z * b.z
end

function is_convex_polygon(points::Vector{Vector3D})
    n = length(points)
    if n < 4
        return true  # Треугольник или меньше всегда выпуклый
    end

    last_sign = 0

    for i in 1:n
        p1 = points[i]
        p2 = points[mod1(i+1, n)]
        p3 = points[mod1(i+2, n)]

        # Вычисляем векторы
        v1 = Vector3D(p2.x - p1.x, p2.y - p1.y, p2.z - p1.z)
        v2 = Vector3D(p3.x - p2.x, p3.y - p2.y, p3.z - p2.z)

        # Вычисляем векторное произведение
        cross = cross_product(v1, v2)

        if i == 1
            last_sign = cross.z
        else
            # Проверяем знак компоненты z векторного произведения
            if (last_sign * cross.z) < 0
                return false
            end
        end
    end

    return true
end

# Пример использования
polygon = Vector{Vector3D}([
    Vector3D(0.0, 0.0, 0.0),
    Vector3D(1.0, 0.0, 0.0),
    Vector3D(1.0, 1.0, 0.0),
    Vector3D(0.0, 1.0, 0.0)
])

println("Is the polygon convex? ", is_convex_polygon(polygon))
