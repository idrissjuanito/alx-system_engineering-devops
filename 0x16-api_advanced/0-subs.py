#!/usr/bin/python3
""" function for querying reddit api """
import requests


def number_of_subscribers(subreddit):
    """
        quries the reddit api based on the subreddit argument
    """
    url = f"https://www.reddit.com/r/{subreddit}.json"
    res = requests.get(url, allow_redirects=False)
    if res.status_code >= 400:
        return 0
    return res.json()["data"]["subscribers"]
