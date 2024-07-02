# Функция сортировки вставками
function insertion_sort!(arr::Vector{T}) where T
    n = length(arr)
    for i in 2:n
        key = arr[i]
        j = i - 1

        # Перемещаем элементы arr[1..i-1], которые больше ключа, на одну позицию вперед
        while j >= 1 && arr[j] > key
            arr[j + 1] = arr[j]
            j -= 1
        end

        # Вставляем ключ в правильную позицию
        arr[j + 1] = key
    end
    return arr
end

# Тестирование функции сортировки вставками
arr = [12, 11, 13, 5, 6]
println("Исходный массив: ", arr)
sorted_arr = insertion_sort!(arr)
println("Отсортированный массив: ", sorted_arr)


# Функция сортировки Шелла
function shell_sort!(arr::Vector{T}) where T
    n = length(arr)
    gap = div(n, 2)

    # Уменьшаем gap до 1
    while gap > 0
        for i in gap+1:n
            key = arr[i]
            j = i

            # Сравниваем и перемещаем элементы с учетом текущего gap
            while j > gap && arr[j - gap] > key
                arr[j] = arr[j - gap]
                j -= gap
            end

            # Вставляем ключ в правильную позицию
            arr[j] = key
        end

        gap = div(gap, 2)
    end
    return arr
end

# Тестирование функции сортировки Шелла
arr = [12, 34, 54, 2, 3]
println("Исходный массив: ", arr)
sorted_arr = shell_sort!(arr)
println("Отсортированный массив: ", sorted_arr)
