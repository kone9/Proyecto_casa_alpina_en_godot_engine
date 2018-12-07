extends Camera

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var TheCameraHolder = self;
onready var ThePlayer = get_parent();
var Pitch = 0.0;
var Yaw = 0.0;
export var MouseSensitivity = 0.4;

func _ready():
	 set_process_input(true)
	
func _input(event):
	if(event is InputEventMouseMotion):
		Yaw = fmod(Yaw - event.relative.x * MouseSensitivity, 360.0);
		Pitch = clamp(Pitch - event.relative.y * MouseSensitivity, -89.0, 89.0);
	DzUpdateCamera();

			


func DzUpdateCamera():
	TheCameraHolder.rotation.x = deg2rad(Pitch);
	TheCameraHolder.rotation.y = deg2rad(Yaw)

func DzGetCameraDirection():
	return TheCameraHolder.global_transform.basis;	
	
