pause You will now execute InsiteVR script
pause 


pause File will be exported as .obj with 'Material Groups' selected
FOR %%f IN (*.obj) DO "c:\program files\blender foundation\blender\blender.exe" -b --python "c:\Program Files\InsiteVR\Scripts\obj.py" -- "%%f"
pause File will be exported as .fbx 
FOR %%f IN (*.obj) DO "c:\program files\blender foundation\blender\blender.exe" -b --python "c:\Program Files\InsiteVR\Scripts\fbx.py" -- "%%f"
pause 