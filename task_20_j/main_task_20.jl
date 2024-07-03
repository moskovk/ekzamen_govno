# Функция для выполнения быстрой сортировки (сортировка Хоара)
function quicksort!(arr::Vector{T}, low::Int, high::Int) where T
    if low < high
        # Получаем индекс элемента-разделителя
        p = partition!(arr, low, high)
        # Рекурсивно сортируем левую и правую части массива
        quicksort!(arr, low, p - 1)
        quicksort!(arr, p + 1, high)
    end
end

# Функция для разделения массива
function partition!(arr::Vector{T}, low::Int, high::Int) where T
    pivot = arr[high]
    i = low - 1

    for j in low:high-1
        if arr[j] <= pivot
            i += 1
            arr[i], arr[j] = arr[j], arr[i]
        end
    end

    arr[i + 1], arr[high] = arr[high], arr[i + 1]
    return i + 1
end

# Вспомогательная функция для удобного вызова быстрой сортировки
function quicksort!(arr::Vector{T}) where T
    quicksort!(arr, 1, length(arr))
end

# Тестирование функции quicksort!
arr = [3, 6, 8, 10, 1, 2, 1]
println("Исходный массив: ", arr)
quicksort!(arr)
println("Отсортированный массив: ", arr)

using Pkg
Pkg.add("BenchmarkTools")
using Random
using Statistics
using BenchmarkTools

# Функция для выполнения быстрой сортировки (сортировка Хоара)
function quicksort!(arr::Vector{T}, low::Int, high::Int) where T
    if low < high
        # Получаем индекс элемента-разделителя
        p = partition!(arr, low, high)
        # Рекурсивно сортируем левую и правую части массива
        quicksort!(arr, low, p - 1)
        quicksort!(arr, p + 1, high)
    end
end

# Функция для разделения массива
function partition!(arr::Vector{T}, low::Int, high::Int) where T
    pivot = arr[high]
    i = low - 1

    for j in low:high-1
        if arr[j] <= pivot
            i += 1
            arr[i], arr[j] = arr[j], arr[i]
        end
    end

    arr[i + 1], arr[high] = arr[high], arr[i + 1]
    return i + 1
end

# Вспомогательная функция для удобного вызова быстрой сортировки
function quicksort!(arr::Vector{T}) where T
    quicksort!(arr, 1, length(arr))
end

# Тестирование функции quicksort!
arr = [3, 6, 8, 10, 1, 2, 1]
println("Исходный массив: ", arr)
quicksort!(arr)
println("Отсортированный массив: ", arr)

# Генерация случайного массива заданной длины
function generate_random_array(length::Int, max_value::Int = 1000)
    return rand(1:max_value, length)
end

# Проведение эксперимента с сортировкой Хоара на массивах разных размеров
function experimental_study()
    sizes = [100, 1000, 5000, 10000, 20000]
    results = Dict()

    for size in sizes
        arr = generate_random_array(size)
        time = @belapsed quicksort!(arr)
        results[size] = time
    end

    return results
end

# Запуск экспериментального исследования и вывод результатов
results = experimental_study()
for (size, time) in results
    println("Размер массива: $size, время сортировки: $time секунд")
end
