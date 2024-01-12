extends Area2D


@export var level = ""
signal player_entered(level)


func _on_body_entered(body):
	if body.name == "player":
		player_entered.emit(level)
