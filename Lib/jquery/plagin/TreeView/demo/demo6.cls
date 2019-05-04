/// 
/// https://www.jstree.com/docs/json/
/// https://www.jstree.com/docs/html/
/// https://www.jstree.com/docs/config/
/// https://www.jstree.com/docs/events/
/// https://www.jstree.com/demo/
/// https://www.jstree.com/
/// https://www.jstree.com/demo_filebrowser/index.php
/// 
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.demo6 Extends %CSP.Page
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

Parameter DstName = "%ZWebDev.Lib.jquery.plagin.TreeView.demo.demo6.cls";

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
       d ..GetDataJSON(%request.Get("GetDataJSON",""))
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

/// получить список полей
ClassMethod GetData(classname = "", block = "")
{
   q:'$d(^oddDEF(classname))
   &HTML< <ul> >
   s prop=""
   for {
      s prop=$o(^oddDEF(classname,block,prop))
      q:prop=""
      /*
      s:block="m" propBlock="method"
      s:block="p" propBlock="parametr" 
      s:block="a" propBlock="property"   
      s:block="x" propBlock="xdata"   
      s:block="q" propBlock="query"   
      */
      s icon="HTML.jQueryEasyUI.themes.icons.SMWrap.item.cls"
      &html< <li class='jstree-closed'
                    id='#(classname_":"_block_":"_prop)#'
           data-jstree='{"icon":"#(icon)#"}'
           >#(prop)#</li>  
      >
   }
   &HTML< </ul> >
}

ClassMethod GetDataJSON(PackName = "")
{
  if $l(PackName,":")=2 {
	  s tmp=$p(PackName,":",2)
	  s classname=$p(PackName,":",1)
	  if tmp="methodList"{
		d ..GetData(classname,"m")
		q  
	  }
	  if tmp="parametrList"{
		d ..GetData(classname,"p")
		q  
	  }
	  
	  if tmp="propertyList"{
		d ..GetData(classname,"a")
		q  
	  }
	  if tmp="xdataList"{
		d ..GetData(classname,"x")
		q  
	  }
	  if tmp="queryList"{
		d ..GetData(classname,"x")
		q  
	  }
	  q
  }
  if $l(PackName,":")=3 {
  
    q
  }
  &HTML< <ul> >
  k filtr
  s classname=""
  for {
     s classname=$o(^oddDEF(classname))
     q:classname=""
     if PackName="" {
        s packLast=$p(classname,".",$l(classname,"."))
        s pack=$e(classname,1,$l(classname)-$l(packLast)-1)
        if $d(filtr(pack)){ continue  }
        s filtr(pack)=1
        &html< <li class='jstree-closed'
                   id='#(pack)#'
                   data-jstree='{"icon":"HTML.jQueryEasyUI.themes.icons.SMWrap.class.cls"}'
                 >#(pack)#</li>
        >
        continue 
     }else{
       if $l(classname,PackName)>1{
	      if classname'=PackName {
             &html< <li class='jstree-closed'
                        id='#(classname)#'
                        data-jstree='{"icon":"HTML.jQueryEasyUI.themes.icons.SMWrap.class.cls"}'
                    >#(classname)#</li>
             >
	      }
       }
       
       if classname=PackName {
	     &html< <li class='jstree-closed'
                     id='#(classname_":parametrList")#'
                     data-jstree='{"icon":"HTML.jQueryEasyUI.themes.icons.SMWrap.parametr.cls"}'
                 >Parametr</li>    
         >
	     &html< <li class='jstree-closed'
                     id='#(classname_":propertyList")#'
                     data-jstree='{"icon":"HTML.jQueryEasyUI.themes.icons.SMWrap.property.cls"}'
                 >Property</li>    
         >
         &html< <li class='jstree-closed'
                     id='#(classname_":methodList")#'
                     data-jstree='{"icon":"HTML.jQueryEasyUI.themes.icons.SMWrap.method.cls"}'
                 >Method</li>    
         >
         &html< <li class='jstree-closed'
                     id='#(classname_":queryList")#'
                     data-jstree='{"icon":"HTML.jQueryEasyUI.themes.icons.SMWrap.queri.cls"}'
                 >query</li>    
         >
         &html< <li class='jstree-closed'
                     id='#(classname_":xdataList")#'
                     data-jstree='{"icon":"HTML.jQueryEasyUI.themes.icons.SMWrap.xdata.cls"}'
                 >xdata</li>    
         >
       }
     }
  }
  &HTML< </ul> >
  k filtr
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
	        return '%25ZWebDev.Lib.jquery.plagin.TreeView.demo.demo6.cls?GetDataJSON='+node.id;
	     }
        ,'data' : function (node) {  return { 'id' : node.id };  }
    }
  },
  "plugins" : [ "wholerow" ]
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

