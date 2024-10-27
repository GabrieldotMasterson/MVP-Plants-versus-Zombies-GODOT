extends Node2D

var mira = false

const planta = preload("res://scenes/planta.tscn")
const zumbi = preload("res://scenes/zumbi.tscn")

var inimigos = 10
var ini_derrotados = 0 

func _ready():
	pass

func _process(_delta):
	
	if ini_derrotados == 10:
		$display_final.visible = true
		$display_final/bad_ending.visible = false
		$display_final/good_ending.visible = true
		print("vitor")
		
	
	if mira:
		var mx = get_viewport().get_mouse_position().x
		var my = get_viewport().get_mouse_position().y
		$mira_planta.position = Vector2(mx,my)
		
		if Input.is_action_just_pressed("click"):
			var planta = planta.instantiate()
			get_tree().root.add_child(planta)
			planta.position = Vector2(mx,my)
			mira = false
			$mira_planta.visible = false

func _on_tacaplanta_ot_button_up() -> void:
	$mira_planta.visible = true
	mira= true

func _on_zombie_timer_timeout() -> void:
	if inimigos >= 1:
		var zum = zumbi.instantiate()
		get_tree().root.add_child(zum)
		zum.position = Vector2(1002,randi_range(120,420))
		inimigos -= 1 


func _on_fim_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("zumbie"):
		$display_final.visible = true
		$display_final/bad_ending.visible = true
		$display_final/good_ending.visible = false
		print("gameover")
