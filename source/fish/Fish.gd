extends Area2D

signal slipped_through(type)

enum FISH { FISH1, FISH2, FISH3, PIRANHA }

var type

var is_caught = false

func _ready():
	randomize()
	rotation_degrees = randi() % 360
	scale = Vector2(rand_range(1, 1.5), rand_range(1, 1.5))

func initialize(position):
	self.position = position

func caught():
	is_caught = true

func _process(delta):
	if not is_caught:
		position.x -= Get.Game.speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	if not is_caught:
		emit_signal("slipped_through", type)
	queue_free()
