/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.compile.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.compile.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.compile Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 10/04/2019  16:20:26
ClassMethod OnPage() As %Library.Status [ Language = cache ]
{
   w $system.Encryption.Base64Decode(..#FragOnPage1)
   w $system.Encryption.Base64Decode(..#FragOnPage2)
   w $system.Encryption.Base64Decode(..#FragOnPage3)
   w $system.Encryption.Base64Decode(..#FragOnPage4)
   Quit $$$OK
}

ClassMethod OnPreHTTP() As %Library.Boolean
{
    Do %response.SetHeader("Content-Type","image/png") 
    if $d(%request.Data("download",1))
    {
       Do %response.SetHeader("Content-Disposition: attachment; filename=","CompileIcon.png") 
       Do %response.SetHeader("Content-Length","753") 
    }
    q 1
}

Parameter FileName = "CompileIcon.png";

Parameter FragOnPage1 = "iVBORw0KGgoAAAANSUhEUgAAABUAAAAUCAYAAABiS3YzAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAAKGSURBVDhPjZS9TipREMdnARUTaYzho1F6KVRC
69uArT00FhQUxk4egEgCNeElKIQnUBspBEL4kCjgur/Jnb17QZP7T4YzM+c/c2bmHNaZz+euB0Ec
x5HpdCqFQkGCwG+cUCikPnRwe3srqVRKOYiCpMhkMnFns5n7/v7utlotIlQ8oq9vSq1WUz5xXjGa
B5vK1ImD1ZKzlstlDQ4mRi+VSu5wOA==";

Parameter FragOnPage2 = "VF5QyIVo+x75x/ZWq5XE43FZLpdq097Ozo68vr7K3t6ez/36+tLVbP21hASZDjEcDstgMJBqtark
SqUiLy8vEo1G/QQGYg0ObZIA4XQQPITE7N3d3cn19bXqkUjE58HBRzfoKmdnZ26329W2xuOxbgIL
hETwer1WPZgQHwmJPTo6ksViIcfHxxKCCFitCkgEfX5+8jrk4+ND/eyjE8weIzCuP09v9ZMasJF2
uy25XE4vKpvNqu/y8lIODw8lk8lIs9nUBFYMiYEeoNofQIBoJGxmim7VmG7CCKxKgK4DIthWSMjp
6anc3NxomwcHB/q8isWieO9RL5R9Dg==";

Parameter FragOnPage3 = "x28XTDwHOefn5+7j46Ps7u7KaDTyKzWSCRdoL2GzenyJRELnf3Jysj3Tfr8v9XpdOIhLoWpeRaPR
0BU+/l6vJw8PD/L09KRxHADYD5kB0J+fn/WDwkXQKknpIJ/P+wlIykVeXV1Jp9NRnxWnSTcrNdAS
rfFkDNjMkMODcdhWHHFbMwW8Q4K4AOYHqHp/f18r582SPHhJyWTy70zVEwDJCOb/jc7JVIFPn4uX
ED+rfQOwrVLFxcUF1q/iBfzo/03S6bS7Vekm/qngPwDfub+/d9/e3vxgWgG66elmA3yMA9is8RkX
xGIx+QaBlixNhaIHcwAAAABJRU5Erg==";

Parameter FragOnPage4 = "QmCC";

}

