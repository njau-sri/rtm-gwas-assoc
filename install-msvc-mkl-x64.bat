
rmdir /s /q x64

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars64.bat"

MSBuild.exe /p:Configuration=Release /p:Platform=x64

pause
