/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.resizable.images.vsizegrip.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.resizable.images.vsizegrip.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.resizable.images.vsizegrip Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 10/04/2019  13:37:43
ClassMethod OnPage() As %Library.Status [ Language = cache ]
{
   w $system.Encryption.Base64Decode(..#FragOnPage1)
   Quit $$$OK
}

ClassMethod OnPreHTTP() As %Library.Boolean
{
    Do %response.SetHeader("Content-Type","image/png") 
    if $d(%request.Data("download",1))
    {
       Do %response.SetHeader("Content-Disposition: attachment; filename=","vsizegrip.png") 
       Do %response.SetHeader("Content-Length","91") 
    }
    q 1
}

Parameter FileName = "vsizegrip.png";

Parameter FragOnPage1 = "iVBORw0KGgoAAAANSUhEUgAAAAgAAAAhCAQAAABOpSL+AAAAIklEQVR4AWMwbb/PdR+JZDD9f1/o
PhI5sgVGBSruc9xHIgGdSQqqQJGkRgAAAABJRU5ErkJggg==";

}

