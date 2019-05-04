/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.parameter.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.parameter.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.parameter Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 04/04/2018  10:07:22
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","parameter.png") 
       Do %response.SetHeader("Content-Length","238") 
    }
    q 1
}

Parameter FileName = "parameter.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAABIAAAARCAYAAADQWvz5AAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTAw9HKhAAAAaklEQVQ4T62M0Q6AIAwD+f+fnm4RPUghsfpwW7k1tIj4BSkdpHSQ0kFKh/FxzjJwCtV7Ag67z1a9GhUor5ybpCN0gyTdr5g78tBzbpKO0GmJPLPq1ahAiazI+9y5w1ekdJDSQUoHKd8T7QBcnG+7gb7Q2AAAAABJRU5ErkJggg==";

}

