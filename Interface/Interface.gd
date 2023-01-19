extends Control



signal granite_changed(nr_granite)
signal logs_changed(nr_logs)
signal spade_changed(nr_spade)
signal distance_changed(distance)
signal info_changed(nr_info)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_GUI_granite_changed(nr_granite):
	emit_signal("granite_changed", nr_granite)
	print("Interface recived and sends the nr of granite: ", nr_granite)

func _on_GUI_logs_changed(nr_logs):
	emit_signal("logs_changed", nr_logs)
	print("Interface recived and sends the nr of logs: ", nr_logs)

func _on_GUI_spade_changed(nr_spade):
	emit_signal("spade_changed", nr_spade)
	print("Interface recieved and sends the nr of spades: ", nr_spade)

func _on_boat_distance_changed(distance):
	emit_signal("distance_changed", distance)
	print("Interface recived and sends the distance of the boat: ", distance)


func _on_GUI_info_changed(nr_info):
	emit_signal("info_changed", nr_info)
	print("Interface recived and sends the information what to do next: ", nr_info)
