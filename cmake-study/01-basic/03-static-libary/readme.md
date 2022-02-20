### 1.说明
add_library（）函数用于从某些源文件创建一个库，默认生成在构建文件夹。 写法如下：
```
add_library(hello_library STATIC
    src/Hello.cpp
)
```
在add_library调用中包含了源文件，用于创建名称为libhello_library.a的静态库。

### 2 添加头文件所在的目录
使用target_include_directories（）添加了一个目录，这个目录是库所包含的头文件的目录，并设置库属性为PUBLIC。
```
target_include_directories(hello_library
    PUBLIC
        ${PROJECT_SOURCE_DIR}/include
)
```
### 3. 链接库
创建将使用这个库的可执行文件时，必须告知编译器需要用到这个库。 可以使用target_link_library（）函数完成此操作。add_executable()连接源文件，target_link_libraries()连接库文件。
```
add_executable(hello_binary
    src/main.cpp
)

target_link_libraries( hello_binary
    PRIVATE
        hello_library
)
```
这告诉CMake在链接期间将hello_library链接到hello_binary可执行文件。 同时，这个被链接的库如果有INTERFACE或者PUBLIC属性的包含目录，那么，这个包含目录也会被传递（ propagate ）给这个可执行文件。