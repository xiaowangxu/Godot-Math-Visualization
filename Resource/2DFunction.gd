extends Resource

tool 

static func eval(input : float):
	return tanh(input)
	pass
	
static func check(input : float):
	return true
