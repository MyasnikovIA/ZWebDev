/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.css.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.css.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.css Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 24/03/2018  16:05:54
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","css.png") 
       Do %response.SetHeader("Content-Length","629") 
    }
    q 1
}

Parameter FileName = "css.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTFH80I3AAAB8UlEQVQ4T5WTvYsTURTFR3BBUGQrYTsLOzv/gYDNgjbBxs7Gf0AsxPQS0SpsYaEEEdQqAWMMxnzDElYCgnarsJssS0S2kM28+c7MHO95ydt1F6dw4HAvM3N/98y9bywAq6Irg8EAlFKejll5FEXyOnKivOg2AedEF/kwns/R6/Wwvf0DSRIf5XG8uD8ajdBqtaAcJSUacIOAsyKr3+9jPo8w2dvHdPpLA0yeponOh8MhPM9Du92GbduEPCDgjGit2+2KvVBD6IRdCaEIoNi92WxqMZfrDgHU+U6ngygMFhD5zpigf0B+TqeYjMcGcJnFa6L8/cfPsSsPGMd/xSzRhVxXCcgd/LbxtvcVJlJPXn3E5+8Hx07ik06WgA2LnUwxc6PX3W949m4r00mj0SDguuWHUd4UO44D13UQ+J52wHuBH8hMlsPVThZzqdfrBDw8csC4s7OrxQ4GQJ3uTtVqNQLyVpqm6wZgz2Z6v564MAClHISBbCfkdo7XXK1WCbipHWy8aeDTl4kuMnrxfgtPX9YyHVQqFQJu0UGOxYTwZaNH5Q8a4rkufDl9ge8vnSzOSrlcJuAa13g3SdJN0+l0zFKpVCLgkjmJF3iU7cNDKJmDsmdwZBaOUnDlx+FM/BNOfBSLRQLWDWCFgEKh8F8CcO8Pq3RdYG3KIDYAAAAASUVORK5CYII=";

}

