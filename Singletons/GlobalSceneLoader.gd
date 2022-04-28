extends Control

var loader
var wait_frames
var time_max = 100 # msec
var current_scene

onready var loading_bar = $ColorRect/CenterContainer/LoadingProgress

onready var loading_overlay = $ColorRect
func _ready():
	
	loading_overlay.visible = false
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() -1)
	

func goto_scene(path): # Game requests to switch to this scene.
	loading_bar.value = 0
	loading_overlay.visible = true
	loader = ResourceLoader.load_interactive(path)
	if loader == null: # Check for errors.
	   return
	set_process(true)

	current_scene.queue_free() # Get rid of the old scene.


	wait_frames = 1


func _process(time):
	if loader == null:
		# no need to process anymore
		set_process(false)
		return

	# Wait for frames to let the "loading" animation show up.
#	if wait_frames > 0:
#		loading_cirle.rotation_degrees += 0.1
		
		wait_frames -= 1
		return

	var t = OS.get_ticks_msec()
	# Use "time_max" to control for how long we block this thread.
	while OS.get_ticks_msec() < t + time_max:
		# Poll your loader.
		var err = loader.poll()

		if err == ERR_FILE_EOF: # Finished loading.
			var resource = loader.get_resource()
			loader = null
			set_new_scene(resource)
			loading_overlay.visible = false
			
			break
		elif err == OK:
			update_progress()
		else: # Error during loading.
			
			loader = null
			break

		
func update_progress():
	var progress = float(loader.get_stage()) / loader.get_stage_count()
	# Update your progress bar?
	loading_bar.value = progress * 100
	

	# ...or update a progress animation?
#	var length = get_node("animation").get_current_animation_length()

	# Call this on a paused animation. Use "true" as the second argument to
	# force the animation to update.
#	get_node("animation").seek(progress * length, true)
	if progress == 100:
		loading_overlay.visible = false

func set_new_scene(scene_resource):
	current_scene = scene_resource.instance()
	get_node("/root").add_child(current_scene)

func set_loadingbar(loadingbar):
	pass
