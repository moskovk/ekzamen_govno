# Функция для выполнения бинарного поиска в отсортированном массиве
# arr - отсортированный массив
# x - значение, которое нужно найти
# Возвращает индекс элемента x в массиве arr, если x присутствует, иначе -1
function binary_search(arr::Vector{T}, x::T) where T
    low = 1  # Начальный индекс
    high = length(arr)  # Конечный индекс

    while low <= high
        mid = div(low + high, 2)  # Средний индекс

        # Проверяем, является ли x средним элементом
        if arr[mid] == x
            return mid
        # Если x больше, игнорируем левую половину
        elseif arr[mid] < x
            low = mid + 1
        # Если x меньше, игнорируем правую половину
        else
            high = mid - 1
        end
    end

    # Если элемент не найден, возвращаем -1
    return -1
end

# Тестирование функции бинарного поиска
arr = [2, 3, 4, 10, 40]
x = 10
index = binary_search(arr, x)
if index != -1
    println("Элемент $x найден в индексе $index")
else
    println("Элемент $x не найден в массиве")
end

x = 5
index = binary_search(arr, x)
if index != -1
    println("Элемент $x найден в индексе $index")
else
    println("Элемент $x не найден в массиве")
end
