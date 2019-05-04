/// 
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.demo4 Extends %CSP.Page
{

/// Метод разбики исходного текста на Cache` код и HTML текст
ClassMethod ExecFrag(SrcCode = "", Beg = "", End = "")
{
     q:SrcCode=""   q:Beg=""    q:End=""    for ExecFragInd=1:1:$l(SrcCode,End){  s tmp=$p(SrcCode,End,ExecFragInd)   s Html=$p(tmp,Beg,1)     s Code=$p(tmp,Beg,2)   w Html   TRY {     x Code    } CATCH ErrorHandle {    zw ErrorHandle  }    }
}

ClassMethod DrawXdata(Name = {##This_":XDataContet"}) As %Library.Status [ Language = cache ]
{
   if $l(Name,":")=1,$e(Name,1,2)'=".."{  s Name=".."_Name  }
   if $e(Name,1,2)=".." {  s ClassName=##This,XdataName=$e(Name,3,$l(Name))
   }else{                  s ClassName=$p(Name,":",1),XdataName=$p(Name,":",2)  }
   s gl="^oddDEF("""_ClassName_""",""x"","""_XdataName_""",21)"  
   s FragOnPageInd=""  f {  s FragOnPageInd=$o(@gl@(FragOnPageInd))  q:FragOnPageInd=""  continue:FragOnPageInd=1  q:FragOnPageInd=@gl      d ..ExecFrag(@gl@(FragOnPageInd),"/*(",")*/")     w $c(13,10)  }
}

Parameter DstName = "%ZWebDev.Lib.jquery.plagin.TreeView.demo.demo4.cls";

Parameter FileName = "C:\AppServ\vakata-jstree-0097fab\dist\demo.html";

Parameter LongPath;

Parameter NameOnly = "demo.html";

Parameter PathApp = "C:\AppServ\vakata-jstree-0097fab\dist\";

Parameter PathOnly = "C:\AppServ\vakata-jstree-0097fab\dist\";

Parameter Rashirenie = "html";

Parameter SrcName = "demo.html";

Parameter isBinFile = 0;

/// 23/03/2018  15:42:02
ClassMethod OnPage() As %Library.Status [ Language = cache ]
{
	if $d(%request.Data("GetDataJSON",1)) {
       d ..GetDataJSON()
	   Quit $$$OK
	}
	
	
	
    d ..DrawXdata("XDataContet")
    Quit $$$OK
}

ClassMethod OnPreHTTP() As %Library.Boolean
{
    Do %response.SetHeader("Content-Type","text/html") 
    if $d(%request.Data("download",1))
    {
       Do %response.SetHeader("Content-Disposition: attachment; filename=","C:\AppServ\vakata-jstree-0097fab\dist\demo.html") 
    }
    q 1
}

ClassMethod GetDataJSON()
{
  &HTML<
  <li data-jstree='{"opened":true,"selected":false ,"icon":"%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.class.cls" }'>User.test
    <ul>
       <!--li data-jstree='{"disabled":true}'> Child</li-->
       <li data-jstree='{"icon":"%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.parameter.cls"}'>Parameter</li>
       <li data-jstree='{"icon":"%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.propertie.cls"}'>Property</li>
       <li data-jstree='{"icon":"%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.method.cls"}'>Method</li>
       <li data-jstree='{"icon":"%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.query.cls"}'>Query</li>
       <li data-jstree='{"icon":"%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.xdata.cls"}'>XData</li>
    </ul>
  </li>
    
   >
}

XData XDataContet
{
<data>
<html>
<head>
  <meta charset="utf-8"/>
  <title>jsTree test</title>
  <link   href="%25ZWebDev.Lib.jquery.plagin.TreeView.themes.default.style.min.cls"  rel="stylesheet" />
  <script src="%25ZWebDev.Lib.jquery.plagin.TreeView.libs.jquery.min.cls"></script>
  <script src="%25ZWebDev.Lib.jquery.plagin.TreeView.jstree.min.cls"></script>
</head>
<body>
  <div id="jstree"></div>
  <button>demo button</button>
  <script>
  $(function () {
	  
 
 $('#jstree').jstree({
  'core' : {
    'data' : {
      'url' : '%25ZWebDev.Lib.jquery.plagin.TreeView.demo.demo4.cls?GetDataJSON=1',
      'data' : function (node) {  return { 'id' : node.id };  }
    }
  },
  "checkbox" : {
    "keep_selected_style" : false
  },
  "plugins" : [ "wholerow", "checkbox" ]
  
});
 
 
 
    $('#jstree').on("changed.jstree", function (e, data) {
       console.log(data.selected);
    });
    $('button').on('click', function () {
        $('#jstree').jstree(true).select_node('child_node_1');
        $('#jstree').jstree('select_node', 'child_node_1');
        $.jstree.reference('#jstree').select_node('child_node_1');
    });
  });
  </script>
</body>
</html>
 
</data>
}

}

