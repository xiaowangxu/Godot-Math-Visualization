extends Resource

tool

class_name Function2DLine

export(float) var w1 : float = 1.0
export(float) var w2 : float = 1.0
export(float) var b  : float = 1.0

func eval(input : float):
	if w2 ==0:
		return 0
	return -(w1* input + b)/w2 
	pass
	
func check(input : float):
	if w2 ==0:
		return false
	return true
