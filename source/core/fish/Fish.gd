extends Node2D

var type

onready var sprite = $Sprite

func _ready():
	randomize()
	sprite.rotation_degrees = randi() % 360
	sprite.scale = Vector2(rand_range(1, 1.5), rand_range(1, 1.5))

func initialize(position):
	self.position = position
