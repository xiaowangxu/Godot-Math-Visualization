extends Node2D

tool

var filesaver : File = File.new()
var id : int = 0

func _process(delta):
	#call_deferred("generate_Image")
	pass
	
func generate_Image() -> void:
	var img = get_viewport().get_texture().get_data()
	img.flip_y()
	img.save_png("user://screenshot" + str(id) + ".png")
	id += 1
	pass


func _on_Point2D_Position_changed(gridposition, localposition, globalposition):
	#$Coordinate2DObject/TextObject4.Text = "Hello World"
	#$Coordinate2DObject/TextObject4.Position = gridposition# - Vector2(0,0.4)
	$VBoxRenderer4.position = globalposition
	$VBoxRenderer4/TextObject6.Text = "(%.3f, %.3f)" % [gridposition.x, gridposition.y]
	pass # Replace with function body.
