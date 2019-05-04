/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.newdoc.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.newdoc.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.newdoc Extends %CSP.Page
{

/// 13/04/2018  15:11:19
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","NewDoc.png") 
       Do %response.SetHeader("Content-Length","597") 
    }
    q 1
}

Parameter FileName = "NewDoc.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAABIAAAAUCAYAAACAl21KAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTAw9HKhAAAB0UlEQVQ4T42ROUxCQRRF34BoYuIWNWqsTLSwNBaGysbExFI7WuwoKWkpf0lpS2lJSUtJo2LcvnswLnzFBTXqeO84Y3AJn5ecvJnPnJs3g7y9fyjAHrVrB7+1wp2LcS8vr++qiaglBnrBAJgF86APLIAIoOdcs5an5zcyCFbK5bIOw/f9C5xV1iNmLfXHV6J4qJ0qlUoM03C6rWuQoP5CvoMajcYfgiAwsKrV6ncYvCnri1wFz+RHkOu/w5q/uzC4q/Tl4vpJkf+u9l9Qc9GBOw5Ezi8fY0BavVFzGOH1WHTgKvqysXszBFoGsX6HsejQJbK5dzMCQoNYLoyw6MDtp4+gWido++//G1RTQGRrv6ZIO0GFUl6n1xI6k0sZvHxGw10BIpWDQIGusCCGZNeTulDJ6Uq1qL1iSi970zq3ntXwRbb9WxI6EScoVDwTxPKKSUM8NaHpy87hLQkNWsrMIGTN7r6KofHUqGaG7B7dGcKC4ukJM0G2mDB7djcRfdk7rhvCgvgWfBPKnITdvRH8Htk/uVeAfZFhreA7cQJehz2bT2t4Y2BO/NP7CFBg2K7dnj0KJsEI6AM8z9/4nfsY6AAROTx7UIC9w/YweN45lgf1CbsKoRevP8HsAAAAAElFTkSuQmCC";

}

