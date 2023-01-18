extends NinePatchRect



func _on_Interface_logs_changed(nr_logs):
	$Number.text = str(nr_logs)
