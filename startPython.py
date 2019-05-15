import sys
import os

if sys.platform == 'win32':
    startPython = 'startPython.bat'
    os.system(startPython)
elif sys.platform == 'linux':
    startPython = 'sh startPython.sh'
    os.system(startPython)
