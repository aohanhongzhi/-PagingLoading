使用方法：
支持JAVA和PHP两种后台。
PHP：直接将WebRoot下的文件放到php服务器上直接运行即可，记得启用sqlite3。
JAVA：修改user-manage.js，将访问后台的url由"datasource.php"改为"datasource.jsp"，然后将WebRoot下的文件放到tomcat下直接运行。也可使用Eclipse直接导入此项目文件。


简要说明：
使用DataTable默认的ajax交互功能，对传给后台和从后台获取的数据都有命名格式要求，这样一来耦合度较高，不利于后期扩展，不能直接适用于需要跟多种不同前端或其他业务交互的项目。本例子主要展示了自行封装请求参数和返回数据的用法，对后台的交互没有任何格式和命名限制。
基于Bootstrap 2.3.2,相关的其他插件包括图标控件FontAwesome、等待提示控件Spinjs(修改版)、弹窗控件lhgdialog(修改版)
主要展现:
封装请求参数（查询、排序、分页,不再需要data、dataFilter和dataSrc）
封装返回数据
自定义查询参数
服务器分页
自行控制和自定义遮罩效果
生成自定义效果的单元格（在线离线）
生成复选框单元格
响应复选框选择事件
生成操作按钮单元格
响应操作栏按钮点击事件
响应行点击事件
渲染回调事件（默认选中第一行）
分页栏增加跳页功能（直接修改了dataTables.bootstrap.js和dataTables.bootstrap.css）
CSS实现单元格超长文字省略号显示
CSS实现单元格连续纯字母数字强制换行显示
