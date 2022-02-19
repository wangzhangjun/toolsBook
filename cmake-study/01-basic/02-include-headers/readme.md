### 1. 说明
CMake语法预先指定了许多变量，可用于帮助您在项目或源代码树中找到有用的目录。 其中一些包括：

* CMAKE_SOURCE_DIR	根源代码目录，工程顶层目录。暂认为就是PROJECT_SOURCE_DIR
* CMAKE_CURRENT_SOURCE_DIR	当前处理的 CMakeLists.txt 所在的路径
* PROJECT_SOURCE_DIR	工程顶层目录
* CMAKE_BINARY_DIR	运行cmake的目录。外部构建时就是build目录
* CMAKE_CURRENT_BINARY_DIR	The build directory you are currently in.当前所在build目录
* PROJECT_BINARY_DIR	暂认为就是CMAKE_BINARY_DIR

**可以利用message（）命令输出一下这些变量。**
另外，这些变量不仅可以在CMakeLists中使用，同样可以在源代码.cpp中使用。

### 2. 源文件
创建一个包含源文件的变量，以便于将其轻松添加到多个命令中，例如add_executable（）函数。


```
set(SOURCES
    src/Hello.cpp
    src/main.cpp
)

add_executable(${PROJECT_NAME} ${SOURCES})
```
**Note:An alternative to setting specific file names in the SOURCES variable is to use a GLOB command to find files using wildcard pattern matching.**
```
file(GLOB SOURCES "src/*.cpp")
```

**Tips : For modern CMake it is NOT recommended to use a variable for sources. Instead it is typical to directly declare the sources in the add_xxx function.**


### 3. 包含目录
当您有其他需要包含的文件夹（文件夹里有头文件）时，可以使用以下命令使编译器知道它们： target_include_directories（）。 编译此目标时，这将使用-I标志将这些目录添加到编译器中，例如 -I /目录/路径
```
target_include_directories(target
    PRIVATE
        ${PROJECT_SOURCE_DIR}/include
)

```
PRIVATE 标识符指定包含的范围。 这对库很重要，将在下一个示例中进行说明。 有关该功能的更多详细信息，请参见以下链接：https：//cmake.org/cmake/help/v3.0/command/target_include_directories.html

### 4.详细输出
make VERBOSE=1，可以查看详细的make输出。