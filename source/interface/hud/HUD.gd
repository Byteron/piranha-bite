extends CanvasLayer

onready var mistakes = $Screen/Labels/VBoxContainer/Mistakes
onready var score = $Screen/Labels/VBoxContainer/Score
onready var high_score = $Screen/Labels/VBoxContainer/HighScore

func update_mistakes(value):
	mistakes.text = "Mistakes: " + str(value)

func update_score(value):
	score.text = "Score: " + str(value)

func update_high_score(value):
	high_score.text = "High Score: " + str(value)