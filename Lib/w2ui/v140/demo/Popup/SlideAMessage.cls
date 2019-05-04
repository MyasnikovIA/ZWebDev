Class %ZWebDev.Lib.w2ui.v140.demo.Popup.SlideAMessage Extends %CSP.Page
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

<button class="w2ui-btn" onclick="popup()">Open Popup</button>

<script type="text/javascript">
function popup() {
    w2popup.open({
        width: 800,
        height: 500,
        title: 'Popup Title',
        body: '<div class="w2ui-centered">This is text inside the popup</div>',
        buttons: '<button class="w2ui-btn" onclick="showMessage()">Show Message</button> ',
        showMax: true
    });
}

function showMessage () {
    w2popup.message({ 
        width   : 400, 
        height  : 180,
        html    : '<div style="padding: 60px; text-align: center">Click on the message to Hide it</div>'+
                  '<div style="text-align: center"><button class="w2ui-btn" onclick="w2popup.message()">Close</button>'
    });
}
</script>

</body>
   </html>>
	Quit $$$OK
}

}

