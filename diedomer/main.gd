extends Node2D

@onready var menu_awal = $MenuAwal

func _ready() -> void:
    get_tree().paused = true
    menu_awal.PROCESS_MODE_ALWAYS
    menu_awal.visible = true


func _on_mulai_pressed() -> void:
    get_tree().paused = false
    menu_awal.visible = false

func _on_balik_ke_mainmenu_pressed() -> void:
    get_tree().paused = false
    pass
