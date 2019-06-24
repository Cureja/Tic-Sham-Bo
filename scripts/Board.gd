extends Node

var scores = [0.0, 0.0, 0.0]
var player1 = 0.0
var player2 = 0.0
var board = {}

var game_live = false
var round_time = 5
const ROUND = 5 #each animation goes to 5
onready var timer = get_node("Round_Timer")

func _ready(): 
	var i = 0
	var keys = [7,8,9,4,5,6,1,2,3]
	for pair in get_tree().get_nodes_in_group("RPS_Pairs"):
		pair.init(String(keys[i]))
		board[i] = pair
		i += 1
	
	timer.set_wait_time(5)
	timer.connect("timeout", self, "_on_Timer_timeout")
	pass

func _process(delta):
	if (game_live == true):
		for pair in get_tree().get_nodes_in_group("RPS_Pairs"):
			scores[pair.get_winner()] += pair.get_points_rate()*delta
		find_node("Player1_Score").text = String(scores[1]).pad_decimals(0)
		find_node("Player2_Score").text = String(scores[2]).pad_decimals(0)
	pass

func _input(event):
	if event.is_action_pressed("ui_up"):
		game_live = true
		timer.start()
		for pair in get_tree().get_nodes_in_group("RPS_Pairs"):
			pair.set_paused(false)
		var ap = find_node("AnimationPlayer")
		ap.stop()
		ap.play("Timer")
		

func _on_Timer_timeout():
	game_live = false
	for pair in get_tree().get_nodes_in_group("RPS_Pairs"):
		pair.set_paused(true)
	pass
	round_end_bonus();

func round_end_bonus():
	var game_state = []
	game_state.resize(10)
	for a in range(9):
		game_state[a+1] = board[a].get_winner()

	for b in range(3):
		check_line(game_state, 1+b*3, 1)
		check_line(game_state, 1+b, 3)
	
	check_line(game_state, 1,4)
	check_line(game_state, 3,2)

func check_line(var game_state, var start, var offset):
	var line = [];
	line.resize(3);
	for a in range(3):
		line[a] = game_state[start+(a*offset)]
	
	if (line[0] == line[1] && line[1] == line[2]):
		return line[0]
	else:
		return 0
