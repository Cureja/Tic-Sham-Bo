extends Control

var points_rate = 4
#var stored_points = [0,0,0]

func _ready():
	add_to_group("RPS_Pairs")

#func _process(delta):
#	stored_points[get_winner()] += delta * points_rate
#	pass

func init(pair_number):
	find_node("Hand1").trigger = "player1_hand"+pair_number
	find_node("Hand2").trigger = "player2_hand"+pair_number

func update_and_get_score():
	var ret_points = [0,0,0]
	ret_points[get_winner()] = points_rate
	return ret_points

# 0 for tie, 1 for player1, 2 for player2
func get_winner():
	return get_node("Hand1").versus(get_node("Hand2"))

func get_points_rate():
	return points_rate

func set_paused(var state):
	get_node("Hand1").paused = state
	get_node("Hand2").paused = state