# macos内核扩展导出符号

macOS内核开发采坑记录。
有个需求是，有好几个kernel extension 同时依赖一个kernel extension，这个公共的extension需要导出一些函数符号，给不同的extension使用。
不得不说macos内核开发的文档还是很少，除了官网的。所以做个记录，也方便有需要的朋友能节省些时间。
### 1.如何导出符号。
我有个helloworld的内核模块，我在这个模块中导出一个函数符号给别的内核模块使用这个函数。

#### 1.1创建一个exports文件。
![image.png](https://upload-images.jianshu.io/upload_images/3829862-82ee477a740c67af.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 1.2在这个文件中写上你要导出的符号
![image.png](https://upload-images.jianshu.io/upload_images/3829862-108a4aa2aa42301f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

_kmod_info是必须写的。一个函数一行，c语言必须前面加个下划线。

### 1.3设置Exported Symbol File选项。
![image.png](https://upload-images.jianshu.io/upload_images/3829862-2812357f7c466a23.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 1.4设置info.plist文件
在导出符号的时候，必须指定一个version.
需要设置OSBundleCompatibleVersion这个属性，这个属性的版本必须小于或者等于CFBundleVersion（Bundle version）。

### 2.如何引入外部符号
在另一个模块中，使用上面导出的符号。只要在OSBundleLibraries中引入上面的模块名（例如：com.HelloWorld）,后面指定版本号，比如上面的OSBundleCompatibleVersion设置为1.0.0,这里就写个1.0.0.

### 3.编译插入
注意在插入的时候要使用-r指定，在这里卡了很长时间。
```
kextload -r `pwd` xxxx.kext
```
就可以使用第一个内核模块导出的函数了。

参考：
```
https://lists.apple.com/archives/darwin-kernel/2010/Feb/msg00040.html
https://stackoverflow.com/questions/47755233/communicating-between-multiple-distinct-kernel-modules-drivers
```
