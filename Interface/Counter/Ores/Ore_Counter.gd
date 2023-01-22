extends NinePatchRect



func _on_Interface_granite_changed(nr_granite):
	$Number.text = str(nr_granite)
