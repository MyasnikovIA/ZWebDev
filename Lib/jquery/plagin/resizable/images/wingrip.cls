/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.resizable.images.wingrip.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.resizable.images.wingrip.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.resizable.images.wingrip Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 10/04/2019  13:37:56
ClassMethod OnPage() As %Library.Status [ Language = cache ]
{
   w $system.Encryption.Base64Decode(..#FragOnPage1)
   w $system.Encryption.Base64Decode(..#FragOnPage2)
   Quit $$$OK
}

ClassMethod OnPreHTTP() As %Library.Boolean
{
    Do %response.SetHeader("Content-Type","image/png") 
    if $d(%request.Data("download",1))
    {
       Do %response.SetHeader("Content-Disposition: attachment; filename=","wingrip.png") 
       Do %response.SetHeader("Content-Length","259") 
    }
    q 1
}

Parameter FileName = "wingrip.png";

Parameter FragOnPage1 = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAUVBMVEUAAACqqqr+/v4vLy/6+vr+
/v7+/v4AAABzc3Nvb2////+2trbJycnr6+vPz891dXVzc3OhoaF3d3eioqJ9fX2goKC+vr5/f3/L
y8t8fHz+/v4NyOEeAAAAG3RSTlMAjgtAaEpbR3wQA3dyanYndRN+L4g2mjByeR/NwbV+AAAARklE
QVR4XmMgDTAzokqwM7KgybMxockzoctziqLJc/ChynNws6LK87ByEZLnF4DLCwoB5YVFeMECYkB5
cQmgfkleKQYiAADT4wJh2XodKgAAAA==";

Parameter FragOnPage2 = "AElFTkSuQmCC";

}

