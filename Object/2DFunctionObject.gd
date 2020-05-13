extends SceneObject 

tool

class_name Function2DObject

export var Function : Resource
export var FunctionRange : Vector2 = Vector2(-100,100)
export var StepCount : int = 100 setget set_StepCount
export var LineWidth : float = 4.0 setget set_LineWidth
export var LineColor : Color = Color.rebeccapurple setget set_LineColor

func _get_configuration_warning():
	var parent = self.get_parent()
	if parent as Coordinate2DRenderer:
		return ""
	return "ERROR : 2DFunctionObject need to be a child of Coordinate2DRenderer"

func draw(canvas : Node2D, rect : Rect2, scale : Vector2, center : Vector2) -> void:
	var rangea : float = -center.x
	var rangeb : float = rect.size.x - center.x
	var points : PoolVector2Array
	var i : float = max(rangea, FunctionRange.x * scale.x)
	var top : float = min(rangeb, FunctionRange.y * scale.x)
	var step : float = (top-i)/float(StepCount)
	while i < top:
		var vaild = Function.check(i/scale.x)
		if vaild:
			var point : Vector2 = center + Vector2(i, -Function.eval(i/scale.x) * scale.y)
			points.append(point)
		else:
			if not points.size() < 2:
				canvas.draw_polyline(points, LineColor, LineWidth, true)
			points.resize(0)
		i += step
	var vaild = Function.check(top/scale.x)
	if vaild:
		var point : Vector2 = center + Vector2(top, -Function.eval(top/scale.x) * scale.y)
		points.append(point)
	if not points.size() < 2:
		canvas.draw_polyline(points, LineColor, LineWidth, true)
	pass
	
func set_StepCount(stepcount : int) -> void:
	StepCount = stepcount
	update_Parent()
	pass
	
func set_LineWidth(linewidth : float) -> void:
	LineWidth = linewidth
	update_Parent()
	pass
	
func set_LineColor(color : Color) -> void:
	LineColor = color
	update_Parent()
	pass
