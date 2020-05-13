extends SceneRenderer

tool

class_name Coordinate2DRenderer

export var Scale: Vector2 = Vector2(50,50) setget set_Scale
export var LineWidth : float = 2.0 setget set_LineWidth
export var RuleWidth : float = 10 setget set_RuleWidth
export var LineColor : Color = Color.white setget set_LineColor
export var Aspect : Vector2 = Vector2.ONE setget set_Aspect
export var AspectXUnit : String = ""
export var AspectYUnit : String = ""
export var RemainLineX : bool = true setget set_RemainLineX
export var RemainLineY : bool = true setget set_RemainLineY
export(Font) var RuleFont : Font = null

func _draw() -> void:
	#RenderTarget.draw_rect(Rect2(Position, Size), Color.white, false, 2.0, true)
	self.draw_Rect_Center()
	var linecenter : Vector2 = Center
	var linerulewidth : float =  max(LineWidth, RuleWidth)
	if RemainLineY:
		var strwidth : float = 0
		if RuleFont != null:
			for i in range(ceil((Center.y - Rect.size.y)/Scale.y/Aspect.y), ceil(Center.y/Scale.y/Aspect.y)):
				strwidth = max(strwidth, RuleFont.get_string_size(str(i*Aspect.y) if AspectYUnit=="" else str(i) + AspectYUnit).x)
		if Center.x < linerulewidth + strwidth:
			linecenter.x =  linerulewidth + strwidth
		elif Center.x > Rect.size.x - linerulewidth - strwidth:
			linecenter.x = Rect.size.x - linerulewidth - strwidth
		pass
	if RemainLineX:
		var strheight : float = 0
		if RuleFont != null:
			for i in range(ceil((Center.x - Rect.size.x)/Scale.x/Aspect.x), ceil(Center.x/Scale.x/Aspect.x)):
				strheight = max(strheight, RuleFont.get_string_size(str(-i*Aspect.x) if AspectXUnit=="" else str(-i) + AspectXUnit).y)
		if Center.y < linerulewidth + strheight:
			linecenter.y = linerulewidth + strheight
		elif Center.y > Rect.size.y - linerulewidth - strheight:
			linecenter.y = Rect.size.y - linerulewidth - strheight
		pass
		
	if Clip:
		VisualServer.canvas_item_set_custom_rect(get_canvas_item(), true, Rect)
		VisualServer.canvas_item_set_clip(get_canvas_item(), true)
	
	# y axis
	self.draw_line(Vector2(Rect.position.x + linecenter.x, Rect.position.x), Vector2(Rect.position.x + linecenter.x, Rect.position.y + Rect.size.y), LineColor, LineWidth, true)
	var pointsy : PoolVector2Array = [Vector2(linecenter.x, Rect.position.y), Vector2(linecenter.x - RuleWidth/2.0, Rect.position.y + RuleWidth), Vector2(linecenter.x + RuleWidth/2.0, Rect.position.y + RuleWidth)]
	self.draw_colored_polygon(pointsy, LineColor)
	# x axis
	self.draw_line(Vector2(Rect.position.x, Rect.position.y + linecenter.y), Vector2(Rect.position.x + Rect.size.x, Rect.position.y + linecenter.y), LineColor, LineWidth, true)
	var pointsx : PoolVector2Array = [Vector2(Rect.size.x, linecenter.y), Vector2(Rect.size.x - RuleWidth, linecenter.y - RuleWidth / 2.0), Vector2(Rect.size.x - RuleWidth, linecenter.y + RuleWidth / 2.0)]
	self.draw_colored_polygon(pointsx, LineColor)
	
	# y axis
	for i in range(ceil((Center.y - Rect.size.y)/Scale.y/Aspect.y), ceil(Center.y/Scale.y/Aspect.y)):
		var positiony : float = Rect.position.y + Center.y - Scale.y * i * Aspect.y
		if i!=0 or linecenter.y != Center.y:
			var positionx : float = Rect.position.x + linecenter.x
			if RuleFont != null:
				var string : String = str(i*Aspect.y) if AspectYUnit=="" else str(i)+AspectYUnit
				var strsize : Vector2 = RuleFont.get_string_size(string)
				self.draw_string(RuleFont, Vector2(positionx + RuleWidth if Center.x > Rect.size.x / 2.0 else positionx - RuleWidth - strsize.x, positiony + strsize.y / 2.0 - RuleFont.get_descent()), string, LineColor)
			self.draw_line(Vector2(positionx - RuleWidth/2.0, positiony), Vector2(positionx + RuleWidth / 2.0, positiony), LineColor, LineWidth, true)
	# x axis
	for i in range(ceil((Center.x - Rect.size.x)/Scale.x/Aspect.x), ceil(Center.x/Scale.x/Aspect.x)):
		var positionx : float = Rect.position.x + Center.x - Scale.x * i * Aspect.x
		if (i!=0 or linecenter.x != Center.x):
			var positiony : float = Rect.position.y + linecenter.y
			if RuleFont != null:
				var string : String = str(-i*Aspect.x) if AspectXUnit=="" else str(-i) + AspectXUnit
				var strsize : Vector2 = RuleFont.get_string_size(string)
				self.draw_string(RuleFont, Vector2(positionx - strsize.x / 2.0, positiony + RuleFont.get_descent() - RuleWidth - strsize.y / 2.0 if Center.y < Rect.size.y / 2.0 else positiony + RuleFont.get_descent() + RuleWidth + strsize.y / 2.0) , string, LineColor)
			self.draw_line(Vector2(positionx, positiony - RuleWidth/2.0), Vector2(positionx, positiony + RuleWidth/2.0), LineColor, LineWidth, true)
	
	for child in get_children():	
		if child as SceneObject:
			child.draw(self, Rect, Scale, Center)
		elif child as SceneRenderer:
			child.update()
	pass

func get_LocalPosition(position : Vector2) -> Vector2:
	return Center + Vector2(position.x * Scale.x, - position.y * Scale.y)
	
func get_AbosulteLocalPosition(position : Vector2) -> Vector2:
	return Vector2(position.x * Scale.x, - position.y * Scale.y)	

func get_Canvas_Scale() -> Vector2:
	return Scale

func set_Scale(scale : Vector2) -> void:
	if scale.x <= 0:
		Scale.x = 1
	else:
		Scale.x = scale.x
	if scale.y <= 0:
		Scale.y = 1
	else:
		Scale.y = scale.y
	update_Renderer()
	pass

func set_LineWidth(linewidth : float) -> void:
	LineWidth = linewidth
	update_Renderer()
	pass
	
func set_RuleWidth(rulewidth : float) -> void:
	RuleWidth = rulewidth
	update_Renderer()
	pass

func set_Aspect(aspect : Vector2) -> void:
	if aspect.x <= 0:
		Aspect.x = 1
	else:
		Aspect.x = aspect.x
	if aspect.y <= 0:
		Aspect.y = 1
	else:
		Aspect.y = aspect.y
	update_Renderer()
	pass

func set_LineColor(linecolor : Color) -> void:
	LineColor = linecolor
	update_Renderer()
	pass
	
func set_RemainLineX(remain : bool) -> void:
	RemainLineX = remain
	update_Renderer()
	pass
	
func set_RemainLineY(remain : bool) -> void:
	RemainLineY = remain
	update_Renderer()
	pass
