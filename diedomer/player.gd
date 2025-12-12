extends CharacterBody2D

var gravity = 1200
var jump_force = -450
var gravity_dir = Vector2.DOWN # gravitasi kebawah

func _physics_process(delta: float) -> void:
    #terapkan gravitasi sesuai arah
    velocity += gravity_dir * gravity * delta
    move_and_slide()
    print($".".global_position)
    
func _on_buttonrgt_button_down() -> void:
    velocity.x += 200


func _on_buttonrgt_button_up() -> void:
    velocity.x += 0
    

    
func _on_buttonjmp_pressed() -> void:
    velocity += -gravity_dir.normalized() * 450
    if is_on_floor():
      velocity += -gravity_dir.normalized() * 450


func _on_area_2d_area_entered(area: Area2D) -> void:
    if area.name == "parkour":
        gravity_dir = Vector2.ZERO


func _on_area_2d_area_exited(area: Area2D) -> void:
    if area.name == "parkour":
        gravity_dir = Vector2.DOWN



func _on_buttondlft_button_down() -> void:
    velocity.x += -200

func _on_buttondlft_button_up() -> void:
    velocity.x += 0
