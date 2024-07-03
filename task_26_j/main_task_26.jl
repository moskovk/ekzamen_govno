# Определяем параметрический тип данных Vector_2D
struct Vector_2D{T}
    x::T
    y::T
end

# Конструктор для создания объекта Vector_2D
function Vector_2D(x::T, y::T) where T
    return Vector_2D{T}(x, y)
end

# Перегрузка оператора сложения для Vector_2D
Base.:+(v1::Vector_2D{T}, v2::Vector_2D{T}) where T = Vector_2D(v1.x + v2.x, v1.y + v2.y)

# Перегрузка оператора вычитания для Vector_2D
Base.:-(v1::Vector_2D{T}, v2::Vector_2D{T}) where T = Vector_2D(v1.x - v2.x, v1.y - v2.y)

# Перегрузка оператора умножения на скаляр для Vector_2D
Base.:*(v::Vector_2D{T}, scalar::S) where {T, S} = Vector_2D(v.x * scalar, v.y * scalar)
Base.:*(scalar::S, v::Vector_2D{T}) where {T, S} = Vector_2D(v.x * scalar, v.y * scalar)

# Функция для вычисления длины вектора
function length(v::Vector_2D{T}) where T
    return sqrt(v.x^2 + v.y^2)
end

# Функция для вычисления скалярного произведения двух векторов
function dot(v1::Vector_2D{T}, v2::Vector_2D{T}) where T
    return v1.x * v2.x + v1.y * v2.y
end

# Функция для вычисления угла между двумя векторами
function angle_between(v1::Vector_2D{T}, v2::Vector_2D{T}) where T
    return acos(dot(v1, v2) / (length(v1) * length(v2)))
end

# Функция для вычисления нормального вектора (поворот на 90 градусов)
function normal_vector(v::Vector_2D{T}) where T
    return Vector_2D(-v.y, v.x)
end

# Тестирование операций и функций для Vector_2D
v1 = Vector_2D(3.0, 4.0)
v2 = Vector_2D(1.0, 2.0)

println("v1: ", v1)
println("v2: ", v2)
println("v1 + v2: ", v1 + v2)
println("v1 - v2: ", v1 - v2)
println("v1 * 2: ", v1 * 2)
println("2 * v2: ", 2 * v2)
println("Длина v1: ", length(v1))
println("Скалярное произведение v1 и v2: ", dot(v1, v2))
println("Угол между v1 и v2: ", angle_between(v1, v2))
println("Нормальный вектор к v1: ", normal_vector(v1))
