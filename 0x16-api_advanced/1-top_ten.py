#!/usr/bin/python
""" Hold function for querying reddit api """
import requests


def top_ten(subreddit):
    """ queries the top ten hot post of subreddit """
    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    res = requests.get(url, allow_redirects=False)
    if res.status_code >= 400:
        print(None)
        return
    data = res.json()
    posts = data.get("data")["children"]
    for p in posts[:10]:
        print(p["data"]["title"])
