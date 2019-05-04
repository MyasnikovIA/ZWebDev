/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.query.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.query.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.query Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 04/04/2018  10:03:04
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","query.png") 
       Do %response.SetHeader("Content-Length","244") 
    }
    q 1
}

Parameter FileName = "query.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAABIAAAARCAYAAADQWvz5AAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTAw9HKhAAAAcElEQVQ4T62OgQoAIQhD+3T/3Er0MrCmcYOBLn3WmPkXh+GLVzHKqm1X9r9CHkclzfK5b0xE0mq0g/K+gCqCoPnofcogKCsI8pd1MMwgKCsI8pd1MMwgKCsI8pd1MMwgKKsrqOoQNG1fr9h2N9C7uXXt/km3jbgu2AAAAABJRU5ErkJggg==";

}

