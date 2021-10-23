extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal on_pickup

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#func _on_Item_body_entered(body):
#	._on_Item_body_entered(body)
#	print("Diamante")
	#emit_signal("on_pickup")
	#if body.is_in_group("player"):
	#	self.queue_free()
	#	print("Item Diamante")

func _on_ItemDiamante_body_entered(body):
	print("Sinal Específico")
	if body.is_in_group("player"):
		self.queue_free()
