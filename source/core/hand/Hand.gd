extends Node2D

signal bitten(finger_left)

onready var hand = $Hand
onready var anim = $AnimationPlayer
onready var audio = $AudioStreamPlayer

onready var blood = $BloodParticles

onready var pickup_space = $PickupSpace

func grab():
	anim.play("grab")
	var current_fish = pickup_space.current_fish
	if current_fish:
		if current_fish.type == Board.FISH.PIRANHA:
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
