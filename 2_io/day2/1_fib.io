#!/usr/local/bin/IO

Fibex := Object clone

Fibex calculateFib := method(n,
        if ((n == 0) or (n == 1), return n)
        sum := 0
        term1 := 0
        term2 := 1
	for (i, 2, n, sum = term1 + term2; term1 = term2; term2 = sum)
        return sum
)

Fibex showFib := method(n,
	("fib(" .. n .. ") = " .. calculateFib(n)) println
)

Fibex showFib(0)
Fibex showFib(1)
Fibex showFib(2)
Fibex showFib(3)
Fibex showFib(4)
Fibex showFib(5)
Fibex showFib(6)
Fibex showFib(7)
