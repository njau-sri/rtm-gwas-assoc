@echo off

if not defined RTM_GWAS_VERSION (
    set RTM_GWAS_VERSION=unknown
)

set /p my_target=Specify Target Platform [win32/win64]:

rem Distributable Code for Visual Studio 2019
rem https://docs.microsoft.com/en-us/visualstudio/releases/2019/redistribution#visual-c-runtime-files
set my_redist=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Redist\MSVC\14.21.27702

if /i "%my_target%" == "win32" (
    rmdir /s /q Release rtm-gwas-assoc-win32
    set my_vcomp_dll="%my_redist%\x86\Microsoft.VC142.OPENMP\vcomp140.dll"
    set my_vcvars="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars32.bat"
)

if /i "%my_target%" == "win64" (
    rmdir /s /q x64 rtm-gwas-assoc-win64
    set my_vcomp_dll="%my_redist%\x64\Microsoft.VC142.OPENMP\vcomp140.dll"
    set my_vcvars="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"
)

if %my_vcvars% == "" (
    echo Error Target Platform: %my_target%
    pause
    exit /b 1
)

call %my_vcvars%

MSBuild.exe -m -p:Configuration=Release

if errorlevel 1 (
    pause
    exit /b 1
)

if "%my_target%" == "win32" (
    mkdir rtm-gwas-assoc-win32
    copy %my_vcomp_dll% rtm-gwas-assoc-win32\
    copy Release\rtm-gwas-assoc.exe rtm-gwas-assoc-win32\
)

if "%my_target%" == "win64" (
    mkdir rtm-gwas-assoc-win64
    copy %my_vcomp_dll% rtm-gwas-assoc-win64\
    copy x64\Release\rtm-gwas-assoc.exe rtm-gwas-assoc-win64\
)

pause
