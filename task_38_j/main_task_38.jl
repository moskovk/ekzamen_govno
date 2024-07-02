# Рекурсивная функция для генерации k-элементных подмножеств
function generate_combinations(arr::Vector{T}, k::Int, start::Int, curr::Vector{T}, result::Vector{Vector{T}}) where T
    # Если текущая комбинация достигла длины k, добавляем ее в результат
    if length(curr) == k
        push!(result, copy(curr))
        return
    end

    # Идем по элементам массива начиная с текущей позиции start
    for i in start:length(arr)
        # Добавляем текущий элемент в комбинацию
        push!(curr, arr[i])
        # Рекурсивно генерируем комбинации, начиная с следующего элемента
        generate_combinations(arr, k, i + 1, curr, result)
        # Удаляем последний элемент для возврата к предыдущему состоянию
        pop!(curr)
    end
end

# Основная функция для генерации всех k-элементных подмножеств из n-элементного множества
function combinations(arr::Vector{T}, k::Int) where T
    result = Vector{Vector{T}}()
    generate_combinations(arr, k, 1, T[], result)
    return result
end

# Тестирование функции combinations
n = 5
k = 3
elements = collect(1:n)
combs = combinations(elements, k)

println("Все $k-элементные подмножества $n-элементного множества:")
for comb in combs
    println(comb)
end
