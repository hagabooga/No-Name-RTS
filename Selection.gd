extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var holding_left_click = false
var click_origin:Vector2
var click_end:Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.visible = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(holding_left_click):
		$Sprite.visible = true
		click_end = get_viewport().get_mouse_position()
	else:
		$Sprite.visible = false
	var x_scale = abs(click_end.x - click_origin.x)
	var y_scale = abs(click_end.y - click_origin.y)
	get_node(".").scale.x = x_scale/60
	get_node(".").scale.y = y_scale/60
	print("x: ", x_scale)
	print("y: ", y_scale)
	get_node(".").position = lerp(click_origin, click_end, 0.5)

func select_objects_in(upperleft, lowerright):
	pass
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if(holding_left_click == false):
				click_origin = event.position
				holding_left_click = true
			#else:
				#click_end = event.position
		elif event.button_index == BUTTON_LEFT and !event.pressed:
			holding_left_click = false
			click_end = event.position
			select_objects_in(click_origin, click_end)
