Class %ZWebDev.Lib.w2ui.v140.demo.Tabs.SetaTabActive Extends %CSP.Page
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
<br><br>

<button class="w2ui-btn" onclick="w2ui.tabs.click('tab3')">Set Tab 3 Active</button>
<button class="w2ui-btn" onclick="w2ui.tabs.click('tab4')">Set Tab 4 Active</button>

<script type="text/javascript">
$(function () {
    $('#tabs').w2tabs({
        name: 'tabs',
        active: 'tab2',
        tabs: [
            { id: 'tab1', text: 'Tab 1' },
            { id: 'tab2', text: 'Tab 2' },
            { id: 'tab3', text: 'Tab 3' },
            { id: 'tab4', text: 'Tab 4' }
        ]
    });
});
</script>

</body>
   </html>>
	Quit $$$OK
}

}

