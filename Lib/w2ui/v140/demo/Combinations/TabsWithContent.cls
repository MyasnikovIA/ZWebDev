Class %ZWebDev.Lib.w2ui.v140.demo.Combinations.TabsWithContent Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{
	&html<<html>
    <head>
        <script src='%25ZWebDev.Lib.jquery.v320.min.js.cls'  language='JavaScript'></script> 
        <script src='%25ZWebDev.Lib.w2ui.v140.min.js.cls'></script> 
        <link  href='%25ZWebDev.Lib.w2ui.v140.min.css.cls'  rel='stylesheet' >  
    </head>
<body>

<style>
.tab {
    width: 100%;
    height: 400px;
    border: 1px solid silver;
    border-top: 0px;
    display: none;
    padding: 10px;
    overflow: auto;
}
</style>

<div id="tab-example">
    <div id="tabs" style="width: 100%; height: 29px;"></div>
    <div id="tab1" class="tab">
        First tab.
    </div>
    <div id="tab2" class="tab">
        Second tab, with some HTML in it. :)
    </div>
    <div id="tab3" class="tab">
        What did you expect, of course it is the third tab.
    </div>
</div>

<script type="text/javascript">
var config = {
    tabs: {
        name: 'tabs',
        active: 'tab1',
        tabs: [
            { id: 'tab1', caption: 'Tab 1' },
            { id: 'tab2', caption: 'Tab 2' },
            { id: 'tab3', caption: 'Tab 3' },
        ],
        onClick: function (event) {
            $('#tab-example .tab').hide();
            $('#tab-example #' + event.target).show();
        }
    }
}

$(function () {
    $('#tabs').w2tabs(config.tabs);
    $('#tab1').show();
});
</script>

</body>
   </html>>
	Quit $$$OK
}

}

