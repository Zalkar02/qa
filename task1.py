with open("air.txt") as f:
	d = {}
	text = f.read()
	a = set(text)
	a.remove(' ')
	a.remove('\n')
	a.remove(',')
	a.remove('.')
	for i in a:
		d[i] = text.count(i)
	for k,v in d.items():
		print(f'{k}: {v}')
	x = {k:v for k,v in d.items() if max(d.values()) == v}
	print(x)