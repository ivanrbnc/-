extends KinematicBody2D

export (int) var speed = 400
export (int) var jump_speed = -600
export (int) var GRAVITY = 1200
export (int) var max_jumps = 2

const UP = Vector2(0,-1)

var velocity = Vector2()
var jumps_remaining = max_jumps

var cheat = false

func get_input():
	if (cheat):
		max_jumps = 1000000
		speed = 1000
	if (!cheat):
		max_jumps = 2
		speed = 400
		
	if (Input.is_action_just_pressed("ui_up") and Input.is_action_just_pressed("ui_select")):
		cheat = !cheat
		
	if (get_tree().current_scene.filename.get_file().get_basename() == 'noob'):
		var animation = "Noob_Idle"
		velocity.x = 0
		if is_on_floor():
			jumps_remaining = max_jumps
		if Input.is_action_just_pressed("ui_up") and jumps_remaining > 0:
			velocity.y = jump_speed
			jumps_remaining -= 1
		if Input.is_action_pressed('ui_right'):
			animation = "Noob_Run"
			$AnimatedSprite.flip_h = false
			velocity.x += speed
		if Input.is_action_pressed('ui_left'):
			animation = "Noob_Run"
			$AnimatedSprite.flip_h = true
			velocity.x -= speed
		if $AnimatedSprite.animation != animation:
			$AnimatedSprite.play(animation)
	if (get_tree().current_scene.filename.get_file().get_basename() == 'evolve'):
		var animation = "Evolve_Idle"
		velocity.x = 0
		if is_on_floor():
			jumps_remaining = max_jumps
		if Input.is_action_just_pressed("ui_up") and jumps_remaining > 0:
			velocity.y = jump_speed
			jumps_remaining -= 1
		if Input.is_action_pressed('ui_right'):
			animation = "Evolve_Run"
			$AnimatedSprite.flip_h = false
			velocity.x += speed
		if Input.is_action_pressed('ui_left'):
			animation = "Evolve_Run"
			$AnimatedSprite.flip_h = true
			velocity.x -= speed
		if $AnimatedSprite.animation != animation:
			$AnimatedSprite.play(animation)
	if (get_tree().current_scene.filename.get_file().get_basename() == 'final'):
		var animation = "Final_Idle"
		velocity.x = 0
		if is_on_floor():
			jumps_remaining = max_jumps
		if Input.is_action_just_pressed("ui_up") and jumps_remaining > 0:
			velocity.y = jump_speed
			jumps_remaining -= 1
		if Input.is_action_pressed('ui_right'):
			animation = "Final_Run"
			$AnimatedSprite.flip_h = false
			velocity.x += speed
		if Input.is_action_pressed('ui_left'):
			animation = "Final_Run"
			$AnimatedSprite.flip_h = true
			velocity.x -= speed
		if $AnimatedSprite.animation != animation:
			$AnimatedSprite.play(animation)

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	get_input()
	velocity = move_and_slide(velocity, UP)
