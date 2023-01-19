extends Control


func _ready():
	pass;

func _on_GoBackButton_pressed():
	var menu = load("res://src/assets/Menu.tscn").instance();
	get_tree().current_scene.add_child(menu);	


func _on_MainMenuButton_pressed():
	get_tree().change_scene("res://src/assets/Menu.tscn")


func _on_QuitGameButton_pressed():
	get_tree().quit()
