Class %ZWebDev.Lib.w2ui.v140.demo.Utilities.Base64EncodingAndDecoding Extends %CSP.Page
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

<textarea id="encode" style="width: 100%; height: 60px; border: 1px solid silver; padding: 10px; font-size: 16px">
This <a href="http://link">is some</a> HTML <b>text</b> to be encoded.
</textarea>
<br><br>
<button class="w2ui-btn" onclick="$('#encode').val(w2utils.base64encode($('#encode')[0].value))">Encode base64</button>
<button class="w2ui-btn" onclick="$('#encode').val(w2utils.base64decode($('#encode')[0].value))">Decode base64</button>
<button class="w2ui-btn" onclick="w2alert(w2utils.encodeTags($('#encode')[0].value))">Encode HTML Tags</button>
<button class="w2ui-btn" onclick="w2alert(w2utils.stripTags($('#encode')[0].value))">Strip HTML Tags</button>
<button class="w2ui-btn" onclick="w2alert(w2utils.md5($('#encode')[0].value))">Calculate md5</button>
</body>
   </html>>
	Quit $$$OK
}

}

