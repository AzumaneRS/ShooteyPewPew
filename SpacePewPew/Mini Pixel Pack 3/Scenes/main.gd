extends Node2D

@onready var start_button = $CanvasLayer/CenterContainer/Start
var enemy = preload("res://Mini Pixel Pack 3/Enemies/enemy_1.tscn")
var score = 0

func _ready():
	start_button.show()
	$Player.hide()
	#spawn_enemies()

func spawn_enemies():
	for x in range(9):
		for y in range(3):
			var e = enemy.instantiate()
			var pos = Vector2(x * (16 + 8) + 24, 16 * 4 + y * 16)
			add_child(e)
			e.start(pos)
			e.died.connect(_on_enemy_died)

func _on_enemy_died(value):
	score += value
	$CanvasLayer/UI.update_score(score)


func _on_start_pressed():
	start_button.hide()
	new_game()
	
func new_game():
	score = 0
	$CanvasLayer/UI.update_score(score)
	$Player.show()
	$Player.start()
	spawn_enemies()
