#!/usr/bin/python3
""" function for querying reddit api """
import requests


def number_of_subscribers(subreddit):
    """
        quries the reddit api based on the subreddit argument
    """
    res = requests.get(subreddit)
    if res.status_code >= 400:
        return 0
    return res.json()["data"]["subscribers"]
