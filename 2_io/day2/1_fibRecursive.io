#!/usr/local/bin/IO

Fibex := Object clone

Fibex calculateFib := method(n,
        if ((n == 0) or (n == 1), return n, return calculateFib(n-1) + calculateFib(n-2))
)

Fibex showFib := method(n,
	("fib(" .. n .. ") = " .. calculateFib(n)) println
)

Fibex showFib(0) 0
Fibex showFib(1) 1
Fibex showFib(2) 2
Fibex showFib(3) 3
Fibex showFib(4) 5
Fibex showFib(5) 8
Fibex showFib(6) 13
Fibex showFib(7) 21
