/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.class.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.class.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.class Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 24/03/2018  11:43:01
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","class.png") 
       Do %response.SetHeader("Content-Length","249") 
    }
    q 1
}

Parameter FileName = "class.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAPCAYAAADtc08vAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTFH80I3AAAAdUlEQVQ4T72PAQrAIAwDfbo/71JqJcYKwsYoZ12ahtnM7BU4Ng2UYgmOTbPeO/o+UMEbusr3Ae5DVzkCKtQ5NJXXP+D76poBYVLSx/f8ZubghAYopch8GtDQuEIbwxP5VoeXvUIrlk7wstf/AU4+JylN91h7AE5Wq6d/rwbEAAAAAElFTkSuQmCC";

}

