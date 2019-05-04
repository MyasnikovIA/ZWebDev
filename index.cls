Class %ZWebDev.index Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{
	&html<
	<head>
		<title>WebDev</title>
		<script type="text/javascript" src="%25ZWebDev.Lib.js.cls"></script>
        <script src='%25ZWebDev.Lib.jquery.v320.min.js.cls'  language='JavaScript'></script> 
        <script src='%25ZWebDev.Lib.jquery.plagin.resizable.js.cls'  language='JavaScript'></script>   
	    <script src='%25ZWebDev.Lib.bootstrap.v337.min.js.cls'></script> 
	    <link  href='%25ZWebDev.Lib.bootstrap.v337.min.css.cls'  rel='stylesheet' >   
        
        <link   href="%25ZWebDev.Lib.jquery.plagin.TreeView.themes.default.style.min.cls"  rel="stylesheet" />
        <script src="%25ZWebDev.Lib.jquery.plagin.TreeView.jstree.min.cls"></script>
	</head>
	>
   &html<
  <body >
  
  
        #(##class(%ZWebDev.Tools.NavBar).DrawBody())#
  
        <div class="panel-container">

            <div class="panel-left" id="leftPane" style="width: 300px; height: 90%;" >
                 #(##class(%ZWebDev.Tools.ClassTree).DrawBody())#
            </div>

            <div class="splitter"></div>
            <div class="panel-right"  id='rightPane' >
              <br> https://ruseller.com/lessons.php?id=526&rub=32
                 
            </div>
        </div>
        
  

  </body>
  
  
  <script  language='JavaScript'>
  $(function() {
     $(".panel-left").resizable({
        handleSelector: ".splitter",
        resizeHeight: false
    });
  });
  
                       
     /*
     /// Загрузка лквой панели
      $("#rightPane").html( #server(..GetSQL())# );
     /* 
     $('#test').click(function(){
         $( "#rightPane").html( #server(..GetSQL())# );
         alert(1);
     });
     */
  </script>
  >
   Quit $$$OK
}

ClassMethod GetSQL() As %String
{
	d ##class(%ZWebDev.Tools.SQLquery).DrawBody()
	q ""
}

}

