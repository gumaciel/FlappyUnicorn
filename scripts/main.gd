extends Node

const GROUP_BLOCK = "block"
const GROUP_FLAPPER = "flapper"
var bestscore = 0 setget set_bestscore
const filepath = "user://bestscore.data"
var width = Globals.get("display/width")
var vel = 150
var points = 0

var flapper = "alysson"

var start = true
var store = false
var ingame = false
var dead = false

func load_bestscore():
	var file = File.new()
	if not file.file_exists(filepath): return
	file.open(filepath, File.READ)
	bestscore = file.get_var()
	file.close()

func save_bestscore():
	var file = File.new()
	file.open(filepath, File.WRITE)
	file.store_var(bestscore)
	file.close()
	
func set_bestscore(new_value):
	bestscore = new_value
	save_bestscore()

func _ready():
	randomize()
	load_bestscore()
	set_process(true)
	pass

func _process(delta):
	if has_node("touch"):
		if ingame:
			get_node("touch/pause").show()
			get_node("touch/jump").show()
			get_node("HUD/points").show()
			get_node("Parallax/flapperLayer/choose_flapper").show()
		else:
			get_node("touch/pause").hide()
			get_node("touch/jump").hide()
			get_node("HUD/points").hide()
		if store:
			get_node("Parallax/flapperLayer/choose_flapper").show()
		if start:
			get_node("Parallax/flapperLayer/choose_flapper").hide()
			get_node("touch/store").show()
			get_node("touch/ingame").show()
			get_node("HUD/logo").show()
		else:
			get_node("touch/store").hide()
			get_node("touch/ingame").hide()
			get_node("HUD/logo").hide()
			
		if main.dead:
			get_node("HUD/score").show()
			get_node("HUD/highscore").show()
			get_node("HUD/points").set_pos(Vector2(300, 310))
			get_node("touch/ok").show()
		else:
			get_node("HUD/points").set_pos(Vector2(220, 137))
			get_node("HUD/highscore").hide()
			get_node("HUD/score").hide()
			get_node("touch/ok").hide()
		if Input.is_action_pressed("start"):
			start = true
			store = false
			ingame = false
			main.dead = false
			get_node("Parallax/flapperLayer/choose_flapper").get_child(0).set_pos(Vector2(100, 350))
		if Input.is_action_pressed("store"):
			print("store")
			self.store = true
			self.ingame = false
			self.start = false
			self.dead = false
			get_node("Parallax/flapperLayer/choose_flapper")._add_store()
		if Input.is_action_pressed("ingame"):
			get_node("Parallax/flapperLayer/choose_flapper").get_child(0).get_node("sample").play("start")
			get_node("Parallax/wallLayer/spawn_wall").interval = 0
			self.store = false
			self.ingame = true
			self.start = false
			self.dead = false