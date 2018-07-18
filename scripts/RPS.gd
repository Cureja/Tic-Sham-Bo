extends Area2D

# Constants
const ROCK = 0
const PAPER = 1
const SCISSOR = 2

const image = ["iconr.png","iconb.png","icong.png"]

# Variables
var state = 0

# Functions
func _input_event(viewport, event, shape_idx):
    if event is InputEventMouseButton \
    and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
        self.on_click()

func on_click():
	state = (state+1) % 3
	get_node("Sprite").set_texture(load("res://images/" + image[state]))

func get_state():
	return state

func versus(opponent):
	# 0 for tie, 1 for win, 2 for lose
	var result = (3 + state - opponent.state) % 3  
	return result