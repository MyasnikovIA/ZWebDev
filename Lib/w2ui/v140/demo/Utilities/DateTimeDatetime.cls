Class %ZWebDev.Lib.w2ui.v140.demo.Utilities.DateTimeDatetime Extends %CSP.Page
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
    w "    width: 90px;"
    w "}"
    w ".w2ui-field.dt input {"
    w "    width: 140px;"
    w "}"
    w ".w2ui-field > div > span {"
    w "    margin-left: 20px;"
    w "}"
    w "</style>"
    
    &html<
<body>

<div class="block">
    <b>US Format</b>
</div>
<div class="w2ui-field">
    <label>Date:</label>
    <div> <input type="us-date"> </div>
</div>
<div class="w2ui-field">
    <label>From-To:</label>
    <div> <input type="us-dateA"> <span class="legend">(from 10th to 20th of current month)</span> </div>
</div>
<div class="w2ui-field">
    <label>Blocked Days:</label>
    <div> <input type="us-dateB"> <span class="legend">(12,13,14 of current month are blocked)</span> </div>
</div>
<div class="w2ui-field">
    <label>Date Range:</label>
    <div> <input type="us-date1"> - <input type="us-date2"> </div>
</div>
<div class="w2ui-field">
    <label>Time:</label>
    <div> <input type="us-time"> </div>
</div>
<div class="w2ui-field">
    <label>From-To:</label>
    <div> <input type="us-timeA"> <span class="legend">(from 8:00 am to 4:30 pm)</span> </div>
</div>
<div class="w2ui-field dt">
    <label>Datetime:</label>
    <div> <input type="us-datetime"> </div>
</div>

<div class="block">
    <b>EU Common Format</b>
</div>
<div class="w2ui-field">
    <label>Date:</label>
    <div> <input type="eu-date"> </div>
</div>
<div class="w2ui-field">
    <label>From-To:</label>
    <div> <input type="eu-dateA"> <span class="legend">(from 10th to 20th of current month)</span> </div>
</div>
<div class="w2ui-field">
    <label>Blocked Days:</label>
    <div> <input type="eu-dateB"> <span class="legend">(12,13,14 of current month are blocked)</span> </div>
</div>
<div class="w2ui-field">
    <label>Date Range:</label>
    <div> <input type="eu-date1"> - <input type="eu-date2"> </div>
</div>
<div class="w2ui-field">
    <label>Time:</label>
    <div> <input type="eu-time"> </div>
</div>
<div class="w2ui-field">
    <label>From-To:</label>
    <div> <input type="eu-timeA"> <span class="legend">(from 8:00 am to 4:30 pm)</span> </div>
</div>
<div class="w2ui-field dt">
    <label>Datetime:</label>
    <div> <input type="eu-datetime"> </div>
</div>


<script type="text/javascript">
var month = (new Date()).getMonth() + 1;
var year  = (new Date()).getFullYear();

// US Format
$('input[type=us-date]').w2field('date');
$('input[type=us-dateA]').w2field('date', { format: 'm/d/yyyy', start:  month + '/5/' + year, end: month + '/25/' + year });
$('input[type=us-dateB]').w2field('date', { format: 'm/d/yyyy', blocked: [ month+'/12/2014',month+'/13/2014',month+'/14/' + year]});
$('input[type=us-date1]').w2field('date', { format: 'm/d/yyyy', end: $('input[type=us-date2]') });
$('input[type=us-date2]').w2field('date', { format: 'm/d/yyyy', start: $('input[type=us-date1]') });
$('input[type=us-time]').w2field('time',  { format: 'h12' });
$('input[type=us-timeA]').w2field('time', { format: 'h12', start: '8:00 am', end: '4:30 pm' });
$('input[type=us-datetime]').w2field('datetime');

// EU Common Format
$('input[type=eu-date]').w2field('date',  { format: 'd.m.yyyy' });
$('input[type=eu-dateA]').w2field('date', { format: 'd.m.yyyy', start:  '5.' + month + '.' + year, end: '25.' + month + '.' + year });
$('input[type=eu-dateB]').w2field('date', { format: 'd.m.yyyy', blocked: ['12.' + month + '.' + year, '13.' + month + '.' + year, '14.' + month + '.' + year]});
$('input[type=eu-date1]').w2field('date', { format: 'd.m.yyyy', end: $('input[type=eu-date2]') });
$('input[type=eu-date2]').w2field('date', { format: 'd.m.yyyy', start: $('input[type=eu-date1]') });
$('input[type=eu-time]').w2field('time',  { format: 'h24' });
$('input[type=eu-timeA]').w2field('time', { format: 'h24', start: '8:00 am', end: '4:30 pm' });
$('input[type=eu-datetime]').w2field('datetime', { format: 'dd.mm.yyyy|h24:mm' });
</script>

</body>
   </html>>
	Quit $$$OK
}

}

