# Определяем параметрический тип данных Vector_2D
struct Vector_2D{T}
    x::T
    y::T
end

# Конструктор для создания вектора
function Vector_2D(x::T, y::T) where T
    return Vector_2D{T}(x, y)
end

# Перегрузка операции сложения
function +(v1::Vector_2D{T}, v2::Vector_2D{T}) where T
    return Vector_2D(v1.x + v2.x, v1.y + v2.y)
end

# Перегрузка операции вычитания
function -(v1::Vector_2D{T}, v2::Vector_2D{T}) where T
    return Vector_2D(v1.x - v2.x, v1.y - v2.y)
end

# Перегрузка операции умножения на скаляр
function *(v::Vector_2D{T}, scalar::T) where T
    return Vector_2D(v.x * scalar, v.y * scalar)
end

function *(scalar::T, v::Vector_2D{T}) where T
    return Vector_2D(v.x * scalar, v.y * scalar)
end

# Перегрузка операции деления на скаляр
function /(v::Vector_2D{T}, scalar::T) where T
    return Vector_2D(v.x / scalar, v.y / scalar)
end

# Вычисление длины (модуля) вектора
function length(v::Vector_2D{T}) where T
    return sqrt(v.x^2 + v.y^2)
end

# Нормализация вектора
function normalize(v::Vector_2D{T}) where T
    len = length(v)
    if len == 0
        throw(DomainError("Невозможно нормализовать нулевой вектор"))
    end
    return v / len
end

# Скалярное произведение двух векторов
function dot(v1::Vector_2D{T}, v2::Vector_2D{T}) where T
    return v1.x * v2.x + v1.y * v2.y
end

# Векторное произведение двух векторов (по модулю в 2D)
function cross(v1::Vector_2D{T}, v2::Vector_2D{T}) where T
    return v1.x * v2.y - v1.y * v2.x
end

# Угол между двумя векторами
function angle_between(v1::Vector_2D{T}, v2::Vector_2D{T}) where T
    dot_product = dot(v1, v2)
    lengths_product = length(v1) * length(v2)
    if lengths_product == 0
        throw(DomainError("Невозможно вычислить угол с нулевым вектором"))
    end
    cos_theta = dot_product / lengths_product
    return acos(clamp(cos_theta, -1, 1))  # Угол в радианах
end

# Перегрузка функции show для красивого вывода
Base.show(io::IO, v::Vector_2D{T}) where T = print(io, "Vector_2D(", v.x, ", ", v.y, ")")

# Тестирование функций и операций
v1 = Vector_2D(3.0, 4.0)
v2 = Vector_2D(1.0, 2.0)

println("v1: ", v1)
println("v2: ", v2)

println("v1 + v2: ", v1 + v2)
println("v1 - v2: ", v1 - v2)
println("v1 * 2: ", v1 * 2)
println("2 * v2: ", 2 * v2)
println("v1 / 2: ", v1 / 2)

println("Длина v1: ", length(v1))
println("Нормализованный v1: ", normalize(v1))

println("Скалярное произведение v1 и v2: ", dot(v1, v2))
println("Векторное произведение v1 и v2 (по модулю): ", cross(v1, v2))
println("Угол между v1 и v2 (в радианах): ", angle_between(v1, v2))
