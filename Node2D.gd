extends Node2D

tool

var filesaver : File = File.new()
var id : int = 0

func _process(delta):
#	call_deferred("generate_Image")
	pass
	
func generate_Image() -> void:
	var img = get_viewport().get_texture().get_data()
	img.flip_y()
	img.save_png("user://screenshot" + str(id) + ".png")
	id += 1
	pass
