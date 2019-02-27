extends Node2D

const MAX_SIZE = 5

enum FISH { FISH1, FISH2, FISH3, PIRANHA }

var type = null

onready var anim = $AnimationPlayer
onready var content = $Content
onready var label = $Label

func _ready():
	label.text = str(content.get_child_count()) + "/5"

func fill(fish):
	fish.caught()
	content.add_child(fish)
	fish.position = position - Vector2(0, 20)
	anim.play("fill")
	label.text = str(content.get_child_count()) + "/5"
	if _is_full():
		anim.play("empty")
		_empty()
		label.text = str(content.get_child_count()) + "/5"

func _empty():
	for child in content.get_children():
		if child.type == type:
			Get.Game.score(10)
		elif child.type == FISH.PIRANHA:
			Get.Game.score(-20)
		else:
			Get.Game.score(-10)
		content.remove_child(child)

func _is_full():
	return content.get_child_count() >= MAX_SIZE