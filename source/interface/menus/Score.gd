extends Control

func _ready():
	$CenterContainer/Content/HighScore.text = str("Best Score: ", Board.high_score, "\n", "Last Score: ", Board.score)

func _on_Back_pressed():
	Scene.change(Scene.TitleScreen)