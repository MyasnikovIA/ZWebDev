/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.fr3.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.fr3.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.fr3 Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 26/03/2018  08:31:03
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","fr3.png") 
       Do %response.SetHeader("Content-Length","497") 
    }
    q 1
}

Parameter FileName = "fr3.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAABEAAAASCAYAAAC9+TVUAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTAw9HKhAAABbUlEQVQ4T52Sv0vDQBTH86PVqeDW0Skugn+A4h9g0K6lgzi1nZw7uQWEjlI69W/oUpdCoehuF6WbLo4OmkgMpNHne4+78BITLD34cHff3H3y7hIDAJgkSSRmbl4K7jVTSRyv7FZrAkfHN6X0evfMcvn2iAIHMTMS34/qtPAj+IHPMAtlX9EK2u0pj7vdGYlASWwS2EpikeTd/4YT12Pm8yd8BCwg6HmzOYFOZwbD4UJLLJJUEDMvObw6h73pPjQWDc60SAqlpKYkppRc3F6Cc+eA9+xxJonCREr4Tug4GQm1MAlh9DqC/kv/jyQIYi3hvYUSOvPp2Zh7gjLXHafQvFCCQXon66Ak21rC5yKrllCTbyzrcQ99FENKMpVoSRlKQntZYilJeieErETn+bGUFN7JppUUSijTeX4sJTzAoKYXrIOSVKWEKtlEUpcSqqQ6GDykJf8HrVWVZP4TjYXsItci02whFWQHOaAMAIxfyCejAY11n80AAAAASUVORK5CYII=";

}

