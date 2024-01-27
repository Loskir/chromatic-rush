extends Area2D

signal gem_collected


func _on_body_entered(body):
	if body.name == "player":
		gem_collected.emit()
		$CoinPickup.play()
		hide()


func _on_coin_pickup_finished():
	queue_free()
