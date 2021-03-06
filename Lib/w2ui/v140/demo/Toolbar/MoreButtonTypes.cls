Class %ZWebDev.Lib.w2ui.v140.demo.Toolbar.MoreButtonTypes Extends %CSP.Page
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

<div id="toolbar" style="padding: 4px; border: 1px solid #dfdfdf; border-radius: 3px"></div>

<script type="text/javascript">
$(function () {
    $('#toolbar').w2toolbar({
        name: 'toolbar',
        items: [
            { type: 'menu', id: 'item1', text: 'Menu', icon: 'fa-table', count: 17, items: [
                { text: 'Item 1', icon: 'fa-camera', count: 5 },
                { text: 'Item 2', icon: 'fa-picture', disabled: true },
                { text: 'Item 3', icon: 'fa-glass', count: 12 }
            ]},
            { type: 'break' },
            { type: 'menu-radio', id: 'item2', icon: 'fa-star',
                text: function (item) {
                    var text = item.selected;
                    var el   = this.get('item2:' + item.selected);
                    return 'Radio: ' + el.text;
                },
                selected: 'id3',
                items: [
                    { id: 'id1', text: 'Item 1', icon: 'fa-camera' },
                    { id: 'id2', text: 'Item 2', icon: 'fa-picture' },
                    { id: 'id3', text: 'Item 3', icon: 'fa-glass', count: 12 }
                ]
            },
            { type: 'break' },
            { type: 'menu-check', id: 'item3', text: 'Check', icon: 'fa-heart',
                selected: ['id3', 'id4'],
                onRefresh: function (event) {
                    event.item.count = event.item.selected.length;
                },
                items: [
                    { id: 'id1', text: 'Item 1', icon: 'fa-camera' },
                    { id: 'id2', text: 'Item 2', icon: 'fa-picture' },
                    { id: 'id3', text: 'Item 3', icon: 'fa-glass', count: 12 },
                    { text: '--' },
                    { id: 'id4', text: 'Item 4', icon: 'fa-glass' }
                ]
            },
            { type: 'break' },
            { type: 'drop',  id: 'item4', text: 'Dropdown', icon: 'fa-plus',
                html: '<div style="padding: 10px; line-height: 1.5">You can put any HTML in the drop down.<br>Include tables, images, etc.</div>'
            },
            { type: 'break', id: 'break3' },
            { type: 'html',  id: 'item5',
                html: function (item) {
                    var html =
                      '<div style="padding: 3px 10px;">'+
                      ' CUSTOM:'+
                      '    <input size="10" onchange="var el = w2ui.toolbar.set(\'item5\', { value: this.value });" '+
                      '         style="padding: 3px; border-radius: 2px; border: 1px solid silver" value="'+ (item.value || '') + '"/>'+
                      '</div>';
                    return html;
                }
            },
            { type: 'spacer' },
            { type: 'button',  id: 'item6',  text: 'Item 6', icon: 'fa-flag' }
        ]
    });

    w2ui.toolbar.on('*', function (event) {
        console.log('EVENT: '+ event.type + ' TARGET: '+ event.target, event);
    });
});
</script>

</body>
   </html>>
	Quit $$$OK
}

}

