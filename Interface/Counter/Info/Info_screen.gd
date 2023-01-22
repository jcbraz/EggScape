extends NinePatchRect

var nr_info_max=0


func _on_Interface_info_changed(nr_info):
	#Stops the change of the infobanners,#once every neccessary action was allready done once
	if nr_info_max !=4:
		nr_info_max = nr_info
		match nr_info:
			0:
				$Number.text = 'Cut down trees and stones by standing in front of them and hitting f'
			1:
				$Number.text = 'Bring logs to the boat'
			2:
				$Number.text = 'Bring ores to the boat'
			3:
				$Number.text = 'Go to the front of the channel and dig further'
			4:
				$Number.text = 'Repeat until the boat reaches the end ... enjoy the game'
			5:
				$Number.text = 'Cut down a tree by standing in front of them and hitting f'
			6:
				$Number.text = 'Cut down a stone by standing in front of them and hitting f'
