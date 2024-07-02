# Определяем параметрический тип данных Vector_3D
struct Vector_3D{T}
    x::T
    y::T
    z::T
end

# Конструктор для создания вектора 3D
function Vector_3D(x::T, y::T, z::T) where T
    return Vector_3D{T}(x, y, z)
end

# Определяем тип данных Segment2D
struct Segment2D{T}
    p1::Vector_3D{T}
    p2::Vector_3D{T}
end

# Конструктор для создания сегмента 2D
function Segment2D(p1::Vector_3D{T}, p2::Vector_3D{T}) where T
    return Segment2D{T}(p1, p2)
end

# Функция для проверки, лежат ли две точки по одну сторону от заданной прямой
function same_side(p1::Vector_3D{T}, p2::Vector_3D{T}, segment::Segment2D{T}) where T
    # Векторное произведение векторов (p2 - p1) и (q - p1)
    function cross_product_2D(v1::Vector_3D{T}, v2::Vector_3D{T}) where T
        return v1.x * v2.y - v1.y * v2.x
    end

    # Вектор от p1 к p2
    d = Vector_3D(segment.p2.x - segment.p1.x, segment.p2.y - segment.p1.y, 0)
    
    # Вектор от p1 к точке p1
    ap1 = Vector_3D(p1.x - segment.p1.x, p1.y - segment.p1.y, 0)
    
    # Вектор от p1 к точке p2
    ap2 = Vector_3D(p2.x - segment.p1.x, p2.y - segment.p1.y, 0)
    
    # Векторное произведение
    cp1 = cross_product_2D(d, ap1)
    cp2 = cross_product_2D(d, ap2)
    
    # Проверяем знак векторного произведения
    return cp1 * cp2 >= 0
end

# Тестирование функции same_side
p1 = Vector_3D(1.0, 2.0, 0.0)
p2 = Vector_3D(2.0, 3.0, 0.0)
segment = Segment2D(Vector_3D(0.0, 0.0, 0.0), Vector_3D(4.0, 4.0, 0.0))

println("Точки лежат по одну сторону от прямой: ", same_side(p1, p2, segment))

p1 = Vector_3D(1.0, 2.0, 0.0)
p2 = Vector_3D(3.0, 1.0, 0.0)
println("Точки лежат по одну сторону от прямой: ", same_side(p1, p2, segment))
