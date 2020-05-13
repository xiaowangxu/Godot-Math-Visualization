extends Node2D

tool

class_name SceneRenderer

export var Rect : Rect2 = Rect2(0,0,100,100) setget set_Rect
export var Center : Vector2 = Vector2.ZERO setget set_Center
export var Clip : bool = true setget set_Clip

func set_Rect(rect : Rect2) -> void:
	Rect = rect
	update_Renderer()
	pass

func set_Center(center : Vector2) -> void:
	Center = center
	update_Renderer()
	pass

func draw_Rect_Center() -> void:
	if !Engine.editor_hint:
		return
	self.draw_rect(Rect, Color(1,1,1,0.5), false, 5.0, true)
	self.draw_circle(Center, 20.0, Color.yellow)

func get_Rect() -> Rect2:
	return Rect2(self.position + Rect.position, Rect.size)

func set_Clip(clip : bool) -> void:
	Clip = clip
	update_Renderer()
	pass

func get_Canvas() -> SceneRenderer:
	return self

func get_Canvas_Scale() -> Vector2:
	return Vector2(1.0, -1.0)
	
func get_Canvas_Rect() -> Rect2:
	return Rect

func get_Canvas_Center() -> Vector2:
	return Center

func update_Renderer() -> void:
	var Parent = self.get_parent()
	if Parent as SceneRenderer:
		Parent.update_Renderer()
	else:
		self.update()
	pass
