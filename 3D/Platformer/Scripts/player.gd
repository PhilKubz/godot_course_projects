extends CharacterBody3D

@onready var model : MeshInstance3D = get_node("Model")
@onready var score_text : Label = get_node("ScoreText")

@export var move_speed : float = 4.0
@export var jump_force : float = 8.0
@export var gravity : float = 20.0

var facing_angle : float
var score : int

func _physics_process(delta):
	# Apply gravity when in the air
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = jump_force
	
	#Get keyboard input
	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	
	#Calculate move direction
	var dir = Vector3(input.x, 0, input.y)
	
	#Assign the direction to velocity
	velocity.x = dir.x * move_speed
	velocity.z = dir.z * move_speed

	#Allow movement 
	move_and_slide()
	
	if input.length() > 0:
		facing_angle = Vector2(input.y, input.x).angle()
		
	model.rotation.y = lerp_angle(model.rotation.y, facing_angle, 0.3)
	
	if global_position.y < -5:
		level_restart()
	

func add_score(amount):
	score += amount
	score_text.text = str("Score: ", score)
#	score_text.text = ("Score: ") + str(score)


func level_restart():
	get_tree().reload_current_scene()
