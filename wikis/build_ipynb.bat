echo on

cd /d %~dp0

call C:\\Users\\Administrator\\Anaconda3\\Scripts\\activate.bat 

jupyter nbconvert --to markdown demo.ipynb 
conda deactivate

pause
