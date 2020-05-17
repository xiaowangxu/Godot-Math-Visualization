extends SceneObject 

tool

class_name Circle2DObject

enum PointType {Fixed, Function}

export var Position : Vector2 = Vector2.ONE setget set_Position
export var Radius : float = 10.0 setget set_Radius
export var LineColor : Color = Color.yellow setget set_LineColor
export var Fill : bool = false setget set_Fill
export var FillColor : Color = Color.yellow setget set_FillColor

signal Position_changed(gridposition, localposition, globalposition)

func _get_configuration_warning():
	var parent = self.get_parent()
	if parent as SceneRenderer:
		return ""
	return "ERROR : 2DFunctionObject need to be a child of SceneRenderer"

func get_Rect(canvas : Node2D, rect : Rect2, scale : Vector2, center : Vector2) -> Rect2:
	return Rect2(Position - Vector2.ONE * Radius, Vector2.ONE * Radius * 2)

func draw(canvas : Node2D, rect : Rect2, scale : Vector2, center : Vector2) -> void:
#	print(">> Circle")
	var loaclposition : Vector2 = center + Vector2(Position.x * scale.x, - Position.y * scale.y)
	if Fill :
		canvas.draw_circle(loaclposition, Radius, FillColor)
	canvas.draw_arc(loaclposition, Radius, 0, 2*PI, 1000, LineColor, 3.0, true)
	pass
	
func set_Position(position : Vector2) -> void:
	Position = position
	update_Parent()
	pass

func set_Radius(radius : float) -> void:
	Radius = radius
	update_Parent()
	pass
	
func set_LineColor(color : Color) -> void:
	LineColor = color
	update_Parent()
	pass
	
func set_Fill(fill : bool) -> void:
	Fill = fill
	update_Parent()
	pass
	
func set_FillColor(color : Color) -> void:
	FillColor = color
	update_Parent()
	pass

