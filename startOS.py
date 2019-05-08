import sys
import os

if sys.platform == 'win32':
    createWorkspace = 'createWorkspace.bat'
    os.system(createWorkspace)
elif sys.platform == 'linux':
    createWorkspace = 'sh createWorkspace.sh'
    os.system(createWorkspace)
