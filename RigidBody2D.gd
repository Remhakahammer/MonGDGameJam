extends RigidBody2D

export (String) var type = "coin"
export (int) var value = 4

signal item_pickup

func _ready():
	pass

func _on_Coin_body_entered(body):
	emit_signal("item_pickup", type, value)
  
