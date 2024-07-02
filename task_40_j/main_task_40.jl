# Определяем абстрактный тип AbstractCombinObject
abstract type AbstractCombinObject end

# Определяем конкретный тип для генерации размещений с повторениями
struct PermutationsWithRepetition <: AbstractCombinObject
    elements::Vector{Any}
    k::Int
end

# Конструктор для создания объекта PermutationsWithRepetition
function PermutationsWithRepetition(elements::Vector{Any}, k::Int)
    return PermutationsWithRepetition(elements, k)
end

# Определяем итератор для перебора размещений с повторениями
function Base.iterate(p::PermutationsWithRepetition, state=(1, fill(1, p.k)))
    i, indices = state
    n = length(p.elements)
    k = p.k

    if i > k
        return nothing
    end

    result = [p.elements[idx] for idx in indices]

    # Увеличиваем индекс для генерации следующего размещения
    for j in k:-1:1
        if indices[j] < n
            indices[j] += 1
            break
        else
            if j == 1
                return nothing
            end
            indices[j] = 1
        end
    end

    return result, (i + 1, indices)
end

# Определяем начальное состояние итератора
function Base.iterate(p::PermutationsWithRepetition)
    return iterate(p, (1, fill(1, p.k)))
end

# Тестирование PermutationsWithRepetition
elements = [1, 2, 3]
k = 2
pwr = PermutationsWithRepetition(elements, k)

println("Размещения $length(elements) элементов по $k с повторениями:")
for perm in pwr
    println(perm)
end
