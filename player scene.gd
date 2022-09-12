extends KinematicBody2D

export (int) var speed = 100
export (int) var jump_speed = 200
export (int) var gravity = 500
var velocity = Vector2.ZERO



func get_input():
	
	velocity.x = 9
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	elif Input.is_action_pressed("move_left"):
		velocity.x -= speed


func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = -jump_speed
			
func ready():
  var currentScene = get_tree().get_current_scene().get_name()


func _on_Goal_body_enter( body ):
 if body.is_in_group("Player"):
		if get_tree().bloopus == "game":
				get_tree().change_scene("res://Scenes/Levels/Level 2.xml")


func _on_Area2D2_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://WINNING.tscn")
