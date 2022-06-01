@echo off
set %projdir%=C:\Users\%username%\Documents\Projects

echo What method would you like to use?
echo ------------------------
echo 1 - Clone an existing repository
echo 2 - New project
echo 3 - Remove project from computer
echo ------------------------
Set /P method=Selection #

If %method%==1 GOTO W
If %method%==3 GOTO DELE

:DELE
Set /P name="Name of project to delete" 
If exist "C:\Users\%username%\Documents\Projects\%name%" (
	del "C:\Users\%username%\Documents\Projects\%name%\*
	del "C:\Users\%username%\Documents\Projects\%name%
) else (	
	exit
)
exit

:W
Set /P name="Folder Name "
Set /P repo="Repository URL "
git clone %repo% "C:\Users\%username%\Documents\Projects\%name%”
GOTO EDITOR

:EDITOR
echo Select the editor you wish to use 
echo -------------------------
echo 1 - Visual Studio Code
echo 2 - Notepad++
echo 3 - Notepad
echo 4 - Sublime Text
echo -------------------------
Set /P editr=Selection #

If %editr%==1 set editor=code
If %editr%==2 set editor=notepad++
If %editr$==4 set editor=subl
If %method%==1 GOTO OPEN

echo Select a language/framework
Echo -------------------------
Echo 1 - Python
Echo 2 - Batch
Echo 3 - React
Echo 4 - Tailwind/HTML/JS/CSS
Echo 5 - Basic web page
Echo 6 - Basic light/dark mode page
echo ------------------------
Set /P App=Selection #
If %App%=="" GOTO Menu
If %App%==1 set lang=python
If %App%==2 set lang=batch
If %App%==3 set lang=react
If %App%==4 set lang=site
If %App%==5 set lang=basicsite
If %App%==6 set lang=basicthemedsite
set /p name="Project Name: "
mkdir "C:\Users\%username%\Documents\Projects\%name%\" && git init "C:\Users\%username%\Documents\Projects\%name%\"
If %lang%==python fsutil file createnew "C:\Users\%username%\Documents\Projects\%name%\main.py" 0 && git init "C:\Users\%username%\Documents\Projects\%name%\"
If %lang%==batch fsutil file createnew "C:\Users\%username%\Documents\Projects\%name%\main.bat" 0 && git init "C:\Users\%username%\Documents\Projects\%name%\"
If %lang%==react create-react-app && git init "C:\Users\%username%\Documents\Projects\%name%\"
If %lang%==site (
	fsutil file createnew "C:\Users\%username%\Documents\Projects\%name%\index.html" 0
	mkdir "C:\Users\%username%\Documents\Projects\%name%\JavaScript"
	fsutil file createnew "C:\Users\%username%\Documents\Projects\%name%\JavaScript\global.js" 0
	fsutil file createnew "C:\Users\%username%\Documents\Projects\%name%\tailwind.config.js" 0
	mkdir "C:\Users\%username%\Documents\Projects\%name%\input"
	mkdir "C:\Users\%username%\Documents\Projects\%name%\output"
	git init "C:\Users\%username%\Documents\Projects\%name%\"
)
if %lang%==basicsite (
	mkdir "C:\Users\%username%\Documents\Projects\%name%\"
	copy templates\basic-website\* "C:\Users\%username%\Documents\Projects\%name%\"
	git init "C:\Users\%username%\Documents\Projects\%name%\"
)
if %lang%==basicthemedsite (
	git clone https://github.com/JaydenDev/VanillaThemeToggleExample "C:\Users\%username%\Documents\Projects\%name%\"
	del "C:\Users\%username%\Documents\Projects\%name%\.git"
	git init "C:\Users\%username%\Documents\Projects\%name%\"
)

:OPEN
if %editor%==code code %projdir%\%name%
if %editor%==notepad++ notepad++ %projdir%\%name%\
if %editor%==subl subl %projdir%\%name%\

pause
