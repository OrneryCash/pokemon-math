extends CharacterBody2D

const SPEED = 125.0

var last_direction = Vector2(0, 1)

@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down", 0)
	
	if direction == Vector2(0, 0):
		if last_direction.x > 0:
			animated_sprite_2d.play("idle_right")
		elif last_direction.x < 0:
			animated_sprite_2d.play("idle_left")
		elif last_direction.y > 0:
			animated_sprite_2d.play("idle_down")
		elif last_direction.y < 0:
			animated_sprite_2d.play("idle_up")
	else:
		if direction.x > 0:
			animated_sprite_2d.play("walk_right")
		elif direction.x < 0:
			animated_sprite_2d.play("walk_left")
		elif direction.y > 0:
			animated_sprite_2d.play("walk_down")
		elif direction.y < 0:
			animated_sprite_2d.play("walk_up")
	
	if direction:
		velocity = direction.normalized() * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	if direction != Vector2(0, 0):
		last_direction = direction.normalized()
		
	move_and_slide()
