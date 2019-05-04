/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.csp.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.csp.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.csp Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 24/03/2018  11:43:12
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","CSP.png") 
       Do %response.SetHeader("Content-Length","686") 
    }
    q 1
}

Parameter FileName = "CSP.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAYAAAA71pVKAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTFH80I3AAACKklEQVQ4T42R30tTcRjGz3/RTVfdBOFVLDGoYRdF7jYIkmZkSVJk1EUOCQqCiQ2D0ZSY03CtcohzW2C41TpUi1z2e+pqNp3aWk4323a2czw/nr7fs7ZhGvXAw4EHPu/zfd/DeJ9FsJVdgTCc4+/geDihmoj50yr8NynEtmEWexpOocNkp9FGePTpFA03SSGkKCnocYzDFwxvOYAZ9n+gwQbJFBQV8IKMW/ZHqNWdrpioCj8Ym6QB6g0J1LbFIMuA3RVEn5NFriAhkxfVAeUhFCqbuet9RQNVEgEFUUaBNGY5CemsiOWMiMSKoML06URVeMD1nOynVJo5XibNL9A3xMJi96PbNoaX83E4p1mYQkY0B/ZB13kfB7s8YKzOgHoYul++KGMtL2H1p4hkeh1LyzzYL9Mwz7YjmA/Bs+TDhRELtDd8aBy9Cab3nk99Zrk5tbauNtt+N5+19ePcxCF0vrmEqx43TpoTqLPexvHH58HQXehhKvulBMSTAqLfipiJF3DZFoOu9zAaHHo0mT/imDGGXeYj2GbZXYJXCVhunv/Ol5rJtXtI80VrDk3Xn2C/+ShqBltx4Iob2jMnsMOgKcHJtIBFsl8swePzYhFTcxzeRzm8juRg8abQ2MVh7zUjtpt2QtPWgvqWEXQPukvwwg8BXwkYWSjiU4zD22geoZkcguEs/JMZdPRHUdNugKZVD23zHdTph0rXpvAs2Y9+/+VN/7kc/q+rMJhfT6Gyuzc1Yl0AAAAASUVORK5CYII=";

}

