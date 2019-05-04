# ZWebDev
Редактор СУБД Intersystems
Проект находится в разработке, и написан преимущественно с использованием технологии CSP
<br>Загрузить проект:  do $system.OBJ.ImportDir("...../ZWebDev",,"ck",,1)
<br>            

<br>Терминала : http://localhost:57772/csp/sys/%25ZWebDev.Tools.Terminal.cls
<br>SQL запросы : http://localhost:57772/csp/sys/%25ZWebDev.Tools.SQLquery.cls


<br>
<br>Для вызова класметодов из Вэб страницы используется библиотека: %ZWebDev.Lib.js

<pre> <script type="text/javascript" src='HTML.CacheLib.cls'></script></pre>
<pre>
     <script language='javascript'> 
               isOkFun=function(txt){
	              $('#ConsoleTerminal').append(txt);
                  $("#CommandText").removeAttr("disabled");
                  $("#TextMac").removeAttr("disabled");
	           } 
               ProgrressBarFun=function(txt){ 
                  $('#ConsoleTerminal').append(txt);
	           } 
	           ExecTextCmd=function(cmd){
	              $('#ConsoleTerminal').text('');
	              #server(..Terminal(cmd,'#(override.namespace)#',isOkFun,ProgrressBarFun))#; 
               } 
      </script> 



ClassMethod Terminal(cmd = "", NameSpace = {$zu(5)}) As %String
{
   s OldNameSpace=$zu(5)
    
	d $zu(5,NameSpace)
	s cmdTmp=$replace(cmd,$c(10)," ")
	s cmdTmp=$tr(cmdTmp,$c(13)," ")
	s $ztrap="ErrorCmd"
	x cmdTmp
	d $zu(5,OldNameSpace)
	q $c(10)
ErrorCmd
    q $c(10)_"Error:"_$ZE_$c(10)_"CMD: "_cmd_$c(10)
}
	  
</pre>