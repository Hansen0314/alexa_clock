#!/bin/bash
su pi 
export PATH=$PATH:/usr/lib/python2.7:/home/pi/.local/lib/python2.7
python /home/pi/mic_hat/alexa.py&
python /home/pi/tm1637/47digitclock.py&
