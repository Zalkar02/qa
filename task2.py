class CoffeeMachine:
	def __init__(self):
		self.milk = 1000
		self.coffee = 1000
		self.suger = 1000

	def __subtract_milk(self, milk):
		self.milk -= milk

	def __subtract_coffee(self, coffee):
		self.coffee -= coffee

	def __subtract_suger(self, suger):
		self.suger -= suger

	def make_coffee(self, milk, coffee, suger):
		if self.milk >= milk and (self.coffee >= coffee and self.suger >= suger):
			self.__subtract_milk(milk)
			self.__subtract_coffee(coffee)
			self.__subtract_suger(suger)
			print('Процесс приготовления кофе завершен!')
		else:
			if self.milk < milk:
				print(f'Пополните запасы молока на {-self.milk + milk} мл!')
			if self.coffee < coffee:
				print(f'Пополните запасы кофе на {-self.coffee + coffee} гр!')
			if self.suger < suger:
				print(f'Пополните запасы сахара на {-self.suger + suger} гр!')


if __name__ == '__main__':
	c = CoffeeMachine()
	milk = int(input('Введите количество молока: '))
	coffee = int(input('Введите количество кофе: '))
	suger = int(input('Введите количество сахара: '))
	c.make_coffee(milk, coffee, suger)