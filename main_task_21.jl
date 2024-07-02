#Реализовать вычисление медианы массива на основе процедуры Хоара.
# Функция для выполнения перестановки элементов
function partition!(arr, low, high)
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

# Функция Quickselect для нахождения k-го по величине элемента
function quickselect!(arr, low, high, k)
    if low == high
        return arr[low]
    end
    
    pivot_index = partition!(arr, low, high)
    
    if k == pivot_index
        return arr[k]
    elseif k < pivot_index
        return quickselect!(arr, low, pivot_index - 1, k)
    else
        return quickselect!(arr, pivot_index + 1, high, k)
    end
end

# Функция для нахождения медианы
function median(arr)
    n = length(arr)
    if n % 2 == 1
        return quickselect!(arr, 1, n, div(n, 2) + 1)
    else
        mid1 = quickselect!(arr, 1, n, div(n, 2))
        mid2 = quickselect!(arr, 1, n, div(n, 2) + 1)
        return (mid1 + mid2) / 2
    end
end

# Пример использования
arr = [64, 34, 25, 12, 22, 11, 90]
println("Исходный массив: ", arr)
med = median(arr)
println("Медиана: ", med)