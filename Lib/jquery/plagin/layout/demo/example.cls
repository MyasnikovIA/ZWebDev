/// 
Class %ZWebDev.Lib.jquery.plagin.layout.demo.example Extends %CSP.Page [ ProcedureBlock ]
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

Parameter DstName = "%25ZWebDev.Lib.jquery.plagin.layout.demo.example.cls";

Parameter FileName = "C:\Users\Luda\Downloads\jquery.layout.all-1.2.0\demo\example.html";

Parameter LongPath = "demo\";

Parameter NameOnly = "example.html";

Parameter PathApp = "C:\Users\Luda\Downloads\jquery.layout.all-1.2.0\";

Parameter PathOnly = "C:\Users\Luda\Downloads\jquery.layout.all-1.2.0\demo\";

Parameter Rashirenie = "html";

Parameter SrcName = "demo/example.html";

Parameter isBinFile = 0;

/// 07/04/2019  15:19:08
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","C:\Users\Luda\Downloads\jquery.layout.all-1.2.0\demo\example.html") 
    }
    q 1
}

XData XDataContet
{
<data>
<HTML>
<HEAD>
<TITLE>Layout Example</TITLE>
<SCRIPT type="text/javascript" src="%25ZWebDev.Lib.jquery.plagin.layout.jquery.cls"></SCRIPT>
<SCRIPT type="text/javascript" src="%25ZWebDev.Lib.jquery.plagin.layout.jquery.layout.cls"></SCRIPT>
<SCRIPT type="text/javascript">
$(document).ready(function () {
	$('body').layout({ applyDefaultStyles: true });
});
</SCRIPT>
</HEAD>
<BODY>
<DIV class="ui-layout-center">Center	<P><A href="http://layout.jquery-dev.net/demos.html">Go to the Demos page</A></P>
	<P>* Pane-resizing is disabled because ui.draggable.js is not linked</P>
	<P>* Pane-animation is disabled because ui.effects.js is not linked</P>
</DIV>
<DIV class="ui-layout-north">North</DIV>
<DIV class="ui-layout-south">South</DIV>
<DIV class="ui-layout-east">East</DIV>
<DIV class="ui-layout-west">West</DIV>
</BODY>
</HTML>
</data>
}

}

