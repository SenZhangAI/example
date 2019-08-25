println("查看某类型最小值，最大值")

println("Max Int =" , typemax(Int))
println("Min Float32 = ", typemin(Float32))

println("查看某个值二进制")
println("bitstring(1.0_01e12) = ", bitstring(1.0_01e12))

println("机器精度 给出的是1.0和下一个Julia可表示的相邻浮点数之差")
println("eps(Float64) = ", eps(Float64))
println("eps(0.0) = ", eps(0.0))

println("nextfloat(0.0) = ", nextfloat(0.0))
println("prevfloat(0.0) = ", prevfloat(0.0))

println("BigFloat可用setprecision和setrounding函数改变默认精度和舍入模式，通常是全局的")
println("但如果放在do-block中，则可改变特定代码精度和舍入模式")

setrounding(BigFloat, RoundUp) do
    x = BigFloat(1) + parse(BigFloat, "0.1")
println("set RoundUp, x = ", x)
end

setrounding(BigFloat, RoundDown) do
    x = BigFloat(1) + parse(BigFloat, "0.1")
println("set RoundDown, x = ", x)
end

setprecision(40) do
    x = BigFloat(1) + parse(BigFloat, "0.1")
println("set precision 40, x = ", x)
end

println("数值后可以不含空格直接接变量，暗指乘法，例如3x=3 * x")
x = 2
println("x=2, 3x^2 + x = 3 * (2^2) + 2 = ", 3x^2 + x)

println("逻辑右移 -2 >>> 1 = ", -2 >>> 1)
println("算术右移 -2 >> 1 = ", -2 >> 1)

println("dot向量化操作，例如 [1, 2, 3] .* 2 = [1 * 2, 2 * 2, 3 * 2]")
println("[1, 2, 3] .* 2 = ", [1, 2, 3] .* 2)

println("链式比较语法糖 1 < 2 <= 2 < 3 == 3 > 2 >= 1 == 1 < 3 != 5 : ", 1 < 2 <= 2 < 3 == 3 > 2 >= 1 == 1 < 3 != 5)

println("Float64(1//3) =", Float64(1 // 3))
