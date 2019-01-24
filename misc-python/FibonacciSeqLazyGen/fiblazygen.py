def fibGen():
	first = 0
	second = 1
	
	while True:
		yield first
		tmp = second
		second += first
		first = tmp
		
print("++Fibonacci Sequence Generator++")
print("Hit enter to generate next number")
gen = fibGen()

while True:
	input("")
	print(next(gen))
