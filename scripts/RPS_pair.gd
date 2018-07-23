extends Control

var points_rate = 4
var stored_points = [0,0,0]

func _ready():
	add_to_group("RPS_Pairs")

func _process(delta):
	var winner = get_node("Hand1").versus(get_node("Hand2"))
	stored_points[winner] += delta * points_rate
	pass

func init(pair_number):
	get_node("Hand1").trigger = "player1_hand"+pair_number
	get_node("Hand2").trigger = "player2_hand"+pair_number

func update_and_get_score():
	var ret_points = [stored_points[0], stored_points[1], stored_points[2]]
	stored_points = [.0,.0,.0]
	return ret_points