@echo OFF
@title Test Batching
cls

echo.
echo Made by Shajed Ahmed
echo ----------------------------------------------------------------
echo This bat script will process a series of meshes from the 
echo input folder, run them through a meshlabserver script 
echo and save the resulting meshes to the output folder
echo Made for InsiteVR
echo ----------------------------------------------------------------
echo.

rem Switch to the MultiMesh program's working directory
C:
cd C:\Program Files\InsiteVR\MeshLab


:: Process a single mesh variable
:: If the filename was (example.obj) you would write in: (example)
:: @set singleMeshNamePrefix=granite_boulder


rem Input Mesh File variables (More than one)
@set inputFolder=input
:: You can choose a specific mesh format for input or
:: use an asterix (*) for all files in the input meshes folder
:: @set inputMeshFormat=obj
:: @set inputMeshFormat=*
@set inputMeshFormat=obj


rem Output Mesh File variables
@set outputFolder=output
@set outputMeshFormat=obj


:: MLX script file variables (If you want to add in your own script)
:: the MLX scripts are stored in the C:\multiMeshScripting\scripts folder
:: @set mlxScriptFile=simple_script.mlx
:: @set mlxScriptFolder=scripts

rem OM Output Mesh Options
:: These options specify what data types are exported by meshlabserver
@set outputMeshOptions=-om vc vf vq vn vt fc ff fq fn wc wn wt 
:: The standard om options are "-om vc fq wn" which give vertex colors, face colors, and wedge normals

rem The available OM options are:
:: vc -> vertex colors
:: vf -> vertex flags
:: vq -> vertex quality
:: vn-> vertex normals
:: vt -> vertex texture coords
:: fc -> face colors
:: ff -> face flags
:: fq -> face quality
:: fn-> face normals
:: wc -> wedge colors
:: wn-> wedge normals
:: wt -> wedge texture coords

rem The meshlabserver program location:
@set meshlabserverPath="C:\Program Files\VCG\MeshLab\meshlabserver.exe"


rem ------------------------------------------------------
rem       List the Current Input Mesh Format
rem ------------------------------------------------------
echo ----------------------------------------------------------------
echo.
echo Processing meshes with the format:
echo %inputMeshFormat%
echo.



rem ------------------------------------------------------
rem            List the input Meshes
rem ------------------------------------------------------
echo.
echo ----------------------------------------------------------------
echo.
echo Input Folder Mesh List:
for %%X in (%inputFolder%\*.%inputMeshFormat%) do (echo "%%X")
echo.



:: ------------------------------------------------------
::   Do a simple mesh conversion on a single file
:: ------------------------------------------------------

:: Example Syntax: 
:: "C:\Program Files\VCG\MeshLab\meshlabserver.exe" -i input\boulder-mini1.ply -o output\boulder-mini1.ply -om vc fq wn

:: Do a simple mesh conversion
:: %meshlabserverPath% -i %inputFolder%\%singleMeshNamePrefix%.%inputMeshFormat% -o %outputFolder%\%singleMeshNamePrefix%.%outputMeshFormat% %outputMeshOptions%



rem ------------------------------------------------------
rem    Do a simple mesh conversion on a folder
rem ------------------------------------------------------

:: Run the "for" loop from inside the input folder
cd %inputFolder%

for %%I in (*.%inputMeshFormat%) do (%meshlabserverPath% -i %%I -o ..\%outputFolder%\%%~nI.%outputMeshFormat% %outputMeshOptions% %outputMeshOptions%)

:: Go back down a directory
cd ..





:: ------------------------------------------------------
:: Run a meshlabserver MLX script on a single file
:: ------------------------------------------------------

:: Example Syntax: 
:: "C:\Program Files\VCG\MeshLab\meshlabserver.exe" -i input\boulder-mini1.ply -o output\boulder-mini1.ply -s scripts\simple_script.mlx -om vc fq wn

:: %meshlabserverPath% -i %inputFolder%\%singleMeshNamePrefix%.%inputMeshFormat% -o %outputFolder%\%singleMeshNamePrefix%.%outputMeshFormat% -s %mlxScriptFolder%\%mlxScriptFile% %outputMeshOptions%



:: ------------------------------------------------------
::   Run a meshlabserver MLX script on a folder
:: ------------------------------------------------------
echo.
echo ----------------------------------------------------------------
echo.

:: Example syntax that is used inside the for loop: 
:: "C:\Program Files\VCG\MeshLab\meshlabserver.exe" -i input\boulder-mini1.ply -o output\boulder-mini1.ply -s scripts\simple_script.mlx -om vc fq wn

:: Run the "for" loop from inside the input folder
:: cd %inputFolder%

:: for %%I in (*.%inputMeshFormat%) do (%meshlabserverPath% -i %%I -o ..\%outputFolder%\%%~nI.%outputMeshFormat% -s ..\%mlxScriptFolder%\%mlxScriptFile% %outputMeshOptions%)

:: Go back down a directory
:: cd ..





rem ------------------------------------------------------
rem            List the Output Meshes
rem ------------------------------------------------------
echo.
echo ----------------------------------------------------------------

echo.
echo Output Folder Mesh List:
for %%X in (%outputFolder%\*.*) do (echo "%%X")
echo.






rem ------------------------------------------------------
rem            Done Processing
rem ------------------------------------------------------

echo. 
echo Script Complete
echo.
PAUSE