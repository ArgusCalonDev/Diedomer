extends Control

func _on_main_lagi_pressed() -> void:
    get_tree().change_scene_to_file("res://main.tscn")

func _on_ke_main_menu_pressed() -> void:
    get_tree().change_scene_to_file("res://main_menu.tscn")
