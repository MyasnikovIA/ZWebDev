Class %ZWebDev.Lib.w2ui.v140.demo.Combinations.InfiniteScroll Extends %CSP.Page
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

<div id="main" style="width: 100%; height: 400px;"></div>
<br>
<label>
    <input type="checkbox" id="autoLoad" onclick="refreshGrid(this.checked)" checked>
    Auto Load
</label>

<script type="text/javascript">
// widget configuration
var config = {
    grid: { 
        name: 'grid',
        url : '//w2ui.com/web/pages/demo/infinite/index.php',
        show: { 
            footer    : true,
            toolbar    : true
        },
        columns: [                
            { field: 'userid', caption: 'ID', size: '50px', sortable: true, resizable: true },
            { field: 'fname', caption: 'First Name', size: '140px', sortable: true, searchable: 'text', resizable: true },
            { field: 'lname', caption: 'Last Name', size: '140px', sortable: true, searchable: 'text', resizable: true },
            { field: 'email', caption: 'Email', size: '100%', resizable: true, sortable: true },
            { field: 'manager', caption: 'Manager', size: '200px', resizable: true, sortable: true }
        ]
    }
};

function refreshGrid(auto) {
    w2ui.grid.autoLoad = auto;
    w2ui.grid.skip(0);    
}

$(function () {
    $('#main').w2grid(config.grid);
});
</script>

</body>
   </html>>
	Quit $$$OK
}

}

