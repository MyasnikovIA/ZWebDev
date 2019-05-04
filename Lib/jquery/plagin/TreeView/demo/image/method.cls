/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.method.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.method.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.method Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 04/04/2018  10:03:41
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","method.png") 
       Do %response.SetHeader("Content-Length","270") 
    }
    q 1
}

Parameter FileName = "method.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAABIAAAARCAYAAADQWvz5AAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTAw9HKhAAAAiklEQVQ4T62QSxKAMAhDe/9LI4FSQFGnn8ULIbTUsRHREdyw3vGZNI+qHlaPpyB61HgpgjzdMSMNaxzO4IZ1dQnIDevqsjIEcSma4WWs1bz23exShgATw3t8maIZfJ9DTlCGYLzE1V8VI9W8McwuZQgwSf+g1zfcsP4d/iI3rKvL3LCuLgFlOA+1C96cUtidFFbyAAAAAElFTkSuQmCC";

}

