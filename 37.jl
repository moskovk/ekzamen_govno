"Написать функцию, позволяющую генерировать все все подмножества
n -элементного множества."

# Функция для генерации всех подмножеств множества
function generate_subsets(set::Vector)
    n = length(set)
    result = Vector{Vector{eltype(set)}}()
    
    # Вспомогательная рекурсивная функция
    function helper(current_subset::Vector, index::Int)
        if index == n + 1
            push!(result, copy(current_subset))
            return
        end
        
        # Не включаем текущий элемент в подмножество
        helper(current_subset, index + 1)
        
        # Включаем текущий элемент в подмножество
        push!(current_subset, set[index])
        helper(current_subset, index + 1)
        pop!(current_subset)
    end
    
    helper(Vector{eltype(set)}(), 1)
    return result
end

# Пример использования
set = [1, 2, 3]

subsets = generate_subsets(set)
println("All subsets:")
for subset in subsets
    println(subset)
end
