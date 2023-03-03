extends CharacterBody2D


const speed = 100
@onready var anim = $AnimatedSprite2D


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = "down"

# fuck this shit but its the movement
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		direction = "right"
		anim.play("side walk")
		anim.flip_h = true
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		direction = "left"
		anim.play("side walk")
		anim.flip_h = false
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		direction = "down"
		anim.play("down walk")
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		direction = "up"
		anim.play("up walk")
	if Input.is_action_just_released("ui_down"):
		anim.play("down idle")
	if Input.is_action_just_released("ui_up"):
		anim.play("up idle")
	if Input.is_action_just_released("ui_left"):
		anim.play("side idle")
		anim.flip_h = false
	if Input.is_action_just_released("ui_right"):
		anim.play("side idle")
		anim.flip_h = true
	velocity = velocity.normalized() * speed
	
func att_dir():
	if Input.is_action_pressed("att") and direction == "down":
		anim.play("down att")
	if Input.is_action_pressed("att") and direction == "up":
		anim.play("up att")
	if Input.is_action_pressed("att") and direction == "left":
		anim.play("side att")
		anim.flip_h = false
	if Input.is_action_pressed("att") and direction == "right":
		anim.play("side att")
		anim.flip_h = true
	

# checks every game tick for input and movement
func _physics_process(delta):
	att_dir()
	get_input()
	move_and_slide()


func _on_animated_sprite_2d_animation_finished():
	pass # Replace with function body.
