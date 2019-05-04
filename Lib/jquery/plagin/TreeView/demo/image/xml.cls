/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.xml.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.xml.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.xml Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 24/03/2018  16:55:00
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","xml.png") 
       Do %response.SetHeader("Content-Length","435") 
    }
    q 1
}

Parameter FileName = "xml.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAAA4AAAAQCAYAAAAmlE46AAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTFH80I3AAABL0lEQVQ4T5XPr2vDQBQH8PsbJjY72T9hdmpM7j8Y+QtGVYkOU1OhTIRQOZeIwVUUUjO4ikHNIHOZqIiYiEjgRMR3914vvwi02YPvkUvyufdOqA+FKUm2Ceq6hqk7k0uG4P3p2n/ukWwSVFVVmO2FoJMYnsFqp6C1ZlyWJYbwBCbQzxiapIcc7iaEEyjIbUqOK89z5D+ZhWZBrZF+pZg/uQydlQfvkMDZady/zRnRt+w74+cWFr9Fiyg3jxFmscRtrDCj97boH10e7ynkWvKl+x3lOsO1/4CrwMGLbyayKDdXoCIj5PsRUszCYzedB+kVmQGcihlGccRzEwqDaJzXLs0BZDpo8aBzk37XBoarsIVTO5IRS3/ZdWxiu44msHcnI7xnbwzPYDLCXbj4f1z8ARm+B3CdIo30AAAAAElFTkSuQmCC";

}

