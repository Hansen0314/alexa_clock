# alexa_clock
时钟在日常的生活中是必不可少的一个组件.随着科技的发展，普通的时钟已经不能满足现在的社会了。通过不懈的努力，我成功的将avs嵌入在时钟里面，从而使时钟不仅能看时间还能查询天气收听新闻等等。

the clock is a very important part in everyday life.whit the development of technologe,Ordinary clock can not meet the current society.eventually,I successfully embed avs in the clock so that the clock can not only look at the time but also the weather, listen to news, etc.
## 硬件构成

为了使超级时钟的结构紧凑主控制器,选用可以连接wifi的raspberry-zreo W
In order to make the alexa clock's compact,the main controller choose raspberry-zreo W that can connect to wifi

![raspberry-zreo](https://github.com/SeeedDocument/Raspberry_Pi_Zero_W_with_Official_Case/raw/master/img/3.jpg)

声音的采集和播放则采用Seeed提供的ReSpeaker 2-Mics Pi HAT
The sound is collected and played using the ReSpeaker 2-Mics Pi HAT from Seeed.

![ReSpeaker 2-Mics Pi HAT](https://github.com/SeeedDocument/MIC_HATv1.0_for_raspberrypi/raw/master/img/2mics_b.jpg)

时间的显示利用Seeed提供的Grove - 4-Digit Display
Time display using the Grove provided by Seeed - 4-Digit Display

![Grove - 4-Digit Display](https://raw.githubusercontent.com/SeeedDocument/Grove-4-Digit_Display/master/img/Grove-4_digit_display.jpg)


## 软件设计

### Grove - 4-Digit Display

非常的不幸是我没有[wiki](http://wiki.seeedstudio.com/Grove-4-Digit_Display/)上面关于树莓派的拓展板，所以我将arduino驱动代码改写成了适用于我的硬件的python驱动代码，python驱动代码在我的[github](https://github.com/hansonCc)上面,执行如下命令去驱动`Grove - 4-Digit Display`
Very unfortunately I don't have [wiki] (http://wiki.seeedstudio.com/Grove-4-Digit_Display/) above for the Raspberry Pi expansion board, so I rewrote the arduino driver code to be suitable for my hardware.python driver code on my [github] (https://github.com/hansonCc), execute the following command to drive `Grove - 4-Digit Display`

```shell
cd ~
git clone https://github.com/hansonCc/alexa_clock.git
cd ~/alexa_clock/TM1637/
python 47digitclock.py
```

其中，特别说明用来设置`Grove - 4-Digit Display`亮度的`SetBrightnes`函数,我们可以通过`Grove - 4-Digit Display`的亮度来确定是当前时间是晚上还是白天。
Among them, the `SetBrightnes` function for setting the 'Grove - 4-Digit Display' brightness is specifically described. We can determine whether the current time is night or day by the brightness of the `Grove - 4-Digit Display`.

### ReSpeaker 2-Mics Pi HAT

为了方便操作我将`avs`和`ReSpeaker 2-Mics Pi HAT`驱动的安装统一集成到了[2018-08-06-raspbian-4GB-for-respeaker](https://v2.fangcloud.com/share/7395fd138a1cab496fd4792fe5?folder_id=188000207913)镜像文件文件里面,将这个文件下载并烧写到`raspberry-zreo W`,在终端运行`alexa-auth`,然后登陆获取alexa的授权,授权的文件保存在`/home/pi/.avs.json`.
For the convenience of operation, I integrated the installation of `avs` and `ReSpeaker 2-Mics Pi HAT` drivers into [2018-08-06-raspbian-4GB-for-respeaker](https://v2.fangcloud.com/share/7395fd138a1cab496fd4792fe5?folder_id=188000207913) Inside the image file, download and burn this file to `raspberry-zreo W`, run `alexa-auth` in the terminal, and then log in to get the authorization of alexa. The authorized file is saved in `/ Home/pi/.avs.json`.


![auth](https://github.com/SeeedDocument/ReSpeaker-4-Mic-Array-for-Raspberry-Pi/raw/master/img/auth.png)

非常感谢[seeed](https://www.seeedstudio.com/)为我们提供的技术支持，我们只需要运行下面的命令去体验`hand-free alexa`.
Thank you very much [seeed](https://www.seeedstudio.com/) for our technical support, we just need to run the following command to experience `hand-free alexa`.

```shell
cd ~/
git clone https://github.com/respeaker/mic_hat.git
cd mic_hat
python alexa.py
```

## 开机自启动

对于一个完整应用开机自启是非常重要的一步。当我们完成了第一次授权过后，我们后面将不用再进行授权，所以开机自启不会再对授权进行操作。操作如下
It’s a very important step for a complete application to boot up.After we have completed the first authorization, we will not need to authorize it later, so we will not operate the authorization again after booting.command is as follows

```shell
cd ~/alexa_clock
chmod 777 alexa_startup.sh
./alexa_startup.sh
```

在打开的文本中找到`exit 0`，在此之前添加的代码在启动时都会被执行，在`exit 0`之前添加如下代码

Find `exit 0` in the open text, the code added before this will be executed at startup, add the following code before `exit 0`

```shell
sudo -u pi /home/pi/alexa_startup.sh
```
在配置开机自启期间，我发现通过每次重启来判断开机自启是不是成功，并不算是一个很好的办法。然后，通过在网络上查询相关的资料找到了执行下面的命令就能完全替代重启这一操作。

I found that it is not a good idea to judge whether the boot is successful or not by each reboot.
then,by querying the relevant information on the network, it is found that executing the following command can completely replace the restart operation.

```shell
systemctl restart rc-local.service
```
同时为了查看开机自启运行的状态可以运行下面的命令进行查看
And,you also can use `systemctl status` to view the `rc-local.service`.
```shell
systemctl status rc-local.service
```
## 模型建立

设计一个漂亮的模型是非常重要的，模型如下：
Designing a beautiful case is a very importantand The case is as follows:

最后，我们通过upbox3D打印机，将各个部件打印出来并安装，最终效果如下：
Finally, we print out through the upbox3D printer and install the various components . The final result is as follows:


## 成果展示

