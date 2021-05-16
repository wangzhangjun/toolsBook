在git中如果想忽略掉某个文件， 不让这个文件提交到版本库中，可以使用修改 .gitignore 文件的方法。
这个文件每一行保存了一个匹配的规则, 可以用正则表达式来描述, 例如:

```
# 此为注释 – 将被 Git 忽略
*.a       # 忽略所有 .a 结尾的文件
!lib.a    # 但 lib.a 除外
/TODO     # 仅仅忽略项目根目录下的 TODO 文件，不包括 subdir/TODO
build/    # 忽略 build/ 目录下的所有文件
doc/*.txt # 会忽略 doc/notes.txt 但不包括 doc/server/arch.txt
*ignore/  # 忽略名称中末尾为ignore的文件夹
*ignore*/ # 忽略名称中间包含ignore的文件夹
```

### Git修改gitignore后生效
```
git rm -r --cached .    #清除缓存
git add .               #重新trace file
git commit -m "update .gitignore" #提交和注释
git push origin master  #可选，如果需要同步到remote上的话
```
