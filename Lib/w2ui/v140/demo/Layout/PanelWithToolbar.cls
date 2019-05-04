Class %ZWebDev.Lib.w2ui.v140.demo.Layout.PanelWithToolbar Extends %CSP.Page
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

<script type="text/javascript">
$(function () {    
    var pstyle = 'border: 1px solid #dfdfdf; padding: 5px;';
    $('#layout').w2layout({
        name: 'layout',
        panels: [
            { type: 'top', size: 50, resizable: true, style: pstyle, content: 'top' },
            { type: 'left', size: 200, resizable: true, style: pstyle, content: 'left' },
            { type: 'main', style: pstyle + 'border-top: 0px;', content: 'content', 
                toolbar: {
                    items: [
                        { type: 'check',  id: 'item1', caption: 'Check', img: 'icon-page', checked: true },
                        { type: 'break',  id: 'break0' },
                        { type: 'menu',   id: 'item2', caption: 'Drop Down', img: 'icon-folder', items: [
                            { text: 'Item 1', icon: 'icon-page' }, 
                            { text: 'Item 2', icon: 'icon-page' }, 
                            { text: 'Item 3', value: 'Item Three', icon: 'icon-page' }
                        ]},
                        { type: 'break', id: 'break1' },
                        { type: 'radio',  id: 'item3',  group: '1', caption: 'Radio 1', img: 'icon-page', hint: 'Hint for item 3', checked: true },
                        { type: 'radio',  id: 'item4',  group: '1', caption: 'Radio 2', img: 'icon-page', hint: 'Hint for item 4' },
                        { type: 'spacer' },
                        { type: 'button',  id: 'item5',  caption: 'Item 5', icon: 'w2ui-icon-check', hint: 'Hint for item 5' }
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

