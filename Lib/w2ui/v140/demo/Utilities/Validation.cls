Class %ZWebDev.Lib.w2ui.v140.demo.Utilities.Validation Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{
	&html<<html>
    <head>
        <script src='%25ZWebDev.Lib.jquery.v331.js.cls'></script>  
        <script src='%25ZWebDev.Lib.w2ui.v140.min.js.cls'></script> 
        <link  href='%25ZWebDev.Lib.w2ui.v140.min.css.cls'  rel='stylesheet' >  
    </head>
<body>

<input id="str" type="text" size="20" onkeyup="update()" style="border: 1px solid silver; padding: 3px; height: 30px; width: 200px;">
<br><br>
<div style="float: left; width: 130px;">isBin</div>          <div id="isBin" style="margin-left: 130px;">...</div>
<div style="float: left; width: 130px;">isInt</div>          <div id="isInt" style="margin-left: 130px;">...</div>
<div style="float: left; width: 130px;">isFloat</div>        <div id="isFloat" style="margin-left: 130px;">...</div>
<div style="float: left; width: 130px;">isHex</div>          <div id="isHex" style="margin-left: 130px;">...</div>
<div style="float: left; width: 130px;">isMoney</div>        <div id="isMoney" style="margin-left: 130px;">...</div>
<div style="float: left; width: 130px;">isAlphaNumeric</div> <div id="isAlphaNumeric" style="margin-left: 130px;">...</div>
<div style="float: left; width: 130px;">isEmail</div>        <div id="isEmail" style="margin-left: 130px;">...</div>
<div style="float: left; width: 130px;">isTime</div>         <div id="isTime" style="margin-left: 130px;">...</div>
<div style="float: left; width: 130px;">isDate</div>         <div id="isDate" style="margin-left: 130px;">...</div>
<div style="float: left; width: 130px;">isDateTime</div>     <div id="isDateTime" style="margin-left: 130px;">...</div>
<div style="height: 20px"></div>
<div style="float: left; width: 130px;">age</div>            <div id="goAge" style="margin-left: 130px;">...</div>
<div style="float: left; width: 130px;">date</div>           <div id="goDate" style="margin-left: 130px;">...</div>
<div style="float: left; width: 130px;">interval</div>       <div id="goInterval" style="margin-left: 130px;">...</div>

<script type="text/javascript">
function update() {
	$('#isBin').html(w2utils.isBin($('#str')[0].value) ? 'Yes' : '-');
    $('#isInt').html(w2utils.isInt($('#str')[0].value) ? 'Yes' : '-');
    $('#isFloat').html(w2utils.isFloat($('#str')[0].value) ? 'Yes' : '-');
    $('#isHex').html(w2utils.isHex($('#str')[0].value) ? 'Yes' : '-');
    $('#isMoney').html(w2utils.isMoney($('#str')[0].value) ? 'Yes' : '-');
    $('#isAlphaNumeric').html(w2utils.isAlphaNumeric($('#str')[0].value) ? 'Yes' : '-');
    $('#isEmail').html(w2utils.isEmail($('#str')[0].value) ? 'Yes' : '-');
    $('#isDate').html(w2utils.isDate($('#str')[0].value) ? 'Yes' : '-');
    $('#isTime').html(w2utils.isTime($('#str')[0].value) ? 'Yes' : '-');
    $('#isDateTime').html(w2utils.isDateTime($('#str')[0].value) ? 'Yes' : '-');

    if (w2utils.isInt($('#str').val())) {
        $('#goInterval').html(w2utils.interval($('#str')[0].value));
    } else {
        $('#goInterval').html('-');
    }
    if (w2utils.isDate($('#str')[0].value)) {
        $('#goAge').html(w2utils.age($('#str')[0].value));
        $('#goDate').html(w2utils.date($('#str')[0].value));
    } else {
        $('#goAge').html('-');
        $('#goDate').html('-');
    }
}
</script>

</body>

   </html>>
	Quit $$$OK
}

}

