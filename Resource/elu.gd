extends Resource

tool 

static func eval(input : float):
	if input > 0:
		return input
	else:
		return 1*(exp(input) - 1)
	pass
	
static func check(input : float):
	return true
