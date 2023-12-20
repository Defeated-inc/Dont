extends Node3D

@onready var beginText = $ingameText/Timer
@onready var bedroomDoor = $bedroomDoor
@onready var frameAnimation = $womanFrame/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Quit"):
		get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
		get_tree().quit()

func _on_e_show_door_interactive_body_entered(body):
	bedroomDoor.setcanOpenDoor(true)
	
func _on_e_show_door_interactive_body_exited(body):
	bedroomDoor.setcanOpenDoor(false)


func _on_e_move_frame_body_entered(body):
	frameAnimation.play("MoveFrame")
	get_node("E_MoveFrame").queue_free()
	beginText.start()
	
