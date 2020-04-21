extends SceneRenderer

tool

class_name VBoxRenderer

export(int, "Left", "Center", "Right") var HAlign : int = 0 setget set_HAlign

func get_Rect() -> Rect2:
	var rectans : Rect2 = Rect
	var maxwidth : float = 0
	var height : float = 0
	for child in get_children():
		if child as SceneObject:
			var rect : Rect2 = child.get_Rect(self, Rect, Vector2(1, -1), Center)
			maxwidth = max(maxwidth, rect.position.x + rect.size.x)
#			print(rect)
			height += rect.position.y + rect.size.y
		elif child as SceneRenderer:
			var rect : Rect2 = child.get_Rect()
			maxwidth = max(maxwidth, rect.position.x + rect.size.x)
			height += rect.size.y
	rectans.size.x = maxwidth
	rectans.size.y = height - Center.y
	return rectans

func _draw() -> void:
	Rect = self.get_Rect()
	self.draw_Rect_Center()
	if Clip:
		VisualServer.canvas_item_set_custom_rect(get_canvas_item(), true, Rect)
		VisualServer.canvas_item_set_clip(get_canvas_item(), true)

	var center : Vector2 = Vector2.ZERO
	for child in get_children():
		if child as SceneObject:
			var rect : Rect2 = child.get_Rect(self, Rect, Vector2(1, -1), Center)
			var itemcenter : float = 0
			match HAlign:
				2:
					itemcenter = Rect.size.x - rect.size.x
				1:
					itemcenter = (Rect.size.x - rect.size.x) / 2.0
			child.draw(self, Rect, Vector2(1, -1), Center + Vector2(itemcenter, center.y))
			center.y +=  rect.position.y + rect.size.y - Center.y
		elif child as SceneRenderer:
			var rect : Rect2 = child.get_Rect()
			var itemcenter : float = 0
			match HAlign:
				2:
					itemcenter = Rect.size.x - rect.size.x
				1:
					itemcenter = (Rect.size.x - rect.size.x) / 2.0
			child.position = Center +  Vector2(itemcenter, center.y)
			child.update()
			center.y += rect.size.y
	pass

func set_HAlign(align : int) -> void:
	HAlign = align
	update_Renderer()
	pass

	
