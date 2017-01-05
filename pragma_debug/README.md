#未开启调试和检查模式

`gnatmake main.adb`将执行如下命令：
>gcc -c main.adb
>gcc -c test.adb
>gnatbind -x main.ali
>gnatlink main.ali

编译后，main的运行结果是：
>print in test

#开启调试和检查模式（使用-gnata）

首先执行`gnatclean main`，清理已编译的内容。

使用``-gnata`打开所有的检查和调试信息(Assertions enabled. Pragma Assert/Debug to be activated)。

执行`gnatmake -gnata main.adb`命令。

编译后，main的运行结果是：
>print in test
>print in test

即`pragma Debug(testf);`语句生效。


#开启调试和检查模式（使用gnat.adc）

在当前文件夹之下创建gnat.adc文件，在该文件中写入如下语句：`pragma Debug_Policy (ON);`。

之后执行`gnatmake main.adb`时，`gnatmake`会自动去读取gnat.adc中的配置信息。

编译后，main的运行结果是：
>print in test
>print in test


