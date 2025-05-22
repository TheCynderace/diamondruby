extends CharacterBody2D

@export var spd = 10.386
@export var jppower = 2.1333
const spd_mult = 64
var spd_portal_mult = 1
const jp_mult = -600
var grav = 6100
var rot = 0
var layer_of_collision = null
const yeouch_layer = 1 << (2 - 1)

func _physics_process(delta: float) -> void:
	
	var collision = move_and_slide()
	if collision:
		var collider = get_last_slide_collision().get_collider()
		
		if collider is TileMapLayer:
			var tile_rid = get_last_slide_collision().get_collider_rid()
			layer_of_collision = PhysicsServer2D.body_get_collision_layer(tile_rid)
	
	if not is_on_floor():
		stopparticle($particle, .05)
		velocity.y +=  grav * delta
		rot += 7 * (delta * 60)
	else:
		$particle.emitting = true
		rot = snapped($cube.rotation_degrees, 90)
		if Input.is_action_pressed("jump"):
			velocity.y = jppower * jp_mult
	$cube.rotation_degrees += (rot - $cube.rotation_degrees) / 3
	velocity.x = spd * spd_mult * spd_portal_mult
	if layer_of_collision == yeouch_layer:
		get_tree().reload_current_scene()
func stopparticle(particle: CPUParticles2D, time: float):
	await get_tree().create_timer(time).timeout
	particle.emitting = false
