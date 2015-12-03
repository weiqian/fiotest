# fiotest
Distribute fio test scripts

1. 下载自动化测试脚本
https://github.com/weiqian/fiotest.git

2. 填写VM的主机名和ip地址到/etc/hosts文件中

3. 设置测试Client和待测试的VM的ssh免密登录

4. 目前已经写好的测试例如下：
iodepth32_128K_seqwrite.ini
iodepth32_16K64K_mixreadwrite.ini
iodepth32_16K_randread.ini
iodepth32_1M_seqread.ini
iodepth32_1M_seqwrite.ini
iodepth32_4K_randread.ini
iodepth32_4K_randwrite.ini
iodepth32_4M_seqread.ini
iodepth32_4M_seqwrite.ini
iodepth32_64K_seqwrite.ini
暂时不测试的用例可通过#注释掉，对应的测试例文件在testcases目录下，可单独修改
添加新的测试例到该目录后，需要执行update.sh更新测试例

5. 向/etc/hosts添加待测试的VM后，需要通过update.sh更新主机列表

6. 通过global.ini可设置全局测试例的共享参数

7. 执行iotest.sh可以开始并发测试VM的磁盘性能

8. 测试结果将放置到testresult目录下