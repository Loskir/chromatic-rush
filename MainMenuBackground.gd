extends ColorRect

var time = 0

func _process(delta):
	time += delta
	self.color = Color.from_ok_hsl(time / 10, 1, 0.35)
