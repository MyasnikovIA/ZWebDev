Class %ZWebDev.Lib.w2ui.v140.demo.Grid.ReorderGridColumns Extends %CSP.Page
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

<div id="grid" style="width: 100%; height: 400px;"></div>

<script type="text/javascript">
$(function () {
    $('#grid').w2grid({ 
        name: 'grid',
        show: {
            footer: true,
            lineNumbers : true,
            selectColumn: true
        },
        reorderColumns: true,
        columns: [    
            { field: 'recid', caption: 'Rec. Id', size: '100%', resizable: true, hidden: true },            
            { field: 'fname', caption: 'Full Name', size: '200px', resizable: true,
                render: function (record, index, column_index) {
                    var html = '<div>'+ record.fname + ' ' + record.lname + '</div>';
                    return html;
                } 
            },
            { field: 'lname', caption: 'Last Name', size: '100%', resizable: true, hidden: true },  
            { field: 'email', caption: 'Email', size: '100%', resizable: true },
            { field: 'profit',caption: 'Profit', size: '120px', render: 'money', resizable: true },
            { field: 'sdate', caption: 'Start Date', size: '120px', render: 'date', resizable: true }
        ],
        records: [
            { recid: 1, fname: 'John', lname: 'Doe', email: 'john@gmail.com', profit: 2500, sdate: '1/3/2012' },
            { recid: 2, fname: 'Stuart', lname: 'Motzart', email: 'stuart@gmail.com', profit: 1004, sdate: '4/13/2012' },
            { recid: 3, fname: 'Jin', lname: 'Franson', email: 'jin@gmail.com', profit: 473, sdate: '3/3/2012' },
            { recid: 4, fname: 'Susan', lname: 'Ottie', email: 'susan@gmail.com', profit: 304, sdate: '5/3/2012' },
            { recid: 5, fname: 'Kelly', lname: 'Silver', email: 'kelly@gmail.com', profit: 9300, sdate: '8/19/2012' },
            { recid: 6, fname: 'Francis', lname: 'Gatos', email: 'francis@gmail.com', sdate: '6/12/2012' },
            { recid: 7, fname: 'Mark', lname: 'Welldo', email: 'mark@gmail.com', profit: 3400, sdate: '8/13/2012' },
            { recid: 8, fname: 'Thomas', lname: 'Bahh', email: 'thomas@gmail.com', profit: 2030, sdate: '4/31/2012' },
            { recid: 10, fname: 'John', lname: 'Doe', email: 'john@gmail.com', profit: 13004, sdate: '1/3/2012' },
            { recid: 12, fname: 'Stuart', lname: 'Motzart', email: 'stuart@gmail.com', sdate: '4/13/2012' },
            { recid: 13, fname: 'Jin', lname: 'Franson', email: 'jin@gmail.com', profit: 4043, sdate: '3/3/2012' },
            { recid: 14, fname: 'Susan', lname: 'Ottie', email: 'susan@gmail.com', profit: 474, sdate: '5/3/2012' },
            { recid: 15, fname: 'Kelly', lname: 'Silver', email: 'kelly@gmail.com', profit: 1704, sdate: '8/19/2012' },
            { recid: 16, fname: 'Francis', lname: 'Gatos', email: 'francis@gmail.com', sdate: '6/12/2012' },
            { recid: 17, fname: 'Mark', lname: 'Welldo', email: 'mark@gmail.com', profit: 7065, sdate: '8/13/2012' },
            { recid: 18, fname: 'Thomas', lname: 'Bahh', email: 'thomas@gmail.com', profit: 609, sdate: '4/31/2012' },
            { recid: 19, fname: 'Sergei', lname: 'Rachmaninov', email: 'sergei@gmail.com', profit: 777, sdate: '2/23/2012' }
        ]
    });    
});
</script>

</body>
   </html>>
	Quit $$$OK
}

}
