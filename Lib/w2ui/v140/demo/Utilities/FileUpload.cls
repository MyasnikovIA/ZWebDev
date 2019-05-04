Class %ZWebDev.Lib.w2ui.v140.demo.Utilities.FileUpload Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{
	&html<<html>
    <head>
        <script src='%25ZWebDev.Lib.jquery.v331.js.cls'></script>  
        <script src='%25ZWebDev.Lib.w2ui.v140.min.js.cls'></script> 
        <link  href='%25ZWebDev.Lib.w2ui.v140.min.css.cls'  rel='stylesheet' >  
    </head>
    >
   w !,"<style>"
   w !,".w2ui-field input { width: 400px;}"
   w !,".w2ui-field > div > span { margin-left: 20px;}"
   w !,"</style>"

    &html<
<body>

<div style="height: 20px"></div>
<div class="w2ui-field">
    <label>Attach Files:</label>
    <div> <input id="file"> </div>
</div>
<div style="height: 20px"></div>


<script type="text/javascript">
$('#file').w2field('file', {});
</script>

</body>
   </html>>
	Quit $$$OK
}

}

