import sys
import os

os.chdir('utils')
if sys.platform == 'win32':
    startPython = 'startPython.bat'
    os.system(startPython)
elif sys.platform == 'linux':
    startPython = 'sh startPython.sh'
    os.system(startPython)
