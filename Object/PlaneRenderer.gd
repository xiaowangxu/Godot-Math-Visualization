extends SceneRenderer 

tool

class_name Plane2DRenderer

func _draw() -> void:
	#RenderTarget.draw_rect(Rect2(Position, Size), Color.white, false, 2.0, true)
	self.draw_Rect_Center()
	if Clip:
		VisualServer.canvas_item_set_custom_rect(get_canvas_item(), true, Rect)
		VisualServer.canvas_item_set_clip(get_canvas_item(), true)
	for child in get_children():	
		if child as SceneObject:
			child.draw(self, Rect, Vector2(1, -1), Center)
		elif child as SceneRenderer:
			child.update()
	pass


