# alexa_clock

时钟在日常的生活中是必不可少的一个组件.随着科技的发展，普通的时钟已经不能满足现在的社会了。通过不懈的努力，我成功的将avs嵌入在时钟里面，从而使时钟不仅能看时间还能查询天气收听新闻等等。

## 硬件构成

为了使超级时钟的结构紧凑主控制器,选用可以连接wifi的raspberry-zreo W


![raspberry-zreo](https://github.com/SeeedDocument/Raspberry_Pi_Zero_W_with_Official_Case/raw/master/img/3.jpg)

声音的采集和播放则采用Seeed提供的ReSpeaker 2-Mics Pi HAT


![ReSpeaker 2-Mics Pi HAT](https://github.com/SeeedDocument/MIC_HATv1.0_for_raspberrypi/raw/master/img/2mics_b.jpg)

时间的显示利用Seeed提供的Grove - 4-Digit Display

![Grove - 4-Digit Display](https://raw.githubusercontent.com/SeeedDocument/Grove-4-Digit_Display/master/img/Grove-4_digit_display.jpg)


## 软件设计

### Grove - 4-Digit Display

非常的不幸是我没有[wiki](http://wiki.seeedstudio.com/Grove-4-Digit_Display/)上面关于树莓派的拓展板，所以我将arduino驱动代码改写成了适用于我的硬件的python驱动代码，python驱动代码在我的[github](https://github.com/hansonCc)上面,执行如下命令去驱动`Grove - 4-Digit Display`

```shell
cd ~
git clone https://github.com/hansonCc/alexa_clock.git
cd ~/alexa_clock/TM1637/
python 47digitclock.py
```

其中，特别说明用来设置`Grove - 4-Digit Display`亮度的`SetBrightnes`函数,我们可以通过`Grove - 4-Digit Display`的亮度来确定是当前时间是晚上还是白天。

### ReSpeaker 2-Mics Pi HAT

为了方便操作我将`avs`和`ReSpeaker 2-Mics Pi HAT`驱动的安装统一集成到了[2018-08-06-raspbian-4GB-for-respeaker](https://v2.fangcloud.com/share/7395fd138a1cab496fd4792fe5?folder_id=188000207913)镜像文件文件里面,将这个文件下载并烧写到`raspberry-zreo W`,在终端运行`alexa-auth`,然后登陆获取alexa的授权,授权的文件保存在`/home/pi/.avs.json`.


![auth](https://github.com/SeeedDocument/ReSpeaker-4-Mic-Array-for-Raspberry-Pi/raw/master/img/auth.png)

非常感谢[seeed](https://www.seeedstudio.com/)为我们提供的技术支持，我们只需要运行下面的命令去体验`hand-free alexa`.

```shell
cd ~/
git clone https://github.com/respeaker/mic_hat.git
cd mic_hat
python alexa.py
```

## 开机自启动

对于一个完整应用开机自启是非常重要的一步。当我们完成了第一次授权过后，我们后面将不用再进行授权，所以开机自启不会再对授权进行操作。操作如下

```shell
cd ~/alexa_clock
chmod 777 alexa_startup.sh
./alexa_startup.sh
```

在打开的文本中找到`exit 0`，在此之前添加的代码在启动时都会被执行，在`exit 0`之前添加如下代码


```shell
sudo -u pi /home/pi/alexa_startup.sh
```

在配置开机自启期间，我发现通过每次重启来判断开机自启是不是成功，并不算是一个很好的办法。然后，通过在网络上查询相关的资料找到了执行下面的命令就能完全替代重启这一操作。


```shell
systemctl restart rc-local.service
```

同时为了查看开机自启运行的状态可以运行下面的命令进行查看

```shell
systemctl status rc-local.service
```

## 模型建立

设计一个漂亮的模型是非常重要的，模型如下：

![3D_Moudle](https://github.com/hansonCc/alexa_clock/raw/master/doc_image/3D_Moudle.png)

最后，我们通过3D打印机，将各个部件打印出来并安装:

![alexa_clock_Overall_internal](https://github.com/hansonCc/alexa_clock/raw/master/doc_image/alexa_clock_Overall_internal.jpg)

盖上外壳后将更加的美丽

![alexa_clock_finished](https://github.com/hansonCc/alexa_clock/raw/master/doc_image/alexa_clock_finished.jpg)

## 成果展示


