@echo OFF
@title InsiteVR
cls

echo.
echo Made by Shajed Ahmed
echo ----------------------------------------------------------------
echo This bat script will process the InsiteVR Script
echo Made for InsiteVR
echo ----------------------------------------------------------------
echo.

echo This will now run the necessary Blender scripts on your file
PAUSE


rem Switch to the InsiteVR program's working directory
C:
cd C:\Program Files\InsiteVR\output


echo File will now be exported as .obj with 'Material Groups' selected
pause 

FOR %%f IN (*.obj) DO "c:\program files\blender foundation\blender\blender.exe" -b --python "c:\Program Files\InsiteVR\blender_scripts\obj.py" -- "%%f"

echo File will be now be exported as .fbx 
pause 
FOR %%f IN (*.obj) DO "c:\program files\blender foundation\blender\blender.exe" -b --python "c:\Program Files\InsiteVR\blender_scripts\fbx.py" -- "%%f"
pause


