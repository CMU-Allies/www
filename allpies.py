# Basically put this on a raspi, set the password variable below, and have it run as root on startup

import RPi.GPIO as GPIO
import requests

channel = 24
password = "PUT THE PASSWORD HERE"

GPIO.setmode(GPIO.BCM)
GPIO.setup(channel, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.add_event_detect(channel, GPIO.BOTH)

while True:
  GPIO.wait_for_edge(channel, GPIO.BOTH)
  while GPIO.event_detected(channel):
    requests.post("https://allies.andrew.cmu.edu/room_status", data={'open': str(GPIO.input(channel)), 'password': password})

GPIO.cleanup()
