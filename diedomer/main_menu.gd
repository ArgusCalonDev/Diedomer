extends Control

func _on_main_pressed() -> void:
    get_tree().change_scene_to_file("res://main.tscn")


func _on_keluar_pressed() -> void:
    get_tree().quit()


func _on_github_pressed() -> void:
    OS.shell_open("https://github.com/ArgusCalonDev/Diedomer")
