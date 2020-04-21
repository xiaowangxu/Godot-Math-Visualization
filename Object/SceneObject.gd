extends Node

tool

class_name SceneObject

func _get_configuration_warning():
	var parent = self.get_parent()
	if parent as SceneRenderer:
		return ""
	return "ERROR : SceneObject need to be a child of SceneRenderer"

func draw(canvas : Node2D, rect : Rect2, scale : Vector2, center : Vector2) -> void:
	pass

func update_Parent() -> void:
	var parent = self.get_parent()
	if parent as SceneRenderer:
		parent.update_Renderer()
	pass
	
func get_Rect(canvas : Node2D, rect : Rect2, scale : Vector2, center : Vector2) -> Rect2:
	return Rect2()
