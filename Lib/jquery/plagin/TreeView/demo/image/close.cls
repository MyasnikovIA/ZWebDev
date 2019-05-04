/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.close.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.close.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.close Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 28/04/2018  13:57:18
ClassMethod OnPage() As %Library.Status [ Language = cache ]
{
   w $system.Encryption.Base64Decode(..#Frag1)
     Quit $$$OK
}

ClassMethod OnPreHTTP() As %Library.Boolean
{
    Do %response.SetHeader("Content-Type","image/png") 
    if $d(%request.Data("download",1))
    {
       Do %response.SetHeader("Content-Disposition: attachment; filename=","close.png") 
       Do %response.SetHeader("Content-Length","4041") 
    }
    q 1
}

Parameter FileName = "close.png";

Parameter Frag1 = "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";

}
