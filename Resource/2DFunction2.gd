extends Resource

tool 

static func eval(input : float) -> float:
	return 1 / (1 + exp(-input))
	pass
	
static func check(intput : float) -> bool:
	return true
