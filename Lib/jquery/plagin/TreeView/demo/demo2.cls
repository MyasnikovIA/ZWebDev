/// 
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.demo2 Extends %CSP.Page
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

Parameter DstName = "%ZWebDev.Lib.jquery.plagin.TreeView.demo.demo2.cls";

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

ClassMethod GetDataJSON()
{
	
	/*
{
  id          : "string" // will be autogenerated if omitted
  text        : "string" // node text
  icon        : "string" // string for custom
  state       : {
    opened    : boolean  // is the node open
    disabled  : boolean  // is the node disabled
    selected  : boolean  // is the node selected
  },
  children    : []  // array of strings or objects
  li_attr     : {}  // attributes for the generated LI node
  a_attr      : {}  // attributes for the generated A node
}	
	
	s data=##class(%ZEN.proxyObject).%New()
    s data.id = "User.test"
    s data.text  = "Класс User.test"
    s data.state.opened=1
    */
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
    $('#jstree').jstree({ 'core' : {
       'data' : [
          {"id":41,"parent":"#","text":"администрирование;старших агентов"},
          { "id" : "ajson1", "parent" : "#", "text" : "Simple root node" },
          { "id" : "ajson2", "parent" : "#", "text" : "Root node 2" },
          { "id" : "ajson3", "parent" : "ajson2", "text" : "Child 1" },
          { "id" : "ajson4", "parent" : "ajson2", "text" : "Child 2" },
       ]
    } });
 
 
 
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

