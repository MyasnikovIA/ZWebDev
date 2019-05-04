Class %ZWebDev.Lib.w2ui.v140.demo.Combinations.BufferedScroll Extends %CSP.Page
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

<script type="text/javascript">
// widget configuration
var config = {
    grid: { 
        name: 'grid',
        show: { 
            footer    : true,
            toolbar    : true
        },
        columns: [                
            { field: 'personid', caption: 'ID', size: '50px', sortable: true, searchable: 'int', resizable: true },
            { field: 'fname', caption: 'First Name', size: '140px', sortable: true, searchable: 'text', resizable: true },
            { field: 'lname', caption: 'Last Name', size: '140px', sortable: true, searchable: 'text', resizable: true },
            { field: 'email', caption: 'Email', size: '100%', resizable: true, sortable: true },
            { field: 'snumber', caption: 'Number', size: '120px', resizable: true, sortable: true, render: 'money' },
            { field: 'sdate', caption: 'Date', size: '120px', resizable: true, sortable: true, render: 'date' }
        ]
    }
};

$(function () {
    // initialization
    $().w2grid(config.grid);
    // generate data
    var fname = ['Vitali', 'Katsia', 'John', 'Peter', 'Sue', 'Olivia', 'Thomas', 'Sergei', 'Snehal', 'Avinash', 'Divia'];
    var lname = ['Peterson', 'Rene', 'Johnson', 'Cuban', 'Twist', 'Sidorov', 'Vasiliev', 'Yadav', 'Vaishnav'];
    // add 25k records
    for (var i = 0; i < 25000; i++) {
        w2ui['grid'].records.push({ 
            recid : i+1,
            personid: i+1,
            fname: fname[Math.floor(Math.random() * fname.length)], 
            lname: lname[Math.floor(Math.random() * lname.length)],
            email: 'vm@gmail.com', manager: '--',
            snumber: Math.floor(Math.random() * 8000),
            sdate: (new Date(Math.floor(Math.random() * 20000) * 100000000)).getTime()
        });
    }
    w2ui.grid.refresh();
    $('#main').w2render('grid');
});
</script>

</body>
   </html>>
	Quit $$$OK
}

}

