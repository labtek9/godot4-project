extends CharacterBody2D


const speed = 100
@onready var anim = $AnimatedSprite2D


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# fuck this shit but its the movement
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		anim.play("side walk")
		anim.flip_h = true
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		anim.play("side walk")
		anim.flip_h = false
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		anim.play("down walk")
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
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
	
# checks every game tick for input and movement
func _physics_process(delta):
	get_input()
	move_and_slide()
