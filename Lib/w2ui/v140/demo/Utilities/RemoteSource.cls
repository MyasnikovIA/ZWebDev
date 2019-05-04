Class %ZWebDev.Lib.w2ui.v140.demo.Utilities.RemoteSource Extends %CSP.Page
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
     w !,".w2ui-field input {width: 400px;}"
     w !,".w2ui-field > div > span {margin-left: 20px;}"
     w !,"</style>"

     
     &html<
<body>

<div style="height: 20px"></div>
<div class="w2ui-field">
    <label>List:</label>
    <div> <input id="list"> </div>
</div>
<br>
<div class="w2ui-field">
    <label>Multi:</label>
    <div> <input id="enum"> </div>
</div>
<div style="height: 20px"></div>


<script type="text/javascript">
$('#list').w2field('list', {
    url: 'http://w2ui.com/web/pages/demo/infinite/enum.php',
    renderItem: function (item) {
        return item.fname + ' ' + item.lname;
    },
    renderDrop: function (item) {
        return item.fname + ' ' + item.lname;
    },
    compare: function (item, search) {
        var fname = search, 
            lname = search;
        if (search.indexOf(' ') != -1) {
            fname = search.split(' ')[0];
            lname = search.split(' ')[1];
        }
        var match = false;
        var re1 = new RegExp(fname, 'i');
        var re2 = new RegExp(lname, 'i');
        if (fname == lname) {
            if (re1.test(item.fname) || re2.test(item.lname)) match = true;
        } else {
            if (re1.test(item.fname) && re2.test(item.lname)) match = true;
        }
        return match;
    }
});

$('#enum').w2field('enum', {
    url: 'http://w2ui.com/web/pages/demo/infinite/enum.php',
    renderItem: function (item) {
        return item.fname + ' ' + item.lname;
    },
    renderDrop: function (item) {
        return item.fname + ' ' + item.lname;
    },
    compare: function (item, search) {
        var fname = search, 
            lname = search;
        if (search.indexOf(' ') != -1) {
            fname = search.split(' ')[0];
            lname = search.split(' ')[1];
        }
        var match = false;
        var re1 = new RegExp(fname, 'i');
        var re2 = new RegExp(lname, 'i');
        if (fname == lname) {
            if (re1.test(item.fname) || re2.test(item.lname)) match = true;
        } else {
            if (re1.test(item.fname) && re2.test(item.lname)) match = true;
        }
        return match;
    },
    onNew: function (event) {
        console.log('++ New Item: Do not forget to submit it to the server too', event);
        $.extend(event.item, { fname: '', lname : event.item.text });
    }
});
</script>

</body>
   </html>>
	Quit $$$OK
}

}

