Class %ZWebDev.Lib.w2ui.v140.demo.Grid.LoadDataOnce Extends %CSP.Page
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

<div id="grid" style="width: 100%; height: 350px; overflow: hidden;"></div>

<script type="text/javascript">
$(function () {
    $('#grid').w2grid({ 
        name: 'grid', 
        method: 'GET', // need this to avoid 412 error on Safari
        columns: [                
            { field: 'lname', caption: 'Last Name', size: '30%', sortable: true },
            { field: 'fname', caption: 'First Name', size: '30%', sortable: true },
            { field: 'email', caption: 'Email', size: '40%', sortable: true },
            { field: 'sdate', caption: 'Start Date', size: '120px', sortable: true }
        ]
    });    
    w2ui['grid'].load('%25ZWebDev.Lib.w2ui.v140.demo.Grid.data2.cls');
});
</script>

</body>
   </html>>
	Quit $$$OK
}

}

