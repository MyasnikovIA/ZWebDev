Class %ZWebDev.Tools.NavBar Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{
	&html<
      <script src="%25ZWebDev.Lib.js.cls" type="text/javascript" ></script>
      <script src='%25ZWebDev.Lib.jquery.v320.min.js.cls'  language='JavaScript'></script>  
	  <script src='%25ZWebDev.Lib.bootstrap.v337.min.js.cls'></script> 
	  <link  href='%25ZWebDev.Lib.bootstrap.v337.min.css.cls'  rel='stylesheet' >   
	>
	d ##class(%ZWebDev.Tools.NavBar).DrawBody()
	Quit $$$OK
}

///   #(##class(%ZWebDev.Tools.NavBar).DrawBody())#
ClassMethod DrawBody() As %String
{
   &html<<nav class="navbar navbar-inverse" >
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#" id='SystemInfoNavBar'>#($p($zv,"(Bui",1)_"  ("_$zu(110)_")")#</a>
    </div>
    <ul class="nav navbar-nav">
    
      <!-- File -->      
      <!--
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">File
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 1-1</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
      -->
      
      
      <!-- Tools -->      
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Tools
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#" id="RunNavBar" >Run</a></li>
          <li><a href="#" id="CosFileNavBar" >COS File</a></li>
          <li><a href="#" id="TerminalNavBar" >Terminal</a></li>
          <li><a href="#" id="SqlqueryNavBar"  >SQL Query</a></li>
          <li><a href="#" id="GlobalNavBar"   >Global Expolorer</a></li>
        </ul>
      </li>
      <li><a href="#">Link</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
    
  </div>
 </nav>
 >
 
   w "<script>"
  &js<
  $('#TerminalNavBar').click(function(){
      SelectItem=localStorage.getItem('SelectItem');
      var res=#server(%ZWebDev.Tools.ClassTree.ContextMenu.Terminal(SelectItem))#;
      try { eval(res); }catch (e) { alert(res);}
  });     
  $('#SqlqueryNavBar').click(function(){
      SelectItem=localStorage.getItem('SelectItem');
      var res=#server(%ZWebDev.Tools.ClassTree.ContextMenu.SQLquery(SelectItem))#;
      try { eval(res); }catch (e) { alert(res);}
  });     

  $('#GlobalNavBar').click(function(){
      SelectItem=localStorage.getItem('SelectItem');
      var res=#server(%ZWebDev.Tools.ClassTree.ContextMenu.GlobalExpolorer(SelectItem))#;
      try { eval(res); }catch (e) { alert(res);}
  });     
  $('#SystemInfoNavBar').click(function(){
      SelectItem=localStorage.getItem('SelectItem');
      var res=#server(..SystemInfo(SelectItem))#;
      try { eval(res); }catch (e) { alert(res);}
  });   
  $('#RunNavBar').click(function(){
      SelectItem=localStorage.getItem('SelectItem');
      var res=#server(..RunNavBar(SelectItem))#;
      try { eval(res); }catch (e) { alert(res);}
  });   
  
  
  $('#CosFileNavBar').click(function(){
      SelectItem=localStorage.getItem('SelectItem');
      var res=#server(%ZWebDev.Tools.ClassTree.ContextMenu.ClassFromFile(SelectItem))#;
      try { eval(res); }catch (e) { alert(res);}
  });     
  
  >
  w "</script>"
 
 
  q ""
}

ClassMethod SystemInfo(SelectItem = "") As %String
{
	 w "ffffffff"
 	q ""
}

/// запуск активного Элемента
ClassMethod RunNavBar(SelectItem = "") As %String
{
	w SelectItem
 	q ""
}

}

