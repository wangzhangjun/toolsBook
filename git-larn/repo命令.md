repo只是google用Python脚本写的调用git的一个脚本，主要是用来下载、管理Android项目的软件仓库。
**所以，在使用repo之前，必须先安装python环境。**

### repo相关命令
* 1.repo init -u URL 用以在当前目录安装 repository ，会在当前目录创建一个目录 ".repo"  -u 参数指定一个URL， 从这个URL 中取得repository 的 manifest 文件。

    ```
    1. 获取的manifest文件放在.repo目录中。命名为manifest.xml。这个文件的内容其实就是所有被git管理的仓库的列表！
    例如：repo init -u git://android.git.kernel.org/platform/manifest.git
    2. 可以用 -m 参数来选择获取 repository 中的某一个特定的 manifest 文件，如果不具体指定，那么表示为默认的 namifest 文件 (default.xml)
    例如：repo init -u git://android.git.kernel.org/platform/manifest.git -m dalvik-plus.xml
    ```

* 2.repo sync [project-list]
下载最新本地工作文件，更新成功，这本地文件和repository 中的代码是一样的。 可以指定需要更新的project ， 如果不指定任何参数，会同步整个所有的项目。如果是第一次运行 repo sync ， 则这个命令相当于 git clone 。repo sync 会更新 .repo 下面的文件。如果在merge 的过程中出现冲突， 这需要手动运行  git  rebase --continue。

* 3. repo diff [ project-list ]：显示提交的代码和当前工作目录代码之间的差异。

* 4. repo forall -c：这个命令会遍历所有的git仓库，并在每个仓库执行-c所指定的命令（这个被执行的命令就不限于仅仅是git命令了，而是任何被系统支持的命令，比如：ls 、 pwd 、cp 等等的 ）
    ```
    当我想通过这个命令遍历所有的仓库并在每个仓库执行"git checkout . "用以将每个仓库的改动都清除的时候，我这么输入命令：
    repo forall -c git checkout .
    看来repo不能遍历执行checkout这个命令。今天我终于想到了另外一个命令"git reset --hard HEAD"
    repo forall -c git git reset --hard HEAD
    再说一个新发现：以前用repo forall 执行一些命令的时候，可能再遍历到某个仓库的时候出了问题，但是我却苦于不知道这个仓库到底是哪个！一直也没有解决。今天终于找到了,关键时候还是要看命令自己带的帮助手册呀。repo help forall  用这个命令查看下针对forall的帮助吧。说的很清楚，repo执行的时候加上-p参数就可以在遍历到每个仓库的时候先打印出当前的pwd，然后再继续执行-c所指定的命令。举例如下：repo forall -p -c git branch
    ```

* 5.repo update[ project-list ]:上传修改的代码 ，如果你本地的代码有所修改，那么在运行 repo sync 的时候，会提示你上传修改的代码，所有修改的代码分支会上传到 Gerrit (基于web 的代码review 系统), Gerrit 受到上传的代码，会转换为一个个变更，从而可以让人们来review 修改的代码。
