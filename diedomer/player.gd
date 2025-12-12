extends CharacterBody2D

var gravity = 1200
var jump_force = -450
var gravity_dir = Vector2.DOWN # gravitasi kebawah
var speed := 1.5
var move_dir = 0.5

func _physics_process(delta: float) -> void:
    #terapkan gravitasi sesuai arah
    velocity += gravity_dir * gravity * delta
    velocity.x += speed * move_dir
    move_and_slide()
    
func _on_buttonrgt_button_down() -> void:
    velocity.x += 200


func _on_buttonrgt_button_up() -> void:
    velocity.x += 0
    

    
func _on_buttonjmp_pressed() -> void:
    velocity.y = jump_force


func _on_area_2d_area_entered(area: Area2D) -> void:
    if area.is_in_group("jebakan"):
        queue_free()
