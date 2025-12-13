extends Node2D

@onready var menu_awal = $MenuAwal
@onready var restart_button = $restart

func _ready() -> void:
    get_tree().paused = true
    menu_awal.PROCESS_MODE_ALWAYS
    menu_awal.visible = true
    restart_button.visible = false


func _on_mulai_pressed() -> void:
    get_tree().paused = false
    menu_awal.visible = false
    restart_button.visible = true

func _on_balik_ke_mainmenu_pressed() -> void:
    get_tree().paused = false
    get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_restart_pressed() -> void:
    get_tree().change_scene_to_file("res://main.tscn")
