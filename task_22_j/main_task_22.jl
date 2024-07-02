function heapify!(arr, n, i)
    largest = i  # Инициализируем наибольший элемент как корень
    left = 2 * i  # Левый потомок
    right = 2 * i + 1  # Правый потомок

    # Проверяем, существует ли левый потомок и больше ли он корня
    if left <= n && arr[left] > arr[largest]
        largest = left
    end

    # Проверяем, существует ли правый потомок и больше ли он наибольшего элемента на данный момент
    if right <= n && arr[right] > arr[largest]
        largest = right
    end

    # Если наибольший элемент не корень, меняем их местами
    if largest != i
        arr[i], arr[largest] = arr[largest], arr[i]
        # Рекурсивно применяем heapify к затронутой подкуче
        heapify!(arr, n, largest)
    end
end

function heapsort!(arr)
    n = length(arr)

    # Построение max-heap (пирамиды)
    for i in div(n, 2):-1:1
        heapify!(arr, n, i)
    end

    # Извлечение элементов из кучи по одному
    for i in n:-1:2
        # Перемещаем текущий корень в конец
        arr[1], arr[i] = arr[i], arr[1]
        # Вызываем heapify на уменьшенной куче
        heapify!(arr, i - 1, 1)
    end

    return arr
end

# Пример использования
arr = [12, 11, 13, 5, 6, 7]
println("Исходный массив: ", arr)
heapsort!(arr)
println("Отсортированный массив: ", arr)