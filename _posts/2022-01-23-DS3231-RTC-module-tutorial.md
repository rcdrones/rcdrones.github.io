---
layout: post
title:  "树莓派DS3231 RTC模块使用指南"
date:   2022-01-23 19:00:00 +0800
categories: Pi4-extension
---

# 树莓派DS3231 RTC模块使用指南



> 树莓派主板本身没有RTC时钟，所以在断网情况下（比如在户外或者不方便上网的环境下），树莓派启动后的系统时间是错误的。为了解决这个问题，我们可以在树莓派IIC总线上外挂一个RTC模块（模块本身是带一颗锂电池，来维持在树莓派断电后，保持时钟芯片的走时）。



### 模块插入图：



### 软件操作指南：

| 命令速查总结：                                               | 命令解释                                                 |
| :----------------------------------------------------------- | :------------------------------------------------------- |
| sudo i2cdetect -y 1                                          | 查询以下IIC模块的地址是否被系统识别（0x68）              |
|                                                              |                                                          |
| echo 'ds3231 0x68' \| sudo tee /sys/class/i2c-adapter/i2c-1/new_device | 把RTC模块注册到Linux系统内部                             |
|                                                              | tee是一个从标准输入，输出到指令文件和屏幕的linux常见工具 |
| sudo hwclock -r                                              | 读取以下RTC模块内部的时间                                |
| sudo hwclock -w                                              | 把系统的时间写入到RTC模块内部                            |
| sudo hwclock -s                                              | 把模块内部的时间更新到系统内部                           |

#### 软件操作分解步骤：

1. 把模块正确的插入到Pi4（PI3也可以），然后对照手机的时间，确认一下此刻系统时间是否正确。 

2. 查询一下模块的地址是否正确被系统识别

    ```sh
    sudo i2cdetect -y 1
    ```

3. 把DS3231注册到系统中

    ```sh
    echo 'ds3231 0x68' | sudo tee /sys/class/i2c-adapter/i2c-1/new_device
    #如果web页复制到linux command里面报错，可能是单引号粘贴不对，需要重新修正为英文半角状态下的单引号（'）
    ```

4. 从模块读取一下，模块内部的时钟  
    ```sh
    sudo hwclock -r
    ```
5. 把系统时间写入到模块里面
    ```sh
    sudo hwclock -w
    ```
6. 再次读几遍模块上的时间，看是否在走时间
    ```sh
    sudo hwclock -r
    ```
7.  开机自动把模块内的时间，更新到系统内部，需要编辑`/etc/rc.local`这个文件
    ```sh
    sudo nano /etc/rc.local
    #在exit 0 上面加入以下内容：
    echo 'ds3231 0x68' | sudo tee /sys/class/i2c-adapter/i2c-1/new_device
    #如果web页复制到linux command里面报错，可能是单引号粘贴不对，需要重新修正为英文半角状态下的单引号（'）
    #把模块内部的时间更新到系统时间内部
    sudo hwclock -s
    ```



### 视频教学：



