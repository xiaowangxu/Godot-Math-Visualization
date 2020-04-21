extends SceneObject 

tool

class_name Point2D

enum PointType {Fixed, Function}

export(PointType) var Type : int = PointType.Fixed
export var Function : Resource
export var Position : Vector2 = Vector2.ONE setget set_Position
export var Radius : float = 10.0 setget set_Radius
export var PointColor : Color = Color.yellow

signal Position_changed(gridposition, localposition, globalposition)

func _get_configuration_warning():
	var parent = self.get_parent()
	if parent as CanvasItem:
		return ""
	return "ERROR : 2DFunctionObject need to be a child of CanvasItem"

func draw(canvas : Node2D, rect : Rect2, scale : Vector2, center : Vector2) -> void:
	match Type:
		PointType.Fixed:
			var loaclposition : Vector2 = center + Vector2(Position.x * scale.x, - Position.y * scale.y)
			canvas.draw_circle(loaclposition, Radius, PointColor)
			emit_signal("Position_changed", Position, loaclposition, canvas.to_global(loaclposition))
		PointType.Function:
			if Function.check(Position.x / scale.x):
				var loaclposition : Vector2 = center + Vector2(Position.x * scale.x, - Function.eval(Position.x) * scale.y)
				canvas.draw_circle(loaclposition, Radius, PointColor)
				emit_signal("Position_changed", Vector2(Position.x, Function.eval(Position.x)), loaclposition, canvas.to_global(loaclposition))
	pass
	
func set_Position(position : Vector2) -> void:
	Position = position
	update_Parent()
	pass

func set_Radius(radius : float) -> void:
	Radius = radius
	update_Parent()
	pass
