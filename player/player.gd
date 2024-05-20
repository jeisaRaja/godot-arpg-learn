extends CharacterBody2D

@export var speed:int
@export var knockbackPower: int = 500
@onready var animation = $AnimationPlayer
@onready var heartContainer = $"../../CanvasLayer/heartsContainer"
@onready var effects = $Effects
@onready var hurtTimer = $hurtTimer

var isHurt : bool = false

var maxHealth: int = 3
var currHealth: int = maxHealth
func handleInput():
	var moveDir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDir * speed
	
func handleCollision():
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()

func updateAnimation():
	if velocity.length() == 0:
		if animation.is_playing():
			animation.stop()
	else:
		var direction = "Down"
		if velocity.x < 0: direction = "Left"
		if velocity.x > 0: direction = "Right"
		if velocity.y < 0: direction = "Up"
		animation.play("walk"+ direction)
	
func _physics_process(delta):
	handleInput()
	handleCollision()
	updateAnimation()
	move_and_slide()
	
func _on_hurt_box_area_entered(area):
	if isHurt: return
	if area.name == "hitBox":
		currHealth -= 1
		if currHealth < 0:
			currHealth = maxHealth
		var enemyVelocity = area.get_parent().velocity
		knockback(enemyVelocity)
		heartContainer.updateHearts(currHealth)
		isHurt = true
		effects.play("hurtBlink")
		hurtTimer.start()
		await hurtTimer.timeout
		isHurt = false
		effects.play("RESET")

func knockback(enemyVelocity: Vector2):
	var knockbackDir = (enemyVelocity.normalized() - velocity.normalized()) * knockbackPower
	velocity = knockbackDir
	move_and_slide()
	
