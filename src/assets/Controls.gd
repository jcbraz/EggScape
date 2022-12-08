extends Control


func _ready():
	pass;

func _on_GoBackButton_pressed():
	var menu = load("res://src/assets/Menu.tscn").instance();
	get_tree().current_scene.add_child(menu);	
