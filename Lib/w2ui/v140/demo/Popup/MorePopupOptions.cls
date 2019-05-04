Class %ZWebDev.Lib.w2ui.v140.demo.Popup.MorePopupOptions Extends %CSP.Page
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
        title     : 'Popup Title',
        body      : '<div class="w2ui-centered">This is text inside the popup</div>',
        buttons   : '<button class="w2ui-btn" onclick="w2popup.close();">Close</button> '+
                    '<button class="w2ui-btn" onclick="w2popup.lock(\'Loading\', true); '+
                    '        setTimeout(function () { w2popup.unlock(); }, 2000);">Lock</button>',
        width     : 500,
        height    : 300,
        overflow  : 'hidden',
        color     : '#333',
        speed     : '0.3',
        opacity   : '0.8',
        modal     : true,
        showClose : true,
        showMax   : true,
        onOpen    : function (event) { console.log('open'); },
        onClose   : function (event) { console.log('close'); },
        onMax     : function (event) { console.log('max'); },
        onMin     : function (event) { console.log('min'); },
        onKeydown : function (event) { console.log('keydown'); }
    });
}
</script>

</body>
   </html>>
	Quit $$$OK
}

}

