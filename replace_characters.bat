@echo off

rem  This program replaces characters in the file names of a directory.
rem  This is useful if you want to remove spaces from file names or 
rem  replace "-" with "_".

rem Credit to dbenham for the for loop
rem https://stackoverflow.com/a/11278987

rem  Parameters (order matters!):
rem  [-w] [-f] [filePath] [-t] [-d] [delim] [-s] [newDelim]

rem  [-w]		skip the warning messages
rem  [-f] [filepath]	specify directory (self by default)
rem  [-t]		apply to subdirectories (t for tree)
rem  [-d] [delim]	assign delimiter (" " by default)
rem  [-s] [newDelim]	assign replacement delimiter ("" by default)

rem  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rem  check to skip warning
if "%~1"=="-w" (GOTO routine & shift) else (GOTO warning)

:warning
echo Are you sure you would like to rename these files?
pause

echo This action cannot be undone!
pause

echo THIS IS YOUR LAST WARNING
pause

rem  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:routine
setlocal disableDelayedExpansion

rem  initalize path
set "filePath="
set "forOption="

rem  assign directory
if "%~1"=="-f" (set "filePath=%~2\" & shift & shift)

rem  tree (applies to directory if called)
if "%~1"=="-t" (set "forOption=/R %filePath%" & set "filePath=" & shift)

rem  assign delimiter
if "%~1"=="-d" (set "delim=%~2" & shift & shift) else (set "delim= ")

rem  assign replacement delimiter (or string)
if "%~1"=="-s" (set "token=%~2" & shift & shift) else (set "newDelim=")

rem  replace spaces
for %forOption% %%F in ("%filePath%*%delim%*") do (
  if /i "%~f0" neq "%%~fF" (
    set "folder=%%~dpF"
    set "file=%%~nxF"
    setlocal enableDelayedExpansion
    echo ren "!folder!!file!" "!file:%delim%=%newDelim%!"
    ren "!folder!!file!" "!file:%delim%=%newDelim%!"
    endlocal
  )
)

rem  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

echo Done
pause
