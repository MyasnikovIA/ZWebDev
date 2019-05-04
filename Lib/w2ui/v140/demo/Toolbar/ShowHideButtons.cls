Class %ZWebDev.Lib.w2ui.v140.demo.Toolbar.ShowHideButtons Extends %CSP.Page
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
            { type: 'button', id: 'hide', text: 'Hide', icon: 'w2ui-icon-cross' },
            { type: 'button', id: 'show', text: 'Show', icon: 'w2ui-icon-plus' },
            { type: 'break',  id: 'break0' },
            { type: 'button', id: 'btn', text: 'Action Button', img: 'icon-page' },
            { type: 'button', id: 'btn2', text: 'Other Button', img: 'icon-page' }
        ],
        onClick: function (event) {
            if (event.target == 'show') this.show('btn');
            if (event.target == 'hide') this.hide('btn');
        }
    });
});
</script>

</body>
   </html>>
	Quit $$$OK
}

}

