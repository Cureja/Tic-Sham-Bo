extends CenterContainer

const ROCK = 0
const PAPER = 1
const SCISSOR = 2
const image = ["iconr.png","iconb.png","icong.png"]

var paused = true
var state = 0
var trigger = "ui_left"
var shake_timer = 0
var shake_timer_shake = .8

func _ready():
	set_process_input(true)
	pass

func _process(delta):
	if (paused != true):
		if shake_timer > 0:
			shake()
		shake_timer -= delta
	pass

func _input(event):
	if (paused != true):
		if event.is_action_pressed(trigger):
			shake_timer = shake_timer_shake
			self.update()

func update():
	state = (state+1) % 3
	get_node("Sprite").set_texture(load("res://images/" + image[state]))

func shake():
	var radius = shake_timer * 100
	var random = radius * sqrt(randf())
	var theta = randf() * 2 * PI
	
#	r * cos(theta)
#	r * sin(theta)

func versus(opponent):
	# 0 for tie, 1 for win, 2 for lose
	var result = (3 + state - opponent.state) % 3  
	return result

# OLD CODE
#func _input_event(viewport, event, shape_idx):
#    if event is InputEventMouseButton \
#    and event.button_index == BUTTON_LEFT \
#    and event.is_pressed():
#        self.on_click()
#
#func on_click():
#	state = (state+1) % 3
#	get_node("Sprite").set_texture(load("res://images/" + image[state]))