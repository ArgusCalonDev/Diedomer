extends Node

# save game path
var save_path := "user://save_game.dat"

# skin system
var selected_skin_id: int = 1

# skins dictionary
var skins = {
    1: {
        "texture": load("res://assets/images/DOMER cat.png"),
        "price": 0,
        "owned": true
    },
    2: {
        "texture": load("res://assets/images/GiTig.jpg"),
        "price": 0,
        "owned": true
    }
}

func save_game():
    var skin_owned_dict = {}
    for id in skins.keys():
        skin_owned_dict[id] = skins[id]["owned"]
        
    var data = {
        "selected_skin_id": selected_skin_id
    }
    
    var file = FileAccess.open(save_path, FileAccess.WRITE)
    file.store_var(data)
    file.close()
    
func load_game():
    if FileAccess.file_exists(save_path):
        var file = FileAccess.open(save_path, FileAccess.READ)
        var data = file.get_var()
        file.close()
        
        if "selected_skin_id" in data:
            selected_skin_id = data["selected_skin_id"]
        if "skins_owned" in data:
            for id in data["skins_owned"].keys():
                if skins.has(id):
                    skins[id]["owned"] = data["skins_owned"][id]
                    

func _ready() -> void:
    load_game()
