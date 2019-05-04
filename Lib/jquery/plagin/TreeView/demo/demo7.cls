/// 
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.demo7 Extends %CSP.Page
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

ClassMethod OnPage() As %Status
{
    if $d(%request.Data("LoadTree",1)) {
       d ..LoadTree(%request.Get("LoadTree",""))
      Quit $$$OK
   }
    d ..DrawXdata("XDataContet")
    Quit $$$OK
   Quit $$$OK
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
 $('#jstree').jstree({
  'core' : {
    'data' : {
        'url' : function (node) {
           // console.log(node);
           return '%25ZWebDev.Lib.jquery.plagin.TreeView.demo.demo7.cls?LoadTree='+node.id;
        }
        ,'data' : function (node) {  return { 'id' : node.id };  }
    }
  },
  "plugins" : [ "wholerow" ]
  
});
 
 
    var ActiveTreeSelect=""; 
    $('#jstree').on("changed.jstree", function (e, data) {
	    ActiveTreeSelect=data.selected;
        console.log(data.selected);
    });
    
    $('#jstree').on("dblclick", function () {
	    alert(ActiveTreeSelect);
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

/// добавиь в дерево список областей имен
ClassMethod drawNamespace()
{
    k namespace
    For i=1:1:$ZU(90,0){ 
        if $l($ZU(90,2,0,i))>0 s namespace($ZCVT($ZU(90,2,0,i),"L"))=1
    }
    &HTML< <ul> >
    s ind=""
    for {
       s ind=$o(namespace(ind))
       q:ind=""
       if ind="%cachelib" continue
       d ..addRec("NameSpace:"_ind,ind,"%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.namespace.cls")
    }
    &HTML< </ul> >
}

/// добавить список классов
ClassMethod drawClassList(NameSpace = {$zu(5)}, SelectTreeName = "")
{
  s oldNS=$zu(5)
  k filtr
  if NameSpace="" s NameSpace=$zu(5)
  d $zu(5,NameSpace)
  s classname=""
  for {
     s classname=$o(^oddDEF(classname))
     q:classname=""
     if $l(classname,"%")>1,$zcvt(NameSpace,"U")'="%SYS" continue
     if SelectTreeName'=""{
       if $l(classname)<$l(SelectTreeName) { continue  }
       if $e(classname,1,$l(SelectTreeName))'=SelectTreeName { continue  }
     }
     s packDraw=$e(classname,$l(SelectTreeName),$l(classname))
     if $e(packDraw,1,1)="."  s packDraw=$e(packDraw,2,$l(packDraw))
     s pack=$p(packDraw,".",1)
     if $d(filtr(pack)){ continue  }
     s filtr(pack)=1
     if SelectTreeName_pack'=classname{
       d ..addRec("ClassList:"_NameSpace_":"_SelectTreeName_pack_".",pack)   
     }else{
      d ..addRec("Class:"_NameSpace_":"_classname  ,classname,"%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.class.cls")       
     }
  }
  d $zu(5,oldNS)
}

/// добавить список классов
ClassMethod drawRoutineList(NameSpace = {$zu(5)}, SelectTreeName = "", gl = "^rMAC")
{
  s oldNS=$zu(5)
  k filtr
  if NameSpace="" s NameSpace=$zu(5)
  d $zu(5,NameSpace)

  if gl="^rMAC" {
     s exe="mac"
     s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.routine.cls"
  }
  if gl="^rINC" {
     s exe="inc"
     s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.inc.cls"
  }
  if gl="^ROUTINE" {
     s exe="mac"
     s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.routine.cls"
  }

  s classname=""
  for {
     s classname=$o(@gl@(classname))
     q:classname=""
     if SelectTreeName'=""{
       if $l(classname)<$l(SelectTreeName) { continue  }
       if $e(classname,1,$l(SelectTreeName))'=SelectTreeName { continue  }
     }
     s packDraw=$e(classname,$l(SelectTreeName),$l(classname))
     if $e(packDraw,1,1)="."  s packDraw=$e(packDraw,2,$l(packDraw))
     s pack=$p(packDraw,".",1)
     if $d(filtr(pack)){ continue  }
     s filtr(pack)=1
     if SelectTreeName_pack'=classname{
       d ..addRec("RoutineList:"_NameSpace_":"_SelectTreeName_pack_".",pack)   
     }else{
	    s shotName=$p(classname,".",$l(classname,".")) 
      d ..addRec("Routine:"_NameSpace_":"_classname  ,shotName_"."_exe,icon)       
     }
  }
  d $zu(5,oldNS)
}

/// добавить список классов
/// d ##class(%25ZWebDev.Lib.jquery.plagin.TreeView.demo.demo7).drawCSPApplicatio()
ClassMethod drawCSPApplicatio(NameSpace = {$zu(5)})
{
     s oldNS=$zu(5)
     if NameSpace="" s NameSpace=$zu(5)
     d $zu(5,"%SYS")
     s SQLobj=##class(%SQL.Statement).%New()
     s SqlStr="Select Name,NameSpace,Type,Path,NameLowerCase  from Security.Applications where NameSpace='"_NameSpace_"'  "
     d SQLobj.%Prepare(SqlStr)
     s DataSet=SQLobj.%Execute()
     while DataSet.%Next()
     {
	     if $l(DataSet.NameLowerCase)>0,$l(DataSet.Path)=0 continue
         d ..addRec("CspList:"_NameSpace_":"_DataSet.Name_":" ,DataSet.Name,"%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.csp.cls")
     }
  d $zu(5,oldNS)
  q
}

ClassMethod drawCSPList(NameSpace = {$zu(5)}, appUrl = "", Dir = "")
{
   s oldNS=$zu(5)
   if NameSpace="" s NameSpace=$zu(5)
   s StartDir=$$GetFilename^%apiCSP(appUrl_"/")
   s ^%deb=StartDir
   s:Dir="" Dir=##class(%File).NormalizeDirectory($$GetFilename^%apiCSP(appUrl_"/"))
   s Dir=$tr(Dir,"$",":")
   s filter=""
   s rs = ##class(%Library.ResultSet).%New("%Library.File:FileSet")
   s sc = rs.Execute(Dir,filter,"Name")
   while rs.Next()
   {
     s name = rs.Get("Name")
     s dir=$tr(name,":","$")
     if (rs.Get("Type") = "D")
     {
        // d ..GetDir(gl,name)
        s OneDir=$e(name,$l(StartDir),$l(name))
	    d ..addRec("CspList:"_NameSpace_":"_appUrl_":"_dir ,$p(name,"\",$l(name,"\")))
     }else{
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
	    d ..addRec("CspFile:"_NameSpace_":"_appUrl_":"_dir ,$p(name,"\",$l(name,"\")),icon)
        // s @gl@(name)=$SYSTEM.CSP.FilenameToUrls(name)
     }
  }
   
   ; d ..addRec("Csp:"_NameSpace_":"_dir ,dir,"%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.csp.cls")
   
   d $zu(5,oldNS)
   q
}

/// добавить список блоков в области имен (классы,рутины,глобалы,CSP)
ClassMethod drawBlockNameSpace(SelectTreeName = "")
{
   d ..addRec("ClassList:"_SelectTreeName  ,"Class","%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.class.cls")   
   d ..addRec("RoutineList:"_SelectTreeName,"Routine","%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.routine.cls")   
   d ..addRec("CspAppList:"_SelectTreeName    ,"CSP","%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.csp.cls")
   ; d ..addRec("GlobalList:"_SelectTreeName ,"Global","%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.globals.cls")
}

/// Заполняем дерево элементами
ClassMethod LoadTree(SelectTreeName = "")
{
   if SelectTreeName = "" {
      d ..drawNamespace()
      q
   }
   q:$l(SelectTreeName,":")=1 
   set blocSRC=$p(SelectTreeName,":",1)
   
   if blocSRC ="NameSpace" {
      s NameSpace=$p(SelectTreeName,":",2)
      d ..drawBlockNameSpace(NameSpace)
      q
   }
   
   if blocSRC ="ClassList" {
      s NameSpace=$p(SelectTreeName,":",2)
      s fragold=""
      s:$l(SelectTreeName,":")>2 fragold=$p(SelectTreeName,":",3)
      d ..drawClassList(NameSpace,fragold)
      q
   }
   
   if blocSRC ="RoutineList" {
      s NameSpace=$p(SelectTreeName,":",2)
      s fragold=""
      s:$l(SelectTreeName,":")>2 fragold=$p(SelectTreeName,":",3)
      d ..drawRoutineList(NameSpace,fragold,"^rMAC")
      d ..drawRoutineList(NameSpace,fragold,"^rINC")
      d ..drawRoutineList(NameSpace,fragold,"^ROUTINE")
      q
   }
   if blocSRC ="CspAppList" {
       s NameSpace=$p(SelectTreeName,":",2)
       d ..drawCSPApplicatio(NameSpace)
       q
   }
   if blocSRC ="CspList" {
      s NameSpace=$p(SelectTreeName,":",2)
      s appUrl=$p(SelectTreeName,":",3)
      s Dir=$p(SelectTreeName,":",4)
      d ..drawCSPList(NameSpace,appUrl,Dir)
      q
   }
}

}

