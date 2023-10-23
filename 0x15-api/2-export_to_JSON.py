#!/usr/bin/python3
"""
request data from public api using arg passed to script
"""
import json
import requests
from sys import argv


if __name__ == "__main__":
    r = requests.get(f"https://jsonplaceholder.typicode.com/users/{argv[1]}")
    user = r.json().get('username')
    req_str = f"https://jsonplaceholder.typicode.com/users/{argv[1]}/todos"
    r = requests.get(req_str)
    todos = r.json()
    json_todos = []
    for todo in todos:
        task = {'task': todo.get('title'), 'completed': todo.get('completed'),
                'username': user}
        json_todos.append(task)
    json_data = {f'{argv[1]}': json_todos}

    with open(f"{argv[1]}.json", "w") as file:
        json.dump(json_data, file)
