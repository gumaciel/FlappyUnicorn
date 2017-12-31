extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var y_velocity = 0
var jump_height = -250
var gravity = -600

func _ready():
	set_process(true)
	set_process_input(true)
	pass
	
func _process(delta):
	if y_velocity != 0:
		set_pos(get_pos() + Vector2(0, y_velocity) * delta)
		y_velocity = y_velocity - gravity * delta
	if has_node("select"):
		if get_owner() != null:
			if get_owner().instore:
				get_node("select").show()
			else:
				get_node("select").hide()
		elif get_owner() == null:
				get_node("select").hide()

	if get_owner() != null:
		if Input.is_action_pressed("select_alysson") and get_index() == 0 and get_owner():
			get_owner().instore = false
			get_owner().select = true
			get_owner().value = 0
			get_owner().returnFlapper(get_index())
			main.flapper = "alysson"
		if Input.is_action_pressed("select_jeane") and get_index() == 1 and get_owner():
			get_owner().instore = false
			get_owner().select = true
			get_owner().value = 1
			get_owner().returnFlapper(get_index())
			main.flapper = "jeane"
		if Input.is_action_pressed("select_manu") and get_index() == 2 and get_owner():
			get_owner().instore = false
			get_owner().select = true
			get_owner().value = 2
			get_owner().returnFlapper(get_index())
			main.flapper = "manu"
		if Input.is_action_pressed("select_gustavo") and get_index() == 3 and get_owner():
			get_owner().instore = false
			get_owner().select = true
			get_owner().value = 3
			get_owner().returnFlapper(get_index())
			main.flapper = "gustavo"
		if Input.is_action_pressed("select_mari") and get_index() == 4 and get_owner():
			get_owner().instore = false
			get_owner().select = true
			get_owner().value = 4
			get_owner().returnFlapper(get_index())
			main.flapper = "mari"
		if Input.is_action_pressed("select_nati") and get_index() == 5 and get_owner():
			get_owner().instore = false
			get_owner().select = true
			get_owner().value = 5
			get_owner().returnFlapper(get_index())
			main.flapper = "nati"
		if Input.is_action_pressed("select_athos") and get_index() == 6 and get_owner():
			get_owner().instore = false
			get_owner().select = true
			get_owner().value = 6
			get_owner().returnFlapper(get_index())
			main.flapper = "athos"
		if Input.is_action_pressed("select_cabelinho") and get_index() == 7 and get_owner():
			get_owner().instore = false
			get_owner().select = true
			get_owner().value = 7
			get_owner().returnFlapper(get_index())
			main.flapper = "cabelinho"
		if Input.is_action_pressed("select_filipe") and get_index() == 8 and get_owner():
			get_owner().instore = false
			get_owner().select = true
			get_owner().value = 8
			get_owner().returnFlapper(get_index())
			main.flapper = "filipe"

func _input(event):
	if event.is_action_pressed("jump") and not event.is_echo() and not main.dead and not get_pos().y < 50:
		get_node("sample").play("jump")
		y_velocity = jump_height


func _on_alysson_area_enter( area ):
	if area.is_in_group(main.GROUP_BLOCK):
		get_node("sample").play("death")
		y_velocity = 0
		main.dead = true
		if main.points > main.bestscore:
			main.bestscore = main.points
	pass # replace with function body
