extends Area2D

@export var speed = 200

func start(pos):
	position = pos
	
func _process(delta):
	position.y += speed * delta
	


func _on_area_entered(area):
	if area.name == "Player":
		queue_free()
		area.shield -= 1


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
