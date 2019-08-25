
## Task切换不会使用调用栈
## Task可以以任意次序切换，而不像函数必须返回上层调用

## 这种流程控制使得解决特定问题更简便
## 例如生产-消费问题

function producer(c::Channel)
    put!(c, "start")
    for n=1:4
        put!(c, 2n)
    end
    put!(c, "stop")
end;
#  不需显式关闭Channel, Channel 对 Task 的绑定同时也意味着 Channel 的生命周期与绑定的 Task 一致。当 Task 结束时，Channel 对象会自动关闭。多个 Channel 可以绑定到一个 Task，反之亦然。

chan = Channel(producer);

println(take!(chan))
println(take!(chan))
println(take!(chan))

# 用for-loop读取剩余的值
for x in chan
    println(x)
end

# 多数 Task 切换是在等待如 I/O 请求的事件，由 Julia Base 里的调度器执行。调度器维持一个可运行 Task 的队列，并执行一个事件循环，来根据例如收到消息等外部事件来重启 Task
