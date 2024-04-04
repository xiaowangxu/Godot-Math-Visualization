extends SceneObject 

tool

class_name DrawArea2DObject

export var Points : PoolVector2Array = [] setget set_Points
export var LineWidth : float = 10.0 setget set_LineWidth
export var LineColor : Color = Color.yellow setget set_LineColor

func _get_configuration_warning():
	var parent = self.get_parent()
	if parent as SceneRenderer:
		return ""
	return "ERROR : DrawArea2DObject need to be a child of SceneRenderer"

func draw(canvas : Node2D, rect : Rect2, scale : Vector2, center : Vector2) -> void:
	if Points.size() < 3:
		return
	var positions : PoolVector2Array = []
	for point in Points:
		positions.append(center + Vector2(point.x * scale.x, - point.y * scale.y))
	canvas.draw_polygon(positions, PoolColorArray([LineColor]), PoolVector2Array(), null, null, true)
	pass

func set_Points(points : PoolVector2Array) -> void:
	Points = points
	update_Parent()
	pass

func add_Point(point : Vector2) -> void:
	Points.append(point)
	update_Parent()
	pass
	
func remove_Point(idx : int) -> void:
	Points.remove(idx)
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
