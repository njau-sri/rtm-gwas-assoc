
if not defined RTM_GWAS_VERSION (
    set RTM_GWAS_VERSION=unknown
)

rmdir /s /q Release

set REDIST=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Redist\MSVC\14.16.27012

set VCOMPDLL=%REDIST%\x86\Microsoft.VC141.OPENMP\vcomp140.dll

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars32.bat"

MSBuild.exe /p:Configuration=Release /p:Platform=Win32

if errorlevel 1 (
    pause
    exit /b 1
)

cd Release
mkdir rtm-gwas-assoc-win32
copy rtm-gwas-assoc.exe rtm-gwas-assoc-win32\
copy "%VCOMPDLL%" rtm-gwas-assoc-win32\

pause
