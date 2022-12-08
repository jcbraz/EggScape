extends Area2D

var node_sent
var type

#onready var GUI = get_node("../GUI")

onready var mapscene_GUI = get_node("../../../../GUI")

# Called when the node enters the scene tree for the first time.
func _ready():
	name = get_name()
	
	var n = get_node(".")
	n.connect("body_entered", mapscene_GUI, "OnLootTreeEnter", [n])
	n.connect("body_exited", mapscene_GUI, "OnLootTreeExit")
	pass

	
	#n.connect("body_entered", GUI, "OnLootAreaEnter")
	#n.connect("body_exited", GUI, "OnLootAreaExit")
