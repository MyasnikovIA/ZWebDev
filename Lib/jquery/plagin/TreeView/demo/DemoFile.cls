/// 
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.DemoFile Extends %CSP.Page
{

/// Корневой каталог, от которого начинается сканирование
Parameter RootDir = "d:\";

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

ClassMethod OnPage() As %Status
{
    if $d(%request.Data("LoadTree",1)) {
      d ..LoadTree(%request.Get("LoadTree",""))
      Quit $$$OK
   }
   // Выводим HTML
   d ..DrawXdata("XDataContet")
   Quit $$$OK
}

XData XDataContet
{
<data>
<html>
<head>
  <meta charset="utf-8"/>
  <title>jsTree File</title>
  <link   href="%25ZWebDev.Lib.jquery.plagin.TreeView.themes.default.style.min.cls"  rel="stylesheet" />
  <script src="%25ZWebDev.Lib.jquery.plagin.TreeView.libs.jquery.min.cls"></script>
  <script src="%25ZWebDev.Lib.jquery.plagin.TreeView.jstree.min.cls"></script>
</head>
<body>
  <pre><div id="event_result" >Список выбранных объектов</div></pre>
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
     
 
 $('#jstree').jstree({
  'core' : {
    'data' : {
        'url' : function (node) {
           // console.log(node);
           return '%25ZWebDev.Lib.jquery.plagin.TreeView.demo.DemoFile.cls?LoadTree='+node.id;
        }
        ,'data' : function (node) {  return { 'id' : node.id };  }
    }
  },
   "checkbox" : {  "keep_selected_style" : false}
  , "plugins" : [ "wholerow", "checkbox" ]
}).jstree();;
 
 
    var ActiveTreeSelect=""; 
    var ArrayTreeSelect=[]; 
    $('#jstree').on("changed.jstree", function (e, data) {
	    ActiveTreeSelect=data.selected;
        console.log(data.selected);
        /// сохраняем список
        var i, j, ArrayTreeSelect = [];
        for(i = 0, j = data.selected.length; i < j; i++) {
           // ArrayTreeSelect.push(data.instance.get_node(data.selected[i]).text);
           ArrayTreeSelect.push(data.selected);
        }
        $('#event_result').html('Selected: ' + ArrayTreeSelect.join(', '));
    });
    
    $('#jstree').on("dblclick", function () {
	    alert(ActiveTreeSelect);
    });

    /// принудительно выбрать ветку
    $('button').on('click', function () {
        $('#jstree').jstree(true).select_node('child_node_1');
        $('#jstree').jstree('child_node_1', 'child_node_1');
        $.jstree.reference('#jstree').select_node('child_node_1');
    });
  });
  </script>
</body>
</html>
 
</data>
}

/// Добавление записи в дерево
ClassMethod addRec(id = "", text = "", icon = "", title = "")
{
     if id'="",text=""{
        s text=id
     }
     if icon'="" {
       &html< <li class='jstree-closed'
                   id='#(id)#'
                   data-jstree='{"icon":"#(icon)#"}'
                 >#(text)#</li>
         >
    }else{
       &html< <li class='jstree-closed'
                   id='#(id)#'
                >#(text)#</li>
         >
    }
}

ClassMethod drawCSPList(Dir = "")
{
   s slash=##class(%ZWebDev.Lib.js).GetSlash()
   if Dir="" {
	  if slash="\" s Dir="c:\"
	  if slash="/" s Dir="/"
   }
   s Dir=$tr(Dir,"$",":")
   
   s filter=""
   s rs = ##class(%Library.ResultSet).%New("%Library.File:FileSet")
   s sc = rs.Execute(Dir,filter,"Name")
   k DirTmp,FileTmp
   while rs.Next()
   {
     s name = rs.Get("Name")
     s dir=$tr(name,":","$")
     if (rs.Get("Type") = "D")
     {
	    s DirTmp(dir)=name
	    // d ..addRec("D:"_dir ,$p(name,slash,$l(name,slash)))
     }else{
	   s FileTmp(dir)=name
     }
  }
     /// сортировка
     s dir=""
     for {
        s dir=$o(DirTmp(dir))
        q:dir=""
        s name=DirTmp(dir)
        d ..addRec("D:"_dir ,$p(name,slash,$l(name,slash)))
     }
     s dir=""
     for {
        s dir=$o(FileTmp(dir))
        q:dir=""
        s name=FileTmp(dir)
        s Rash=$zcvt($p(name,".",$l(name,".")),"L")
	    s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.csp.cls"
	    if Rash="html" s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.html.cls"
	    if Rash="htm" s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.html.cls"
	    if Rash="js" s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.js.cls"
	    if Rash="css" s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.css.cls"
	    if Rash="bmp" s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.bmp.cls"
	    if Rash="jpg" s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.jpg.cls"
	    if Rash="jpeg" s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.jpg.cls"
	    if Rash="png" s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.jpg.cls"
	    if Rash="xml" s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.xml.cls"
	    if Rash="rar" s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.arhiv.cls"
	    if Rash="zip" s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.arhiv.cls"
	    if Rash="7z" s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.arhiv.cls"
	    if Rash="xls" s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.exel.cls"
	    if Rash="txt" s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.txt.cls"
	    if Rash="csv" s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.txt.cls"
	    if Rash="log" s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.txt.cls"
	    if Rash="fp3" s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.fr3.cls"
	    if Rash="doc" s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.doc.cls"
	    d ..addRec("F:"_dir ,$p(name,slash,$l(name,slash)),icon)
     }
  q
}

/// Заполняем дерево элементами
ClassMethod LoadTree(SelectTreeName = "")
{
   s dir=$p(SelectTreeName,":",2)
   d ..drawCSPList(dir)
   q
}

}

