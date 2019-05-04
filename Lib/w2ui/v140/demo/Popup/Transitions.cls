Class %ZWebDev.Lib.w2ui.v140.demo.Popup.Transitions Extends %CSP.Page
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

<button class="w2ui-btn" onclick="w2popup.load({ url: '/sirena/%25ZWebDev.Lib.w2ui.v140.demo.Popup.popup1.cls' })">Open Popup</button>

</body>

   </html>>
	Quit $$$OK
}

}

