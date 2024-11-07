extends Node2D

const vel = 100

var mov = false

func _ready() -> void:
	visible = false
	pass 

func _process(delta: float) -> void:
	if mov:
		position -= Vector2(vel*delta, 0)


func _on_timer_timeout() -> void:
	queue_free()

func _on_timer_mov_timeout() -> void:
	mov  = true
	visible = true
