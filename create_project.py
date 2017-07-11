"""
   \\\  CREATE i3wm PROJECT  ///
   Create a project that can be opened with the "open_project.py" script also
   found in this folder. Choose from a selection of predifined i3wm windows
   that swallow urxvt terminals and open vim or other terminal based programs
   in those terminals. Vim opens with recursive filetypes based on the
   template chosen. Give the project a name and a directory where it should be
   created and this script does the rest.
   There is also the option to automatically create a git repo and
   initialize it
"""

import os
import stat
from sys import argv, exit


HOME = os.path.expanduser('~')
TEMPLATES = os.path.join(HOME, 'i3-project-manager/templates')
PROJECTS_FILE = os.path.join(HOME, 'i3-project-manager/project_list.txt')
PROJECTS = os.path.join(HOME, 'i3-project-manager/projects')
PROJECT_DIR = argv[1]


def user_templates(templates):
    """ User selects template by choosing the number refering to that
        template. If template number doesn't exist, or if a non number is
        selected then user is re-prompted. """

    no_of_templates = len(templates)

    try:
        answer = int(input("Choose template number...\n"))
        if answer > no_of_templates or answer < 1:
            print("Template number does not exist, try again.")
            return user_templates(templates)
        return templates[answer]

    except ValueError:
        print("Please choose a number only")
        return user_templates(templates)


def print_templates(templates):
    """ Print available templates to terminal for user to choose from. """

    print("\n{}====================".format(' ' * 5))
    print("{}CHOOSE YOUR TEMPLATE".format(' ' * 5))
    print("{}====================".format(' ' * 5))

    for i, template in enumerate(templates, 1):
        print("{}{}.  {}".format(' ' * 5, i, templates[i]))

    print("\n")


def get_templates():
    """ Return dictionary containing the available i3wm templates for user
        to choose from. """

    templates = {}
    count = 1
    for f in os.listdir(TEMPLATES):
        if f.endswith('json'):
            templates[count] = f.replace('.json', '')
            count += 1

    return templates


def create_script():
    """ Open project template chosen by user and edit it to include data for
        the new project. Then save this to a new file that is the bash script
        for opening the new project. """

    templates = get_templates()
    print_templates(templates)
    chose = user_templates(templates)
    layout_template = os.path.join(TEMPLATES, chose + '.json')
    script_template = os.path.join(TEMPLATES, chose + '.sh')

    new_project_script = PROJECT_DIR.rstrip('/')
    new_project_script = os.path.split(new_project_script)[-1] + '.sh'
    new_project_script_absolute = os.path.join(PROJECTS, new_project_script)

    with open(script_template, 'r') as file1, \
            open(new_project_script_absolute, 'w') as file2:

        lines = file1.readlines()
        new_file = []
        for line in lines:
            line = line.rstrip()
            if '^PROJ_DIR^' in line:
                new_file.append(line.replace('^PROJ_DIR^', PROJECT_DIR))
            elif '^TEMP_DIR^' in line:
                new_file.append(line.replace('^TEMP_DIR^', layout_template))
            else:
                new_file.append(line)

        file2.write('\n'.join(new_file))

    return(new_project_script)


def shorten_user():
    """ Change '/home/user/' to '~' just to make it easier on the eye """

    return PROJECT_DIR.replace(HOME, "~")


def new_index(projects):
    """ Establish how many projects already exist to give index number for new
        project. If there are 5 projects, then this function returns '6' """

    length = len(projects)
    last_index = projects[length - 1].split(',')[0]
    return str(int(last_index) + 1)


def already_exist(projects):
    """ Checks if project already exists """

    for project in projects:
        if argv[1] in project or shorten_user() in project:
            print("PROJECT LINE: {}".format(project))
            return True
            break


def create_project():
    """ Add the project data to file '~/i3-project-manager/project_list.txt'
        and create the executable bash script that opens the project. """

    with open(PROJECTS_FILE, 'r+') as f:
        projects = f.readlines()
        if not already_exist(projects):
            index = new_index(projects)
            script = create_script()
            script_path = os.path.join(PROJECTS, script)

            # seek to end of file to append new project
            f.seek(0, 2)
            f.write(index + ',' + shorten_user() + ',' + script + "\n")

            # make script executable for user
            st = os.stat(script_path)
            os.chmod(script_path, st.st_mode | stat.S_IEXEC)

        else:
            print("Project already exists\nAborting...")
            exit(0)


def main():
    create_project()


if __name__ == '__main__':
    main()
