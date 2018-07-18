extends Node

var points_rate = 10
var stored_points = [0,0,0]

func init(pair_number):
	get_node("Hand1").trigger = "player1_hand"+pair_number
	get_node("Hand2").trigger = "player2_hand"+pair_number

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	var winner = get_node("Hand1").versus(get_node("Hand2"))
	stored_points[winner] += delta * points_rate
	pass

func update_and_get_score():
	var ret_points = [stored_points[0], stored_points[1], stored_points[2]]
	stored_points = [.0,.0,.0]
	return ret_points