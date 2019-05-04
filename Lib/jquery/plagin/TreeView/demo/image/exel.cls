/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.exel.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.exel.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.exel Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 26/03/2018  08:24:46
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","exel.png") 
       Do %response.SetHeader("Content-Length","897") 
    }
    q 1
}

Parameter FileName = "exel.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAABEAAAASCAYAAAC9+TVUAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTAw9HKhAAAC/UlEQVQ4T5WUW0gUURjHR6WiG1omKZWiaImKUmtFkkQvQb32oAQ+RBGFWBCGYZilJqaRZJppppTrhUTTMu95ix6ym5qoaeu60+p6X82t1t1Z/53v7E5uEEEH/nNm5nznN//zfWeOIEmSAxP1jkxrmJxs7/4mipNFsfyeLmuZKGDXs85B1HQMoLq9H1Wtfah82YuKph48afyI8rr3KK17i5LaLkxOz4HFexKA5tIlOu9VLiILjmN/ugKhacFQpAZhd0oAgpP8EZjoC/8Ebyz+XMaswYKCinbsO3YaE9OzBPIikECAtJYb6FR3QLMgQm/Uw2Qxwb75xXvCwCB6BslRNqLpdZ89SBDIAQF2JikQcj0U3TM9KO+ugFvEdkQkneQQn8vbYDBaoP9uwd3H9Rwgiy8nLCOUO9AaxhCeFYLIB2EcQMrvK+QQr1h3BrE6mVywoKTlC5TNKhniKFAOaAnk4MXXesSUHUBseTiKNMXIV1shOy66YVGGzEvQzEh41KTC3qOnCOIk7EkN5IFt423I6MziDpKrDyFbfR+ZI9l8zOP8Znz7sYyZRQvG5ySop8x42DAiQxwFqgK1ssFSDigaLUZUgQLRyoNIVt3kY1tjXLiLKbYU7awE1aQZeXWjKxAqIzU5D6TbzMGR3CAorir42JbojQg+fOa3hsbNyHkuyhAHIfCaLw/8V3M9tx4TegkiywVB+rUmZNZ8XYH4J/jwfUBl9LrkzpPoccGVLcGZOyDAprPr/nDSqzEhvUorQyJoxwYwxTL55ZW3YmKeKmDhvY59fYzlQDNt5pMHxky8/zCyxHsbxIX/QEz8B7tX2swsm7ltkU2kKoywJA7prJNldQ0b7SHOBDhhA8XRlqakDenM+Mz6Qfblfq0Zn0QzukeX8E5lxJthq4srykkZspomr2LiTmhL94omFDaoeQlzakXcqRFx66kWaZVjSKkYR2KZDvElE4grnl5JrB1EoJf/KxniQQAbiMPsRM8bmOjs8Gaig4sOLWemKCY2Jjn8AqImb4ej03jAAAAAAElFTkSuQmCC";

}

