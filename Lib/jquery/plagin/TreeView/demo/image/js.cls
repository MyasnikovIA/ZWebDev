/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.js.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.js.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.js Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 24/03/2018  16:05:39
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","js.png") 
       Do %response.SetHeader("Content-Length","270") 
    }
    q 1
}

Parameter FileName = "js.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAIAAACQkWg2AAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTFH80I3AAAAiklEQVQ4T5WOAQ7AIAgDefqe5s9cbR0oIWZelg0qJ7PnBgP49B2dOTPtvbVWCGyN5XhriG0lqMZmPZpAKCcLixnHCH1JLfj1KxooBZ3FfWwnWQByfElyCgEc9tQbBPPxIHQnCyqUymEcP7YJn+ZJngbFBkQABXLVPg3UhgBGvzMPSAi86xe85AqzF+ahwYWHyncpAAAAAElFTkSuQmCC";

}

