/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.namespace.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.namespace.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.namespace Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 24/03/2018  09:24:38
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","namespace.png") 
       Do %response.SetHeader("Content-Length","518") 
    }
    q 1
}

Parameter FileName = "namespace.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAPCAYAAADtc08vAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTFH80I3AAABgklEQVQ4T42SPUvDQByHSx0d/AZ+BhedHdWps1NRB8El4OKYUZwCIgo6BAWpCFIK4kuHtiq0BWkjbbG2RGO1ikExYN9f/Hn/I6nRNtqDh4PL3XNPQlwA3HYknwFCJGQNwgZD0uAlljV4RAXjSwxBwci8gp4COYwO0jHDDyYEBNlgQgNeEy4InGVBHITSfLboWSD2KKDNzdYn2m2gzuZKvY2Pcgur20cs6I9RA0YmvHDtnST5ocVNvXP77xrZ5+9C09grkGAnEIVRauHVaPLN/9awmw1GR7C1H4H+3uAF/dQIogjDAJSsKVjfDaLwUodarKHfGnb5t4AW8o9VfqtTzcKajhlJx/SKjkyuiLGpOYQVmyB1W0ZcUeFU8/zWwINeg/pURSJzj9HJWYRjNgEtEE419oJYUuV7/ZaAfddBhodwqskWKkjdlZHIlxCJ33QJ6BceJpxq7AXB8zR/ToctwZAp+YG95uIyh1D0Gqfs8GHoigusfSQgBsyZ6KrpBRtMAPcXjXrs0gvtbYAAAAAASUVORK5CYII=";

}

