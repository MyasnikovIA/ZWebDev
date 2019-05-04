/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.propertie.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.propertie.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.propertie Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 04/04/2018  10:03:29
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","propertie.png") 
       Do %response.SetHeader("Content-Length","261") 
    }
    q 1
}

Parameter FileName = "propertie.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAABIAAAARCAYAAADQWvz5AAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTAw9HKhAAAAgUlEQVQ4T92MSw6AMAhEvf+lEUqBAamm0ZUmzzIfOIjoE1oT4U9+PPa50ZqGHlDsmLyGh+KjQLSYiSOjwF6EPiQTbFvOepRYT1MkimGUpZWPmRCpiFJ2MbnLY3g4Yqx67oppmLei614KVSM1SzqJtqz0Gegk/n1oh7SL4g2tuQ8dJ1pVByQixHXTAAAAAElFTkSuQmCC";

}

