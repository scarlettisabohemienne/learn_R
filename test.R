install.packages("survival")
library(survival) #不用双引号，或者右下角包前打钩也可调用
# warning不要紧 只要不是error 
# shift+command+c行注释
log(10)
lg <- log(10) #alt - 快速赋值 结果+命令
# 区分大小写
lg
seq(1,5)
seq(1,5,0.5)#多一个by的参数
5%/%2 #整除，结果不四舍五入
x1<-c(2,3, 5, 7,10) #函数c 向量形式
x2<-c("A","B", "C","D") #char,输出后还带引号
x2
x3<-1:5   #产生1-5直接连续整数数据 =seq(1,5)
x3

# r运算结果产生的全部是数据
class(x1) #numeric&double的区别？
# 可用整数变量表示分类变量（factor）
# 根据变量属性进行分类，变量可以分为数值变量和分类变量
# 对于char型的分类数据，R语言直接认定为因子
# 对于数值型分类数据，R语言很多时候认定为数值变量数据。此时，需要用factor( )或者as.factor( )函数进行转换

f1<-factor(c(1,2,1,3,2,4,2,4,2,1))
f1
f2<-factor(c(1,2,1,3,2,4,2,4,2,1), levels=c(2,1,4,3))#levels参数设定，对因子顺序进行重新排列，2作为参照
f2
f3<-factor(c(1,2,1,3,2,4,2,4,2,1), levels=c(2,1,4,3), 
           labels = c("A","B","AB","O")) # <- 和=赋值啥区别？除了自定义变量以外的赋值用等号？
f3

table(f1)   #因子列表展示,但是什么顺序显示？
class(f1)  #查看f1的类型
levels(f1)  #查看f1 因子的分组水平
summary(f1)  #f1因子的汇总，和table啥区别？


SD <- sd(c(1,2,6,10,15,26))
SD