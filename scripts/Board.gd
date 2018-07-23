extends Node

var player1 = 0.0
var player2 = 0.0
var game_live = false
onready var timer = get_node("Round_Timer")


func _ready(): 
	var i = 1
	for pair in get_tree().get_nodes_in_group("RPS_Pairs"):
		pair.init(String(i))
		i += 1
	
	timer.set_wait_time(5)
	timer.connect("timeout", self, "_on_Timer_timeout")
	pass

func _process(delta):
	for pair in get_tree().get_nodes_in_group("RPS_Pairs"):
		var update = pair.update_and_get_score()
		player1 += update[1]
		player2 += update[2] 
	find_node("Player1_Score").text = String(player1).pad_decimals(0)
	find_node("Player2_Score").text = String(player2).pad_decimals(0)
	pass
	
func _on_Timer_timeout():
	game_live = true
	pass
