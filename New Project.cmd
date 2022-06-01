@echo off

echo Select a language/framework
Echo -------------------------
Echo 1 - Python
Echo 2 - Batch
Echo 3 - React
Echo 4 - Tailwind/HTML/JS/CSS
echo ------------------------
Set /P App=Selection #
If %App%=="" GOTO Menu
If %App%==1 set lang=python
If %App%==2 set lang=batch
If %App%==3 set lang=react
If %App%==4 set lang=site
set /p name="Project Name: "
mkdir "C:\Users\%username%\Documents\Projects\%name%\"
If %lang%==python fsutil file createnew "C:\Users\%username%\Documents\Projects\%name%\main.py" 0
If %lang%==batch fsutil file createnew "C:\Users\%username%\Documents\Projects\%name%\main.bat" 0
If %lang%==react create-react-app
If %lang%==site (
	fsutil file createnew "C:\Users\%username%\Documents\Projects\%name%\index.html" 0
	mkdir "C:\Users\%username%\Documents\Projects\%name%\JavaScript"
	fsutil file createnew "C:\Users\%username%\Documents\Projects\%name%\JavaScript\global.js" 0
	fsutil file createnew "C:\Users\%username%\Documents\Projects\%name%\tailwind.config.js" 0
	mkdir "C:\Users\%username%\Documents\Projects\%name%\input"
	mkdir "C:\Users\%username%\Documents\Projects\%name%\output"
)
pause
