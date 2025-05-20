extends CharacterBody2D


@export var spd = 10.386
@export var jppower = 2.1333
const spd_mult = 64
var spd_portal_mult = 1
const jp_mult = -600
var grav = 6100
var rot = 0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y +=  grav * delta
		rot += 7 * (delta * 60)
	else:
		rot = snapped($cube.rotation_degrees, 90)
		if Input.is_action_pressed("jump"):
			velocity.y = jppower * jp_mult
	$cube.rotation_degrees += (rot - $cube.rotation_degrees) / 3
	velocity.x = spd * spd_mult * spd_portal_mult
	move_and_slide()
