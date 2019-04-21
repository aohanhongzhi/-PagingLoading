# -PagingLoading,Java或者PHP的分页加载技术实现<br/>
#分页加载技术的核心其实就是后端的数据库查询写法与全表查询的区别而已。分页加载就是对数据库只查询部分数据，而不是所有的数据。<br/>
#sql语句是：SELECT * FROM user order by name asc limit 0, 10<br/>
#上面这条sql语句的意思就是查询user表中的所有列，从第0条开始，查询10条，以name排序，。
#后端查询完了数据之后就需要对数据进行封装成json数据，返回到前端。<br/>
#前端对json数据进行解析，然后显示即可。<br/>
#页面的前后端分离的本质其实就是好对ajax技术的完全应用不再使用jsp，php，或者asp这种方式显示编译界面。<br/>
#使用ajax可以方便前后端的分离，唯一的耦合就是json数据格式。这样耦合度最低，前后端的框架或者技术选型可以随时切换。前后端基本上就没有什么关系了<br/>
#源代码请参考：http://www.datatables.club/example/user_share/mir/
