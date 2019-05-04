/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.resizable.images.hsizegrip.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.resizable.images.hsizegrip.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.resizable.images.hsizegrip Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 10/04/2019  13:37:27
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","hsizegrip.png") 
       Do %response.SetHeader("Content-Length","89") 
    }
    q 1
}

Parameter FileName = "hsizegrip.png";

Parameter FragOnPage1 = "iVBORw0KGgoAAAANSUhEUgAAACEAAAAICAQAAADdTl4aAAAAIElEQVQoz2MwrTD9TxFsZ7jPcV+I
IsjFQAUw6hFqegQA+xzRHT2p7pEAAAAASUVORK5CYII=";

}

