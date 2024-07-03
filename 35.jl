"Написать функцию, позволяющую генерировать все размещения n
элементов по k с повторениями"

# Функция для генерации всех размещений n элементов по k с повторениями
function generate_permutations_with_repetition(elements::Vector, k::Int)
    n = length(elements)
    result = Vector{Vector{eltype(elements)}}()

    function helper(current_perm::Vector)
        if length(current_perm) == k
            push!(result, copy(current_perm))
            return
        end

        for i in 1:n
            push!(current_perm, elements[i])
            helper(current_perm)
            pop!(current_perm)
        end
    end

    helper(Vector{eltype(elements)}())
    return result
end

# Пример использования
elements = ['A', 'B', 'C']
k = 2

permutations = generate_permutations_with_repetition(elements, k)
println("All permutations with repetition:")
for perm in permutations
    println(perm)
end
