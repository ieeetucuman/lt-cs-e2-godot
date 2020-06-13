extends KinematicBody2D

var speed = 300
var acceleration = 0.05
var velocity = Vector2.ZERO

func _physics_process(delta):
	var target = get_global_mouse_position()
	look_at(target)
	var max_velocity = position.direction_to(target) * speed
	
	
	if Input.is_action_pressed('move'):
		velocity = velocity.linear_interpolate(max_velocity, acceleration)
	
	var collision = move_and_collide(velocity * delta, false)
	if collision:
		var explosion_scene = load("res://Explosion.tscn")
		var explosion = explosion_scene.instance()
		explosion.position = position
		explosion.emitting = true
		get_parent().add_child(explosion)
		collision.collider.queue_free()
		queue_free()
