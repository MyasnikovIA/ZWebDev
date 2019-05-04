Class %ZWebDev.Lib.w2ui.v140.demo.Fields.NumericFields Extends %CSP.Page
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
    w "<style>"
    w ".block {"
    w "    padding-top: 20px; "
    w "    padding-bottom: 10px; "
    w "    color: #999;"
    w "}"
    w ".w2ui-field input {"
    w "    width: 100px;"
    w "    text-align: right;"
    w "}"
    w ".w2ui-field > div > span {"
    w "    margin-left: 20px;"
    w "}"
    w " </style>"
	&html<
<body>
<div class="block">
    <b>General</b>
</div>
<div class="w2ui-field">
    <label>Integer:</label>
    <div><input id="w2int"></div>
</div>
<div class="w2ui-field">
    <label>Float:</label>
    <div><input id="w2float"></div>
</div>
<div class="w2ui-field">
    <label>Hex:</label>
    <div><input id="w2hex"></div>
</div>
<div class="w2ui-field">
    <label>Binary:</label>
    <div><input id="w2bin"></div>
</div>
<div class="w2ui-field">
    <label>Color:</label>
    <div><input id="w2color" style="text-align: left"></div>
</div>

<div class="block">
    <b>US Format</b>
</div>
<div class="w2ui-field">
    <label>Integer:</label>
    <div><input id="us-int" value="0"></div>
</div>
<div class="w2ui-field">
    <label>Float:</label>
    <div><input id="us-float" value="0"></div>
</div>
<div class="w2ui-field">
    <label>Money:</label>
    <div><input id="us-money" value="0"></div>
</div>
<div class="w2ui-field">
    <label>Percent:</label>
    <div><input id="us-percent" value="0"></div>
</div>

<div class="block">
    <b>EU Common Format</b>
</div>
<div class="w2ui-field">
    <label>Integer:</label>
    <div><input id="eu-int" value="0"></div>
</div>
<div class="w2ui-field">
    <label>Float:</label>
    <div><input id="eu-float" value="0"></div>
</div>
<div class="w2ui-field">
    <label>Money:</label>
    <div><input id="eu-money" value="0"></div>
</div>
<div class="w2ui-field">
    <label>Percent:</label>
    <div><input id="eu-percent" value="0"></div>
</div>


<script type="text/javascript">
// General
$('#w2int').w2field('int', { autoFormat: false });
$('#w2float').w2field('float', { autoFormat: false });
$('#w2hex').w2field('hex');
$('#w2bin').w2field('bin');
$('#w2color').w2field('color');

// US Format
$('#us-int').w2field('int');
$('#us-float').w2field('float', { precision: 3 });
$('#us-money').w2field('money');
$('#us-percent').w2field('percent', { precision: 1, min: 0, max: 100 });

// EU Common Format
$('#eu-int').w2field('int', { autoFormat: true, groupSymbol: ' ' });
$('#eu-float').w2field('float', { groupSymbol: ' ', precision: 3 });
$('#eu-money').w2field('money', { groupSymbol: ' ', currencyPrefix: '', currencySuffix: '€' });
$('#eu-percent').w2field('percent', { precision: 1, min: 0, max: 100 });
</script>
</body>
   </html>
   >
	Quit $$$OK
}

}

