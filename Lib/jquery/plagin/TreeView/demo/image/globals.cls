/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.globals.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.globals.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.globals Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 24/03/2018  11:43:32
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","globals.png") 
       Do %response.SetHeader("Content-Length","270") 
    }
    q 1
}

Parameter FileName = "globals.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAPCAYAAADtc08vAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTFH80I3AAAAiklEQVQ4T72QYQqAIAxG7Xb+j44TeDxvZX1bq80NlIKEl/a+uczUWvtEKME58HC4ul6QPHWt1ZBznmuAoohSCs2u3gkuMuOfBgiFfoiXezBw/lyaCRW0uew3y7ZK5otB+DUNGvE6PrL8MwGngRs1MCeA08CNGlyecrOZpc75peepHeSyeEso52npAOkKNOaDYO+tAAAAAElFTkSuQmCC";

}

