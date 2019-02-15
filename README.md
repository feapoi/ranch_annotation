ranch代码注解
-----
- 原项目地址：https://github.com/ninenines/ranch

ranch工作流程
-----
1.启动ranch
ranch_sup ->ranch_server
ranch_server用来存储配置以及相关参数

2.ranch:start_listener
在ranch_sup下创建ranch_listener_sup子进程，一个监听端口对应一个ranch_listener_sup

3.ranch_listener_sup
ranch_listener_sup下又创建子进程ranch_conns_sup和ranch_acceptors_sup,
ranch_acceptors_sup用来管理accpet进程池，
ranch_conns_sup用来管理已经连接成功的网络进程

4.当外部连接ranch应用的监听端口时，ranch_acceptor接收外部连接，此时进入ranch_acceptor循环，在此循环中调用start_protocol函数向ranch_conns_sup发送start_protocol消息，进入ranch_conns_sup循环，在ranch_conns_sup循环中，启动Protocol:start_link创建业务进程。并把Socket的控制权给此进程，然后比较当前外部连接数和maxConns的大小，若当前连接数小于maxConns的数不成立，此acceptor进入休眠状态。当有连接进程退出时，就会减少当前连接数，从而唤起睡眠的acceptor进程。