import os
from subprocess import call

def create_symlinks():
    home = os.path.expanduser('~')
    files = [f for f in os.listdir('.')]
    for f in files:
        if f == 'symify.py' or f == '.symify.py.swp' or f == '.git':
            continue

        if (os.path.isfile(os.path.join(home, f)) or
                os.path.isdir(os.path.join(home, f)) or
                os.path.islink(os.path.join(home, f))):
            print '~/%s already exists.' % f
            c = raw_input('Replace it? [y/n]: ')
            if c == 'y':
                call(['rm', '-rf', home + '/' + f])
            else:
                continue

        # we need a full path to the symlink otherwise osx will shit the bed...
        call(['ln', '-s', os.getcwd() + '/' + f, home + '/' + f])
    return

create_symlinks()
