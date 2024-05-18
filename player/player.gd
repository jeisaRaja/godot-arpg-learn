extends CharacterBody2D

@export var speed:int

@onready var animation = $AnimationPlayer

func handleInput():
	var moveDir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDir * speed

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
	move_and_slide()
	updateAnimation()
	
