extends Area2D

var pre_store = preload("res://scenes/store_flappers.tscn")
var store
var flapper
const POSX_INIT = 100
const POSY_INIT = 350

func _ready():
	add_to_group(main.GROUP_FLAPPER)
	
	store = pre_store.instance()
	store.instore = get_owner().store
	add_child(store)
	self.flapper = get_child(0).returnFlapper(0)
	add_child(flapper)
	get_child(1).set_pos(Vector2(POSX_INIT, POSY_INIT))
	remove_child(store)
	
	set_process(true)
	pass
func _process(delta):
	if get_child_count() >= 1:
		if get_child(0).has_node("alysson"): #this could be any node
			if get_child(0).select:
				print("selecionou")
				get_owner().start = true
				get_owner().store = false
				get_owner().ingame = false
				get_owner().dead = false
				self.flapper = get_child(0).returnFlapper(get_child(0).value)
				add_child(flapper)
				hide()
				get_child(1).get_node("sample").play("choice")
				print(get_child(1))
				get_child(1).set_pos(Vector2(POSX_INIT, POSY_INIT))
				remove_child(store)
	if get_owner().ingame:
		for i in range(0, 4):
			if get_owner().get_node("Parallax/wallLayer/spawn_wall").get_child(i) != null:
				if get_owner().get_node("Parallax/wallLayer/spawn_wall").get_child(i).point:
					if get_child(0).get_pos().x > get_owner().get_node("Parallax/wallLayer/spawn_wall").get_child(i).get_pos().x:
						if get_owner().get_node("Parallax/wallLayer/spawn_wall").get_child(i).has_node("obj"):
							get_owner().get_node("Parallax/wallLayer/spawn_wall").get_child(i).get_node("obj").hide()
							get_child(0).get_node("sample").play("obj")
						main.points+=0.5
						get_owner().get_node("Parallax/wallLayer/spawn_wall").get_child(i).point = false
	pass

func _add_store():
	store = pre_store.instance()
	store.instore = get_owner().store
	if get_child_count() == 1:
		remove_child(flapper)
	add_child(store)
