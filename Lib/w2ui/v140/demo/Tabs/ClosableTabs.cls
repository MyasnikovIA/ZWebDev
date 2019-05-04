Class %ZWebDev.Lib.w2ui.v140.demo.Tabs.ClosableTabs Extends %CSP.Page
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

<div id="tabs" style="width: 100%;"></div>

<script type="text/javascript">
$(function () {
    $('#tabs').w2tabs({
        name: 'tabs',
        active: 'tab1',
        tabs: [
            { id: 'tab1', text: 'Tab 1' },
            { id: 'tab2', text: 'Tab 2', closable: true },
            { id: 'tab3', text: 'Tab 3', closable: true },
            { id: 'tab4', text: 'Tab 4', closable: true },
            { id: 'tab5', text: 'Tab 5', closable: true },
            { id: 'tab6', text: 'Tab 6', closable: true },
            { id: 'tab7', text: 'Tab 7', closable: true },
            { id: 'tab8', text: 'Tab 8', closable: true }
        ]
    });
});
</script>

</body>
   </html>>
	Quit $$$OK
}

}

