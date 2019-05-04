Class %ZWebDev.Lib.w2ui.v140.demo.Grid.RenderToaNewBox Extends %CSP.Page
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

<div style="position: relative; height: 300px;">
    <div id="grid1" style="position: absolute; left: 0px; width: 49.9%; height: 300px; border: 2px solid green;"></div>
    <div id="grid2" style="position: absolute; right: 0px; width: 49.9%; height: 300px; border: 2px solid red;"></div>
</div>
<br>
<button class="w2ui-btn" onclick="$('#grid1').w2render('grid');">Render into Green Box</button>
<button class="w2ui-btn" onclick="$('#grid2').w2render('grid');">Render into Red Box</button>

<script type="text/javascript">
$(function () {
    $().w2grid({ 
        name: 'grid', 
        columns: [                
            { field: 'recid', caption: 'ID', size: '50px', sortable: true, attr: 'align=center' },
            { field: 'lname', caption: 'Last Name', size: '30%', sortable: true },
            { field: 'fname', caption: 'First Name', size: '30%', sortable: true },
            { field: 'email', caption: 'Email', size: '40%' },
            { field: 'sdate', caption: 'Start Date', size: '120px' }
        ],
        records: [
            { recid: 1, fname: 'Jane', lname: 'Doe', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 2, fname: 'Stuart', lname: 'Motzart', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 3, fname: 'Jin', lname: 'Franson', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 4, fname: 'Susan', lname: 'Ottie', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 5, fname: 'Kelly', lname: 'Silver', email: 'jdoe@gmail.com', sdate: '4/3/2012' },
            { recid: 6, fname: 'Francis', lname: 'Gatos', email: 'jdoe@gmail.com', sdate: '4/3/2012' }
        ]
    });
});
</script>

</body>

   </html>>
	Quit $$$OK
}

}

