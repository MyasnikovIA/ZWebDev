Class %ZWebDev.Lib.w2ui.v140.demo.Layout.SimpleLayout Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{
	&html<<html>
    <head>
        <script src='%25ZWebDev.Lib.jquery.v331.js.cls'></script>  
        <script src='%25ZWebDev.Lib.w2ui.v140.min.js.cls'></script> 
        <link  href='%25ZWebDev.Lib.w2ui.v140.min.css.cls'  rel='stylesheet' >  
    </head>
    <body>
       <div id="myLayout" style="height: 400px"></div>
       <script type="text/javascript">              
        $(function () {
           $('#myLayout').w2layout({
              name: 'myLayout',
              panels: [
                 { type: 'top', size: 60 },
                 { type: 'left', size: 150, resizable: true },
                 { type: 'right', size: 150, resizable: true }
              ]
           });
        });
       </script>
      </body>
    </html>>
	Quit $$$OK
}

}

