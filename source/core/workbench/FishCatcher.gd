extends Position2D

signal fish_missed

func _on_Area2D_area_entered(area):
	if not area.type == Board.FISH_TYPE.PIRANHA:
		emit_signal("fish_missed")
	area.queue_free()