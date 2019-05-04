Class %ZWebDev.Lib.w2ui.v140.demo.Popup.LockingTheContent Extends %CSP.Page
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
        width: 500,
        height: 300,
        title: 'Popup Title',
        body: '<div class="w2ui-centered">Click on the "Lock" button or "Lock With a Message" to lock the message for 2 seconds. After 2 seconds it will be automatically unlocked.</div>',
        buttons: '<button class="w2ui-btn" onclick="lock(\'\')">Lock</button>'+
                 '<button class="w2ui-btn" onclick="lock(\'Loading...\')">Lock With a Message</button>',
        showMax: true
    });
}
function lock (msg) {
    w2popup.lock(msg, true);
    setTimeout(function () { w2popup.unlock(); }, 2000);
}
</script>

</body>
   </html>>
	Quit $$$OK
}

}

