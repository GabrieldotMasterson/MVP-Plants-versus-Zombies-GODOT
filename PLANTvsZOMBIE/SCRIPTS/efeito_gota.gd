extends Node2D

var vel = 100 

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	position += Vector2(vel*delta, 0)
	pass


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	print("gota foi de americanas")
	queue_free()
