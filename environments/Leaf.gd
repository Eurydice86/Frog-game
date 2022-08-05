extends StaticBody2D


#

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_exited(body):
	make_unavailable()


func _on_AvailabilityTimer_timeout():
	make_available()

func make_unavailable():
	$Sprite.visible = false
	$CollisionShape2D.set_deferred("disabled", true)
	$AvailabilityTimer.start()

func make_available():
	$Sprite.visible = true
	$CollisionShape2D.set_deferred("disabled", false)
