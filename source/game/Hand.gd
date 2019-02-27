extends Node2D

signal lost_finger(finger_left)

onready var hand = $Hand
onready var anim = $AnimationPlayer
onready var audio = $AudioStreamPlayer

func grab():
	anim.play("grab")

func remove_finger():
	audio.play()
	
	if hand.get_child_count() < 1:
		return
		
	var finger = get_random_finger()
	finger.free()
	emit_signal("lost_finger", hand.get_child_count())

func get_fingers():
	return hand.get_children()

func get_random_finger():
	randomize()
	var fingers = get_fingers()
	return fingers[randi() % fingers.size()]
