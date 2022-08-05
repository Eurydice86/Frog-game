extends Line2D

var maxLength
var pos
onready var offsetVector
var extended

func _ready():
	extended = false
	offsetVector = Vector2(0, 0)
	add_point(offsetVector)
	maxLength = 300
	pos = offsetVector
	
func _process(delta):
	$target.position = get_local_mouse_position()

func extend():
	extended = true
	$slurpAudio.play()
	pos = $target.position.clamped(maxLength)
	add_point(pos)
	$Timer.start()
	
func _on_Timer_timeout():
	retract()

func retract():
	pos = offsetVector
	extended = false
	if points.size()>1:
		remove_point(points.size()-1)

#func _draw():
#	draw_line(offsetVector, pos, Color(1,0,0), 10)


func _on_Area2D_body_entered(body):
	$target.set_texture(load("res://sprites/target_green.png"))


func _on_Area2D_body_exited(body):
	$target.set_texture(load("res://sprites/target.png"))
