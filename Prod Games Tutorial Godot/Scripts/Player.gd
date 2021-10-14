extends KinematicBody2D


# Var
var vel : Vector2
var goal_speed = 0
var is_attacking : bool = false

# Export Var
export var speed : int = 200
export var lerp_rate : float = 0.3

# Const
const GRAVITY = 2e3 # 2000, só que é float e não int -> int(2e3)
const JUMP_FORCE = -800
const ATTACK1_HURTBOX_POSITION_X : float = 46.5

# Enum
enum Side {LEFT, RIGHT}

func _ready():
	pass


func _process(delta):
	if Input.is_action_pressed("move_right"):
		goal_speed = speed
		
	if Input.is_action_pressed("move_left"):
		goal_speed = -speed
		
	if Input.is_action_just_released("move_left")  or Input.is_action_just_released("move_right"):
		goal_speed = 0
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vel.y = JUMP_FORCE
	
	handle_animation()
	
	if Input.is_action_just_pressed("attack1"):
		execute_attack1()

func _physics_process(delta):
	vel.x = lerp(vel.x, goal_speed, lerp_rate) # 
	vel = move_and_slide(vel, Vector2.UP) # (0,-1)
	vel.y += GRAVITY * delta # 2000 * 0.016666


func handle_animation():
	if !is_attacking:
		if floor( abs(vel.x) ) == 0:
			$AnimatedSprite.play("idle")
		else:
			$AnimatedSprite.play("run")
			if vel.x > 0:
				turn_around(Side.RIGHT)
			else:
				turn_around(Side.LEFT)

func turn_around(side : int):
	if side == Side.LEFT:
		$AnimatedSprite.flip_h = true
		$AnimatedSprite/Attack1Hitbox/CollisionAttack1.position.x = -ATTACK1_HURTBOX_POSITION_X
	else: # direita
		$AnimatedSprite.flip_h = false
		$AnimatedSprite/Attack1Hitbox/CollisionAttack1.position.x = ATTACK1_HURTBOX_POSITION_X
		
func execute_attack1():
	is_attacking = true
	$AnimatedSprite.play("attack1")
	
func check_animation(animation_name : String) -> bool:
	if $AnimatedSprite.animation == animation_name:
		return true
	return false

func _on_AnimatedSprite_animation_finished():
	if check_animation("attack1"):
		is_attacking = false

func _on_AnimatedSprite_frame_changed():
	if check_animation("attack1"):
		if $AnimatedSprite.frame == 1:
			$AnimatedSprite/Attack1Hitbox/CollisionAttack1.disabled = false # enabled
		elif $AnimatedSprite.frame == 2:
			$AnimatedSprite/Attack1Hitbox/CollisionAttack1.disabled = true # disabled

func hit():
	print("Got hit")
