#!/usr/bin/env python3
"""
request data from public api using arg passed to script
"""
import json
import requests
from sys import argv


if __name__ == "__main__":
    r = requests.get(f"https://jsonplaceholder.typicode.com/users")
    users = r.json()
    req_str = f"https://jsonplaceholder.typicode.com/todos"
    r = requests.get(req_str)
    todos = r.json()
    json_data = {}
    for user in users:
        user_tasks = [
                {
                    'username': user.get('username'),
                    'task': todo.get('title'),
                    'completed': todo.get('completed')
                }
                for todo in todos
                if todo.get('userId') == user.get('id')
            ]
        json_data[f"{user.get('id')}"] = user_tasks

    with open("todo_all_employees.json", "w") as file:
        json.dump(json_data, file)
