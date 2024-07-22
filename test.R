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
help("seq") #了解包,里面打双引号
5%/%2 #整除，结果不四舍五入
x1<-c(2,3, 5, 7,10) #函数c 向量形式赋值给变量x1
x2<-c("A","B", "C","D") #char,输出后还带引号
x2
x3<-1:5   #产生1-5直接连续整数数据 =seq(1,5)
x3

# r运算结果产生的全部是数据
class(x1) #numeric&double的区别？r里numeric可以包括double
z <- 1.5
is.numeric(z)  # TRUE
is.double(z)  # TRUE
typeof(z)  # "double"
View(z) #View()大写 可以查看变量，新开一个小窗
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
           labels = c("A","B","AB","O")) # <-和=赋值区别: 除了新的自定义变量以外的赋值用等号， <- 优先级高于=
f3

table(f1)   #因子列表展示
class(f1)  #查看f1的类型
levels(f1)  #查看f1 因子的分组水平
summary(f1)  #f1因子的汇总，table()是拿来生成table的，summary()是给你看个大概参数


SD <- sd(c(1,2,6,10,15,26))
SD

# 上传到github
# 1. r生成ssh key粘到github 终端里只有指明的文件git才会跟踪，先cd到git 项目的文件夹
# git remote set-url origin git@github.com:scarlettisabohemienne/learn_R.git
# ls -a | grep .git
# 2. github里建repository r开一个新Project输入URL（非http）
# 3.created a file, saved it, staged it, committed it，push!

# 向量  同一向量不能混杂多种不同类型的数据 通过函数c( )实现向量创建功能
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
subset(x1, x1>3 & x1<8) #[1]针对的数据集叫x1 [2]x1要满足的条件 #刚才打了标签这里才有标签，不是非有不可

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

# rank( )，就是返回每个元素的排名, ties.method是如果有2+相同元素的话 其排列方法
rank(x3,ties.method = "last")

# 1.	创建矩阵 矩阵一般在向量的基础上产生，常用的函数为matrix()和dim( )
# 函数matrix()，基本格式为：matrix(x, nrow=..., ncol=..., byrow=..., dimnames=...)byrow设置是否按行填充，默认为FALSE（按列填充）；dimnames用字符型向量表示矩阵的行名和列名。
x<-1:6
x
a<-matrix(x,nrow=3,ncol=2) #采用matrix产生3行2列矩阵
a

b<-matrix(x,nrow=3,ncol=2,byrow=T,dimnames=list(c("r1","r2","r3"), c("c1","c2")))
b

# 2.	矩阵索引（子集提取）位置提取
a[1,2]  #返回矩阵a的第1行，第2列的元素
a[2,]   #返回矩阵a的第2行
a[,2]   #返回矩阵a的第2列
a[c(1:2),]  #返回矩阵a的第1至第2行
# 按名称索引：
b["r2","c1"]  #返回矩阵c的第r2行，第c1列的元素

# 数据库合并
# 函数rbind(A,B), 纵向合并（增加行），要求列数相同；
# 函数cbind(C,D), 横向合并（增加列），要求行数相同。
# 注意：rbind(A,1) 相当于给矩阵A增加一行“1”。
rbind(a,b)
cbind(a,b)

# 数据库删减
a[-1,] #删除矩阵a的第一行
a[-c(2:3),]#，删除矩阵a的第2至4行

colSums(a)  #对矩阵的各列求和
rowSums(a)  #对矩阵的各行求和
colMeans(a)  #对矩阵的各列求均值
rowMeans(a) #对矩阵的各行求均值

# 直接通过向量创建数据框 函数data.frame()把多个向量组合起来创建，并设置列名称，列名即为变量名
# data.frame(col1,col2,col3,...) 列向量col1, col2, col3, …可以为任意类型
x1=c(5.1,4.9,4.7,4.6)
x2=c(3.5,3.0,3.2,3.1)
x3=c(1.4,1.4,1.3,1.5)
d1<-data.frame(x1,x2,x3)
d1
dim(d1) #4行3列

# data.frame的子集提取
# 方法一，通过行列位置提取行列
d1[,1]   # 返回数据框d1的第1列
d1[1,]   # 返回数据框d1的第1行
d1[1:3,] #  返回数据框d1的第1至3行

# 方法二，通过列名提取列
# data.frame只有列名，而matrix有行名也有列名 所以matrix用名可以提取两种
d1["x1"]  # 产生名为x1的一列，就是产生变量为x1的一列结果，为数据框
d1["x2"] #产生名为x2的一列，就是产生变量为x2的一列结果，为数据框
d1["x3"]  # 产生名为x3的一列，为数据框 （只有一列的data.frame)

# 方法三，通过$提取列:  这种形式是今后医学数据分析最重要的提取形式，提出来是向量
d1$x1   # 产生名为x1的一列，就是产生变量为x1的一列结果，为向量
d1$x2   # 产生名为x2的一列，就是产生变量为x2的一列结果，为向量，输出是横向的vector
d1$x3   # 产生名为x3的一列

# 方法四，根据变量值的大小提取行 
d1[d1$x1>4.6,]   #提取x1>4.6的行（子集）
d1[d1$x1>4.6 | d1$x2<3.5,]  #提取x1>4.6或者x2<3.5的行
d1[d1$x1>4.6 & d1$x2<3.5,]  #提取x1>4.6且x2<3.5的行
d1[d1$x2==3,] #提取x2等于3的行，R语言函数等号中用==，而不是= （虽然是$法，提取行结果是子集，提取列结果是变量【输出有表头】）

# 方法五，通过位置提取元素
d1[1,1] #返回数据框d1的第1列第1个数据
d1$x1[1]#先提取向量，再提取位置 或
d1["x1"][1] #  返回数据框d1的x1列中第1个数据

# 方法六，用函数subset()按条件索引
subset(d1, x1<5)

# 数据框的编辑
# 1.增加样本数据（行）
d2<-rbind(d1,list(5.0,3.6,1.4,0.2)) #可以写多于原来matrix列数的变量，但不会包进去
d2

# 增加属性变量（列）
d3<-cbind(d1,x4=c("男","女","男","女")) #data.frame可以是不同类型的变量，但要加新列名 x4
d3

# 数据框最常见的增加行列的方法是，采用转换(加减乘除)产生新变量
d1$x5<-d1$x1-d1$x2 #我们产生新变量x5，是x1和x2的差值 #d1$说明向量来源是d1这个data.frame
d1
is.vector(x5)

# 删除数据
d1[,-1]  #删除第1列
d1[-1,]  #删除第1行

# 编辑数据框列名
names(d1)   #查看数据框列名, 主要是为了知道名字的位置
names(d1)[1]="xxx1" #修改第1列列名
names(d1)

# 数据框运算往往针对是某一列或者某一行，最常见的是针对某一列（最小的单位，是向量）的计算，方法和向量计算相似。
length(d1$x2)  #向量的长度
mean(d1$x2)  #计算向量均数
sd(d1$x2) #计算向量的标准差
sum(d1$x2) #计算向量的总计
median(d1$x2)  #计算向量的中位数

# 创建列表 用函数list()，基本格式为：list(object1,object2,...)
# 其中，object对象可以是任何类型。若同时为列表中的对象命名：list(name1=object1,name2=object2,...)
mylist<-list(
  a=c(1,2,3,4),
  b=c("one","two","three"),
  c=c(TRUE,FALSE),
  d=(1+2i))
mylist #data.frame中的$表示的是向量子集，而list中的$表示各个小包的内容物

g<-"My List"
h<-c(25,26,18,39)
j<-matrix(1:10,nrow=5)
mylist<-list(title=g,ages=h,j)#g&h事先有名称了，而j没有名称会用[[]]来表示第三个子包
mylist

# 列表索引（子集提取） 与数据框操作类似，但是用两个方括号。list不能直接分析，要分析里面的子集
mylist[[1]]   #索引列表data的第1列
mylist[["title"]]  #按名称索引，同mylist [[1]]
mylist $title  #索引列表mylist的名称为title的列
mylist [[1]][1] #索引列表mylist的第1列的第1个元素

# is系列是判断某一个数据中的观察值是何种类型，或者数据属于何种对象与结构
is.character(x)        #判断是否为字符型
is.numeric(x)         #判断是否为数值型
is.vector(x)          #判断是否为一个向量
is.matrix(x)          #判断是否为一个矩阵   
is.array(x)           #判断是否为一个数组
is.data.frame(x)      #判断是否为一个数据框
is.factor(x)          #判断是否为一个因子

# as系列是对数据的类型、对象进行转换
as.numeric()          #转换为数值型
as.logical()           #转换为逻辑型
as.charactor()         #转换为字符串
as.matrix()           #转换为矩阵
as.data.frame()       #转换为数据框

#subset法提取行，$法提取列