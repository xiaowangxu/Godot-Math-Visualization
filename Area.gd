extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var points : PoolVector2Array = []
	var i : float = 0
	points.append(Vector2(i, 0))
	while i <= 2.5:
		points.append(Vector2(i, $Coordinate2DObject/Function2DObject.Function.eval(i)))
		i += 0.1
	points.append(Vector2(i-0.1, 0))
	$Coordinate2DObject/DrawArea2DObject.Points = points
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
