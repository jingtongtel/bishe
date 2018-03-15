【系统架构说明】
本系统构建于：Spring 4.3.3.RELEASE、Spring MVC 4.3.3.RELEASE、MyBatis 3.3.0。

【工程结构说明】
mbd
  |--src/test/java 测试程序存放目录
  |
  |--src/main/java 源代码存放目录
  |             |
  |             |--com.bocoo.mbd 
  |                           |--bean       实体Bean目录（往下再按业务功能/模块划分目录，如：demo、sys、index等等）
  |                           |--common     通用程序目录
  |                           |--controller 请求控制器类目录（往下再按业务功能/模块划分目录，如：demo、sys、index等等）
  |                           |--mapper     持久层接口类目录（往下再按业务功能/模块划分目录，如：demo、sys、index等等）
  |                           |--service    业务逻辑层程序目录（往下再按业务功能/模块划分目录，如：demo、sys、index等等）
  |                           |--util       工具类目录
  |                           
  |--src/main/resources 配置文件存放目录
  |               |
  |               |--mapping                myBatis映射文件存放目录
  |               |--jdbc.properties        数据库连接配置文件
  |               |--log4j.properties       日志配置文件
  |               |--spring-application.xml spring基础配置和数据源、事务管理配置文件
  |               |--spring-servlet.xml     spring mvc配置文件
  |               
  |--src/main/webapp 前端代码存放目录
  |
  |--target  编译后的war包生成目录
  |
  |--pom.xml  maven依赖配置文件
  
【开发规范】
1.本工程基于maven构建，所有的依赖配置均在pom.xml中，如有其它依赖，添加dependency即可。
2.程序请严格按照bean、controller、service、mapper 分层分目录存放，并根据各自开发的功能，分模块分子目录。
3.测试程序请放入src/test目录
4.配置文件：jdbc.properties、log4j.properties、spring-application.xml、spring-servlet.xml请谨慎修改。
5.系统中使用spring注解，无需在xml中定义bean，使用@Controller、@Service 等即可。
6.请严格遵循java基本编程规范，注意类名、变量名的规范写法，请给类、方法和复杂逻辑添加必要的注释说明。
7.如必要，请在程序中添加判空处理和异常处理，提高逻辑严谨性和程序健壮性。
8.提交svn时，只提交源代码，不要将本机Eclipse classpath环境变量配置和编译后的target目录下的文件提交到svn服务器上。

【示例】
框架中带有一个demo示例
在mysql中建表
CREATE TABLE student (
  id int(11) DEFAULT NULL,
  name varchar(20) DEFAULT NULL,
  sex int(11) DEFAULT NULL
);
添加数据
insert into student values(1,'zhangsan'0);
insert into student values(2,'lisi'1);
insert into student values(3,'wangwu'0);
把程序部署到tomcat中，启动服务
测试地址：http://ip:port/mbd/student/queryAll.do
       http://ip:port/mbd/student/queryStudent.do?name=zhangsan
  