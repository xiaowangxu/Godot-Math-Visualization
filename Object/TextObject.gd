extends SceneObject

tool

class_name TextObject

export var TextFont : Font = null
export(String, MULTILINE) var Text : String = "" setget set_Text
export(int, "Left", "Center", "Right") var HAlign : int = 0 setget set_HAlign
export(int, "Top", "Center", "Bottom") var VAlign : int = 2 setget set_VAlign
export var Position : Vector2 = Vector2.ZERO setget set_Position
export var TextColor : Color = Color.white setget set_TextColor
export(float, 0, 1, 0.001) var Percentage : float = 1.0 setget set_Percentage

func _get_configuration_warning():
	if TextFont == null:
		return "ERROR : TextObject need to have a Font"
	var parent = self.get_parent()
	if parent as SceneRenderer:
		return ""
	return "ERROR : TextObject need to be a child of SceneRenderer"

func get_Rect(canvas : Node2D, rect : Rect2, scale : Vector2, center : Vector2) -> Rect2:
	var stringsize : Vector2 = Vector2.ZERO
	var linearray : PoolStringArray = Text.split("\n")
	for line in linearray:
		stringsize.x = max(stringsize.x, TextFont.get_string_size(line).x)
	var position : Vector2 = center + Vector2(Position.x * scale.x, - Position.y * scale.y)
	stringsize.y = linearray.size() * TextFont.get_height()
	match HAlign:
		1:
			position.x -= stringsize.x/2.0
		2:
			position.x -= stringsize.x
	match VAlign:
		2:
			position.y -= stringsize.y
		1:
			position.y -= stringsize.y/2.0
	return Rect2(position, stringsize)
	

func draw(canvas : Node2D, rect : Rect2, scale : Vector2, center : Vector2) -> void:
	var objectrect : Rect2 = get_Rect(canvas, rect, scale, center)
	objectrect.position.y += TextFont.get_ascent()
	if Engine.editor_hint:
		canvas.draw_rect(get_Rect(canvas, rect, scale, center), Color.darkgray, true)
	if TextFont != null:
		if Percentage <= 0:
			return
		var currentlength : int = Text.length() * Percentage
		var posx : float = 0
		for i in range(0, ceil(Text.length() * Percentage)):
			var currentchar : String = Text.substr(i, 1)
			if currentchar == '\n' or currentchar.length() < 1:
				objectrect.position.y += TextFont.get_height()
				posx = 0
				continue
			var nextchar : String = Text.substr(i + 1, 1) if i < Text.length()-1 else ""
			if float(i+1)/float(Text.length()) <= Percentage:
				posx += canvas.draw_char(TextFont, objectrect.position + Vector2(posx, 0), currentchar, nextchar, TextColor)
			else:
				var remaincolor : Color = TextColor
				remaincolor.a *= 1.0 - (float(i+1)/float(Text.length()) - Percentage) / 1.0 * float(Text.length())
				posx += canvas.draw_char(TextFont, objectrect.position + Vector2(posx, 0), currentchar, nextchar, remaincolor)
#			var currentlength : int = Text.length() * Percentage
#			var remaincolor : Color = TextColor
#			remaincolor.a = ((Text.length() * Percentage) - currentlength) * TextColor.a
#			var currentstring : String = Text.substr(0, currentlength)
#			var remainstring : String = Text.substr(0, ceil(Text.length() * Percentage))
#			canvas.draw_string(TextFont, position, currentstring, TextColor)
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

