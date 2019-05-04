Class %ZWebDev.Lib.w2ui.v140.demo.Combinations.DependentFields Extends %CSP.Page
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

<style>
</style>

<div id="tab-example">
    <div class="w2ui-field">
        <label>Employee: </label>
        <div><input id="field1" style="width: 300px"></div>
    </div>
    <div class="w2ui-field">
        <label>Manager: </label>
        <div><input id="field2" style="width: 300px"></div>
    </div>
</div>

<script type="text/javascript">
$(function () {
    $('#field1')
        .w2field('list', {
            url : 'data/enum.json'
        })
        .on('change', function () {
            var $field2 = $('#field2');
            var sel = $(this).data('selected');
            var fld = $field2.data('w2field');  // before 1.4.1 -- var fld = $field.data('w2field');
            if (sel && !$.isEmptyObject(sel)) {
                $field2
                    .attr('placeholder', '') // before 1.5.0 -- fld.options.placeholder = '';
                    .prop('readonly', false);                
            } else {
                $field2
                    .attr('placeholder', 'Select employee first')
                    .prop('readonly', true); // before 1.5.0 -- fld.options.placeholder = 'Select employee first';
            }
            $field2.data('selected', null);
            fld.clearCache();
            fld.refresh();
        });

    $('#field2')
        .attr('placeholder', 'Select employee first')
        .prop('readonly', true)
        .w2field('list', {
            url: 'data/enum.json',
            onRequest: function (event) {
                var sel = $('#field1').data('selected');
                event.postData['employee_id'] = sel.id;
            }
        });
})
</script>

</body>

   </html>>
	Quit $$$OK
}

}

