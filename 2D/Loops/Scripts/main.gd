extends Node2D

@export var spawn_count : int = 500

var star_scene = preload("res://Scenes/star.tscn")


func _ready():
	spawn_star()

func spawn_star():
	for i in spawn_count:
		var star = star_scene.instantiate()
		var star_size = randf_range(0.5, 1.0)
		
		add_child(star)
		star.position.x = randi_range(-180, 180)
		star.position.y = randi_range(-100, 100)
		star.scale.x = star_size
		star.scale.y = star_size
