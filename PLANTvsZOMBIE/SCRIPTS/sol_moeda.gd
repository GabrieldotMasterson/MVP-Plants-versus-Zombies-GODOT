extends Node2D

var mouse_dentro = false
var queda = 20

# odeio esses comentaros
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mouse_dentro:
		if Input.is_action_just_pressed("click"):
			print('sol drip')
			get_node("/root/Game").atualiza_display(10)
			queue_free()
			
	if queda > 0 :
		position = Vector2(0,-queda)
		queda -= 1


func _on_area_2d_mouse_entered() -> void:
	mouse_dentro = true


func _on_area_2d_mouse_exited() -> void:
	mouse_dentro = false
