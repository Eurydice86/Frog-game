extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var gravity = Vector2(0, 30)
var velocity
var heading
export var xSpeed = 17280
export var yForce = 600
var tongueLength
var tongueTip
var tongueExtended
var spriteOffset

# Called when the node enters the scene tree for the first time.
func _ready():
	heading = (get_global_mouse_position() - position).sign().x
	velocity = Vector2(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	heading = (get_global_mouse_position() - position).sign().x
	if heading < 0:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
	if Input.is_action_just_pressed("tongue") and not $Tongue.extended:
		$Tongue.extend()
	if is_on_floor():
		velocity.x = 0
		if Input.is_action_just_pressed("jump"):
			jump(delta)
			

	velocity += gravity
	velocity = move_and_slide(velocity, Vector2.UP)

func jump(delta):
	velocity.y = -yForce
	velocity.x = heading * xSpeed * delta
	$jumpAudio.play()
