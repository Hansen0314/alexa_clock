# alexa_clock

the clock is a very important part in everyday life.whit the development of technologe,Ordinary clock can not meet the current society.eventually,I successfully embed avs in the clock so that the clock can not only look at the time but also the weather, listen to news, etc.

## Hardware composition

In order to make the alexa clock's compact,the main controller choose raspberry-zreo W that can connect to wifi

![raspberry-zreo](https://github.com/SeeedDocument/Raspberry_Pi_Zero_W_with_Official_Case/raw/master/img/3.jpg)

The sound is collected and played using the ReSpeaker 2-Mics Pi HAT from Seeed.

![ReSpeaker 2-Mics Pi HAT](https://github.com/SeeedDocument/MIC_HATv1.0_for_raspberrypi/raw/master/img/2mics_b.jpg)

Time display using the Grove provided by Seeed - 4-Digit Display

![Grove - 4-Digit Display](https://raw.githubusercontent.com/SeeedDocument/Grove-4-Digit_Display/master/img/Grove-4_digit_display.jpg)


## software design

### Grove - 4-Digit Display

Very unfortunately I don't have [wiki] (http://wiki.seeedstudio.com/Grove-4-Digit_Display/) above for the Raspberry Pi expansion board, so I rewrote the arduino driver code to be suitable for my hardware.python driver code on my [github] (https://github.com/hansonCc), execute the following command to drive `Grove - 4-Digit Display`

```shell
cd ~
git clone https://github.com/hansonCc/alexa_clock.git
cd ~/alexa_clock/TM1637/
python 47digitclock.py
```

Among them, the `SetBrightnes` function for setting the 'Grove - 4-Digit Display' brightness is specifically described. We can determine whether the current time is night or day by the brightness of the `Grove - 4-Digit Display`.

### ReSpeaker 2-Mics Pi HAT

For the convenience of operation, I integrated the installation of `avs` and `ReSpeaker 2-Mics Pi HAT` drivers into [2018-08-06-raspbian-4GB-for-respeaker](https://v2.fangcloud.com/share/7395fd138a1cab496fd4792fe5?folder_id=188000207913) Inside the image file, download and burn this file to `raspberry-zreo W`, run `alexa-auth` in the terminal, and then log in to get the authorization of alexa. The authorized file is saved in `/ Home/pi/.avs.json`.


![auth](https://github.com/SeeedDocument/ReSpeaker-4-Mic-Array-for-Raspberry-Pi/raw/master/img/auth.png)

Thank you very much [seeed](https://www.seeedstudio.com/) for our technical support, we just need to run the following command to experience `hand-free alexa`.

```shell
cd ~/
git clone https://github.com/respeaker/mic_hat.git
cd mic_hat
python alexa.py
```

## Boot from boot

It’s a very important step for a complete application to boot up.After we have completed the first authorization, we will not need to authorize it later, so we will not operate the authorization again after booting.command is as follows:

```shell
cd ~/alexa_clock
chmod 777 alexa_startup.sh
./alexa_startup.sh
```

Find `exit 0` in the open text, the code added before this will be executed at startup, add the following code before `exit 0`.

```shell
sudo -u pi /home/pi/alexa_startup.sh
```

I found that it is not a good idea to judge whether the boot is successful or not by each reboot.
then,by querying the relevant information on the network, it is found that executing the following command can completely replace the restart operation.

```shell
systemctl restart rc-local.service
```

And,you also can use `systemctl status` to view the `rc-local.service`.

```shell
systemctl status rc-local.service
```

## moudle bulid

Designing a beautiful case is a very importantand The case is as follows:

![3D_Moudle](https://github.com/hansonCc/alexa_clock/raw/master/doc_image/3D_Moudle.png)

Finally, we print out through the upbox3D printer and install the various components:

![alexa_clock_Overall_internal](https://github.com/hansonCc/alexa_clock/raw/master/doc_image/alexa_clock_Overall_internal.jpg)

More perfect after closing the lid

![alexa_clock_finished](https://github.com/hansonCc/alexa_clock/raw/master/doc_image/alexa_clock_finished.jpg)

## Achievement display


