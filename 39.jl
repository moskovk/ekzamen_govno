"Написать функцию, позволяющую генерировать все Разбиения
натурального числа на положительные слагаемые"

# Функция для генерации всех разбиений натурального числа на положительные слагаемые
function generate_partitions(n::Int)
    result = Vector{Vector{Int}}()
    
    # Вспомогательная рекурсивная функция
    function helper(current_partition::Vector{Int}, remaining::Int, start::Int)
        if remaining == 0
            push!(result, copy(current_partition))
            return
        end
        
        for i in start:remaining
            push!(current_partition, i)
            helper(current_partition, remaining - i, i)
            pop!(current_partition)
        end
    end
    
    helper(Vector{Int}(), n, 1)
    return result
end

# Пример использования
n = 5

partitions = generate_partitions(n)
println("All partitions of $n into positive integers:")
for partition in partitions
    println(partition)
end
