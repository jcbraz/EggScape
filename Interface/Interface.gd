extends Control



signal granite_changed(nr_granite)
signal logs_changed(nr_logs)
signal spade_changed(nr_spade)


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
	print("Interface recived and sends the nr of spades: ", nr_spade)


