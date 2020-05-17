extends Node2D


# Declare member variables here. Examples:
var input1 = 0.00
var input2 = 1.00
var w1 = 1.00
var w2 = 1.00
var b = 1.00


# Called when the node enters the scene tree for the first time.
func _ready():
	self.update_Percentron()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func update_Percentron():
	if input1 * w1 + input2 * w2 + b > 0:
		$Plane2DRenderer/Plane2DRenderer/TextObject4.Text = "1.00"
		$Plane2DRenderer/Plane2DRenderer/TextObject4.TextColor = Color8(0,0,0)
		$Plane2DRenderer/VBoxRenderer2/Circle2DObject.FillColor = Color8(255,255,255)
	else:
		$Plane2DRenderer/Plane2DRenderer/TextObject4.Text = "0.00"
		$Plane2DRenderer/Plane2DRenderer/TextObject4.TextColor = Color8(255,255,255)
		$Plane2DRenderer/VBoxRenderer2/Circle2DObject.FillColor = Color8(0,0,0)
	$Plane2DRenderer/Coordinate2DRenderer/Function2D.Function.w1 = w1
	$Plane2DRenderer/Coordinate2DRenderer/Function2D.Function.w2 = w2
	$Plane2DRenderer/Coordinate2DRenderer/Function2D.Function.b  = b
	if 0 * w1 + 0 * w2 + b > 0:
		$Plane2DRenderer/Coordinate2DRenderer/Point2DObject.PointColor = Color8(20, 100, 245)
	else:
		$Plane2DRenderer/Coordinate2DRenderer/Point2DObject.PointColor = Color8(255, 255, 0)
	if 1 * w1 + 0 * w2 + b > 0:
		$Plane2DRenderer/Coordinate2DRenderer/Point2DObject2.PointColor = Color8(20, 100, 245)
	else:
		$Plane2DRenderer/Coordinate2DRenderer/Point2DObject2.PointColor = Color8(255, 255, 0)
	if 0 * w1 + 1 * w2 + b > 0:
		$Plane2DRenderer/Coordinate2DRenderer/Point2DObject3.PointColor = Color8(20, 100, 245)
	else:
		$Plane2DRenderer/Coordinate2DRenderer/Point2DObject3.PointColor = Color8(255, 255, 0)
	if 1 * w1 + 1 * w2 + b > 0:
		$Plane2DRenderer/Coordinate2DRenderer/Point2DObject4.PointColor = Color8(20, 100, 245)
	else:
		$Plane2DRenderer/Coordinate2DRenderer/Point2DObject4.PointColor = Color8(255, 255, 0)
	$Plane2DRenderer/Coordinate2DRenderer.update_Renderer()

func _on_Input1_value_changed(value):
	input1 = value
	$Plane2DRenderer/Plane2DRenderer/TextObject2.Text = "%.2f" % input1
	if input1 == 0:
		$Plane2DRenderer/Plane2DRenderer/TextObject2.TextColor = Color8(255,255,255)
		$Plane2DRenderer/VBoxRenderer/Circle2DObject.FillColor = Color8(0,0,0)
	else:
		$Plane2DRenderer/Plane2DRenderer/TextObject2.TextColor = Color8(0,0,0)
		$Plane2DRenderer/VBoxRenderer/Circle2DObject.FillColor = Color8(255,255,255)
	update_Percentron()
	pass # Replace with function body.


func _on_Input2_value_changed(value):
	input2 = value
	$Plane2DRenderer/Plane2DRenderer/TextObject3.Text = "%.2f" % input2
	if input2 == 0:
		$Plane2DRenderer/Plane2DRenderer/TextObject3.TextColor = Color8(255,255,255)
		$Plane2DRenderer/VBoxRenderer/Circle2DObject2.FillColor = Color8(0,0,0)
	else:
		$Plane2DRenderer/Plane2DRenderer/TextObject3.TextColor = Color8(0,0,0)
		$Plane2DRenderer/VBoxRenderer/Circle2DObject2.FillColor = Color8(255,255,255)
	update_Percentron()
	pass # Replace with function body.


func _on_Input3_value_changed(value):
	w1 = value
	$Plane2DRenderer/Plane2DRenderer/TextObject7.Text = "%.2f" % w1
	update_Percentron()
	pass # Replace with function body.


func _on_Input4_value_changed(value):
	w2 = value
	$Plane2DRenderer/Plane2DRenderer/TextObject6.Text = "%.2f" % w2
	update_Percentron()
	pass # Replace with function body.


func _on_Input5_value_changed(value):
	b = value
	$Plane2DRenderer/Plane2DRenderer/TextObject5.Text = "%.2f" % b
	update_Percentron()
	pass # Replace with function body.
