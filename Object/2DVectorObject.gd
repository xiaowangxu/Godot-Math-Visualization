extends Line2DObject

tool

class_name Vector2DObject

export var TipWidth : float = 20 setget set_TipWidth
export var HoldBack : Vector2 = Vector2.ZERO setget set_HoldBack

func draw(canvas : Node2D, rect : Rect2, scale : Vector2, center : Vector2) -> void:
	var localpositionfrom : Vector2 = center + Vector2(PositionFrom.x * scale.x, - PositionFrom.y * scale.y)
	var localpositionto : Vector2 = center + Vector2(PositionTo.x * scale.x, - PositionTo.y * scale.y)
	localpositionfrom = localpositionfrom + (localpositionto - localpositionfrom).normalized() * HoldBack.x
	localpositionto = localpositionto - (localpositionto - localpositionfrom).normalized() * HoldBack.y
	canvas.draw_line(localpositionfrom, localpositionto - (localpositionto - localpositionfrom).normalized() * TipWidth, LineColor, LineWidth, true)
	var point1 : Vector2 = Vector2(0, 0)
	var point2 : Vector2 = Vector2(-TipWidth, TipWidth/2.0)
	var point3 : Vector2 = Vector2(-TipWidth, -TipWidth/2.0)
	var angle : float = PI + localpositionfrom.angle_to_point(localpositionto)
#	print(rad2deg(angle))
	point1 = point1.rotated(angle)
	point2 = point2.rotated(angle)
	point3 = point3.rotated(angle)
	var points : PoolVector2Array = [point1 + localpositionto, point2 + localpositionto, point3 + localpositionto]
	canvas.draw_colored_polygon(points, LineColor)
	
	pass
	
func set_TipWidth(width : float) -> void:
	TipWidth = width
	update_Parent()
	pass

func set_HoldBack(holdbaack : Vector2) -> void:
	HoldBack = holdbaack
	update_Parent()
	pass
