Class %ZWebDev.Lib.jquery.plagin.resizable.demo.demo1 Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{
	&html<
	
	<html>
<head>
    <title>Simple Split Panels - jquery-resizable</title>
    <meta charset="utf-8"/>
    <script src='%25ZWebDev.Lib.jquery.v320.min.js.cls'  language='JavaScript'></script> 
    <script src='%25ZWebDev.Lib.jquery.plagin.resizable.js.cls'  language='JavaScript'></script>   
    
</head>
<body style="">
    <div class="page-container">

        <h1>
            jquery-resizable - A simple splitter panel
        </h1>
        <hr />

        <p>
            Simple example that demonstrates how to create slidable two-pane layouts using FlexBox and the resizable plug-in.
            Note that Flexbox is not required, but used here to keep the layout simple.
        </p>

        <label>Horizontal Splitter Panes:</label>

        <div class="panel-container">

            <div class="panel-left">
                left panel
            </div>

            <div class="splitter">
            </div>
         

            <div class="panel-right">
                right panel
            </div>
        </div>
        <button id="btnUnbind" style="margin: 30px 0 0; height: 35px; width: 190px;">Unbind Horizontal Resizers</button>

        <div class="panel-container" style="margin-top: 50px;">

            <div class="panel-left">
                left panel (same ids)
            </div>

            <div class="splitter">
            </div>

            <div class="panel-right">
                right panel (same ids)
            </div>
        </div>

        <div class="panel-container" style="margin-top: 50px;">
            <div class="panel2-left">
                left panel 2
            </div>

            <div class="splitter2">
            </div>

            <div class="panel2-right">
                right panel 2
            </div>
        </div>

        <label>Vertical Splitter Panes:</label>
        <div class="panel-container-vertical">

            <div class="panel-top">
                top panel
            </div>

            <div class="splitter-horizontal">
            </div>

            <div class="panel-bottom">
                bottom panel
            </div>
        </div>

        <label>Horizontal Splitter Panes with IFrame:</label>

        <div class="panel-container">

            <div class="panel-left">
                left panel
            </div>

            <div class="splitter">
            </div>
         

            <div class="panel-right" style="padding: 0;">
                <iframe src="www.ya.ru"
                        style="width: 100%; height: 100%; border: none"></iframe>
            </div>
        </div>
        <button id="btnUnbind" style="margin: 30px 0 0; height: 35px; width: 190px;">Unbind Horizontal Resizers</button>



        <hr />

        <p>
            This example creates two resizables for the horizontal and vertical splitter panes:
        </p>



      
    </div>


<script  language='JavaScript'>
    $(".panel-left").resizable({
        handleSelector: ".splitter",
        resizeHeight: false
    });

    $(".panel2-left").resizable({
        handleSelector: ".splitter2",
        resizeHeight: false
    });

    $(".panel-top").resizable({
        handleSelector: ".splitter-horizontal",
        resizeWidth: false
    });

    $("#btnUnbind").on("click",
        function () {            
            $(".panel-left").resizable("destroy");
        });
</script>


</body>
</html>


	
	>
	Quit $$$OK
}

}

