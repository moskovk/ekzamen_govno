#Реализовать алгоритмы "пузырьковой" сортировки и сортировки "расческой"
#Пузырьковая сортировка 
function bubble_sort!(arr)
    n = length(arr)
    for i in 1:n-1
        for j in 1:n-i
            if arr[j] > arr[j+1]
                arr[j], arr[j+1] = arr[j+1], arr[j]
            end
        end
    end
    return arr
end

# Пример использования пузырьковой сортировки
arr = [64, 34, 25, 12, 22, 11, 90]
println("Исходный массив: ", arr)
bubble_sort!(arr)
println("Отсортированный массив: ", arr)


# Сортировка расческой 
function comb_sort!(arr)
    n = length(arr)
    gap = n
    shrink = 1.3
    sorted = false

    while gap > 1 || !sorted
        gap = max(1, floor(Int, gap / shrink))
        sorted = true

        for i in 1:(n - gap)
            if arr[i] > arr[i + gap]
                arr[i], arr[i + gap] = arr[i + gap], arr[i]
                sorted = false
            end
        end
    end

    return arr
end

# Пример использования сортировки расческой
arr = [64, 34, 25, 12, 22, 11, 90]
println("Исходный массив: ", arr)
comb_sort!(arr)
println("Отсортированный массив: ", arr)