extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Icon/AnimationPlayer.play("new_animation")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += Vector2(500 * delta, 0 )


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
