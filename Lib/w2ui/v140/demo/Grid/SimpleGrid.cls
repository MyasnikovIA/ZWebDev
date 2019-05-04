Class %ZWebDev.Lib.w2ui.v140.demo.Grid.SimpleGrid Extends %CSP.Page
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

<div id="grid" style="width: 100%; height: 350px;"></div>

<script type="text/javascript">
$(function () {
    $('#grid').w2grid({ 
        name: 'grid', 
        url: '%25ZWebDev.Lib.w2ui.v140.demo.Grid.data.cls',
        method: 'GET', // need this to avoid 412 error on Safari
        columns: [                
            { field: 'fname', caption: 'First Name', size: '30%' },
            { field: 'lname', caption: 'Last Name', size: '30%' },
            { field: 'email', caption: 'Email', size: '40%' },
            { field: 'sdate', caption: 'Start Date', size: '120px' }
        ]
    });    
});
</script>

</body>

   </html>>
	Quit $$$OK
}

}

