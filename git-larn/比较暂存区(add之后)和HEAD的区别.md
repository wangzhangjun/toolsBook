以往我们commit之后，可以使用git diff 文件名  来查看commit和之前的区别。

那么对于add之后的如何区分呢。

```
git diff --cached  //是对暂存区的文件和HEAD进行比较
```

比较工作区和暂存区的文件差异：
```
git diff 
```
