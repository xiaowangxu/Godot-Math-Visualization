extends SceneObject

tool

class_name ImageObject

export var TextureImage : Texture = null 
export(String, MULTILINE) var Text : String = "" setget set_Text
export(int, "Left", "Center", "Right") var HAlign : int = 0 setget set_HAlign
export(int, "Top", "Center", "Bottom") var VAlign : int = 2 setget set_VAlign
export var Position : Vector2 = Vector2.ZERO setget set_Position
export var TextColor : Color = Color.white setget set_TextColor
export(float, 0, 1, 0.001) var Percentage : float = 1.0 setget set_Percentage

func _get_configuration_warning():
	if TextureImage == null:
		return "ERROR : ImageObject need to have a Texture"
	var parent = self.get_parent()
	if parent as SceneRenderer:
		return ""
	return "ERROR : ImageObject need to be a child of SceneRenderer"

func update_Parent() -> void:
	var parent = self.get_parent()
	if parent as CanvasItem:
		parent.update()
	pass

func draw(canvas : Node2D, rect : Rect2, scale : Vector2, center : Vector2) -> void:
	var position : Vector2 = center + Vector2(Position.x * scale.x, - Position.y * scale.y )
	if TextureImage != null:
		canvas.draw_texture_rect(TextureImage, Rect2(position, TextureImage.get_size()), false, TextColor)
	pass
	
func set_Position(position : Vector2) -> void:
	Position = position
	update_Parent()
	pass
	
func set_Text(string : String) -> void:
	Text = string
	update_Parent()
	pass
	
func set_TextColor(color : Color) -> void:
	TextColor = color
	update_Parent()
	pass
	
func set_HAlign(align : int) -> void:
	HAlign = align
	update_Parent()
	pass
	
func set_VAlign(align : int) -> void:
	VAlign = align
	update_Parent()
	pass
	
func set_Percentage(percent : float) -> void:
	Percentage = percent
	update_Parent()
	pass

