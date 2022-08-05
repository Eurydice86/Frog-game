extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var fly = preload("res://actors/fly.tscn")
var flyInstance
var flyExists
var spawnHeight = 150

var spawnPositions = [96, 288, 480, 672, 864]

# Called when the node enters the scene tree for the first time.
func _ready():
	flyExists = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var children =  get_children()
	for c in children:
		if c.name[0] == "f":
			flyExists = true
		else:
			flyExists = false
	if not flyExists:
		flyInstance = fly.instance()
		var randPosX = randi() % spawnPositions.size()
		flyInstance.position = Vector2(spawnPositions[randPosX], spawnHeight)
		add_child(flyInstance)
	


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Game Over Screen.tscn")


func _on_Button_pressed():
	get_tree().change_scene("res://Main Menu.tscn")
