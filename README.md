# pwaf
php waf extension filter webshell

## Requirement
- PHP-7.0 +

## download
````
git clone git@github.com:snfnwgi/pwaf.git
````
### Compile in Linux
````
$/path/to/phpize
$./configure --with-php-config=/path/to/php-config/
$make && make install
````
### Example

目前只过滤了exec方法,后续慢慢完善
````php
<?php
exec($_GET['webshell']);//用exec执行GET或POST用户输入的信息都不会执行成功,并会记录日志（/tmp/pwaf.log）.

````
````
//log file
[filename]: /vagrant_data/test/pwaf.php
[function]: exec
[line]: 3
[date]:2017-8-2 19:7:52
````
### 背景
1.webshell 单纯用PHP代码过滤总是防不胜防,各种webshell的变种.唯独在扩展层面最有效,因为不管webshell怎么变形,最终都会交给zend vm处理,zend 提拱了重写opcode接口（zend_set_user_opcode_handler）,在编写扩展时我们可调用接口做自己的想做的事情.  
2.为了怕误报webshell,采用了用日志记录的方式（文件名,行号,执行函数,时间）,如果真的有误报了,改写代码写法（用户输入的都会报,直接写在代码里不会)   
3.在研究了一段时间后发现有类似扩展,(代码中有些借鉴了教主鸟哥的taint思想)

### 相关资料
1.taint:https://github.com/laruence/taint  
2.各种PHP变形webshell:https://github.com/tennc/webshell/tree/master/php