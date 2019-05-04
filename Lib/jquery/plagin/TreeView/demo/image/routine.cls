/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.routine.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.routine.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.routine Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 24/03/2018  11:47:41
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","routine.png") 
       Do %response.SetHeader("Content-Length","265") 
    }
    q 1
}

Parameter FileName = "routine.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAABEAAAARCAIAAAC0D9CtAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACeSURBVDhPnZLBEsMgCERjf9zxyy3ytgxS7aHvkLCyC04m7bkz51S1szLHXmvtn4yqBM4XImNm/ObI2MkYw54183G78G0g7axMDC4BQyv2y68MJ9+B2HDYY2Ddx2kJBSfA3ZjHW9CWKHsYBqZVOVm6WdTvZsTgXHhHHDIxOBfeEdc9EJIWXPdASFpQM0w9Iod5ygz+qB/03q8//JXneQPZrYibKwvZ0QAAAABJRU5ErkJggg==";

}

