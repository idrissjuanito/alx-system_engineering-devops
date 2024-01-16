""" function for querying reddit api """
import requests


def number_of_subscribers(subreddit):
    """
        quries the reddit api based on the subreddit argument
    """
    res = requests.get("https://www.reddit.com/r/programming/about.json")
    if res.status_code >= 400:
        return 0
    return res.json()["data"]["subscribers"]
