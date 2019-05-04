Class %ZWebDev.Lib.w2ui.v140.demo.Toolbar.SimpleToolbar Extends %CSP.Page
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
            { type: 'button', id: 'item2', text: 'Button', icon: 'fa-wrench' },
            { type: 'break' },
            { type: 'check', id: 'item3', text: 'Check 1', icon: 'fa-star' },
            { type: 'check', id: 'item4', text: 'Check 2', icon: 'fa-heart' },
            { type: 'break' },
            { type: 'radio', id: 'item5', group: '1', text: 'Radio 1', icon: 'fa-star', checked: true },
            { type: 'radio', id: 'item6', group: '1', text: 'Radio 2', icon: 'fa-heart' },
            { type: 'spacer' },
            { type: 'button', id: 'item7', text: 'Button', icon: 'fa-star' }
        ],
        onClick: function (event) {
            console.log('Target: '+ event.target, event);
        }
    });
});
</script>

</body>
   </html>>
	Quit $$$OK
}

}

