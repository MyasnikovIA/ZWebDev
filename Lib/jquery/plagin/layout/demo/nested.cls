/// 
Class %ZWebDev.Lib.jquery.plagin.layout.demo.nested Extends %CSP.Page [ ProcedureBlock ]
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

Parameter DstName = "%25ZWebDev.Lib.jquery.plagin.layout.demo.nested.cls";

Parameter FileName = "C:\Users\Luda\Downloads\jquery.layout.all-1.2.0\demo\nested.html";

Parameter LongPath = "demo\";

Parameter NameOnly = "nested.html";

Parameter PathApp = "C:\Users\Luda\Downloads\jquery.layout.all-1.2.0\";

Parameter PathOnly = "C:\Users\Luda\Downloads\jquery.layout.all-1.2.0\demo\";

Parameter Rashirenie = "html";

Parameter SrcName = "demo/nested.html";

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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","C:\Users\Luda\Downloads\jquery.layout.all-1.2.0\demo\nested.html") 
    }
    q 1
}

XData XDataContet
{
<data>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 

	<title>Nested Layouts</title> 

	<script type="text/javascript" src="%25ZWebDev.Lib.jquery.plagin.layout.jquery.cls"></script> 
	<script type="text/javascript" src="%25ZWebDev.Lib.jquery.plagin.layout.jquery.layout.cls"></script> 
	<script type="text/javascript" src="%25ZWebDev.Lib.jquery.plagin.layout.jquery.ui.all.cls"></script> 

	<script> 

	var outerLayout, middleLayout, innerLayout; 

	$(document).ready(function () { 

		outerLayout = $('body').layout({ 
			center__paneSelector:	".outer-center" 
		,	west__paneSelector:		".outer-west" 
		,	east__paneSelector:		".outer-east" 
		,	west__size:				125 
		,	east__size:				125 
		,	spacing_open:			8 // ALL panes
		,	spacing_closed:			12 // ALL panes
		,	north__spacing_open:	0
		,	south__spacing_open:	0
		,	center__onresize:		"middleLayout.resizeAll" 
		}); 

		middleLayout = $('div.outer-center').layout({ 
			center__paneSelector:	".middle-center" 
		,	west__paneSelector:		".middle-west" 
		,	east__paneSelector:		".middle-east" 
		,	west__size:				100 
		,	east__size:				100 
		,	spacing_open:			8  // ALL panes
		,	spacing_closed:			12 // ALL panes
		,	center__onresize:		"innerLayout.resizeAll" 
		}); 

		innerLayout = $('div.middle-center').layout({ 
			center__paneSelector:	".inner-center" 
		,	west__paneSelector:		".inner-west" 
		,	east__paneSelector:		".inner-east" 
		,	west__size:				75 
		,	east__size:				75 
		,	spacing_open:			8  // ALL panes
		,	spacing_closed:			8  // ALL panes
		,	west__spacing_closed:	12
		,	east__spacing_closed:	12
		}); 

	}); 


	</script> 

	<style type="text/css"> 

	.ui-layout-pane { /* all 'panes' */ 
		padding: 10px; 
		background: #FFF; 
		border-top: 1px solid #BBB;
		border-bottom: 1px solid #BBB;
		}
		.ui-layout-pane-north ,
		.ui-layout-pane-south {
			border: 1px solid #BBB;
		} 
		.ui-layout-pane-west {
			border-left: 1px solid #BBB;
		} 
		.ui-layout-pane-east {
			border-right: 1px solid #BBB;
		} 
		.ui-layout-pane-center {
			border-left: 0;
			border-right: 0;
			} 
			.inner-center {
				border: 1px solid #BBB;
			} 

		.outer-west ,
		.outer-east {
			background-color: #EEE;
		}
		.middle-west ,
		.middle-east {
			background-color: #F8F8F8;
		}

	.ui-layout-resizer { /* all 'resizer-bars' */ 
		background: #DDD; 
		}
		.ui-layout-resizer:hover { /* all 'resizer-bars' */ 
			background: #FED; 
		}
		.ui-layout-resizer-west {
			border-left: 1px solid #BBB;
		}
		.ui-layout-resizer-east {
			border-right: 1px solid #BBB;
		}

	.ui-layout-toggler { /* all 'toggler-buttons' */ 
		background: #AAA; 
		} 
		.ui-layout-toggler:hover { /* all 'toggler-buttons' */ 
			background: #FC3; 
		} 

	.outer-center ,
	.middle-center {
		/* center pane that are 'containers' for a nested layout */ 
		padding: 0; 
		border: 0; 
	} 

	</style> 

</head> 
<body> 

<div class="outer-center">

	<div class="middle-center">

		<div class="inner-center">Inner Center</div> 
		<div class="inner-west">Inner West</div> 
		<div class="inner-east">Inner East</div>
		<div class="ui-layout-north">Inner North</div> 
		<div class="ui-layout-south">Inner South</div> 

	</div> 
	<div class="middle-west">Middle West</div> 
	<div class="middle-east">Middle East</div> 

</div> 

<div class="outer-west">Outer West</div> 
<div class="outer-east">Outer East</div> 

<div class="ui-layout-north">Outer North</div> 
<div class="ui-layout-south">Outer South</div> 

</body> 
</html> 

</data>
}

}

