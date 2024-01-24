extends Node



func _on_door_player_entered(level):
	get_tree().change_scene_to_file(level)

var spawn_point = Vector2(0, 0)

func respawn_player():
	get_node("player").position = spawn_point

func _ready():
	spawn_point = get_node("player").position

func _on_death_zone_body_entered(body):
	if (body.name == 'player'):
		respawn_player()
