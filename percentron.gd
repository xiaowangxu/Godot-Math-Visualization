extends Node2D


# Declare member variables here. Examples:
var input1 = 1.00
var input2 = 1.00
var w1 = 1.00
var w2 = 1.00
var b = 1.00


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func update_Percentron():
	if input1 * w1 + input2 * w2 + b > 0:
		$Plane2DRenderer/Plane2DRenderer2/Plane2DRenderer/TextObject4.Text = "1.00"
	else:
		$Plane2DRenderer/Plane2DRenderer2/Plane2DRenderer/TextObject4.Text = "0.00"
	$Plane2DRenderer/Plane2DRenderer2/Coordinate2DRenderer/Function2D.Function.w1 = w1
	$Plane2DRenderer/Plane2DRenderer2/Coordinate2DRenderer/Function2D.Function.w2 = w2
	$Plane2DRenderer/Plane2DRenderer2/Coordinate2DRenderer/Function2D.Function.b  = b
	$Plane2DRenderer/Plane2DRenderer2/Coordinate2DRenderer.update_Renderer()

func _on_Input1_value_changed(value):
	input1 = value
	$Plane2DRenderer/Plane2DRenderer2/Plane2DRenderer/TextObject2.Text = "%.2f" % input1
	update_Percentron()
	pass # Replace with function body.


func _on_Input2_value_changed(value):
	input2 = value
	$Plane2DRenderer/Plane2DRenderer2/Plane2DRenderer/TextObject3.Text = "%.2f" % input2
	update_Percentron()
	pass # Replace with function body.


func _on_Input3_value_changed(value):
	w1 = value
	$Plane2DRenderer/Plane2DRenderer2/Plane2DRenderer/TextObject7.Text = "%.2f" % w1
	update_Percentron()
	pass # Replace with function body.


func _on_Input4_value_changed(value):
	w2 = value
	$Plane2DRenderer/Plane2DRenderer2/Plane2DRenderer/TextObject6.Text = "%.2f" % w2
	update_Percentron()
	pass # Replace with function body.


func _on_Input5_value_changed(value):
	b = value
	$Plane2DRenderer/Plane2DRenderer2/Plane2DRenderer/TextObject5.Text = "%.2f" % b
	update_Percentron()
	pass # Replace with function body.
