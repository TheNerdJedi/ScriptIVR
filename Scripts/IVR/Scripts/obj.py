import bpy
import sys
import os
 
#Get command line arguments
argv = sys.argv
argv = argv[argv.index("--") + 1:] # get all args after "—"
obj_in = argv[0]
obj_out = os.path.splitext(argv[0])[0] # we split up the name and then only take the first part
obj_out = obj_out + "_grouped.obj"

# Import the OBJ file
# See http://www.blender.org/api/blender_python_api_2_60_0/bpy.ops.import_scene.html
bpy.ops.import_scene.obj(filepath=obj_in, filter_glob="*.obj;*.mtl", 
							use_ngons=True, use_edges=True, use_smooth_groups=True, use_split_objects=True, 
							use_split_groups=True, use_image_search=True, split_mode='ON',global_clamp_size=0.0, 
							axis_forward='-Z', axis_up='Y')

# Export as OBJ file
# See http://www.blender.org/documentation/blender_python_api_2_62_1/bpy.ops.export_scene.html
bpy.ops.export_scene.obj(filepath=obj_out, filter_glob="*.obj;*.mtl", 
							use_mesh_modifiers=True, use_edges=True, use_uvs=True, use_materials=True, use_blen_objects=True, 
							group_by_material=True, axis_forward='-Z', axis_up='Y', global_scale=1.00, path_mode='AUTO')