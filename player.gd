extends CharacterBody2D

@export var speed: float = 150.0

@onready var sprite = $AnimatedSprite2D

var last_direction = "down"

func _physics_process(_delta):
	var direction = Input.get_vector(
		"move_left",
		"move_right",
		"move_up",
		"move_down"
	)

	velocity = direction * speed
	move_and_slide()

	# Walking
	if direction != Vector2.ZERO:
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				last_direction = "right"
			else:
				last_direction = "left"
		else:
			if direction.y > 0:
				last_direction = "down"
			else:
				last_direction = "up"

		sprite.play("walk_" + last_direction)

	# Standing still
	else:
		sprite.play("idle_" + last_direction)
		
