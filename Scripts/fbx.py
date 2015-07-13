import bpy
import sys
import os
 
#Get command line arguments
argv = sys.argv
argv = argv[argv.index("--") + 1:] # get all args after "—"
obj_in = argv[0]
# fbx_out = os.path.splitext(argv[0])[0] # we split up the name and then only take the first part
# fbx_out = argv[0] + ".fbx" 

# Import the OBJ file
# See http://www.blender.org/api/blender_python_api_2_60_0/bpy.ops.import_scene.html
bpy.ops.import_scene.obj(filepath=obj_in, filter_glob="*.obj;*.mtl", 
							use_ngons=True, use_edges=True, use_smooth_groups=True, use_split_objects=True, 
							use_split_groups=True, use_image_search=True, split_mode='ON',global_clamp_size=0.0, 
							axis_forward='-Z', axis_up='Y')

fbx_out = os.path.splitext(argv[0])[0]
fbx_out = fbx_out + ".fbx"


# Export as FBX
# See http://www.blender.org/documentation/blender_python_api_2_62_1/bpy.ops.export_scene.html
bpy.ops.export_scene.fbx(filepath=fbx_out, filter_glob="*.fbx", global_scale=1.00, axis_forward='-Z', 
							axis_up='Y', object_types={'EMPTY', 'LAMP', 'MESH', 'CAMERA',
                                                                       'ARMATURE', 'MESH'}, 
							use_mesh_modifiers=True, use_anim=True, use_anim_action_all=True, use_default_take=True, 
							use_anim_optimize=True, anim_optimize_precision=6.00, path_mode='AUTO', batch_mode='OFF', 
							use_batch_own_dir=True)