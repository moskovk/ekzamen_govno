# Реализовать алгоритм сортировки слияниями
function merge_sort(arr)
    # Базовый случай: если массив состоит из одного элемента или пуст, он уже отсортирован
    if length(arr) <= 1
        return arr
    end

    # Разделение массива на две половины
    mid = div(length(arr), 2)
    left_half = arr[1:mid]
    right_half = arr[mid+1:end]

    # Рекурсивная сортировка каждой половины
    left_sorted = merge_sort(left_half)
    right_sorted = merge_sort(right_half)

    # Слияние двух отсортированных половин
    return merge(left_sorted, right_sorted)
end

function merge(left, right)
    sorted = []
    i, j = 1, 1

    while i <= length(left) && j <= length(right)
        if left[i] <= right[j]
            push!(sorted, left[i])
            i += 1
        else
            push!(sorted, right[j])
            j += 1
        end
    end

    # Добавление оставшихся элементов
    while i <= length(left)
        push!(sorted, left[i])
        i += 1
    end
    while j <= length(right)
        push!(sorted, right[j])
        j += 1
    end

    return sorted
end

# Пример использования сортировки слиянием
arr = [64, 34, 25, 12, 22, 11, 90]
println("Исходный массив: ", arr)
sorted_arr = merge_sort(arr)
println("Отсортированный массив: ", sorted_arr)