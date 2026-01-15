extends Control

func _on_domer_cat_pressed() -> void:
    Global.selected_skin_id = 1
    Global.save_game()
    get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_gi_tig_pressed() -> void:
    Global.selected_skin_id = 2
    Global.save_game()
    get_tree().change_scene_to_file("res://main_menu.tscn")
