/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.xdata.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.xdata.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.xdata Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 04/04/2018  10:02:53
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","xdata.png") 
       Do %response.SetHeader("Content-Length","247") 
    }
    q 1
}

Parameter FileName = "xdata.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAABIAAAARCAYAAADQWvz5AAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTAw9HKhAAAAc0lEQVQ4T7WMQRKAMAgD+zOvPt4/YanSCRRxrPSwhJAMhYhSaGPbD/pD/qMMrlEFwcITtt+PrDOsfcQqsBfQSy63rsrc6u1R1lQZrxBkuGvjFYIMd228QlXBZrhrU1VgbzN7w30IvrLuEcK3N2x/KMxB5QRGi/Wxp97JxAAAAABJRU5ErkJggg==";

}

