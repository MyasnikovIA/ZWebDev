Class %ZWebDev.Lib.w2ui.v140.demo.Utilities.MultiSelectDropDownLists Extends %CSP.Page
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
    w !,".w2ui-field input {"
    w !,"    width: 400px;"
    w !,"}"
    w !,".w2ui-field > div > span {"
    w !,"    margin-left: 20px;"
    w !,"}"
    w !,"</style>"

   &html<

<body>

<div style="height: 20px"></div>
<div class="w2ui-field">
    <label>Multi-Select:</label>
    <div> <input id="enum"> </div>
</div>
<div style="height: 10px"></div>
<div class="w2ui-field">
    <label>Max 2 Items:</label>
    <div> <input id="enum-max"> </div>
</div>
<div style="height: 10px"></div>
<div class="w2ui-field">
    <label>Custom:</label>
    <div> <input id="enum-custom"> </div>
</div>
<div style="height: 20px"></div>

<script type="text/javascript">
var pstyle = 'padding-right: 3px; color: #828AA7; text-shadow: 1px 1px 3px white;';
var people = ['George Washington', 'John Adams', 'Thomas Jefferson', 'James Buchanan', 'James Madison', 'Abraham Lincoln', 'James Monroe', 'Andrew Johnson', 'John Adams', 'Ulysses Grant', 'Andrew Jackson', 'Rutherford Hayes', 'Martin Van Buren', 'James Garfield', 'William Harrison', 'Chester Arthur', 'John Tyler', 'Grover Cleveland', 'James Polk', 'Benjamin Harrison', 'Zachary Taylor', 'Grover Cleveland', 'Millard Fillmore', 'William McKinley', 'Franklin Pierce', 'Theodore Roosevelt', 'John Kennedy', 'William Howard', 'Lyndon Johnson', 'Woodrow Wilson', 'Richard Nixon', 'Warren Harding', 'Gerald Ford', 'Calvin Coolidge', 'James Carter', 'Herbert Hoover', 'Ronald Reagan', 'Franklin Roosevelt', 'George Bush', 'Harry Truman', 'William Clinton', 'Dwight Eisenhower', 'George W. Bush', 'Barack Obama'];
$('#enum').w2field('enum', { 
    items: people,
    openOnFocus: true,
    selected: [{ id: 0, text: 'John Adams' }, { id: 0, text: 'Thomas Jefferson' }]
});
$('#enum-max').w2field('enum', { 
    items: people, 
    openOnFocus: true,
    max: 2 
});
$('#enum-custom').w2field('enum', { 
    items: people, 
    openOnFocus: true,
    onAdd: function (event) {
        if (Math.random() > 0.8) {
            event.item.style = 'background-color: rgb(255, 232, 232); border: 1px solid red;';
        }
    },
    renderItem: function (item, index, remove) {
        var html = remove + '<span class="fa-trophy" style="'+ pstyle +'; margin-left: -4px;"></span>' + item.text;
        return html;
    },
    renderDrop: function (item, options) {
        return '<span class="fa-star" style="'+ pstyle +'"></span>' + item.text;
    }
});
// if you need to get to the selected items, use:
// $('#id').data('selected');
</script>

</body>
   </html>>
	Quit $$$OK
}

}

