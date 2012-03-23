[![Build Status](https://secure.travis-ci.org/chumpy/calamity.png)](http://travis-ci.org/chumpy/calamity)

# Calamity
A GTD life hacking tool for the command line.

Keep track of tasks and organize them into contexts and projects

## Install
````
$ gem install calamity
````

## Use
usage: calamity [global options] command [command options]

Version: 0.0.2

Global Options:
    --database="database" - The database file location (default: 
                            /Users/kevinbeddingfield/.calamity/calamity.db)
    --help                - Show this message

Commands:
    finish - Mark a task or tasks finished
    help   - Shows list of commands or help for one command
    list   - List unfinished tasks
    save   - Save a task, either to create a new one or update an existing one

