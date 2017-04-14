#!/bin/bash

echo "---------------- Installing Virtualenv ---------------"
pip install virtualenv

echo "---------------- Setting Python exec path ---------------"
python_exec_path="$(which python3.4)"
echo "Python executable path:$python_exec_path"

echo "---------------- Finding Project root ---------------"
current_dir="$(pwd)"
project_root="$(dirname "$current_dir")"
echo "Project Root:$project_root"

echo "---------------- Creating a new virtual environment with a python3.4 executable ---------------"
virtualenv --python="$python_exec_path" "$project_root/Env/"
source "$project_root/Env/bin/activate"
sleep 1

echo "-------- Installing dependencies -------------"
python3.4 "$project_root/"Env/bin/pip install -r requirements.txt

echo "-------- Starting django dev server -------------"
export PYTHONPATH="$parent_dir"
python "$project_root/manage.py" runserver