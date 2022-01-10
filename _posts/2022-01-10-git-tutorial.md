---
layout: post
title:  "GIT版本管理"
date:   2022-01-07 20:00:00 +0800
categories: git_tutoriGI
---

# GIT版本管理

> 简介：git本身是一种源代码版本管理软件，至于国外的github和国内的码云（gitee）本身只是提供云硬盘。我在学习完git课程之后，联想到的是git本身其实根本不需要远程服务器。在本地任何目录下，都只要运行一下git init 就能开始版本管理。本文就是git使用上的经验分享。



### git的脑图



### git的常用命令

```
git init #对目录开始git管理。也就是执行git初始化的动作。

git add . #表示把目录内的变动文件，都加入暂存区。

git commit -m "这是第一次修改，我添加了XX文件，修改了YY文件" #让暂存区的文件进行一次拍照，然后产生一个以一大堆HEX组成的版本号。
```

```
git reflog # 查看目前这个目录的所有版本号，也就是查看目前的修改记录。
```
```
git reset --hard HEX #返回某一次快照的状态。 HEX表示模块的编号，就是上面reflog显示出来的版本号 
```

```
git checkout add_some_func # 从当前分支切换到特定名称的分支。
```

```
git checkout master #切换到主分支
```

```
git merge add_some_func #把add_some_func分支进行的修改合并到master上面。
```

```
git reset --hard HEX # 强制返回到某个版本快照。（工作目录的文件也会更改为快照状态）
```



#### 产生一个分支，在分支上工作的整个流程

```
git branch add_some_func # 在当前分支下面产生一个子分支，用于同步开发，或者是临时想解决一个bug，产生一个分子。
git checkout add_some_func #切换到主分支

或者如下：
git checkout -b add_some_func #创建分支并且切换到分支上工作


然后在本地：
	1. 修改源代码（做你的工作）
	2. git add .
	3. git commit -m "写点更新记录的标签，方便后期来查看"


等修改完成后：
git checkout master # 切换到master分支
git merge add_some_func # 把分支上的修改合并到master上


最后删除分支：（可选的步骤）
git branch -d add_some_func # 目前分支在master下，然后删除莫个特定分支
```



### 和远程服务器的交互

* 首先要生成rsa的公匙

  * 设置 user.name 和 user.email

```
    设置：
    git config --global user.name "aaa"
    git config --global user.email	"bbb@163.com"
    
    读取验证：
    git config user.name
    git config user.email
```

  * 产生rsa密码

    ```
    生成密码
    ssh-keygen -t rsa -C "bbb@163.com" #产生的密码在 c:\users\xxx\.ssh\id_rsa.pub
    
    去网站上粘贴id_rsa.pub文件里的内容
    
    测试一下：
    ssh -T git@gitee.com
    ssh -T git@github.com # 看到succeed表示正确
    ```

* 方式一：如果先建立本地文件夹，要上传到云端（也就是本地任意文件夹和云端做关联）

  * 本地建立和云端地址的关联

    ```
    git remote add 随便叫一个远程名称 ssh远程云端的地址
    
    git remote add github git@github.com:rcdrones/abc.git
    git remote add gitee git@gitee.com:rcdrones/abc.git
    ```

  * 上传代码到云端

    ```
    git push -u github master # github就是上面的标签， master是分支名称
    ```

* 方式二：如果只有云端，没有开本地文件夹

  * git clone 下整个云端的代码库

    ```
    git clone git@gitee.com:rcdrones/abc.git
    ```

  * 修改文件，然后git push上云端

    ```
    git add .
    git commit -m "写一些修改记录"
    
    git push -u github master
    
    git push -f gitee master
    
    ```

  * 在push之前最好用pull拉取一下最新的代码库

    ```
    git pull github master
    ```

    

### 疑难杂症

在`git status`发现文件名转码异常，变成了16进制码。解决方案：

```
git config --global core.quotepath false

git config --list
```





