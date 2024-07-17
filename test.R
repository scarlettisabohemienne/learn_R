install.packages("survival")
library(survival) #不用双引号，或者右下角包前打钩也可调用
# warning不要紧 只要不是error 
# shift+command+c行注释
log(10)
lg <- log(10) #option - 快速赋值 结果+命令
# 区分大小写
lg
seq(1,5)
seq(1,5,0.5)#多一个by的参数
help("seq") #了解包
5%/%2 #整除，结果不四舍五入
x1<-c(2,3, 5, 7,10) #函数c 向量形式赋值给变量x1
x2<-c("A","B", "C","D") #char,输出后还带引号
x2
x3<-1:5   #产生1-5直接连续整数数据 =seq(1,5)
x3

# r运算结果产生的全部是数据
class(x1) #numeric&double的区别？
# 分类变量在r特指无序数据,因为有序的等级分类变量一般是作为数值变量
# 根据变量属性进行分类，变量可以分为数值变量和分类变量 
# 分类变量也就是无序变量叫做因子（factor）有3种:char,t/f,用整数替代的char(男1女2)
# 对于char型的分类数据，R语言直接认定为因子
# 对于数值型（上述3.整数替代型）分类数据，R语言很多时候认定为数值变量数据。此时，需要用factor( )或者as.factor( )函数进行转换

f1<-factor(c(1,2,1,3,2,4,2,4,2,1)) #把向量（数值型）转换为因子
f1

x4 <- factor(x1) #把x4规定为因子，则输出x4后有'levels' 证明x4是因子，是分类数据
x4
class(x4)

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

# 上传到github
# 1. r生成ssh key粘到github 终端里只有指明的文件git才会跟踪，先cd到git 项目的文件夹
# git remote set-url origin git@github.com:scarlettisabohemienne/learn_R.git
# ls -a | grep .git
# 2. github里建repository r开一个新Project输入URL（非http）
# 3.created a file, saved it, staged it, committed it，push!

# 向量子集提取一般采用中括号[ ]，【】里面写的是位置

# 1.位置提取法
x1[1]      #返回x1的第1个元素
x1[-1]     #返回除第一个元素之外的所有元素
x1[c(2:4)]  #返回x1的第2至4个元素
x1[-c(2:4)]  #返回x1的除第2至4元素之外的所有元素

# 2.which元素位置法  通过函数which( )返回逻辑向量中为TRUE的位置，不能返回数值；
which.max(x1) #返回向量x1中最大值所在的位置；5
which.min(x1) #返回向量x1中最小值所在的位置。
x1[which(x1>3 & x1<8)]  #不常用 见下 #内函数使用判断符号（大于小于）提取True的位置，外函数再输出结果
x1[which.max(x1)] #which.max输出位置

# 3.值大小提取（也是逻辑判断提取法）不要which了
x1[x1>3 & x1<8] # 产生大于3 又小于8的子集
x1[x1==3] #使用判断符号==， 产生True的结果

# 4.根据名称索引   先给向量中的每个元素命名，再通过名称访问对应的元素：
names(x1)<-c("two","thre","five","seve","ten")
x1[c("thre","seve")] #出的结果类似矩阵

# 5. subset函数生成子集  检索向量中满足条件的元素，提取出来：
subset(x1, x1>3 & x1<8) #[1]针对的数据集叫x1 [2]x1要满足的条件 #刚才打了标签这里才有，不是非有不可

#向量的编辑   对已创建向量进行增加或删除元素。
#（1）增加元素
x3<-1:5
x3
x4<-c(x3, c(6,7,8,log(12)))  # 在x后面增加6、7、8和log（12）
x4

# （2）删除元素
x5 <- c(1,3,5,7,9)
x5
x6<-x5[-c(3,5)]  # 加负号，是反向删除，这是最常见的方式 #删的是位置，不是数值的3和5
x6
x6<-x5[-1]
x6

# 向量排序 函数sort()，基本格式：sort(x,decreasing=FALSE, na.last= FALSE,...)
# 其中，x为排序对象（数值型或字符型）；decreasing默认为FALSE即升序，TURE为降序；na.last默认为FALSE，若为TRUE，则将向量中的NA值放到序列末尾。
sort(x5)
sort(x6,decreasing=T)

length(x1)  #向量的长度
mean(x1)  #计算向量均数
sd(x1) #计算向量的均数
sum(x1) #计算向量的总计
median(x1)  #计算向量的中位数

# 1.	创建矩阵 矩阵一般在向量的基础上产生，常用的函数为matrix()和dim( )
# 函数matrix()，基本格式为：matrix(x, nrow=..., ncol=..., byrow=..., dimnames=...)byrow设置是否按行填充，默认为FALSE（按列填充）；dimnames用字符型向量表示矩阵的行名和列名。
x<-1:6
x
a<-matrix(x,nrow=3,ncol=2) #采用matrix产生3行2列矩阵
a

b<-matrix(x,nrow=3,ncol=2,byrow=T,dimnames=list(c("r1","r2","r3"), c("c1","c2")))
b

