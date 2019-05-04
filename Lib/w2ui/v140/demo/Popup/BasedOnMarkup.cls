Class %ZWebDev.Lib.w2ui.v140.demo.Popup.BasedOnMarkup Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{
	&html<<html>
    <head>
        <script src='%25ZWebDev.Lib.jquery.v331.js.cls'></script>  
        <script src='%25ZWebDev.Lib.w2ui.v140.min.js.cls'></script> 
        <link  href='%25ZWebDev.Lib.w2ui.v140.min.css.cls'  rel='stylesheet' >  
    </head>
<body>

<button class="w2ui-btn" onclick="$('#popup1').w2popup()">Popup 1</button>
<button class="w2ui-btn" onclick="$('#popup2').w2popup()">Popup 2</button>

<div id="popup1" style="display: none; width: 600px; height: 400px; overflow: hidden">
    <div rel="title">
        Popup #1 Title
    </div>
    <div rel="body" style="padding: 10px; line-height: 150%">
        <div style="float: left; background-color: white; width: 150px; height: 80px; border: 1px solid silver; margin: 5px;"> </div>
        This is body of popup #1. You can put any text or HTML inside the body (as well as title and buttons).
        This is body of popup #1. You can put any text or HTML inside the body (as well as title and buttons).
        This is body of popup #1. You can put any text or HTML inside the body (as well as title and buttons).
        This is body of popup #1. You can put any text or HTML inside the body (as well as title and buttons).
        This is body of popup #1. You can put any text or HTML inside the body (as well as title and buttons).
        This is body of popup #1. You can put any text or HTML inside the body (as well as title and buttons).
        This is body of popup #1. You can put any text or HTML inside the body (as well as title and buttons).
        This is body of popup #1. You can put any text or HTML inside the body (as well as title and buttons).
        This is body of popup #1. You can put any text or HTML inside the body (as well as title and buttons).
        This is body of popup #1. You can put any text or HTML inside the body (as well as title and buttons).
        This is body of popup #1. You can put any text or HTML inside the body (as well as title and buttons).
    </div>
    <div rel="buttons">
        <button class="w2ui-btn" onclick="$('#popup2').w2popup()">Switch to Popup 2</button>
    </div>
</div>

<div id="popup2" style="display: none; width: 400px; height: 200px; overflow: hidden">
    <div rel="title">
        Popup #2
    </div>
    <div rel="body" style="padding: 10px; line-height: 150%">
        Some other popup text. Some other popup text. Some other popup text. Some other popup text. Some other popup text. 
        Some other popup text. Some other popup text. Some other popup text. Some other popup text. Some other popup text. 
    </div>
    <div rel="buttons">
        <button class="w2ui-btn" onclick="$('#popup1').w2popup()">Switch to Popup 1</button>
    </div>
</div>

</body>
   </html>>
	Quit $$$OK
}

}

