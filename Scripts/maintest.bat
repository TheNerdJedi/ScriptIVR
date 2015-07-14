pause File will be exported as .obj with 'Material Groups' selected
FOR %%f IN (*.obj) DO "c:\program files\blender foundation\blender\blender.exe" -b --python "c:\Users\Russell\Desktop\UltimateTest\obj.py" -- "%%f"
pause File will be exported as .fbx 
FOR %%f IN (*.obj) DO "c:\program files\blender foundation\blender\blender.exe" -b --python "c:\Users\Russell\Desktop\UltimateTest\fbx.py" -- "%%f"
pause 