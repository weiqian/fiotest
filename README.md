# fiotest
Distribute fio test scripts

1. �����Զ������Խű�
https://github.com/weiqian/fiotest.git

2. ��дVM����������ip��ַ��/etc/hosts�ļ���

3. ���ò���Client�ʹ����Ե�VM��ssh���ܵ�¼

4. Ŀǰ�Ѿ�д�õĲ��������£�
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
��ʱ�����Ե�������ͨ��#ע�͵�����Ӧ�Ĳ������ļ���testcasesĿ¼�£��ɵ����޸�
����µĲ���������Ŀ¼����Ҫִ��update.sh���²�����

5. ��/etc/hosts��Ӵ����Ե�VM����Ҫͨ��update.sh���������б�

6. ͨ��global.ini������ȫ�ֲ������Ĺ������

7. ִ��iotest.sh���Կ�ʼ��������VM�Ĵ�������

8. ���Խ�������õ�testresultĿ¼��