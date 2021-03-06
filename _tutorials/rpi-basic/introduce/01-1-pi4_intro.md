---
b_av: 73041020
b_cid: 125300467
b_page: 1
youku_id: 
youtube_id: 
description: 
chapter: 1
title: Pi4历史及开箱
date: 2019-7-10

author: rcdrones
post-headings:
  - 树莓派历史
  - 版本选择
  - 开箱
  - 和Pi3的差异
---




{% include assign-heading.html %}

Pi3 B 发布于2016年2月： 之前经历的版本有 Pi1 B、Pi1 B+、Pi2 B、Pi3 B。Pi3 B最大的变化是在Pi2 B的基础上升级了CPU还有带了WIFI。之前的版本都只能用有线100M网络。

Pi3 B+ 发布于2018年3月： 比3B多了对WIFI 5G频段的支持。

Pi4 B 发布于2019年6月： 升级的比较大。最显著的是分了3个内存版本(1G、2G、4G)。之前的代数，都只有一个确定的内存容量可供选择（35 45 55 usd）。 CPU 比3B+ 快2-4倍 . [点击性能对比](https://www.eefocus.com/mcu-dsp/444160/)



{% include assign-heading.html %}

![](sel.jpg)

目前，我开发了2个项目。一个是树莓派的UPS（视频插图），一个是树莓派4智能风扇（视频插图），都是用4G来开发的。



{% include assign-heading.html %}

3版本的纸盒包装。 底下是一张垫纸，和一小份说明书。

防静电的处理方式：

![](esd.jpg)

自备无防静电的手套。就把手洗干净，并擦干（放掉了静电）。利用光盘拿法去拿板子。

有静电手套：带上静电手套操作。



{% include assign-heading.html %}

Pi3 B E14 前后也出过2个版本。早期的一个版本CPU上没有散热片。后期的版本是CPU带了散热片。并且后期的版本CPU频率提高到1.4GHz。


不同：

* Pi3的内存和Wifi是放在板子的背后，Pi4所有ic都在正面。
* Pi3的USB 都是USB2.0 ， Pi4 有2个USB2.0 + 2个USB3.0（蓝色）
* 网口位置不同。所以case 不通用。并且网口速度不一样，Pi4 为千兆网络
* 蓝牙是Wifi有升级。
* 电源Micro升级到Tpye-C。电流从原来的5V 2.5A，需求升级到5V 3A。
* 2个Mirco HDMI接口。
* 内存在正面，正方形。Pi3 长方形，内存散热片不通用。

看不见的升级：

  * CPU是BCM2711 28nm工艺，1.5G。上一代3B+ 40nm 1.4G。内核从CORTEX-A53升级到COETEX-A72
  * GPU：Video Core 6 500Mhz ，上一代3B+是博通Video Core 4 400Mhz.增加了4K 60FPS的解码能力。
  * 蓝牙升级到5.0，上一代是4.2。

相同：

* 20x2P GPIO排针。向下兼容。

* 4个M2.5孔的位置和GPIO口的位置相同。（HAT扩展板向下兼容）

* POE排针和Pi 3B+位置相同，并且POE HAT向下兼容。


吐槽：

* 毛边（邮票孔 +铣床）
* DIP位置的助焊剂痕迹。后焊工艺不同。


