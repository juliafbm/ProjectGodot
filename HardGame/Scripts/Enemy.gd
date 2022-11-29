extends KinematicBody2D


const DOWN = 0
const RIGHT = 1
const UP = 2
const LEFT = 3

export var speed = 500
export var health = 1
var velocity = Vector2()
var move_direction = -1
var direction
var steps
var count_steps
var screensize

func _ready():
	screensize = get_viewport_rect().size
	randomize()
	_new_goal()

func _new_goal():
	direction = randi() % 4 
	steps = 50 + (randi() % 50)
	count_steps = 0
	
func _process(delta):
	count_steps += 1
	if count_steps > steps:
		_new_goal()
	if direction == DOWN:
		velocity.y = speed
		rotation_degrees = 0
	elif direction == RIGHT:
		velocity.x = speed
		rotation_degrees = -90
	elif direction == UP:
		velocity.y = -speed
		rotation_degrees = 180
	elif direction == LEFT:
		velocity.x = -speed
		rotation_degrees = 90
	if velocity.length() > 0:
		move_and_collide(velocity * delta)


	
