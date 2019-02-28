extends Area2D

var type

onready var sprite = $Sprite

func _ready():
	randomize()
	var fish_scale = rand_range(1, 1.5)
	sprite.rotation_degrees = randi() % 360
	sprite.scale = Vector2(fish_scale, fish_scale)

func initialize(position):
	self.position = position
