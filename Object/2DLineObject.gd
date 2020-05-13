extends SceneObject 

tool

class_name Line2DObject

export var PositionFrom : Vector2 = Vector2.ONE setget set_PositionFrom
export var PositionTo : Vector2 = Vector2.ONE setget set_PositionTo
export var LineWidth : float = 10.0 setget set_LineWidth
export var LineColor : Color = Color.yellow setget set_LineColor

func _get_configuration_warning():
	var parent = self.get_parent()
	if parent as SceneRenderer:
		return ""
	return "ERROR : Line2DObject need to be a child of SceneRenderer"

func draw(canvas : Node2D, rect : Rect2, scale : Vector2, center : Vector2) -> void:
	var localpositionfrom : Vector2 = center + Vector2(PositionFrom.x * scale.x, - PositionFrom.y * scale.y)
	var localpositionto : Vector2 = center + Vector2(PositionTo.x * scale.x, - PositionTo.y * scale.y)
	canvas.draw_line(localpositionfrom, localpositionto, LineColor, LineWidth, true)
	pass
	
func set_PositionFrom(position : Vector2) -> void:
	PositionFrom = position
	update_Parent()
	pass

func set_PositionTo(position : Vector2) -> void:
	PositionTo = position
	update_Parent()
	pass

func set_LineWidth(width : float) -> void:
	LineWidth = width
	update_Parent()
	pass
	
func set_LineColor(color : Color) -> void:
	LineColor = color
	update_Parent()
	pass
