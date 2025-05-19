extends CharacterBody2D


@export var spd = 10.386
@export var jppower = 2.1333
const spd_mult = 64
var spd_portal_mult = 1
const jp_mult = -640
const grav = 7000

func _physics_process(delta: float) -> void:
	velocity.x = spd * spd_mult * spd_portal_mult
	if not is_on_floor():
		velocity.y +=  grav * delta
		
	else:
		
		if Input.is_action_pressed("jump"):
			velocity.y = jppower * jp_mult
	move_and_slide()
