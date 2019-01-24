print("Fibonacci Sequence Slow Generator")
first = 0
second = 1
while True:
	x = 0
	while (x < 100000000):
		x += 1
	print(first)
	tmp = second
	second += first
	first = tmp
