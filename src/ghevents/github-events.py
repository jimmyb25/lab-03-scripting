#!/opt/homebrew/bin/python3
import os
import json
import requests

GHUSER = os.getenv('GITHUB_USER')
url = f'https://api.github.com/users/{GHUSER}/events'

# functions
def retrieve_events(url):
	"""This function retrieves events from the url, turning them into python object"""
	url_requests_text = requests.get(url).text
	pyt_obj = json.loads(url_requests_text)
	return pyt_obj

def print_events(events, n=5):
	"""This funciton prints n items from the list events"""
	for i in events[:n]:
		event = i['type'] + " :: " + i['repo']['name']
		print(event)

def main():
	print(GHUSER)
	print(url)
	events_list = retrieve_events(url)
	print_events(events_list)

if __name__ == "__main__":
	main()
