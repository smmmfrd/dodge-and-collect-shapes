extends CharacterBody2D


const SPEED = 200.0
const ACCEL = 15.0
const FRICTION = 20.0

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var target_velocity = direction * SPEED
	
	if direction.length() > 0:
		velocity = velocity.lerp(target_velocity, delta * ACCEL)
	else:
		velocity = velocity.lerp(Vector2.ZERO, delta * FRICTION)

	move_and_slide()
