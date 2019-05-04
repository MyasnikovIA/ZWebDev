/// 
Class %ZWebDev.Lib.jquery.plagin.layout.demo.simple Extends %CSP.Page [ ProcedureBlock ]
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

Parameter DstName = "%25ZWebDev.Lib.jquery.plagin.layout.demo.simple.cls";

Parameter FileName = "C:\Users\Luda\Downloads\jquery.layout.all-1.2.0\demo\simple.html";

Parameter LongPath = "demo\";

Parameter NameOnly = "simple.html";

Parameter PathApp = "C:\Users\Luda\Downloads\jquery.layout.all-1.2.0\";

Parameter PathOnly = "C:\Users\Luda\Downloads\jquery.layout.all-1.2.0\demo\";

Parameter Rashirenie = "html";

Parameter SrcName = "demo/simple.html";

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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","C:\Users\Luda\Downloads\jquery.layout.all-1.2.0\demo\simple.html") 
    }
    q 1
}

XData XDataContet
{
<data>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<title>Simple Layout Demo</title>

	<script type="text/javascript" src="%25ZWebDev.Lib.jquery.plagin.layout.jquery.cls"></script>
	<script type="text/javascript" src="%25ZWebDev.Lib.jquery.plagin.layout.jquery.ui.all.cls"></script>
	<script type="text/javascript" src="%25ZWebDev.Lib.jquery.plagin.layout.jquery.layout.cls"></script>
	<script type="text/javascript">

	var myLayout; // a var is required because this page utilizes: myLayout.allowOverflow() method

	$(document).ready(function () {
		myLayout = $('body').layout({
			// enable showOverflow on west-pane so popups will overlap north pane
			west__showOverflowOnHover: true

		//,	west__fxSettings_open: { easing: "easeOutBounce", duration: 750 }
		});
 	});

	</script>


	<style type="text/css">
	.ui-layout-pane {
		background: #FFF; 
		border: 1px solid #BBB; 
		padding: 10px; 
		overflow: auto;
	} 
	.ui-layout-resizer { background: #DDD;} 
	.ui-layout-toggler {background: #AAA;} 
	</style>


	<style type="text/css">
	/**
	 *	ALL CSS below is only for cosmetic and demo purposes
	 *	Nothing here affects the appearance of the layout
	 */

	body {
		font-family: Arial, sans-serif;
		font-size: 0.85em;
	}
	p {
		margin: 1em 0;
	}

	/*
	 *	Rules below are for simulated drop-down/pop-up lists
	 */

	ul {
		/* rules common to BOTH inner and outer UL */
		z-index:	100000;
		margin:		1ex 0;
		padding:	0;
		list-style:	none;
		cursor:		pointer;
		border:		1px solid Black;
		/* rules for outer UL only */
		width:		15ex;
		position:	relative;
	}
	ul li {
		background-color: #EEE;
		padding: 0.15em 1em 0.3em 5px;
	}
	ul ul {
		display:	none;
		position:	absolute;
		width:		100%;
		left:		-1px;
		/* Pop-Up */
		bottom:		0;
		margin:		0;
		margin-bottom: 1.55em;
	}
	.ui-layout-north ul ul {
		/* Drop-Down */
		bottom:		auto;
		margin:		0;
		margin-top:	1.45em;
	}
	ul ul li		{ padding: 3px 1em 3px 5px; }
	ul ul li:hover	{ background-color: #FF9; }
	ul li:hover ul	{ display:	block; background-color: #EEE; }

	</style>

</head>
<body>

<!-- manually attach allowOverflow method to pane -->
<div class="ui-layout-north" onmouseover="myLayout.allowOverflow('north')" onmouseout="myLayout.resetOverflow(this)">
	This is the north pane, closable, slidable and resizable

	<ul>
		<li>
			<ul>
				<li>one</li>
				<li>two</li>
				<li>three</li>
				<li>four</li>
				<li>five</li>
			</ul>
			Drop-Down <!-- put this below so IE and FF render the same! -->
		</li>
	</ul>

</div>

<!-- allowOverflow auto-attached by option: west__showOverflowOnHover = true -->
<div class="ui-layout-west">
	This is the west pane, closable, slidable and resizable

	<ul>
		<li>
			<ul>
				<li>one</li>
				<li>two</li>
				<li>three</li>
				<li>four</li>
				<li>five</li>
			</ul>
			Pop-Up <!-- put this below so IE and FF render the same! -->
		</li>
	</ul>

	<p><button onclick="myLayout.close('west')">Close Me</button></p>

	<p><a href="demo/#" onClick="showOptions(myLayout,'defaults.fxSettings_open');showOptions(myLayout,'west.fxSettings_close')">Show Options.Defaults</a></p>

</div>

<div class="ui-layout-south">
	This is the south pane, closable, slidable and resizable &nbsp;
	<button onclick="myLayout.toggle('north')">Toggle North Pane</button>
</div>

<div class="ui-layout-east">
	This is the east pane, closable, slidable and resizable

	<!-- attach allowOverflow method to this specific element -->
	<ul onmouseover="myLayout.allowOverflow(this)" onmouseout="myLayout.resetOverflow('east')">
		<li>
			<ul>
				<li>one</li>
				<li>two</li>
				<li>three</li>
				<li>four</li>
				<li>five</li>
			</ul>
			Pop-Up <!-- put this below so IE and FF render the same! -->
		</li>
	</ul>

	<p><button onclick="myLayout.close('east')">Close Me</button></p>

	<p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p>
	<p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p>
	<p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p>
	<p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p>
</div>

<div class="ui-layout-center">
	This center pane auto-sizes to fit the space <i>between</i> the 'border-panes'
	<p>This layout was created with only <b>default options</b> - no customization</p>
	<p>Only the <b>applyDefaultStyles</b> option was enabled for <i>basic</i> formatting</p>
	<p>The Pop-Up and Drop-Down lists demonstrate the <b>allowOverflow()</b> utility</p>
	<p>The Close and Toggle buttons are examples of <b>custom buttons</b></p>	<p><a href="http://layout.jquery-dev.net/demos.html">Go to the Demos page</a></p>
	<p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p>
	<p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p>
	<p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p>
	<p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p><p>...</p>
</div>

</body>
</html>
</data>
}

}

