# Функция для обмена элементов в массиве
function swap!(arr::Vector{T}, i::Int, j::Int) where T
    arr[i], arr[j] = arr[j], arr[i]
end

# Рекурсивная функция для генерации перестановок
function generate_permutations(arr::Vector{T}, l::Int, r::Int, result::Vector{Vector{T}}) where T
    if l == r
        # Добавляем копию текущей перестановки в результат
        push!(result, copy(arr))
    else
        for i in l:r
            # Меняем элементы местами
            swap!(arr, l, i)
            # Рекурсивно генерируем перестановки для следующего уровня
            generate_permutations(arr, l+1, r, result)
            # Возвращаем элементы на место
            swap!(arr, l, i)
        end
    end
end

# Основная функция для генерации всех перестановок n элементов
function permutations(arr::Vector{T}) where T
    result = Vector{Vector{T}}()
    generate_permutations(arr, 1, length(arr), result)
    return result
end

# Тестирование функции permutations
n = 3
elements = collect(1:n)
perms = permutations(elements)

println("Все перестановки $n элементов:")
for perm in perms
    println(perm)
end
