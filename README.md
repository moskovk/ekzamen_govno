1. Спроектировать параметрический тип данных Polynomial, реализовать
операции +,-,*
2. Спроектировать параметрический тип данных Polynomial, реализовать
деление многочленов "уголком"
3. Спроектировать параметрический тип данных Polynomial, реализовать
вычисление многочлена и его производной в точке по расширенной
схеме Горнера
4. Спроектировать параметрический тип данных дуальных чисел Dual,
реализовать основные операции и все элементарные функции для
этого типа данных.
5. Спроектировать параметрический тип данных дуальных чисел Dual. С
использованием этого типа данных написать функцию высшего
порядка, получающую на вход f::Function и некоторое вещественное
число x и возвращающую кортеж значений f(x), f'(x) основные
операции и все элементарные функции для этого типа данных.
6. Спроектировать параметрический тип данных данных Residue,
представляющий собой кольцо вычетов по некоторому модулю
(параметр типа). Реализовать все операции в кольце вычетов.
7. Реализовать расширенный алгоритм Евклида. Обеспечить
возможность применение соответствующей функции не только к
элементам кольца целых чисел, но и, например, к многочленам (т.е.
функция должна быть обобщенной).
8. Спроектировать параметрический тип данных данных Residue,
представляющий собой кольцо вычетов по некоторому модулю
(параметр типа). Реализовать в функцию, обращающую все
обратимые элементы некоторого кольца вычетов.
9. Реализовать алгоритм, проверяющий, является ли заданное целое
число простым.
10. Реализовать алгоритм "решето Эратосфена", вычисляющий массив
всех простых чисел, не превосходящих заданного целого
неотрицательного числа.
11. Написать функцию factorize(n::T) where T <: Integer ,
возвращающую вектор состоящий из именованных кортежей
( NamedTuple ) с полями div и deg , в первом из которых должен
содержаться очередной простой делитель числа n , а во втором -
кратность этого делителя. Возвращаемый вектор должен содержать
кортежи со всеми простыми делителями и их кратностями (без
повторений).
12. Реализовать алгоритм, реализующий обратный ход алгоритма Гаусса
и протестировать его на случайных треугольных матрицах большого
размера.
13. Реализовать алгоритм, осуществляющий приведение матрицы
матрицы к ступенчатому виду с выбором ведущего элемента.
14. Реализовать алгоритм, реализующий метод Гаусса решение СЛАУ для
произвольной невырожденной матрицы.
15. Написать функцию, возвращающую ранг произвольной прямоугольной
матрицы (реализуется на базе приведения матрицы к ступенчатому
виду).
16. Написать функцию, возвращающую определитель произвольной
квадратной матрицы (на основе процедуры приведения матрицы к
ступенчатому виду).
17. Реализовать алгоритмы "пузырьковой" сортировки и сортировки
"расческой".
18. Реализовать алгоритм сортировки вставками и алгоритм сортировки
Шелла.
19. Реализовать алгоритм сортировки слияниями.
20. Реализовать алгоритм сортировки Хоара, и провести
экспериментально исследование этого алгоритма, аналогичное
указанному в предыдущих пунктах.
21. Реализовать вычисление медианы массива на основе процедуры
Хоара.
22. Реализовать алгоритм пирамидальной сортировки.
23. Реализовать алгоритм сортировки методом подсчета (за линейное
время), сравнить эффективность этого алгоритма в сравнении с
самым быстрым из рассматривавшихся алгоритмов.
24. Реализовать алгоритм быстрого поиска в отсортированном массиве.
25. Реализовать сортировку столбцов заданной числовой матрицы
(переставить столбцы матрицы) в порядке не убывания среднего
квадратического отклонения их элементов. Среднеквадратическое
отклонение вычислять с помощью однопроходного алгоритма. Для
сортировки можно воспользоваться библиотечной функцией.
26. Реализовать параметрический тип данных Vector_2D, и определить
для него основные операции и функции, необходимые для решения
геометрических задач на плоскости.
27. Написать функцию, возвращающую координаты точки пересечения
(возвращаемый тип Vector_2D ) двух заданных отрезков
(представляемых типом Segment2D , см. лекцию), если таковая
имеется, или nothing, если отрезки не пересекаются. Учесть при этом,
с помощь перехвата и обработки прерывания, возможность того, что
отрезки могут лежать на параллельных прямых.
28. Написать функцию, осуществляющую проверку (возвращающую
значение типа True ), лежат ли две заданные точки (типа Vector_3D )
по одну сторону от заданной прямой (прямая задается значением типа
Segment2D , см. лекцию 6); делать это двумя способами, которые
обсуждались на лекции.
29. Написать функцию, определяющую (возвращающую значение типа
True ), является ли заданный многоугольник (задается вектором типа
Vector{Vector_3D} ) выпуклым.
30. Написать функцию, проверяющую, лежит ли заданная точка внутри
заданного многоугольника (не обязательно выпуклого).
31. функцию, реализующую алгоритм Джарвиса построения выпуклой
оболочки заданного набора (множества) точек плоскости.
32. функцию, реализующую алгоритм Грехома построения выпуклой
оболочки заданного набора (множества) точек плоскости.
33. Написать функцию, возвращающую площадь (ориентированную)
многоугольника, заданного последовательностью своих вершин,
вычисляемую методом трапеций.
34. Написать функцию, возвращающую площадь (ориентированную)
многоугольника, заданного последовательностью своих вершин,
вычисляемую методом треугольников.
35. Написать функцию, позволяющую генерировать все размещения n
элементов по k с повторениями.
36. Написать функцию, позволяющую генерировать все перестановки n
элементов.
37. Написать функцию, позволяющую генерировать все все подмножества
n -элементного множества.
38. Написать функцию, позволяющую генерировать все k -элементные
подмножества n -элементного множества.
39. Написать функцию, позволяющую генерировать все Разбиения
натурального числа на положительные слагаемые.
40. Спроектировать абстрактный тип AbstractCombinObject и определить
для него итераторы для перебора комбинаторных объектов.
Спроектировать какой-либо конкретный тип данных (например, для
генерации всех размещений n элементов по k с повторениями),
наследуя его от AbstractCombinObject .
