extends CanvasLayer

onready var mistakes = $Screen/Labels/VBoxContainer/Mistakes
onready var score = $Screen/Labels/VBoxContainer/Score
onready var high_score = $Screen/Labels/VBoxContainer/HighScore

onready var mistake_audio = $Screen/Labels/VBoxContainer/Mistakes/AudioStreamPlayer

func update_mistakes(value):
	if value != 0:
		mistake_audio.play()
	mistakes.text = "Mistakes: " + str(value)

func update_score(value):
	score.text = "Score: " + str(value)

func update_high_score(value):
	high_score.text = "High Score: " + str(value)