extends NinePatchRect



func _on_Interface_distance_changed(distance):
	$Number.text = str(distance) + 'm'
