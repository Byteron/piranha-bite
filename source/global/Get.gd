extends Node

var Game = null

var fish = [
	preload("res://source/fish/Fish1.tscn"),
	preload("res://source/fish/Fish2.tscn"),
	preload("res://source/fish/Fish3.tscn"),
	preload("res://source/fish/Piranha.tscn")
]

func random_fish():
	randomize()
	return fish[randi() % fish.size()]

func fish_instance(type):
	return fish[type].instance()