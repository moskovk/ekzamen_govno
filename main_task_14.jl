#Реализовать алгоритм, реализующий метод Гаусса решение СЛАУ для произвольной невырожденной матрицы
# Функция для выполнения прямого хода метода Гаусса
function forward_elimination!(A, b)
    n = size(A, 1)
    for i in 1:n
        # Поиск максимального элемента в столбце
        max_row = i
        for k in i+1:n
            if abs(A[k, i]) > abs(A[max_row, i])
                max_row = k
            end
        end

        # Поменять местами текущую строку и строку с максимальным элементом
        A[i, :], A[max_row, :] = A[max_row, :], A[i, :]
        b[i], b[max_row] = b[max_row], b[i]

        # Приведение к ступенчатому виду
        for k in i+1:n
            c = -A[k, i] / A[i, i]
            A[k, i] = 0.0
            for j in i+1:n
                A[k, j] += c * A[i, j]
            end
            b[k] += c * b[i]
        end
    end
end

# Функция для выполнения обратного хода метода Гаусса
function back_substitution(A, b)
    n = size(A, 1)
    x = zeros(Float64, n)
    for i in n:-1:1
        sum_ax = 0.0
        for j in i+1:n
            sum_ax += A[i, j] * x[j]
        end
        x[i] = (b[i] - sum_ax) / A[i, i]
    end
    return x
end

# Функция для решения СЛАУ методом Гаусса
function gauss(A, b)
    A = copy(A)  # Копируем матрицу A, чтобы не мод