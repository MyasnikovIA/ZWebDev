/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.edit.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.edit.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.edit Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 13/04/2018  19:59:40
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","edit.png") 
       Do %response.SetHeader("Content-Length","742") 
    }
    q 1
}

Parameter FileName = "edit.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAABEAAAATCAYAAAB2pebxAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTFH80I3AAACYklEQVQ4T32U32uSURjHX2fLRcWaQetqdBl0VQRBN7WwrmxFV73QXzCytiXeBW3UVsGudqNBIFmUlkQ0qJttUS3QVxIydZIa4Q8S0RBScUO/Pc/RI05dBz6c533PeT7nfZ/3nFcBcIowEBPESeI4cYbQEQOEvtVL+HqY4NyDxBAHEk7q7GXcDx7jBVmiyMmdCWKVRqNxOraxgWQy2eYnQe06wU/EOQcIfbdEDhqdTic0TUM6nW6TSCSQy+VoGE+IXQTnbJNI0azX60UmkxFJna1QKAixy+X6TZdy/oAMGI4vsKBeryObzfZI+J5lchLnxsdxa2aGb5kIUZM9HBA6KaB69Egq1SpM86u4du851KuqENlsNtRqNfE6OkrScw34FTiZCQaDyOfzbcH5h59w1FHD4dkYJm4/EyJVVfGnWGw+QZJW9Pl8YmWJFJQrFZgefBSC0bkfGLxbxNCUH1esS4hGozzlclNCn46r393+lss9AsN0ACOWNawHvvGUF8T+HSWbW1v9BTdX8OXrd57CgkuEbkfJ4qOnOLaU7xKswf3mHQ8/JjhX5PeV8IZafrsMx+vP2HfnlxAYpz5gZV1DOBzmKWZC5BJ7+0peejywWq20sQKwv1rF2PR7aKGY2GwtidxX3Bs4ULolNywWXDSbsbBwH263R5wbbh0SeYpZInaswp9USir0SR12OzS/H1XaH52NJaFQiMNDBOfuJkRNlFKphEgkIkT/Ix6PI988gEbOIwaJpoQYTqVS2459P1q/gjlOJPjnJE4yC2SRZHyWOEHwKswIMUaMEkcIroeoRRMo/wBQ/A4j5WcdswAAAABJRU5ErkJggg==";

}

