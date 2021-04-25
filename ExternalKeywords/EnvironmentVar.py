#Python Function to set Environment Variables for Browsers stored in Browsers Folder

import os


def Environment_Variable_Setup():
    cd = os.getcwd()
    add = '\Browsers'
    print(cd+add)
    readyPath = cd+add

    os.environ['PATH'] = readyPath
    env_var = 'PATH'

    if env_var in os.environ:
        print(f'{env_var} value is {os.environ[env_var]}')
    else:
        print(f'{env_var} does not exist')


