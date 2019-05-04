Class %ZWebDev.Lib.w2ui.v140.demo.Sidebar.AddRemoveItems Extends %CSP.Page
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
    <button class="w2ui-btn" onclick="addItems()">Add Items</button>
    <button class="w2ui-btn" onclick="insertItems()">Insert Items</button>
    <button class="w2ui-btn" onclick="removeItem()">Remove Inserted Items</button>
</div>
<div style="clear: both"></div>

<script type="text/javascript">
$(function () {
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

function addItems() {
    w2ui.sidebar.add([
        { id: 'new-1', text: 'New Item 1', icon: 'w2ui-icon-check' },
        { id: 'new-2', text: 'New Item 2', icon: 'w2ui-icon-check' },
        { id: 'new-3', text: 'New Item 3', icon: 'w2ui-icon-check' }
    ]);
}

function insertItems() {
    w2ui.sidebar.insert('level-1-2', null, [
        { id: 'new-4', text: 'New Item 4', icon: 'w2ui-icon-check' },
        { id: 'new-5', text: 'New Item 5', icon: 'w2ui-icon-check' },
        { id: 'new-6', text: 'New Item 6', icon: 'w2ui-icon-check' }
    ]);
    w2ui.sidebar.expand('level-1-2');
}

function removeItem() {
    w2ui.sidebar.remove('new-1', 'new-2', 'new-3', 'new-4', 'new-5', 'new-6');
}
</script>

</body>
   </html>>
	Quit $$$OK
}

}

