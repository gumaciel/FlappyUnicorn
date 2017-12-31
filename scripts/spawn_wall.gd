extends Area2D


var pre_factory = preload("res://scenes/factory_wall.tscn")
var interval = 0
var factory

func _ready():
	set_process(true)
	pass

func _process(delta):
	if get_owner().start:
		main.points = 0
		if get_child(0) != null:
			get_child(0).queue_free()
		if get_child(1) != null:
			get_child(1).queue_free()
		if get_child(2) != null:
			get_child(2).queue_free()
		if get_child(3) != null:
			get_child(3).queue_free()
		
	if get_owner().ingame and not main.dead:
		if interval > 0:
			interval -= delta;
		elif interval <= 0:
			factory = pre_factory.instance()
			factory.get_node("Position2D").set_pos(Vector2(0, rand_range(0,250)))
			var wall = factory.get_child(0).duplicate()
			add_child(wall)
			wall.set_pos(Vector2(main.width, (factory.get_node("Position2D").get_pos().y - factory.get_node("wall_top/Sprite").get_texture().get_height()) - 100))
			var wall = factory.get_child(1).duplicate()
			add_child(wall)
			wall.set_pos(Vector2(main.width, (factory.get_node("Position2D").get_pos().y + factory.get_node("wall_top/Sprite").get_texture().get_height()) + 100))
			interval = 2
	elif get_owner().ingame and main.dead:
		get_child(0).set_process(false)
		get_child(1).set_process(false)
		if get_child(2) != null:
			get_child(2).set_process(false)
		if get_child(3) != null:
			get_child(3).set_process(false)
		