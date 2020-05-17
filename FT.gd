extends Node2D


# Declare member variables here. Examples:
# var a = 2
var b : float = 0
var vectorlist : Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(20):
		var vector : Vector2DObject = Vector2DObject.new()
		vector.LineWidth = 3/(i+1)
		vector.TipWidth = 30/(i+1)
		$Coordinate2DObject.add_child(vector)
		vectorlist.append(vector)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var lastpos : Vector2 = Vector2.ZERO
	var i : int = 1
	for vector in vectorlist:
		vector.PositionFrom = lastpos
		lastpos += Vector2(cos(b*i)*3/i, sin(b*i)*3/i)
		vector.PositionTo = lastpos
		i += 1
	var Target : Vector2 = $Coordinate2DObject.Rect.size/2.0 - $Coordinate2DObject.get_AbosulteLocalPosition(lastpos)
	$Coordinate2DObject.Center = Vector2(lerp($Coordinate2DObject.Center.x, Target.x, 0.05), lerp($Coordinate2DObject.Center.y, Target.y, 0.05))
	b += delta * 0.5
	pass
