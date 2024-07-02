# Функция для разделения массива и определения опорного элемента
function partition!(arr::Vector{T}, low::Int, high::Int) where T
    pivot = arr[high]  # Опорный элемент
    i = low - 1        # Индекс меньшего элемента

    for j in low:high-1
        if arr[j] <= pivot
            i += 1
            arr[i], arr[j] = arr[j], arr[i]  # Обмен элементов
        end
    end

    arr[i + 1], arr[high] = arr[high], arr[i + 1]  # Обмен опорного элемента
    return i + 1  # Возвращаем индекс опорного элемента
end

# Основная функция быстрой сортировки
function quicksort!(arr::Vector{T}, low::Int, high::Int) where T
    if low < high
        # Получаем индекс опорного элемента, с которым массив разделен
        pi = partition!(arr, low, high)

        # Рекурсивно сортируем элементы до и после опорного элемента
        quicksort!(arr, low, pi - 1)
        quicksort!(arr, pi + 1, high)
    end
end

# Вспомогательная функция для удобного вызова быстрой сортировки
function quicksort!(arr::Vector{T}) where T
    quicksort!(arr, 1, length(arr))
end

# Тестирование функции быстрой сортировки
arr = [10, 7, 8, 9, 1, 5]
println("Исходный массив: ", arr)
quicksort!(arr)
println("Отсортированный массив: ", arr)

using Random  # Для генерации случайных чисел
using Statistics  # Для вычисления статистических данных
using BenchmarkTools  # Для измерения производительности

# Функция для генерации случайного массива заданной длины
function generate_random_array(n::Int)
    return rand(1:1000, n)
end

# Функция для выполнения экспериментов
function experiment()
    sizes = [100, 1000, 5000, 10000, 20000]  # Размеры массивов для тестирования
    results = Dict{Int, Float64}()

    for size in sizes
        arr = generate_random_array(size)
        @show size  # Выводим размер массива
        @btime quicksort!(arr) setup = (arr = copy(arr)) evals = 1  # Измеряем время сортировки и выводим результаты
    end
end

# Проведение экспериментов
experiment()

using Pkg
Pkg.add("BenchmarkTools")
