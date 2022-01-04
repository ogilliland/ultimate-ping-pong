extends Control

var score_p1: int
var score_p2: int

func _ready() -> void:
	get_node("../GoalLeft").connect("goal_scored", self, "_on_goal")
	get_node("../GoalRight").connect("goal_scored", self, "_on_goal")

func init() -> void:
	score_p1 = 0
	score_p2 = 0
	update_score()
	new_match()

func new_match() -> void:
	get_node("../Ball").init()
	get_node("../Effects/BallTrail").init()
#	get_node("../Player").init()
#	get_node("../Enemy").init()

func _on_goal(by: int, _against: int) -> void:
	match by:
		1:
			score_p1 += 1
		2:
			score_p2 += 1
	update_score()
	new_match()

func update_score() -> void:
	var p11 = floor(score_p1 / 10.0)
	var p12 = score_p1 % 10
	var p21 = floor(score_p2 / 10.0)
	var p22 = score_p2 % 10
	get_node("HBoxContainer/P1Digit1").text = str(p11)
	get_node("HBoxContainer/P1Digit2").text = str(p12)
	get_node("HBoxContainer/P2Digit1").text = str(p21)
	get_node("HBoxContainer/P2Digit2").text = str(p22)
