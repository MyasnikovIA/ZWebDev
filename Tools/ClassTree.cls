Class %ZWebDev.Tools.ClassTree Extends %CSP.Page
{

/// Путь к форме редактирования свойств класса
Parameter URLEditClass = "Developper.Studio.Editor.Class.cls";

/// Путь к форме редактирования свойств полей класса
Parameter URLEditClassProperty = "Developper.Studio.Editor.Property.cls";

/// Путь к форме редактирования свойств параметров
Parameter URLEditClassParameter = "Developper.Studio.Editor.Parameter.cls";

/// Путь к форме редактирования свойств методов класса
Parameter URLEditClassMethod = "Developper.Studio.Editor.Method.cls";

/// Путь к форме редактирования свойств SQL запроса
Parameter URLEditClassQuery = "Developper.Studio.Editor.Query.cls";

/// Путь к форме редактирования свойств XData
Parameter URLEditClassXData = "Developper.Studio.Editor.XData.cls";

/// Путь к форме редактирования MAC программ
Parameter URLEditRoutine = "Developper.Studio.Editor.Routine.cls";

/// Путь к форме редактирования CSP файлов
Parameter URLEditCSPFile = "Developper.Studio.Editor.CSP.cls";

/// Путь к форме редактирования свойств Глобала
Parameter URLEditGlobal = "Developper.Studio.Editor.Global.cls";

/// Путь к редактированию Rest классов
Parameter URLEditRestclass = "Developper.Studio.Editor.Global.cls";

/// Путь к форме редактирования свойств методов класса
Parameter URLEditRestClassMethod = "Developper.Studio.Editor.Method.cls";

/// Путь к форме редактирования свойств Глобала
Parameter HistoryGlobal = "^mtempHistor";

ClassMethod OnPage() As %Status
{
    do ##class(%ZEN.Auxiliary.jsonProvider).%ConvertJSONToObject(%request.Get("json","{}"),,.override,1)

    ; set ^%deb5=%request.Get("json","{}")
    if $d(%request.Data("LoadTree",1)) {
       d ##class(%ZWebDev.Tools.ClassTree).LoadTree(%request.Get("json",""))
       Quit $$$OK
    }
     
 &html<
<head>
  <title>Web SMWrap</title>
  
  
  	  <script type="text/javascript" src="%25ZWebDev.Lib.js.cls"></script>
	  <script src='%25ZWebDev.Lib.jquery.v320.min.js.cls'  language='JavaScript'></script>  
	  <script src='%25ZWebDev.Lib.bootstrap.v337.min.js.cls'></script> 
	  <link  href='%25ZWebDev.Lib.bootstrap.v337.min.css.cls'  rel='stylesheet' >   

      <!--script src="%25ZWebDev.Lib.jquery.plagin.TreeView.libs.jquery.min.cls"></script-->
      <link   href="%25ZWebDev.Lib.jquery.plagin.TreeView.themes.default.style.min.cls"  rel="stylesheet" />
      <script src="%25ZWebDev.Lib.jquery.plagin.TreeView.jstree.min.cls"></script>

</head>
 >
    d ..DrawBody()
    Quit $$$OK
}

/// ##class(%ZWebDev.Tools.ClassTree).DrawBody()
ClassMethod DrawBody() As %String
{
   &html<
     <div id="WorkSpaceServerItem"></div> 
   >
  w "<script>" d ..JSTreeClass()   w "</script>"
 	
	q ""
}

ClassMethod JSTreeClass() As %String
{
  &js<
     $(document).ready(function () {
        ParseTree=function (node) { 
              var SelObj={}; SelObj.text=node.text; SelObj.id=node.id;
              var obj=node["data"]
              for (var ind in obj) {
                  if(ind =='parent'){ continue ;}
                  if(ind =='parents'){ continue ;}
                  // w:isData=2 " data-jstree='{""icon"":"""_override.%data(ind)_"""}' "
                  var val=obj[ind];
                  if (typeof val === 'object'){
	                if (obj[ind]["icon"]!=undefined){
		               SelObj["icon"]=obj[ind]["icon"];
	                }   
	              }else{
                     SelObj[ind]=val;
                  }
               }
             return JSON.stringify(SelObj);
        }        
     
      #(##class(%ZWebDev.Tools.ClassTree.ContextMenu).Draw())# 
     
      $("#WorkSpaceServerItem").jstree({
            "core" : {
                "check_callback" : true,
                'data' : {
                       'url'  : function (node) { 
                             SelectItem=ParseTree(node);
                             // console.log(SelectItem);
                             if (typeof window.top.SelectItem!=='undefined'){
                                parent.SelectItem=SelectItem;
                             }
                             return '%25ZWebDev.Tools.ClassTree.cls?LoadTree='+node.id+"&json="+SelectItem;}
                      ,'data' : function (node) {  return { 'id' : node.id }; }
                }
             },"plugins" : [  "wholerow" ,"contextmenu"]
              , "contextmenu":ContextMenuWorkSpace
         });
          
         var SelectItem=""; 
         var SelectItemArr=[];
         $("#WorkSpaceServerItem").on("changed.jstree", function (e, data) {
                var node =data.instance.get_node(data.selected[0]);
                SelectItem=ParseTree(node);
                // console.log(SelectItem);
                if (typeof window.top.SelectItem!=='undefined'){
                      parent.SelectItem=SelectItem;
                }
                localStorage.setItem('SelectItem',SelectItem);
                var res=#server(..onClick(SelectItem))#;
                try { eval(res); }catch (e) { alert(res);}
         });
         /// открываем объект из области сервера
         $("#WorkSpaceServerItem").on("dblclick", function () {
             var item=localStorage.getItem('SelectItem');
             // window.top.display();
             window.top.addTab(SelectItem);
             // var res=#server(..onDblClick(item))#;
             // try { eval(res); }catch (e) { alert(res);}
         });
         //  $("#WorkSpaceServerItem").on("dblclick",dblClickTree);

    
         
     });
    >
   q ""
}

/// Клик на объект
ClassMethod onClick(override = "") As %String
{
   d ..SetSession("SelectItem",override)
   q ""
}

/// Рисуем закладки
ClassMethod DrawTabs() As %String
{
  
   s href=$lb("#ProjectTree","#WorkSpaceTree","#HistorySpaceTree")
   s text=$lb("Project","Work space","History")
   s active= ..GetSession("SelectActiveTab","")
   for ind=1:1:$ll(href){
	 s hrefOne=$lg(href,ind)
	 w "<li "
	 if hrefOne=active  w " class='active' "
     w "><a href='"_hrefOne_"' "
     w " data-toggle='tab'>"
     w $lg(text,ind)
     w "</a></li>",!
   }
   
   /*
   &html<
     <li class="active"><a href="#ProjectTree"      data-toggle="tab">Project   </a></li>
     <li               ><a href="#WorkSpaceTree"    data-toggle="tab">Work space</a></li>
     <li               ><a href="#HistorySpaceTree" data-toggle="tab">History</a></li>
   >
   */
   
   q ""
}

/// Добавление записи в дерево
ClassMethod addRec(override = "", icon = "", Data = "")
{
       q:override=""
       s text=override.text
       if text="" s text=override.id
          w "<li class='jstree-closed' "
          s ind=""
          for {
             s ind=$o(override.%data(ind))
             q:ind=""
             s name=$zcvt(ind,"L")
             s isData=1
             s:name="id" isData=0
             continue:name="text"
             s:name="icon" isData=2
             w:isData=1 " data-"_name_"="""_override.%data(ind)_""" "
             w:isData=2 " data-jstree='{""icon"":"""_override.%data(ind)_"""}' "
             w:isData=0 " "_name_"="""_override.%data(ind)_""" "
             w !
          }
          w "  "_Data_" >"_text_"</li>"
}

/// Заполняем дерево элементами
ClassMethod LoadTree(override = "", DrawGlobal = 0)
{
   ;   d:override="" ##class(%ZEN.Auxiliary.jsonProvider).%ConvertJSONToObject("{}",,.override,1)
   ;   k ^SPOOL($JOB)
   ;   O 2:($job) 
   ;   U 2:($job)
   ;   zw override
   ;   w !,"============================",!
   ;   s data=override.data
   ;   zw data
   ;   c 2:($job)  
   ;   ; k ^SPOOL($JOB)
    ; s ^%deb5=override
    if override = ""{
       d ..drawNameSpace()
       q
    }
    d ##class(%ZEN.Auxiliary.jsonProvider).%ConvertJSONToObject(override,,.override,1)
    s oldNS=$ZU(5)
    s:override.namespace="" override.namespace=$ZU(5)
    d $zu(5,override.namespace)
    s override.order=-1
    if override.block="NameSpace" {
        d ..drawBlockNameSpace(override,DrawGlobal)
        d $zu(5,oldNS)  q
    }
    if override.block="ClassList" {
        d ..drawClassList(override)
        d $zu(5,oldNS)  q
    }
    
    if override.block="RESTList" {
        d ..drawRESTList(override)
        d $zu(5,oldNS)  q
    }
    
    
    if override.block="CspAppList" {
        d ..drawCSPApplicatio(override)
        d $zu(5,oldNS)  q
    }
    if override.block="CspList" {
         d ..drawCSPList(override)
         d $zu(5,oldNS)  q
    }
    //if override.block="CspList" {
    //     d ..drawCSPList(override)
    //     d $zu(5,oldNS)  q
   // }
    if override.block="RoutineList" {
         d ..drawRoutineList(override)
         d $zu(5,oldNS)  q
    }
    if override.block="Class" {
         d ..drawClassComponent(override)
          d $zu(5,oldNS)  q
    }


   if override.block="Restclass"{
         s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.method.cls"
         s override.block="ClassMethod"
         s override.icon=icon
         s override.urledit=..#URLEditRestClassMethod
         d ..drawClassComponentList(override,"m")
         d $zu(5,oldNS)  q
    }
    

    if override.block="ClassParametrList"{
         s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.parameter.cls"
         s override.block="ClassParametr"
         s override.icon=icon
         s override.urledit=..#URLEditClassParameter
         d ..drawClassComponentList(override,"p")
         d $zu(5,oldNS)  q
    }


    if override.block="ClassPropertyList"{
         s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.propertie.cls"
         s override.block="ClassProperty"
         s override.icon=icon
         s override.urledit=..#URLEditClassProperty
         d ..drawClassComponentList(override,"a")
         d $zu(5,oldNS)  q
    }

    if override.block="ClassXDataList"{
         s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.xdata.cls"
         s override.block="ClassXData"
         s override.icon=icon
         s override.urledit=..#URLEditClassXData
         d ..drawClassComponentList(override,"x")
         d $zu(5,oldNS)  q
    }
    
    if override.block="ClassQueryList"{
         s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.query.cls"
         s override.block="ClassQuery"
         s override.icon=icon
         s override.urledit=..#URLEditClassQuery
         d ..drawClassComponentList(override,"q")
         d $zu(5,oldNS)  q
    }
    
    if override.block="ClassMethodList"{
         s icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.method.cls"
         s override.block="ClassMethod"
         s override.icon=icon
         s override.urledit=..#URLEditClassMethod
         d ..drawClassComponentList(override,"m")
         d $zu(5,oldNS)  q
    }
    
    if override.block="ClassProperty"{
         s override.block="Class"
         d ..drawClassParentProperty(override)
         d $zu(5,oldNS)  q
    }
    
    if override.block="GlobalList"{
         s override.block="Global"
         d ..drawGlobalList(override)
         d $zu(5,oldNS)  q
    }
    
    if override.block="Global"{
         s override.block="Global"
         d ..drawGlobalList(override)
         d $zu(5,oldNS)  q
    }
    d $zu(5,oldNS) 
    q
}

ClassMethod drawGlobalList(override)
{
    if override.global=""{
          s gl="inv"
          s NameSpace=$ZU(5)
          D GetDirNSP^%SYS.GD($ZU(5),gl) 
          s GlobalName=""
          s ind=0
          for {
             s GlobalName=$O(@gl@(GlobalName),override.order)
             q:GlobalName=""
             if $l(GlobalName,"%")>1,NameSpace'="%SYS" continue
             s override.global=$system.Encryption.Base64Encode("^"_GlobalName)
             s override.text="^"_GlobalName
             s override.id=override.block_":"_override.namespace_":"_$random(999999999)
             s override.icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.globals.cls"
             d ..addRec(override)       
          }    
    }else{
       s ind=""
       s gbl=$system.Encryption.Base64Decode(override.global)
       k filtr
       s name=""
       s countRaw=0,addContinue=0
       for {
         s ind=$o(@gbl@(ind),override.order)
         q:ind=""
         s name=$name(@gbl@(ind))
         if '$d(filtr(name)){
            s countRaw=countRaw+1
            s filtr(name)=""
            s override.global=$system.Encryption.Base64Encode(name)
            if $d(@name)=11{
              s val=@name 
              s isScob=0
              s:$l($tr(val,"0123456789.",""))>0 isScob=1
              if isScob=1 {
                s override.text=name_"="_val
              }else{
                if $l(val)>30 s val=$e(val,1,30)_"......"
                s override.text=name_"="""_val_""""
                
              }
            }else{
              s override.text=name   
            }
            s override.id=override.block_":"_override.namespace_":"_$random(999999999)
            s override.icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.globals.cls"
            s override.urledit=..#URLEditGlobal
            d ..addRec(override)
            if countRaw>1000 {
              s indTmp=$o(@gbl@(ind))
              s:$l(indTmp)>0 addContinue=1
              q
            }
         } 
       }
       if addContinue=1 {
         s override.global=$system.Encryption.Base64Encode(name)
         s override.text="..."
         s override.id=override.block_":"_override.namespace_":"_$random(999999999)
         s override.icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.globals.cls"
         d ..addRec(override)
       }
       
       
       
    }
}

/// Показать класс  
ClassMethod drawClassParentProperty(override)
{
   s classname=override.cacheclass
   s PropertyName=override.objectname
   k override.%data("objectname")
   ;  ^oddDEF("Abonents.AbDocHistory","a","DocDate",5)="%Date"
   if $d(^oddDEF(classname)),$d(^oddDEF(classname,"a")),$d(^oddDEF(classname,"a",PropertyName)),$d(^oddDEF(classname,"a",PropertyName,5)) {
      s SuperClass=^oddDEF(classname,"a",PropertyName,5) 
      if $l(SuperClass,".")=1 {
         if $e(SuperClass,1,1)="%"{  s SuperClass="%Library."_$e(SuperClass,2,$l(SuperClass)) }
         else{  s SuperClass="User."_$e(SuperClass,2,$l(SuperClass)) }
      }
      if $d(^oddDEF(SuperClass)){
         s override.parentclassname=classname
         s override.cacheclass=SuperClass
         s override.block="Class"
         s override.text=SuperClass
         s override.id=override.block_":"_$zcvt(override.namespace,"L")_":"_override.cacheclass
         s override.window=override.id
         s override.urledit=..#URLEditClass
         s override.icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.class.cls"
         d ..addRec(override)       
      }
   }
   q ""
}

///  создать список параметров
ClassMethod drawClassComponentList(override, Blc = "m")
{
     s NameSpace=override.namespace
     s classname=override.cacheclass
     if $d(^oddDEF(classname)),$d(^oddDEF(classname,Blc)){
        s ParamName=""
        for {
           s ParamName=$o(^oddDEF(classname,Blc,ParamName),override.order)
           q:ParamName=""
           ; s txt=BlocName_":"_NameSpace_":"_classname_":"_ParamName
           s override.text=ParamName
           s override.objectname=ParamName
           s override.id=override.block_":"_$zcvt(override.namespace,"L")_":"_override.cacheclass_":"_ParamName
           s override.window=override.id
           d ..addRec(override)   
        }
    }
}

ClassMethod drawClassComponent(override) [ ProcedureBlock = 1 ]
{
         s override.block="ClassParametrList"
         s override.text="Parameter"
         s override.id=override.block_":"_override.namespace_":"_override.cacheclass
         s override.icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.parameter.cls"
         d ..addRec(override )   
         
         s override.block="ClassPropertyList"
         s override.text="Property"
         s override.id=override.block_":"_override.namespace_":"_override.cacheclass
         s override.icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.propertie.cls"
         d ..addRec(override)   
         
         s override.block="ClassMethodList"
         s override.text="Method"
         s override.id=override.block_":"_override.namespace_":"_override.cacheclass
         s override.icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.method.cls"
         d ..addRec(override )   
         
         s override.block="ClassQueryList"
         s override.text="Query"
         s override.id=override.block_":"_override.namespace_":"_override.cacheclass
         s override.icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.query.cls"
         d ..addRec(override )   
         
         s override.block="ClassXDataList"
         s override.text="XData"
         s override.id=override.block_":"_override.namespace_":"_override.cacheclass
         s override.icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.xdata.cls"
         d ..addRec(override )
}

/// добавить список классов
ClassMethod drawRoutineList(override) [ ProcedureBlock = 1 ]
{
  s glList=$lb()
  s $li(glList,1)=$lb("^rMAC"   ,"mac","%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.routine.cls")
  s $li(glList,2)=$lb("^rINC"   ,"inc","%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.inc.cls")
  ; s $li(glList,3)=$lb("^ROUTINE","int","%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.int.cls")

  s NameSpace= override.namespace
  s SelectTreeName=override.routine

  for ind=1:1:$ll(glList){
      k filtr
      k sortPack,sort
      s gl  = $lg( $lg(glList,ind) , 1 )
      s exe = $lg( $lg(glList,ind) , 2 )
      s icon= $lg( $lg(glList,ind) , 3 )
      s classname=""
      for {
         s classname=$o(@gl@(classname))
         q:classname=""
         ; if $l(routine,"%")>1,$zcvt(routine,"U")'="%SYS" continue
              
         if SelectTreeName'=""{
            if $l(classname)<$l(SelectTreeName) { continue  }
            if $e(classname,1,$l(SelectTreeName))'=SelectTreeName { continue  }
         }
         if $l(classname,"%")>1,$zcvt(NameSpace,"U")'="%SYS" continue
         s packDraw=$e(classname,$l(SelectTreeName),$l(classname))
         if $e(packDraw,1,1)="."  s packDraw=$e(packDraw,2,$l(packDraw))
         s pack=$p(packDraw,".",1)
         if $d(filtr(pack)){ continue  }
         s filtr(pack)=1
         if SelectTreeName_pack'=classname{
            s txt="RoutineList:"_NameSpace_":"_SelectTreeName_pack_"."
            s sortPack(txt)=pack
            s override.block="RoutineList"
            s override.routine=SelectTreeName_pack_"."
            s override.text=pack
            s override.id=txt
            s override.icon=""
            d ..addRec(override)   
            // d ..addRec(txt,pack)   
         }else{
            s shotName=$p(classname,".",$l(classname,".")) 
            s txt="Routine:"_$zcvt(NameSpace,"L")_":"_classname_"."_exe
            s sort(txt)=$lb(shotName_"."_exe,icon)
            // d ..addRec(txt ,shotName_"."_exe,icon)
            s override.block="Routine"
            s override.routine=classname_"."_exe
            s override.text=shotName_"."_exe
            s override.id=txt
            s override.icon=icon
            s override.window=txt
            s override.urledit=..#URLEditRoutine
            d ..addRec(override)   
         }
      }
   }
}

ClassMethod drawCSPList(override)
{
   s Slash=##class(%ZWebDev.Lib.js).GetSlash()
   s appUrl=override.application
   s Dir=override.file
   s NameSpace=override.namespace
   s StartDir=$$GetFilename^%apiCSP(appUrl_"/")
   s StartPath=$e(StartDir,1,$l(StartDir)-$l(appUrl))
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
        s override.block="CspList"
        s override.file=dir
        s override.id="CspList:"_NameSpace_":"_dir_":"_appUrl
        s override.text=$p(name,Slash,$l(name,Slash))
        s override.onedir=OneDir
        s override.startdir=StartDir
        s override.icon=""
        s override.window=""
        s override.urledit=""
        s override.application=appUrl
        s override.isDir=1
        k override.%data("url")
        k override.%data("rashirenie")
        d ..addRec(override)       
        ; d ..addRec("CspList:"_NameSpace_":"_dir_":"_appUrl ,$p(name,Slash,$l(name,Slash)))
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
        
        s override.block="CspFile"
        s override.file=name
        s override.rashirenie=Rash
        s override.id="CspFile:"_NameSpace_":"_dir_":"_appUrl
        s override.text=$p(name,Slash,$l(name,Slash))
        s override.startdir=StartDir
        s override.icon=icon
        s override.window="CspFile:"_$zcvt(NameSpace,"L")_":"_override.text_":"_$system.Encryption.Base64Encode(name)
        s override.application=appUrl
        s override.url=$lg($system.CSP.FilenameToUrls(name))
        s override.isDir=0
        // "CspFile:"_NameSpace_":"_override.text_":"_$system.Encryption.Base64Encode(override.id)
        s override.urledit=..#URLEditCSPFile
        d ..addRec(override)
        
        // d ..addRec("CspFile:"_NameSpace_":"_dir_":"_appUrl ,$p(name,Slash,$l(name,Slash)),icon)
        // s @gl@(name)=$SYSTEM.CSP.FilenameToUrls(name)
     }
  }
   
   ; d ..addRec("Csp:"_NameSpace_":"_dir ,dir,"%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.csp.cls")
   
   q
}

/// добавить список классов
/// d ##class(HTML.jquery.plagin.TreeView.demo.demo7).drawCSPApplicatio()
ClassMethod drawCSPApplicatio(override)
{
     s oldNSTmp=$zu(5)
     d $zu(5,"%SYS")
     s SQLobj=##class(%SQL.Statement).%New()
     s SqlStr="Select Name,NameSpace,Type,Path,NameLowerCase  from  Security.Applications where NameSpace='"_override.namespace_"'  "
     d SQLobj.%Prepare(SqlStr)
     s DataSet=SQLobj.%Execute()
     while DataSet.%Next()
     {
         if $l(DataSet.NameLowerCase)>0,$l(DataSet.Path)=0 continue
         s override.application=DataSet.Name
         s override.block="CspList"
         s override.text=DataSet.Name
         s override.id="CspList:"_override.namespace_"::"_DataSet.Name_":"
         s override.icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.csp.cls"
         d ..addRec(override)       
     }
     d $zu(5,oldNSTmp)
     q
}

/// добавить список классов
ClassMethod drawRESTList(override)
{
  k filtr
  s classname=""
  s SelectTreeName=override.cacheclass
  for {
     s classname=$o(^oddDEF(classname))
     q:classname=""
     if $l(classname,"%")>1,$zcvt(override.namespace,"U")'="%SYS" continue
     if '$d(^oddDEF(classname,60)) continue
     if ^oddDEF(classname,60)'="%CSP.REST" continue
     
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
       s override.cacheclass=SelectTreeName_pack_"."
       s override.isdir=1
       s override.text=pack
       s override.block="RESTList"
       s override.id=override.block_":"_override.namespace_":"_SelectTreeName_pack_"."
       s override.icon=""
       d ..addRec(override)   
     }else{
       s ShotName=$p(classname,".",$l(classname,".")) 
       s override.cacheclass=SelectTreeName_pack
       s override.block="Restclass"
       s override.isdir=0
       s override.text=ShotName
       s override.id=override.block_":"_override.namespace_":"_classname
       s override.icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.rest.cls"
       s override.window=override.block_":"_$zcvt(override.namespace,"L")_":"_classname
       s override.urledit=..#URLEditRestclass
       d ..addRec(override)       
     }
  }
}

/// добавить список классов
ClassMethod drawClassList(override)
{
  k filtr
  s classname=""
  s SelectTreeName=override.cacheclass
  for {
     s classname=$o(^oddDEF(classname))
     q:classname=""
     if $l(classname,"%")>1,$zcvt(override.namespace,"U")'="%SYS" continue
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
       s override.cacheclass=SelectTreeName_pack_"."
       s override.isdir=1
       s override.text=pack
       s override.block="ClassList"
       s override.id=override.block_":"_override.namespace_":"_SelectTreeName_pack_"."
       s override.icon=""
       d ..addRec(override)   
     }else{
       s ShotName=$p(classname,".",$l(classname,".")) 
       s override.cacheclass=SelectTreeName_pack
       s override.block="Class"
       s override.isdir=0
       s override.text=ShotName
       s override.id=override.block_":"_override.namespace_":"_classname
       s override.icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.class.cls"
       s override.window=override.block_":"_$zcvt(override.namespace,"L")_":"_classname
       s override.urledit=..#URLEditClass
       d ..addRec(override)       
     }
  }
}

/// добавить список блоков в области имен (классы,рутины,глобалы,CSP)
ClassMethod drawBlockNameSpace(override, DrawGlobal = 0)
{
   // s override.block="ClassList",override.text="Class" 
   &HTML< <ul> >
       s override.block="RESTList",override.text="RESTclass",override.id="RESTList"_override.namespace
       s override.icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.rest.cls"
       d ..addRec(override)   
       s override.block="ClassList",override.text="Class",override.id="ClassList:"_override.namespace
       s override.icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.class.cls"
       d ..addRec(override)   
       s override.block="RoutineList",override.text="Routine",override.id="RoutineList:"_override.namespace 
       s override.icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.routine.cls"
       d ..addRec(override)   
       s override.block="CspAppList",override.text="CSP" ,override.id="CspAppList:"_override.namespace 
       s override.icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.csp.cls"
       d ..addRec(override)
       if DrawGlobal=1 {
         s override.block="GlobalList",override.text="Global" ,override.id="GlobalList:"_override.namespace 
         s override.icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.globals.cls"
         d ..addRec(override)
       }
   &HTML< </ul> >
}

ClassMethod drawNameSpace(override = "")
{
    s:override="" override=##class(%ZEN.proxyObject).%New()
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
       s override.text=ind
       s override.block="NameSpace"
       s override.namespace=ind
       s override.icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.namespace.cls"
       d ..addRec(override)
    }
    &HTML< </ul> >
}

///  w ##class(Developper.SMWrap.Auth).GetIP()
ClassMethod GetIP() As %String
{
	// Если сессия мертва, и время прошло более суток, тогда удаляем данные
	s I=$ZU(111,0)   
    s ip=$A(I,1)_"."_$A(I,2)_"."_$A(I,3)_"."_$A(I,4)
    k I
    if $l(ip)=0 s ip=$ZU(67, 15, $job)
	q ip
}

ClassMethod SetSession(KEY As %String, VAL As %String)
{
	s %session=$get(%session,"")
	Q:%session=""
	s ip=..GetIP()
	if $d(^mtempSession(ip)){
	  if $p($h,",",1)>$lg(^mtempSession(ip),2) {     ; если IP сесия жева более суток 
		  if $d(%session),'$d(^%cspSession( %session.SessionId)){ ; есди сесии нет в списке
		     k ^mtempSession(ip)                     ; очищаем данные.                
		  }
	  }
	}
	;                               id сесии      Date           Time
	s ^mtempSession(ip)=$lb(%session.SessionId,$p($h,",",1),$p($h,",",2))
	s ^mtempSession(ip,KEY)=VAL
    
    // do %session.Set(KEY,VAL)
}

ClassMethod GetSession(Akey As %String, Adef As %String = "") As %String
{
	s %session=$get(%session,"")
	Q:%session=""
    s ip=..GetIP()
	s ^mtempSession(ip)=$lb(%session.SessionId,$p($h,",",1),$p($h,",",2))
	q:'$d(^mtempSession(ip)) Adef
    q:'$d(^mtempSession(ip,Akey)) Adef   
    q ^mtempSession(ip,Akey)  
    // quit %session.Get(Akey,Adef)
}

ClassMethod KillSession(Akey As %String = "")
{
	s %session=$get(%session,"")
	Q:%session=""
	; s ip=$ZU(67, 15, $job)
    s ip=..GetIP()
	s ^mtempSession(ip)=$lb(%session.SessionId,$p($h,",",1),$p($h,",",2))
	; k:Akey="" ^mtempSession(ip)
	k ^mtempSession(ip,Akey)
	// do %session.Kill(Akey)
}

/// Двойной клик на объект
ClassMethod onDblClick(override = "") As %String
{
   
  ; if override="" {
  ;    s override=..GetSession("SelectItem","")
  ; }
   q:override="" ""
   s json=override 
   s json=$zcvt(json,"I","URL")
   do ##class(%ZEN.Auxiliary.jsonProvider).%ConvertJSONToObject(override,,.overrideTmp,1)
   
  ; if $d(overrideTmp.%data("window")),$l(overrideTmp.%data("window"))>0, $d(overrideTmp.%data("urledit")) {
  ;	  s gl="^mtempHistor"
  ;	  s ip=..GetIP()
  ;	  s @gl@(ip,overrideTmp.window)=json
  ;     &js< $('#WorkSpaceServerItem').jstree().refresh();  >
  ; }
   
   if $d(overrideTmp.%data("urledit")) {
	   if '$d(overrideTmp.%data("window")){
		   s overrideTmp.window=overrideTmp.%data("urledit")
	   }
	   &js<
	       var w =-30+screen.width;
	       var h =-120+screen.height;
	       var y = 10;
	       var x = 400;
	   	   var win=window.open('#(overrideTmp.urledit)#?json=#(json)#',"#(overrideTmp.window)#" , 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + y + ', left=' + x);
               win.focus();
	   >
   }
   // s override.window
   // s override.urledit=..#URLEditClass
   q ""
}

}

