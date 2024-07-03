"Написать функцию, возвращающую координаты точки пересечения
(возвращаемый тип Vector_2D ) двух заданных отрезков
(представляемых типом Segment2D , см. лекцию), если таковая
имеется, или nothing, если отрезки не пересекаются. Учесть при этом,
с помощь перехвата и обработки прерывания, возможность того, что
отрезки могут лежать на параллельных прямых."

struct Vector2D
    x::Float64
    y::Float64
end

struct Segment2D
    p1::Vector2D
    p2::Vector2D
end

# Вспомогательная функция для вычисления детерминанта 2x2 матрицы
function det(a, b, c, d)
    return a * d - b * c
end

# Функция для вычисления точки пересечения двух отрезков
function segment_intersection(s1::Segment2D, s2::Segment2D)
    x1, y1 = s1.p1.x, s1.p1.y
    x2, y2 = s1.p2.x, s1.p2.y
    x3, y3 = s2.p1.x, s2.p1.y
    x4, y4 = s2.p2.x, s2.p2.y

    # Вычисляем детерминанты
    denom = det(x1 - x2, y1 - y2, x3 - x4, y3 - y4)
    
    if denom == 0.0
        # Отрезки параллельны или коллинеарны
        return nothing
    end

    # Вычисляем координаты точки пересечения
    px = det(det(x1, y1, x2, y2), x1 - x2, det(x3, y3, x4, y4), x3 - x4) / denom
    py = det(det(x1, y1, x2, y2), y1 - y2, det(x3, y3, x4, y4), y3 - y4) / denom

    # Проверяем, что точка пересечения находится внутри обоих отрезков
    if min(x1, x2) <= px <= max(x1, x2) && min(y1, y2) <= py <= max(y1, y2) &&
       min(x3, x4) <= px <= max(x3, x4) && min(y3, y4) <= py <= max(y3, y4)
        return Vector2D(px, py)
    else
        return nothing
    end
end

# Пример использования
s1 = Segment2D(Vector2D(0, 0), Vector2D(2, 2))
s2 = Segment2D(Vector2D(0, 2), Vector2D(2, 0))

intersection = segment_intersection(s1, s2)
println("Intersection: ", intersection)
