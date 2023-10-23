#!/usr/bin/python3
"""
request data from public api using arg passed to script
"""
import csv
import requests
from sys import argv


if __name__ == "__main__":
    r = requests.get(f"https://jsonplaceholder.typicode.com/users/{argv[1]}")
    user = r.json().get('name')
    req_str = f"https://jsonplaceholder.typicode.com/users/{argv[1]}/todos"
    r = requests.get(req_str)
    todos = r.json()
    with open(f"{argv[1]}.csv", "w") as csvfile:
        csvwriter = csv.writer(csvfile, delimiter=",", quoting=csv.QUOTE_ALL)
        for todo in todos:
            csvwriter.writerow([argv[1],
                                user.split(" ")[0],
                                todo.get('completed'),
                                todo.get('title')])
