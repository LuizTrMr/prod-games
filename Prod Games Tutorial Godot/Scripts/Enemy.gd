extends KinematicBody2D

var vel : Vector2
var goal_speed : int = 0
var speed : int = 200
var lerp_rate : float = 0.3

onready var state_machine = $Sprite/AnimationTree.get("parameters/playback")

func _ready():
	goal_speed = speed
	yield(get_tree().create_timer(1), "timeout")
	goal_speed = 0
	yield(get_tree().create_timer(1), "timeout")
	state_machine.travel("attack")
	#$Sprite/AnimationPlayer.play("attack")
	#die()
	
func _process(delta):
	var current = state_machine.get_current_node()
	if int(vel.x) != 0:
		state_machine.travel("run")
	else:
		state_machine.travel("idle")
		
func _physics_process(delta):
	vel.x = lerp(vel.x, goal_speed, lerp_rate) # 
	vel = move_and_slide(vel, Vector2.UP) # (0,-1)


func _on_AttackHitBox_body_entered(body):
	if body.is_in_group("player"):
		body.hit()

func die():
	state_machine.travel("dead")
	
	
	
	
	
	
	
	
	
