Class %ZWebDev.Lib.w2ui.v140.demo.Layout.NestedLayouts Extends %CSP.Page
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

<span style="display: inline-block; width: 60px;"> Main: </span>
<button class="w2ui-btn" onclick="w2ui['layout'].toggle('top', window.instant)">Top</button>
<button class="w2ui-btn" onclick="w2ui['layout'].toggle('left', window.instant)">Left</button>
<button class="w2ui-btn" onclick="w2ui['layout'].toggle('right', window.instant)">Right</button>
<button class="w2ui-btn" onclick="w2ui['layout'].toggle('preview', window.instant)">Preview</button>
<button class="w2ui-btn" onclick="w2ui['layout'].toggle('bottom', window.instant)">Bottom</button>

<div style="height: 10px;"></div>

<span style="display: inline-block; width: 60px;"> Nested: </span>
<button class="w2ui-btn" onclick="w2ui['layout2'].toggle('top', window.instant)">Top</button>
<button class="w2ui-btn" onclick="w2ui['layout2'].toggle('left', window.instant)">Left</button>
<button class="w2ui-btn" onclick="w2ui['layout2'].toggle('right', window.instant)">Right</button>
<button class="w2ui-btn" onclick="w2ui['layout2'].toggle('preview', window.instant)">Preview</button>
<button class="w2ui-btn" onclick="w2ui['layout2'].toggle('bottom', window.instant)">Bottom</button>

<script type="text/javascript">
$(function () {
    var pstyle = 'border: 1px solid #dfdfdf; padding: 5px;';
    $('#layout').w2layout({
        name: 'layout',
        panels: [
            { type: 'top', size: 50, resizable: true, style: pstyle, content: 'top' },
            { type: 'left', size: 200, resizable: true, style: pstyle, content: 'left' },
            { type: 'main', style: 'background-color: white;', overflow: 'hidden' },
            { type: 'preview', size: '50%', resizable: true, hidden: true, style: pstyle, content: 'preview' },
            { type: 'right', size: 200, resizable: true, style: pstyle, content: 'right' },
            { type: 'bottom', size: 50, resizable: true, hidden: true, style: pstyle, content: 'bottom' }
        ]
    });
    var pstyle = 'background-color: #F0F0C1; border: 1px solid #dfdfdf; padding: 5px;';
    $().w2layout({
        name: 'layout2',
        panels: [
            { type: 'top', size: 40, resizable: true, style: pstyle, content: 'top' },
            { type: 'left', size: 80, resizable: true, style: pstyle, content: 'left' },
            { type: 'main', style: pstyle },
            { type: 'preview', size: '50%', resizable: true, hidden: true, style: pstyle, content: 'preview' },
            { type: 'right', size: 80, resizable: true, style: pstyle, content: 'right' },
            { type: 'bottom', size: 40, resizable: true, hidden: true, style: pstyle, content: 'bottom' }
        ]
    });
    
    w2ui['layout'].content('main', w2ui['layout2']);
});
</script>

</body>
    </html>
    >
	Quit $$$OK
}

}

