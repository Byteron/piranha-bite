extends Sprite

onready var fish_container = $FishContainer

onready var lines = [
	$Line1,
	$Line2
]

onready var boxes = [
	$Boxes/BoxRed,
	$Boxes/BoxBlue,
	$Boxes/BoxYellow
]

func _process(delta):
	if Get.Game:
		for line in lines:
			line.position.x -= Get.Game.speed * delta
			if line.position.x <= -240:
				line.position.x = 242