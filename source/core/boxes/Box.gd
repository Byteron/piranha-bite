extends Node2D

signal sold

const MAX_SIZE = 5

var type = null

onready var anim = $AnimationPlayer
onready var content = $Sprite/Content
# onready var label = $Label

func fill(fish):
	fish.position = position - Vector2(0, 20)
	content.add_child(fish)
	anim.play("fill")
	if _is_full():
		anim.play("empty")
		_empty()

func _empty():
	var revenue = 0
	for fish in content.get_children():
		if fish.type == type:
			revenue += 10
		elif fish.type == Board.FISH.PIRANHA:
			revenue -= 20
		else:
			revenue -= 10
		content.remove_child(fish)
		emit_signal("sold", revenue)

#func _update_label():
#	label.text = str(content.get_child_count()) + "/" + str(MAX_SIZE)

func _is_full():
	return content.get_child_count() >= MAX_SIZE