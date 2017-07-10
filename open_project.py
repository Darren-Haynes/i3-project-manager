"""
    \\\  PROJECT OPENING SCRIPT  ///
    Iteractive command line tool for opening my projects in an i3wm workspace.
    Presently I have to manually close any programs that my already
    be open in that workspace before executing this script. Next step will be
    to figure out how to work with i3wm to close any open programs in the
    workspace first. This script can then be a true project switcher and not
    just a project opener.
"""
import os
import os.path
import subprocess

HOME = os.path.expanduser("~")
BASE = os.path.join(HOME, 'i3-project-manager')
PROJECTS = os.path.join(BASE, 'project_list.txt')
EXEC_DIR = os.path.join(BASE, 'projects')


def get_project_id(d):
    """Get user to choose the project they want to open"""

    no_of_Projects = len(d)

    try:
        answer = int(input("\nChoose project number...\n"))
        if answer > no_of_Projects or answer < 1:
            print("Project number does not exist, try again.")
            return get_project_id(d)
        return d[answer][1]

    except ValueError:
        print("Please choose a number only")
        return get_project_id(d)


def print_projects(d):
    """Print the available projects to the command line so user can see
       which one to choose"""

    print("=" * 50)
    print(" " * 15 + "CHOOSE YOUR PROJECT")
    print("=" * 50 + "\n")
    for proj_id in d.keys():
        print("{}   {}".format(str(proj_id), d[proj_id][0]))

    return get_project_id(d)


def get_projects():
    """ Project data is stored in a txt file. Here that data is read and
        turned into a dictionary"""

    with open(PROJECTS, 'r') as f:
        projects = f.readlines()
        # remove header
        projects.pop(0)
        projects = [p.strip() for p in projects]

        d = {}
        for project in projects:
            l = project.split(',')
            d[int(l[0])] = [l[1], l[2]]

    return print_projects(d)


def main():
    """ Get the bash script that opens the project in i3wm workspace and
        execute it""" 
    bash_script = get_projects()
    subprocess.call(os.path.join(EXEC_DIR, bash_script))


if __name__ == '__main__':
    main()
