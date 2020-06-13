extends Node

var asteroid_scene = load("res://Asteroid.tscn")

func _ready():
	_spawn_asteroid()
	
func _spawn_asteroid():
	var asteroid = asteroid_scene.instance()
	_set_asteroid_initial_position(asteroid)
	_set_asteroid_trajectory(asteroid)
	add_child(asteroid)

func _set_asteroid_initial_position(asteroid):
	var viewport_rect = get_viewport().size
	randomize()
	asteroid.position = Vector2(rand_range(0, viewport_rect.x), -100)
	
func _set_asteroid_trajectory(asteroid):
	randomize()
	asteroid.angular_velocity = rand_range(-10,10)
	asteroid.angular_damp = 0
	asteroid.linear_velocity = Vector2(rand_range(-300, 300), 300)
	asteroid.linear_damp = 0


func _on_Timer_timeout():
	_spawn_asteroid()
