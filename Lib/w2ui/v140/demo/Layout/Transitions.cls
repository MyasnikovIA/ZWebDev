Class %ZWebDev.Lib.w2ui.v140.demo.Layout.Transitions Extends %CSP.Page
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

<button class="w2ui-btn" onclick="$('#eventList').html('');">Clear Events</button>
<div style="height: 10px"></div>

<div id="layout" style="width: 100%; height: 400px;"></div>
<br>
<input type="checkbox" id="instant" onclick="window.instant = this.checked;"> <label for="instant">Instant</label>
<div style="height: 10px;"></div>

<button class="w2ui-btn" onclick="w2ui['layout'].toggle('top', window.instant)">Top</button>
<button class="w2ui-btn" onclick="w2ui['layout'].toggle('left', window.instant)">Left</button>
<button class="w2ui-btn" onclick="w2ui['layout'].toggle('right', window.instant)">Right</button>
<button class="w2ui-btn" onclick="w2ui['layout'].toggle('preview', window.instant)">Preview</button>
<button class="w2ui-btn" onclick="w2ui['layout'].toggle('bottom', window.instant)">Bottom</button>

<script type="text/javascript">
var instant = false;
$(function () {    
    var pstyle = 'border: 1px solid #dfdfdf; padding: 5px;';
    $('#layout').w2layout({
        name: 'layout',
        panels: [
            { type: 'top', size: 50, resizable: true, hidden: true, style: pstyle, content: 'top' },
            { type: 'left', size: 200, resizable: true, hidden: true, style: pstyle, content: 'left' },
            { type: 'main', style: pstyle, content: '<div id="eventList"></div>' },
            { type: 'preview', size: '50%', resizable: true, hidden: true, style: pstyle, content: 'preview' },
            { type: 'right', size: 200, resizable: true, hidden: true, style: pstyle, content: 'right' },
            { type: 'bottom', size: 50, resizable: true, hidden: true, style: pstyle, content: 'bottom' }
        ]
    });
    w2ui['layout'].on('*', function (event) {
        console.log('Event: '+ event.type + ' Target: '+ event.target);
        console.log(event);
        var log = $('#eventList').html();
        $('#eventList').html( log + (log != '' ? '<br>' : '') + event.type + ': '+ event.target);
    });
});
</script>

</body>
    </html>>
	Quit $$$OK
}

}

