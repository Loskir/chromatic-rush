extends Node

var spawn_point = Vector2(0, 0)
var gems_collected = 0
var attempt = 0

func _ready():
	if $AttemptsLabel and $Instructions:
		$AttemptsLabel.hide()
	attempt = 1
	spawn_point = get_node("player").position
	for gem in $Gems.get_children():
		gem.connect('gem_collected', _on_gem_collected)

func respawn_player():
	attempt += 1
	if $Instructions:
		$Instructions.hide()
	if $AttemptsLabel:
		$AttemptsLabel.show()
		$AttemptsLabel.text = "Attempt " + str(attempt)
	get_node("player").position = spawn_point

func _on_door_player_entered(level):
	get_tree().change_scene_to_file(level)

func _on_death_zone_body_entered(body):
	if body.name == 'player':
		respawn_player()

func _on_spikes_body_entered(body):
	if body.name == 'player':
		respawn_player()


func _on_gem_collected():
	gems_collected += 1
	$HUD/CoinCouner.text = str(gems_collected)
