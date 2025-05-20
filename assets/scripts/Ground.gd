extends Area2D




# all this does is make the ground move when the player touches the area2d
# so it gives the illusion that the ground is infinite



func _on_body_entered(body: Node2D) -> void:
	var ground = $".."
	var player = $"../../../player"
	if body == player:
		ground.position.x += 512
