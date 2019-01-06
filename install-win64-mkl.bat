
if not defined RTM_GWAS_VERSION (
    set RTM_GWAS_VERSION=unknown
)

rmdir /s /q x64

set REDIST=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Redist\MSVC\14.16.27012

set VCOMPDLL=%REDIST%\x64\Microsoft.VC141.OPENMP\vcomp140.dll

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars64.bat"

MSBuild.exe /p:Configuration=Release /p:Platform=x64

if errorlevel 1 (
    pause
    exit /b 1
)

cd x64\Release
mkdir rtm-gwas-assoc-win64
copy rtm-gwas-assoc.exe rtm-gwas-assoc-win64\
copy "%VCOMPDLL%" rtm-gwas-assoc-win64\

pause
