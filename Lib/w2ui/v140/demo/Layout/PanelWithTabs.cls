Class %ZWebDev.Lib.w2ui.v140.demo.Layout.PanelWithTabs Extends %CSP.Page
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

<div id="layout" style="width: 100%; height: 400px;"></div>

<div style="height: 20px;"></div>

<span style="display: inline-block; width: 50px;"> Main: </span>
<button class="w2ui-btn" onclick="w2ui['layout'].content('main', 'This is some content set manually')">Set Content</button>
<button class="w2ui-btn" onclick="w2ui['layout'].load('main', 'data/content1.html')">Load Content 1</button>
<button class="w2ui-btn" onclick="w2ui['layout'].load('main', 'data/content2.html')">Load Content 2</button>

<script type="text/javascript">
$(function () {    
    var pstyle = 'border: 1px solid #dfdfdf; padding: 5px;';
    $('#layout').w2layout({
        name: 'layout',
        panels: [
            { type: 'top', size: 50, resizable: true, style: pstyle, content: 'top' },
            { type: 'left', size: 200, resizable: true, style: pstyle, content: 'left' },
            { type: 'main', style: pstyle + 'border-top: 0px;', content: 'main', 
                tabs: {
                    active: 'tab1',
                    tabs: [
                        { id: 'tab1', caption: 'Tab 1' },
                        { id: 'tab2', caption: 'Tab 2' },
                        { id: 'tab3', caption: 'Tab 3' }
                    ],
                    onClick: function (event) {
                        this.owner.content('main', event);
                    }
                }
            }
        ]
    });
});
</script>

</body>
   </html>>
	Quit $$$OK
}

}

