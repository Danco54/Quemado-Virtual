extends CharacterBody2D

@export var speed : float = 400
@export var gravity : float = 800.0
@export var jump_strength = -600.0
var max_jumps = 1
var jumps_left: int = max_jumps

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity.x = input_direction.x * speed

func _physics_process(delta):
	get_input()
	
	# Aplicar gravedad
	velocity.y += gravity * delta
	
	# Verificar si estamos en el suelo
	if is_on_floor():
		# Si estamos en el suelo, restablecemos el contador de saltos
		jumps_left = max_jumps
	
	# Manejo de saltos
	if Input.is_action_just_pressed('saltar'):
		if is_on_floor() or jumps_left > 0:
			# Realizar un salto o doble salto si aún tenemos disponible
			velocity.y = jump_strength
			jumps_left -= 1
	move_and_slide()
