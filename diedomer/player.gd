extends CharacterBody2D

# variabel gravitasi
var gravity = 1200
var jump_force = -450
var gravity_dir = Vector2.DOWN # gravitasi kebawah

# speed variable
var speed := 300.0 # kecepatan awal
var max_speed := 1400.0 # maksimum kecepatan
var speed_step := 60.0 # speed bertambah tiap ...
var speed_timer := 0.0 # speed timer
var move_dir = 1.0

# poin variable
var poin := 0 # poin awal
var poin_timer := 0.0

# nodes
@onready var speed_label = $"../CanvasLayer/speed"
@onready var poin_label = $"../CanvasLayer/poin"
@onready var player_sprite = $Sprite2D

func _ready() -> void:
    if Global.selected_skin_id in Global.skins:
        player_sprite.texture = Global.skins[Global.selected_skin_id]["texture"]

func _physics_process(delta):
    velocity += gravity_dir * gravity * delta
    # atur pertambahan speed
    speed_timer += delta
    if speed_timer >= 1.5:
        speed += speed_step
        speed = min(speed, max_speed)
        speed_timer = 0.0
        update_speed_label()
        
    poin_timer += delta
    if poin_timer >= 3.0:
        poin += 1
        poin_timer = 0.0
        update_poin_label()

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
    
func update_poin_label() -> void:
    poin_label.text = "poin: " + str(poin)
