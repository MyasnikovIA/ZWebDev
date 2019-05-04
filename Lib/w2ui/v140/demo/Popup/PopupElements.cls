Class %ZWebDev.Lib.w2ui.v140.demo.Popup.PopupElements Extends %CSP.Page
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

<button class="w2ui-btn" onclick="popup1()">Popup With all Elements</button>
<button class="w2ui-btn" onclick="popup2()">Popup Without Elements</button>

<script type="text/javascript">
function popup1() {
    w2popup.open({
        title: 'Popup Title',
        body: '<div class="w2ui-centered">This is text inside the popup</div>',
        buttons: 'buttons',
        showMax: true
    });
}
function popup2() {
    w2popup.open({
        body: '<div class="w2ui-centered">Click anywhere outside the popup to hide it.</div>'
    });
}
</script>
</body>
   </html>>
	Quit $$$OK
}

}

