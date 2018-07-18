extends Node

var player1 = 0.0
var player2 = 0.0

func _ready():
	
	pass

func _process(delta):
	for n in get_node("Game").get_children():
		var update = n.update_and_get_score()
		player1 += update[2]
		player2 += update[1] 
	get_node("Player1_Score").text = String(player1).pad_decimals(1)
	get_node("Player2_Score").text = String(player2).pad_decimals(1)
	pass
