extends Position2D

signal fish_missed(type)

func _on_Area2D_area_entered(area):
	emit_signal("fish_missed", area.type)
	area.queue_free()