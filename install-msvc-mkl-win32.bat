
rmdir /s /q Release

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars32.bat"

MSBuild.exe /p:Configuration=Release /p:Platform=Win32

pause
