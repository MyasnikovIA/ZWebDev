Class %ZWebDev.Lib.w2ui.v140.demo.Grid.ResizableColumns Extends %CSP.Page
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
        header: 'List of Names',
        show: {
            toolbar: true
        },
        columns: [                
            { field: 'fname', caption: 'First Name', size: '30%', resizable: true, sortable: true },
            { field: 'lname', caption: 'Last Name', size: '30%', resizable: true, sortable: true },
            { field: 'email', caption: 'Email', size: '40%', resizable: true, sortable: true },
            { field: 'sdate', caption: 'Start Date', size: '120px', resizable: true, sortable: true, hidden: true }
        ],
        records: [
            { recid: 1, fname: 'John', lname: 'Doe', email: 'john@gmail.com', sdate: '1/3/2012' },
            { recid: 2, fname: 'Stuart', lname: 'Motzart', email: 'stuart@gmail.com', sdate: '4/13/2012' },
            { recid: 3, fname: 'Jin', lname: 'Franson', email: 'jin@gmail.com', sdate: '3/3/2012' },
            { recid: 4, fname: 'Susan', lname: 'Ottie', email: 'susan@gmail.com', sdate: '5/3/2012' },
            { recid: 5, fname: 'Kelly', lname: 'Silver', email: 'kelly@gmail.com', sdate: '8/19/2012' },
            { recid: 6, fname: 'Francis', lname: 'Gatos', email: 'francis@gmail.com', sdate: '6/12/2012' },
            { recid: 7, fname: 'Mark', lname: 'Welldo', email: 'mark@gmail.com', sdate: '8/13/2012' },
            { recid: 8, fname: 'Thomas', lname: 'Bahh', email: 'thomas@gmail.com', sdate: '4/31/2012' },
            { recid: 10, fname: 'John', lname: 'Doe', email: 'john@gmail.com', sdate: '1/3/2012' },
            { recid: 12, fname: 'Stuart', lname: 'Motzart', email: 'stuart@gmail.com', sdate: '4/13/2012' },
            { recid: 13, fname: 'Jin', lname: 'Franson', email: 'jin@gmail.com', sdate: '3/3/2012' },
            { recid: 14, fname: 'Susan', lname: 'Ottie', email: 'susan@gmail.com', sdate: '5/3/2012' },
            { recid: 15, fname: 'Kelly', lname: 'Silver', email: 'kelly@gmail.com', sdate: '8/19/2012' },
            { recid: 16, fname: 'Francis', lname: 'Gatos', email: 'francis@gmail.com', sdate: '6/12/2012' },
            { recid: 17, fname: 'Mark', lname: 'Welldo', email: 'mark@gmail.com', sdate: '8/13/2012' },
            { recid: 18, fname: 'Thomas', lname: 'Bahh', email: 'thomas@gmail.com', sdate: '4/31/2012' },
            { recid: 19, fname: 'Sergei', lname: 'Rachmaninov', email: 'sergei@gmail.com', sdate: '2/23/2012' }
        ]
    });    
});
</script>

</body>
   </html>>
	Quit $$$OK
}

}

