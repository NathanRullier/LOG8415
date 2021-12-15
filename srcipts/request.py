import requests
import base64

import speech_recognition as sr

url = 'https://cloudprojetfinal.azurewebsites.net/test'
x = requests.get(url)
encode_string = base64.b64encode(open("sound.wav", "rb").read())
# with open('sound.wav', 'rb') as f:
    # base64_bytes = base64.b64encode(f)
files={'sound': encode_string}

x = requests.post(url, data = files)

print(x.text)