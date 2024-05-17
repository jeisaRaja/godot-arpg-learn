extends CharacterBody2D

@export var speed:int

func handleInput():
	var moveDir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDir * speed

func _physics_process(delta):
	handleInput()
	move_and_slide()
