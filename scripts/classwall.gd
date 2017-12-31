extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var ingame
var point = true

func _ready():
	set_process(true)
	add_to_group(main.GROUP_BLOCK)
	if has_node("obj"):
		print(main.flapper)
		get_node("obj").set_texture(load("res://sprites/objs/" + main.flapper + ".png"))

	pass
	
func _process(delta):
	set_pos(get_pos() + Vector2(-1, 0) * main.vel * delta)
	if get_pos().x < -70:
		queue_free()