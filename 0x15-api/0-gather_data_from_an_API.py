#!/usr/bin/python3
"""
request data from public api using arg passed to script
"""
from sys import argv
import requests


if __name__ == "__main__":
    r = requests.get(f"https://jsonplaceholder.typicode.com/users/{argv[1]}")
    user = r.json().get('name')
    req_str = f"https://jsonplaceholder.typicode.com/users/{argv[1]}/todos"
    r = requests.get(req_str)
    todos = r.json()
    total_todos = len(todos)
    completed = 0
    completed_todos = []
    for todo in todos:
        if todo.get('completed'):
            completed += 1
            completed_todos.append(todo.get('title'))
    print(f"Employee {user} is done with tasks({completed}/{total_todos})")
    for todo in completed_todos:
        print(f"\t {todo}")
