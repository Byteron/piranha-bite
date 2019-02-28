extends Node2D

signal sold(revenue)
signal content_size_changed(size)
signal wrong_box()

const MAX_SIZE = 5

var type = null

onready var anim = $AnimationPlayer
onready var content = $Sprite/Content

func fill(fish):
	_fill(fish)
	if _is_full():
		_sell()
	emit_signal("content_size_changed", content.get_child_count())

func _fill(fish):
	anim.play("fill")
	fish.get_parent().remove_child(fish)
	fish.initialize(position)
	content.add_child(fish)
	if fish.type != type:
		emit_signal("wrong_box")

func _sell():
	anim.play("sell")
	var revenue = _get_revenue()
	_clear_content()
	emit_signal("sold", revenue)

func _get_revenue():
	var revenue = 0
	for fish in content.get_children():
		if fish.type == type:
			revenue += 10
		elif fish.type == Board.FISH_TYPE.PIRANHA:
			revenue -= 20
		else:
			revenue -= 10
	return revenue

func _clear_content():
	for fish in content.get_children():
		content.remove_child(fish)

func _is_full():
	return content.get_child_count() >= MAX_SIZE