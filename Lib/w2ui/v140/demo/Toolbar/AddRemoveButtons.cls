Class %ZWebDev.Lib.w2ui.v140.demo.Toolbar.AddRemoveButtons Extends %CSP.Page
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
    var btnCount = 0;
    $('#toolbar').w2toolbar({
        name: 'toolbar',
        items: [
            { type: 'button', id: 'append', text: 'Append', icon: 'w2ui-icon-plus' },
            { type: 'button', id: 'insert', text: 'Insert', icon: 'w2ui-icon-plus' },
            { type: 'button', id: 'delete', text: 'Delete', icon: 'w2ui-icon-cross' },
            { type: 'break',  id: 'break0' },
            { type: 'break',  id: 'break1' }
        ],
        onClick: function (event) {
            switch (event.target) {
                case 'append':
                    this.add({ type: 'button', id: 'button' + btnCount, text: 'button '+ btnCount, img: 'icon-page' });
                    btnCount++;
                    break;
                case 'insert':
                    this.insert('break1', { type: 'button', id: 'button' + btnCount, text: 'button '+ btnCount, img: 'icon-page' });
                    btnCount++;
                    break;
                case 'delete':
                    if (btnCount <= 0) return;
                    btnCount--;
                    this.remove('button'+ btnCount);
                    break;
            }
        }
    });
});
</script>

</body>
   </html>>
	Quit $$$OK
}

}

