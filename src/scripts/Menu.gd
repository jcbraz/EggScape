extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass;


func _on_StartGameButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://src/assets/Landscape.tscn");
	

func _on_ControlsButton_pressed():
	var controls = load("res://src/assets/Controls.tscn").instance();
	get_tree().current_scene.add_child(controls);	


func _on_QuitGameButton_pressed():
	get_tree().quit();

