extends Sprite

onready var fish_container = $FishContainer

onready var lines = $Lines.get_children()

onready var boxes = [
	$Boxes/BoxRed,
	$Boxes/BoxBlue,
	$Boxes/BoxYellow
]

func _ready():
	lines[0].other_line = lines[1]
	lines[1].other_line = lines[0]

func _process(delta):
	if Get.Game:
		_move_lines(delta)
		_reset_lines()

func _move_lines(delta):
	for line in lines:
		line.position.x -= Get.Game.speed * delta

func _reset_lines():
	for line in lines:
		if line.position.x <= -240:
			line.move_back()
	