Class %ZWebDev.Lib.jquery.plagin.tabs.demo.demo1 Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{
	&html<
	<html>
    <head>
        <title>Динамические закладки на jQuery | Материалы сайта RUSELLER.COM</title>
    
      <script type="text/javascript" src="%25ZWebDev.Lib.js.cls"></script>
	  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
          <script src='%25ZWebDev.Lib.jquery.plagin.tabs.js.cls'  language='JavaScript'></script> 
	   </head>
    <body>
      
      
      <div class="tabs">
          <ul>
            <li id="litab" class="ntabs add"><a href="" id="addtab">+</a></li>
          </ul>            
         <div ></div>
      </div>
      <script language='JavaScript'>
          
      
      </script> 
	  <button onclick="addtab('fffffffffff','-----' );">ll</button> 
      
      
    </body>
</html>
	>
	Quit $$$OK
}

}

