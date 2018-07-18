extends Node

var player1 = 0.0
var player2 = 0.0

func _ready():
	var i = 1
	for pair in get_node("Game").get_children():
		pair.init(String(i))
		i += 1
	pass

func _process(delta):
	for pair in get_node("Game").get_children():
		var update = pair.update_and_get_score()
		player1 += update[2]
		player2 += update[1] 
	get_node("Player1_Score").text = String(player1).pad_decimals(1)
	get_node("Player2_Score").text = String(player2).pad_decimals(1)
	pass
