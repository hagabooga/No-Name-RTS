tool
extends AnimatedSprite

var selected = false


func _ready():
	set_material(get_material().duplicate())

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		selected = not selected
		material.set_shader_param("outline_width", 0.5 if selected else 0)
