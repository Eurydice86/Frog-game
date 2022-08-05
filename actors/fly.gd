extends RigidBody2D


var speed = 150
var velocity
var initialPosition
var min_x
var max_x
var min_y
var max_y
var boxSize = 150

var mouseInArea
var frog
var frogTongue

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2(1,0)
	initialPosition = position
	
	min_x = initialPosition.x - boxSize
	max_x = initialPosition.x + boxSize
	min_y = initialPosition.y - boxSize
	max_y = initialPosition.y + boxSize
	
	var siblings = get_parent().get_children()
	for s in siblings:
		if s.name == "Frog":
			frog = s
	var grandsiblings = frog.get_children()
	for g in grandsiblings:
		if g.name == "Tongue":
			frogTongue = g

	

func _physics_process(delta):
	if Input.is_action_just_pressed("tongue")  and mouseInArea and (position - frog.position).length() <= frogTongue.maxLength:
		queue_free()

	position.x += speed * delta * (randi() % 3 - 1)
	position.y += speed * delta * (randi() % 3 - 1)
	position.y = clamp(position.y, min_y, max_y)



func _on_targetArea_mouse_entered():
	mouseInArea = true

func _on_targetArea_mouse_exited():
	mouseInArea = false
