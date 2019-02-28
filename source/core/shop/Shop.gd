extends Node2D

signal mistake_made
signal sold(revenue)

onready var boxes = [
	$Boxes/RedBox,
	$Boxes/BlueBox,
	$Boxes/YellowBox
]

func _ready():
	for box in boxes:
		box.connect("wrong_box", self, "_on_Box_wrong_box")
		box.connect("sold", self, "_on_Box_sold")

func fill(box_type, fish):
	boxes[box_type].fill(fish)

func _on_Box_wrong_box():
	emit_signal("mistake_made")

func _on_Box_sold(revenue):
	emit_signal("sold", revenue)