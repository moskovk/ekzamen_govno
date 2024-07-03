"Реализовать сортировку столбцов заданной числовой матрицы
(переставить столбцы матрицы) в порядке не убывания среднего
квадратического отклонения их элементов. Среднеквадратическое
отклонение вычислять с помощью однопроходного алгоритма. Для
сортировки можно воспользоваться библиотечной функцией."
using Statistics

# Функция для вычисления среднеквадратического отклонения одного столбца
function stddev_onepass(col)
    n = length(col)
    if n <= 1
        return 0.0
    end

    mean = 0.0
    m2 = 0.0

    for x in col
        delta = x - mean
        mean += delta / n
        m2 += delta * (x - mean)
    end

    variance = m2 / (n - 1)
    return sqrt(variance)
end

# Функция для сортировки столбцов матрицы по среднеквадратическому отклонению
function sort_columns_by_stddev(matrix)
    # Вычисляем среднеквадратическое отклонение для каждого столбца
    stddevs = [stddev_onepass(matrix[:, i]) for i in 1:size(matrix, 2)]

    # Получаем порядок сортировки
    sort_order = sortperm(stddevs)

    # Переставляем столбцы в соответствии с порядком сортировки
    return matrix[:, sort_order]
end

# Пример использования
matrix = rand(1:100, 5, 5)
println("Original matrix:")
println(matrix)

sorted_matrix = sort_columns_by_stddev(matrix)
println("Sorted matrix by standard deviation of columns:")
println(sorted_matrix)
