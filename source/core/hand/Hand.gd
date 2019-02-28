extends Node2D

signal bitten(finger_left)

var current_fish = null

onready var hand = $Hand
onready var anim = $AnimationPlayer
onready var audio = $AudioStreamPlayer

onready var blood = $BloodParticles

func grab():
	anim.play("grab")
	if current_fish and current_fish.type == Board.FISH_TYPE.PIRANHA:
		_remove_finger()
	return current_fish

func _remove_finger():
	audio.play()
	if hand.get_child_count() < 1:
		return
	var finger = _get_random_finger()
	_cut_finger(finger)
	emit_signal("bitten", hand.get_child_count())

func _cut_finger(finger):
	blood.position = finger.position
	blood.emitting = true
	finger.free()

func _get_fingers():
	return hand.get_children()

func _get_random_finger():
	randomize()
	var fingers = _get_fingers()
	return fingers[randi() % fingers.size()]

func _on_Area2D_area_entered(area):
	current_fish = area

func _on_Area2D_area_exited(area):
	current_fish = null