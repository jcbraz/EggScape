extends Control


func _ready():
	pass;




func _on_MainMenuButton_pressed():
	get_tree().change_scene("res://src/assets/Menu.tscn");


func _on_QuitGameButton_pressed():
	get_tree().quit()
