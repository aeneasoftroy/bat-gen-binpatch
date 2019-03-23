@echo off
@color 0a

set RELEASER=HcH
set PATCHNFO=HcH.NFO

echo             _pgM0000Mgg,       
echo         _p00000000000000Go.      gen-binpatcher v2: Generate Binary Patch
echo        p0000000000MMM000000o  
echo       p000000MM00000MM000000o    This script generates a binary patch and
echo      ]00000000000000000000000o   a script that applies the patch as well.
echo      #000000000M00000000000000   
echo      ]000M~`~~M00000M~``~#N009   -Uses MD5 for checksum verification
echo       M0#      ~000       0MM    -Uses DIFF to differentiate
echo        ##      g000,     _0Y     -Uses PATCH to apply differences
echo        ]0^&gg,g00F 30Ng,gg00[   
echo        #0000000# , #0000000#     Usage: gen-binpatch.bat original patched
echo        00MM0000000000N0MMM00
echo          `0 BMM00000F0f 0'    
echo           00`*0#####0*'00        Aeneas Of Troy
echo           `0M.........M0      
echo            VM00000000MV      
echo              `~000@~'      
echo.

REM Here we check if the input is given:
if [%1] == [] @color 0c && echo No input original file received && pause && goto :EOF
if [%2] == [] @color 0c && echo No input patched file received && pause && goto :EOF

set /p rlsname="Enter release name: "
if exist "%CD%\%rlsname%\" color 0c&&echo ERROR: Release directory already exists&&pause&&goto :EOF
md "%CD%\%rlsname%\"

echo.&&echo [%date%]::[%time%] Diff binary mode on: && echo. && echo original file: %1 && echo 	VS. && echo patched file: %2 && echo.
diff --binary -a %1 %2 > "%CD%\%rlsname%\data.patch"
dir "%CD%\%rlsname%\data.patch" | findstr /i "data.patch"


echo [%date%]::[%time%] Getting MD5 checksum ...
md5sum.exe %1>"%CD%\%rlsname%\%1.MD5"
set /p MD5="MD5" < "%CD%\%rlsname%\%1.MD5"
echo %MD5%

echo [%date%]::[%time%] Generating patcher.bat ...
REM to use this patch data: 
REM Target file logically is the %1 variable, so we re-use it:
echo @echo off > "%CD%\%rlsname%\patch.bat"
echo color 0a >> "%CD%\%rlsname%\patch.bat"
echo echo         _pgM0000Mgg,       >> "%CD%\%rlsname%\patch.bat"
echo echo     _p00000000000000Go.      gen-binpatcher v2: >> "%CD%\%rlsname%\patch.bat"
echo echo    p0000000000MMM000000o     >> "%CD%\%rlsname%\patch.bat"
echo echo   p000000MM00000MM000000o    %RLSNAME% >> "%CD%\%rlsname%\patch.bat"
echo echo  ]00000000000000000000000o   >> "%CD%\%rlsname%\patch.bat"
echo echo  #0000000000M0M00000000000   TARGET: >> "%CD%\%rlsname%\patch.bat"
echo echo  #000000NN0000000M0M000000   %1>> "%CD%\%rlsname%\patch.bat"
echo echo  #000000000M00000000000000       >> "%CD%\%rlsname%\patch.bat"
echo echo  ]000M~`~~M00000M~``~#N009   MD5:  >> "%CD%\%rlsname%\patch.bat"
echo echo   M0#      ~000       0MM    %MD5% >> "%CD%\%rlsname%\patch.bat"
echo echo    ##      g000,     _0Y     >> "%CD%\%rlsname%\patch.bat"
echo echo    ]00gg,g000000Ng,gg00  ____________________________  >> "%CD%\%rlsname%\patch.bat"
echo echo     000000000000000000  ( Applying binary patch ...  ) >> "%CD%\%rlsname%\patch.bat"
echo echo       00BMM00000F0f00   /`""""""""""""""""""""""""""'  >> "%CD%\%rlsname%\patch.bat"
echo echo        000[     ]000      >> "%CD%\%rlsname%\patch.bat"
echo echo         00000000000       >> "%CD%\%rlsname%\patch.bat"
echo echo           0000000         >> "%CD%\%rlsname%\patch.bat"
echo ping 127.0.0.1 -n 3 -w 1000 ^>NUL >> "%CD%\%rlsname%\patch.bat"
echo CLS >> "%CD%\%rlsname%\patch.bat"
echo echo Binary diff patcher: >> "%CD%\%rlsname%\patch.bat"
echo echo.>> "%CD%\%rlsname%\patch.bat"
echo echo Step 1. Verifying MD5 checksum of target file ... >> "%CD%\%rlsname%\patch.bat"
echo md5sum -c %1.MD5 >> "%CD%\%rlsname%\patch.bat"
echo if not %%errorlevel%% == 0 echo TARGET FILE DOES NOT MD5 MATCH! >> "%CD%\%rlsname%\patch.bat"
echo if not %%errorlevel%% == 0 pause >> "%CD%\%rlsname%\patch.bat"
echo if not %%errorlevel%% == 0 exit >> "%CD%\%rlsname%\patch.bat"
echo echo. >> "%CD%\%rlsname%\patch.bat"
echo echo Step 2. Creating a backup of the target (%1) ... >> "%CD%\%rlsname%\patch.bat"
echo copy %1 %1.bak ^>NUL >> "%CD%\%rlsname%\patch.bat"
echo dir %1.bak ^| findstr /i %1 >> "%CD%\%rlsname%\patch.bat"
echo echo Backup created. >> "%CD%\%rlsname%\patch.bat"
echo echo. >> "%CD%\%rlsname%\patch.bat"
echo echo Step 3. Patching %1 ... >> "%CD%\%rlsname%\patch.bat"
echo patch --binary %1 data.patch >> "%CD%\%rlsname%\patch.bat"
echo echo Done.>> "%CD%\%rlsname%\patch.bat"
echo echo new file specs: >> "%CD%\%rlsname%\patch.bat"
echo dir %1 ^| findstr /i %1 >> "%CD%\%rlsname%\patch.bat"
echo echo. >> "%CD%\%rlsname%\patch.bat"
echo echo Patching done. >> "%CD%\%rlsname%\patch.bat"
echo echo. >> "%CD%\%rlsname%\patch.bat"
echo pause >> "%CD%\%rlsname%\patch.bat"

echo [%date%]::[%time%] Generating %PATCHNFO% ...
echo Release name : %RLSNAME%>> "%CD%\%rlsname%\%PATCHNFO%"
echo Date and time: %DATE% ::: %TIME%>> "%CD%\%rlsname%\%PATCHNFO%"
echo Patcher      : %RELEASER%>> "%CD%\%rlsname%\%PATCHNFO%"
echo Target file  : %1>> "%CD%\%rlsname%\%PATCHNFO%"
echo Target MD5   : %MD5%>> "%CD%\%rlsname%\%PATCHNFO%"
echo.  >> "%CD%\%rlsname%\%PATCHNFO%"

echo [%date%]::[%time%] Copying required binaries to output directory ...
copy patch.exe "%CD%\%rlsname%\" >NUL
copy md5sum.exe "%CD%\%rlsname%\" >NUL

echo.&&echo [%date%]::[%time%] Patcher generation done.&&echo.

echo [%date%]::[%time%] Output directory contents:

dir /b "%CD%\%rlsname%\"

:EOF