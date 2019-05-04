Class %ZWebDev.Lib.w2ui.v140.demo.Grid.SelectUnselectRecords Extends %CSP.Page
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

<div id="grid" style="width: 100%; height: 250px;"></div>
<br>
<button class="w2ui-btn" onclick="w2ui.grid.selectAll();">Select All</button>
<button class="w2ui-btn" onclick="w2ui.grid.selectNone();">Select None</button>
<button class="w2ui-btn" onclick="w2ui.grid.select(5);">Select a Record</button>
<button class="w2ui-btn" onclick="w2ui.grid.unselect(5);">Deselect a Record</button>
<button class="w2ui-btn" onclick="w2ui.grid.select(5,3,7);">Select Several</button>
<button class="w2ui-btn" onclick="w2alert(w2ui.grid.getSelection());">Get Selection</button>

<script type="text/javascript">
$(function () {
    $('#grid').w2grid({ 
        name: 'grid', 
        show: {
            selectColumn: true
        },
        columns: [                
            { field: 'recid', caption: 'ID', size: '30px', sortable: true, attr: 'align="center"' },
            { field: 'lname', caption: 'Last Name', size: '30%', sortable: true },
            { field: 'fname', caption: 'First Name', size: '30%', sortable: true },
            { field: 'email', caption: 'Email', size: '40%', sortable: true },
            { field: 'sdate', caption: 'Start Date', size: '90px', sortable: true }
        ],
        records: [
            { recid: 1, fname: 'John', lname: 'doe', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 2, fname: 'Stuart', lname: 'Motzart', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 3, fname: 'Jin', lname: 'Franson', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 4, fname: 'Susan', lname: 'Ottie', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 5, fname: 'Kelly', lname: 'Silver', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 6, fname: 'Francis', lname: 'Gatos', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 7, fname: 'Mark', lname: 'Welldo', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 8, fname: 'Thomas', lname: 'Bahh', email: 'jdoe@gmail.com', sdate: '4/3/2012' }
        ]
    });    
});
</script>

</body>
   </html>>
	Quit $$$OK
}

}

