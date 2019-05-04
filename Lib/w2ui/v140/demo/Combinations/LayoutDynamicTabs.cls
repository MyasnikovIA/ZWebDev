Class %ZWebDev.Lib.w2ui.v140.demo.Combinations.LayoutDynamicTabs Extends %CSP.Page
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

<div id="main" style="width: 100%; height: 400px;"></div>

<script type="text/javascript">
// widget configuration
var config = {
    layout: {
        name: 'layout',
        padding: 0,
        panels: [
            { type: 'left', size: 200, resizable: true, minSize: 120 },
            { type: 'main', overflow: 'hidden', 
                style: 'background-color: white; border: 1px solid silver; border-top: 0px; padding: 10px;',
                tabs: {
                    active: 'tab0',
                    tabs: [{ id: 'tab0', caption: 'Initial Tab' }],
                    onClick: function (event) {
                        w2ui.layout.html('main', 'Active tab: '+ event.target);
                    },
                    onClose: function (event) {
                        this.click('tab0');
                    }
                }
            }
        ]
    },
    sidebar: {
        name: 'sidebar',
        nodes: [ 
            { id: 'general', text: 'General', group: true, expanded: true, nodes: [
                { id: 'item1', text: 'Item 1', img: 'icon-page' },
                { id: 'item2', text: 'Item 2', img: 'icon-page' },
                { id: 'item3', text: 'Item 3', img: 'icon-page' },
                { id: 'item4', text: 'Item 4', img: 'icon-page' }
            ]}
        ],
        onClick: function (event) {
            var tabs = w2ui.layout_main_tabs;
            if (tabs.get(event.target)) {
                tabs.select(event.target);
                w2ui.layout.html('main', 'Tab Selected');
            } else {
                tabs.add({ id: event.target, caption: 'Tab '+ event.target, closable: true });
                w2ui.layout.html('main', 'New tab added');
            }
        }
    }
};

$(function () {
    // initialization
    $('#main').w2layout(config.layout);
    w2ui.layout.content('left', $().w2sidebar(config.sidebar));
});
</script>

</body>
   </html>>
	Quit $$$OK
}

}

