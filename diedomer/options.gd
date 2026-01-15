extends Control

func _on_indonesian_button_pressed() -> void:
    TranslationServer.set_locale("id")
    get_tree().change_scene_to_file("res://main_menu.tscn")
    
func _on_english_button_pressed() -> void:
    TranslationServer.set_locale("en")
    get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_back_pressed() -> void:
    get_tree().change_scene_to_file("res://main_menu.tscn")
