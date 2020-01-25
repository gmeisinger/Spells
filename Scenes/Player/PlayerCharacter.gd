extends "res://Scenes/Actor/Actor.gd"

func _ready():
	Globals.set("player", self)

# Movement
func process_movement(delta):
	var target_speed = Vector2()
	if Input.is_action_pressed("move_up"):
		target_speed.y -= 1
	if Input.is_action_pressed("move_down"):
		target_speed.y += 1
	if Input.is_action_pressed("move_left"):
		target_speed.x -= 1
		h_face = -1
	if Input.is_action_pressed("move_right"):
		target_speed.x += 1
		h_face = 1
	
	velocity = target_speed.normalized() * max_speed
	#flip sprites
	face_sprites(sign(get_target().x), sign(get_target().y))

func get_target():
	return get_local_mouse_position()

func update_camera():
	pass
	$GameCamera.update_offset(get_target())