#Написать функцию, возвращающую ранг произвольной прямоугольной матрицы
# (реализуется на базе приведения матрицы к ступенчатому виду)

# Функция для приведения матрицы к ступенчатому виду
function row_echelon_form(A::Matrix{Float64})
    m, n = size(A)
    B = copy(A)
    lead = 1
    for r in 1:m
        if lead > n
            return B
        end
        i = r
        while B[i, lead] == 0
            i += 1
            if i > m
                i = r
                lead += 1
                if lead > n
                    return B
                end
            end
        end
        B[i, :], B[r, :] = B[r, :], B[i, :]
        B[r, :] /= B[r, lead]
        for i in 1:m
            if i != r
                B[i, :] -= B[i, lead] * B[r, :]
            end
        end
        lead += 1
    end
    return B
end

# Функция для вычисления ранга матрицы
function matrix_rank(A::Matrix{Float64})
    REF = row_echelon_form(A)
    rank = 0
    m, n = size(REF)
    for i in 1:m
        if any(REF[i, :] .!= 0)
            rank += 1
        end
    end
    return rank
end

# Пример использования
A = [1.0 2.0 3.0; 4.0 5.0 6.0; 7.0 8.0 9.0]
println("Matrix A:")
println(A)
println("Rank of A:")
println(matrix_rank(A))