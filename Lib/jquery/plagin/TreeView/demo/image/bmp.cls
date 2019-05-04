/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.bmp.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.bmp.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.bmp Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 24/03/2018  16:51:00
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","bmp.png") 
       Do %response.SetHeader("Content-Length","627") 
    }
    q 1
}

Parameter FileName = "bmp.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAOCAIAAACpTQvdAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwwAADsMBx2+oZAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTFH80I3AAAB70lEQVQoU5WRzWsTQRiHZyYTJ1/bzabJ7mqyKa2pSgN+ITYVWhFFxYMn8SDotX+AV0/eRDx4zKXgpQdFDwHv9VAQUQkSaWJtqzEhYtq6yZps9mvGSTYHj/W5zDA8P37v8MJSqQT+Cx5gB4bL2I89XSzE21sBF+x7lAbx5NWbUTUjX58XhERKyLSNZt/sLJy+wk3kR/fKZdB3QdAkTs9r6mDlmfVpXTs8parqhBRRFDmIQ76J6AgQZobCcvdh+h7EItJjqF2pVoqrIkk2O9tCSFLEKd9EnseHoDGC4zMOOWMnLjExj2kkALsGPql9fLvidnpfKq9qO2tc4zIexagwgVIgUFtF1h94xCSeY5tdB/bWgffZ2JbT5H2DXaDzt7k5bogAnNwJ5TZJ/lfEbUCFBA8tpIXy86T+fRq+SRArz95xjcvDAGcfKj8d6jaQ22ImADBnFu4YqRNo65vxco19rfVd0/LNcUNLkH4MQD2sVTOFuscE1cs6rY2q/eBF/OHr8OOS19Ntv2H8h+O3biRAOHZM1VLShycb2vldagG9A3d/2/2BEyWQEOCb2G+YW7ooRpPtbmPAaPbaos32NrvR7FF6d8lkCF8+JdUDZ9V/G2an5/gWZVkern32HACPJoc3kF8eHSN8ExaLxfHDQQDgL3d3UtzHHdETAAAAAElFTkSuQmCC";

}

