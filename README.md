# Copyright Updater

Get ready for the new year. Update your license files

## Usage

Pass as arguments the path to a git repo containing a LICENSE:

    ./copyright-updater path/to/repo

Or just pass along all your repos:

    ./copyright-updater my_projects/*

The script will:

* Search for a file with a name matching "LICENSE*"
* Replace "Copyright XXXX" with Copyright "XXXX-2014"
* Replace "Copyright XXXX-YYYY" with Copyright "XXXX-2014"
* Commit the license file and push it
* Warn you for every directory that does not contain a LICENSE file
