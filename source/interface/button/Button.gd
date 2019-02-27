extends Button

func _ready():
	$Label.text = name
	
func _on_Button_pressed():
	$AudioStreamPlayer.play()
