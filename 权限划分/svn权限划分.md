关于svn权限管理规划

1.关于多个项目分开设置权限，互相之间不能进行越界访问
2.对svn用户进行删除权限的控制，并提示代码提交注释添加

第一步
新增加用户
```
htpasswd -b /opt/svn/conf/passwd user1 user1
```
直接按着项目分为4组 a/b/c/d
```
[groups] 
a=user1,user2
b=user3,user4
c=user5,user6
d=user7,user8
ad=ad
[/]
@ad=rw
* =r	
[/a]
@a=rw
* =
[/b]
@b=rw
* =
[/c]
@c=rw
* =
[/d]
@d=rw
* =
```
第二步
在svn的hook下添加一个pre-commit文件 内容如下
```
#!/bin/bash
REPOS="$1"
TXN="$2"
SVNLOOK=/opt/CollabNet_Subversion/bin/svnlook   #此处根据你的系统变量而定，你可以通过which svnlook来确定

# Make sure that the log message contains some text.
if [ -z `$SVNLOOK log -t "$TXN" "$REPOS" |grep "[a-zA-Z0-9]"` ];then
        echo "请输入注释!" >&2
        exit 1
fi
USER=`$SVNLOOK author -t $TXN $REPOS`
ADMINLIST=test1,test2  #这里是拥有删除权限的用户，逗号隔开
if [ "`echo $ADMINLIST|grep -w $USER|wc -l`" -eq 0 ];then
        if [ `$SVNLOOK changed -t $TXN $REPOS |grep "^D "|wc -l` -gt 0 ];then
                echo "你没有权限删除，请联系管理员删除！" >&2
                exit 1
        fi
fi
# All checks passed, so allow the commit.
exit 0
```
```
Chwon apache:apache  pre-commit
chmod 755 pre-commit
```
这边可能会出现utf8编码问题，在svn协议下是没有问题的 http可能有点问题。所以使用英文注释和抛出错误
将pre-commit拷贝到所有的项目库中hook下

