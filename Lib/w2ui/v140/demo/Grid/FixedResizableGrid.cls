Class %ZWebDev.Lib.w2ui.v140.demo.Grid.FixedResizableGrid Extends %CSP.Page
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

<div id="grid" style="width: 100%; height: 200px"></div>
<br>
<button class="w2ui-btn" onclick="addRecord()">Add One Record</button>
<button class="w2ui-btn" onclick="removeRecords()">Remove Appended Records</button>
    
<label>
    <input type="checkbox" id="fixedsize" onclick="var grid = w2ui.grid; grid.fixedBody = this.checked; 
        if (this.checked) { grid.resize(null, '200px'); } else { grid.refresh(); }">
    Fixed Height
</label>

<script type="text/javascript">
$(function () {
    $('#grid').w2grid({ 
        name: 'grid', 
        show: { lineNumbers: true },
        fixedBody: false,
        columns: [                
            { field: 'lname', caption: 'Last Name', size: '30%' },
            { field: 'fname', caption: 'First Name', size: '30%' },
            { field: 'email', caption: 'Email', size: '40%' },
            { field: 'sdate', caption: 'Start Date', size: '90px' }
        ],
        records: [
            { recid: 1, fname: 'Jane', lname: 'Doe', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 2, fname: 'Stuart', lname: 'Motzart', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 3, fname: 'Jin', lname: 'Franson', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 4, fname: 'Susan', lname: 'Ottie', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 5, fname: 'Kelly', lname: 'Silver', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 6, fname: 'Francis', lname: 'Gatos', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 7, fname: 'Mark', lname: 'Welldo', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 8, fname: 'Thomas', lname: 'Bahh', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 9, fname: 'Mark', lname: 'Welldo', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 10, fname: 'Thomas', lname: 'Bahh', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 11, fname: 'Jane', lname: 'Doe', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 12, fname: 'Stuart', lname: 'Motzart', email: 'jdoe@gmail.com', sdate: '4/3/2012' }
        ]
    });    
});

function addRecord() {
    var g = w2ui['grid'].records.length;
    w2ui['grid'].add( { recid: g + 1, fname: 'Jin', lname: 'Franson', email: 'jdoe@gmail.com', sdate: '4/3/2012' } );
}

function removeRecords() {
    w2ui.grid.clear();
    w2ui.grid.records = [
        { recid: 1, fname: 'Jane', lname: 'Doe', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
        { recid: 2, fname: 'Stuart', lname: 'Motzart', email: 'jdoe@gmail.com', sdate: '4/3/2012' }
    ];
    w2ui.grid.total = 2;
    w2ui.grid.refresh();
}
</script>

</body>
   </html>>
	Quit $$$OK
}

}

