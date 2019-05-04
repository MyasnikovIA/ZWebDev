/// https://www.jstree.com/docs/json/
/// https://www.jstree.com/docs/html/
/// https://www.jstree.com/docs/config/
/// https://www.jstree.com/docs/events/
/// https://www.jstree.com/demo/
/// https://www.jstree.com/
/// https://www.jstree.com/demo_filebrowser/index.php
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.demo1 Extends %CSP.Page
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

Parameter DstName = "%ZWebDev.Lib.jquery.plagin.TreeView.demo.demo1.cls";

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

XData XDataContet
{
<data>
<html>
<head>
  <meta charset="utf-8"/>
  <title>jsTree test</title>
  <script src='%25ZWebDev.Lib.jquery.plagin.TreeView.libs.jquery.min.cls'></script>  
  <link   href="%25ZWebDev.Lib.jquery.plagin.TreeView.themes.default.style.min.cls"  rel="stylesheet" />
  <script src="%25ZWebDev.Lib.jquery.v331.js.cls"></script>
  <script src="%25ZWebDev.Lib.jquery.plagin.TreeView.jstree.min.cls"></script>
</head>
<body>
  <div id="jstree">
    <ul>
      <li>Root node 1
        <ul>
          <li id="child_node_1">Child node 1</li>
          <li>Child node 2</li>
        </ul>
      </li>
      <li>Root node 2</li>
    </ul>
  </div>
  <button>demo button</button>
  <script>
  $(function () {
    $('#jstree').jstree();
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

