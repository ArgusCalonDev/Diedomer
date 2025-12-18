extends CharacterBody2D

var gravity = 1200
var jump_force = -450
var gravity_dir = Vector2.DOWN # gravitasi kebawah

var speed := 300.0 # kecepatan awal
var max_speed := 2000.0 #maksimum kecepatan
var speed_step := 60.0 # speed bertambah tiap ...
var speed_timer := 0.0 # speed timer
var move_dir = 1.0
# nodes
@onready var speed_label = $"../CanvasLayer/speed"

func _physics_process(delta):
    velocity += gravity_dir * gravity * delta
    # atur pertambahan speed
    speed_timer += delta
    if speed_timer >= 1.5:
        speed += speed_step
        speed = min(speed, max_speed)
        speed_timer = 0.0
        update_speed_label()

    velocity.x = speed
    move_and_slide()
    
func _on_buttonjmp_pressed() -> void:
    velocity.y = jump_force

func _on_area_2d_area_entered(area: Area2D) -> void:
    if area.is_in_group("jebakan"):
        Engine.time_scale = 0.2
        await get_tree().create_timer(0.2).timeout
        Engine.time_scale = 1
        get_tree().change_scene_to_file("res://you_lose.tscn")
    if area.is_in_group("win area"):
        get_tree().change_scene_to_file("res://you_win.tscn")

func update_speed_label() -> void:
    speed_label.text = "speed: " + str(speed)
