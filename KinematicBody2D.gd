extends KinematicBody2D

export (int) var speed = 300
export (int) var gravity = 1000
export (float, 0, 1.0) var friction = 0.25
export (float, 0, 1.0) var acceleration = 0.25

var jump_speed = 600
var velocity = Vector2.ZERO


func get_input():
	var dir = 0
	if Input.is_action_pressed("move_right"):
		dir += 1
	elif Input.is_action_pressed("move_left"):
		dir -= 1
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)


func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_pressed("jump"):
		if is_on_floor():
			velocity.y = -jump_speedextends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
