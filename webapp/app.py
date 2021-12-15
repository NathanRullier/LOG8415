from flask import Flask
from flask import request
import speech_recognition as sr
import base64

app = Flask(__name__)

@app.route("/")
def hello():
    return ""

@app.route("/test", methods=["POST"])
def test():
    return _test(request.form['sound'])

def _test(sound):
    r = sr.Recognizer()
    
    wav_file = open("./temp.wav", "wb")
    decode_string = base64.b64decode(sound)
    wav_file.write(decode_string)


    with sr.AudioFile('./temp.wav') as source:
        audio_data = r.record(source)
        text = r.recognize_google(audio_data)
    return text

