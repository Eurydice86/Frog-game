extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var finalPosition = Vector2(224, 0)
export var initialPosition = Vector2(224, 200)
export var speed = 140

# Called when the node enters the scene tree for the first time.
func _ready():
	$gameOverText.visible_characters = 0
	$sadFrog.position = initialPosition


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $sadFrog.position.y > finalPosition.y:
		$sadFrog.position.y -= speed * delta
	else:
		show_game_over_text()


func show_game_over_text():
	if $gameOverText.visible_characters < 9:
		$gameOverText.visible_characters += 1


func _on_Timer_timeout():
	get_tree().change_scene("res://Main Menu.tscn")
