# replace_characters
`replace_character.bat` is a batch script to replace characters in the file names of a directory. Its intended use is to remove spaces from file names and replace them with "_".

### Credits

Credits to [dbenham's post](https://stackoverflow.com/a/11278987) on Stackoverflow. `replace_characters.bat` is based on a heavily modified version of their script.

# Quick Start guide

## Features

> [!NOTE]
> Parameters are not required, **but they must be given in order**.

1. `-w` skip the warning messages

2. `-f [filePath]` specify directory (in place by default)

3. `-t` apply to subdirectories (t for tree)

4. `-d [delim]` aasign delimiter (" " by default)

5. `-s [newDelim]` assign replacement delimiter ("" by default)

## Basic Instructions

1. Paste `replace_characters.bat` in the directory of the files you wish to modify.

2.  Double-click `replace_characters.bat` to run script and follow instructions on Command Prompt (if applicable)

> [!CAUTION]
> This script will modify *all* files in teh directory and the changes cannot be undone!

## Advanced Instructions (using command prompt)

### In place

1. In File Explorer, navigate the the directory of the files you want to modify.

3. Paste `replace_characters.bat`.

4. In the File Explorer search tree, replace the text with `cmd` and hit Enter to open Command Prompt in the current directory[^2].

To change the replacement delimiter to "_", run:
```
replace_characters.bat -s _
```

To change the replacement delimiter to "_" in the current directory and *all* subdirectories, run:
```
replace_characters.bat -t -s
```

To change the delimiter to "-" and replacement delimiter to "_", run:
```
replace_characters.bat -d - -s _
```

### In another place

1. In File Explorer, navigate the the directory of  `replace_characters.bat`.
2. In the File Explorer search tree, replace the text with `cmd` and hit Enter to open Command Prompt in the current directory[^2].

To modify file names in another directory, run:
```
replace_characters.bat -f C:\my_path\my_directory\
```

> [!IMPORTANT]
> The script may not run as intended unless `\` is included at the end of the file path.

To skip the warning prompts, modify file names in another directory, and change delimiter to "_", run:
```
replace_characters.bat -w -f C:\my_path\my_directory\ -s _
```

# Modifying `replace_characters.bat`

## Changing Defaults

### Delimiter

To change the default delimiter to "-", replace:
```
rem  assign delimiter
if "%~1"=="-d" (set "delim=%~2" & shift & shift) else (set "delim= ")
```

With:
```
rem  assign delimiter
if "%~1"=="-d" (set "delim=%~2" & shift & shift) else (set "delim=-")
```

### Replacement delimiter

To change the default replacement delimiter to "_", replace:
```
rem  assign replacement delimiter (or string)
if "%~1"=="-s" (set "token=%~2" & shift & shift) else (set "newDelim=")
```

With:
```
rem  assign replacement delimiter (or string)
if "%~1"=="-s" (set "token=%~2" & shift & shift) else (set "newDelim=_")
```

### Subdirectories

> [!WARNING]
> This code is untested and may or may not work as intended

To invert `-t` such that the script applies to subdirectories by default, replace:
```
rem  tree (applies to directory if called)
if "%~1"=="-t" (set "forOption=/R %filePath%" & set "filePath=" & shift)
```

With:
```
rem  tree (applies to directory if uncalled)
if "%~1"=="-t" (shift) else (set "forOption=/R %filePath%" & set "filePath=")
```



[^2]: [YouTube tutorial](https://www.youtube.com/shorts/FDkXqlSx8B4)
