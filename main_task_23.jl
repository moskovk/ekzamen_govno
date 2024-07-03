# Реализовать алгоритм сортировки методом подсчета (за линейное время), сравнить эффективность этого 
#алгоритма в сравнении с самым быстрым из рассматривавшихся алгоритмов.
using BenchmarkTools

function counting_sort(arr)
    max_val = maximum(arr)
    min_val = minimum(arr)
    range_val = max_val - min_val + 1

    count = zeros(Int, range_val)
    output = similar(arr)

    # Подсчитываем количество элементов
    for num in arr
        count[num - min_val + 1] += 1
    end

    # Накапливаемые суммы для индексов
    for i in 2:length(count)
        count[i] += count[i - 1]
    end

    # Сортируем элементы по индексу
    for num in reverse(arr)
        output[count[num - min_val + 1]] = num
        count[num - min_val + 1] -= 1
    end

    return output
end

# Генерация случайного массива
n = 1000000
arr = rand(1:1000, n)

# Копия массива для честного сравнения
arr_copy = copy(arr)

# Измерение времени для Counting Sort
@btime counting_sort($arr)

# Измерение времени для QuickSort
@btime sort($arr_copy)

