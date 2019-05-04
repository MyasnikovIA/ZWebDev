Class %ZWebDev.Lib.w2ui.v140.demo.Sidebar.SelectUnselect Extends %CSP.Page
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

<div id="sidebar" style="height: 300px; width: 200px; float: left"></div>
<div style="margin-left: 220px;">
    <button class="w2ui-btn" onclick="w2ui.sidebar.select('level-1-2')"> Select Level 1.2 </button>
    <button class="w2ui-btn" onclick="w2ui.sidebar.unselect('level-1-2')"> Unselect Level 1.2 </button>
    <button class="w2ui-btn" onclick="w2ui.sidebar.click('level-1-2')"> Emulate Click on Level 1.2 </button>
</div>
<div style="clear: both"></div>

<script type="text/javascript">
$(document).ready(function () {
    $('#sidebar').w2sidebar({
        name: 'sidebar',
        nodes: [
            { id: 'level-1', text: 'Level 1', img: 'icon-folder', expanded: true, group: true,
              nodes: [ { id: 'level-1-1', text: 'Level 1.1', icon: 'fa-star-empty' },
                       { id: 'level-1-2', text: 'Level 1.2', icon: 'fa-star-empty' },
                       { id: 'level-1-3', text: 'Level 1.3', icon: 'fa-star-empty' }
                     ]
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

