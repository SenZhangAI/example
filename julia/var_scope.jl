## module 可以视为一个namespace的全局作用域

module A
    a = 1
end;

module B
    module C
        c = 2
    end
    println(C.c)
    import ..A
    println(A.a)
end;

module D
    #b = a # 没有变量a
end;

module E
    import ..A
    #A.a = 2 # 不嫩个其他module全局变量赋值
end;


x = 0;
for i = 1:10
    x = i + 1
end
# for-loop中局部x不改变外部变量
println("local x = ",x)

x = 0;
for i = 1:10
    global x
    x = i + 1
end
# global关键字能引用外部全局x
# 但尽量不使用全局变量
println("global x = ",x)

x, y = 1, 2
function foo()
    x = 10 # 声明了x，x为局部变量
    return x + y # 没有声明y，y来自全局
end
println("foo() = ", foo())

# 嵌套函数会改变其父作用域的局部变量
x, y = 1, 2;
function baz()
    x = 2 # introduces a new local
    function bar()
        x = 10       # modifies the parent's x
        return x + y # y is global
    end
    return bar() + x # 12 + 10 (x is modified in call of bar())
end;
# 之所以这样设计是为了允许构建闭包
# 内部函数从包含它的作用域中继承的变量有时被称为被捕获变量
# 被捕获变量可能带来性能问题

println("baz() = ", baz())
println("global (x, y) = ", (x, y))

