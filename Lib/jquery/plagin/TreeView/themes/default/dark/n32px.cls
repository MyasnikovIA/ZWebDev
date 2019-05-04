/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.themes.default.dark.n32px.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.themes.default.dark.n32px.cls'  alt='Нет фото'  width=320 height=240 >    -->
Class %ZWebDev.Lib.jquery.plagin.TreeView.themes.default.dark.n32px Extends %CSP.Page [ ProcedureBlock ]
{

/// Метод разбики исходного текста на Cache` код и HTML текст
ClassMethod ExecFrag(SrcCode = "", Beg = "", End = "")
{
     q:SrcCode=""   q:Beg=""    q:End=""    for ExecFragInd=1:1:$l(SrcCode,End){  s tmp=$p(SrcCode,End,ExecFragInd)   s Html=$p(tmp,Beg,1)     s Code=$p(tmp,Beg,2)   w Html   TRY {     x Code    } CATCH ErrorHandle {    zw ErrorHandle  }    }
}

/// 23/03/2018  15:42:04
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","C:\AppServ\vakata-jstree-0097fab\dist\themes\default-dark\32px.png") 
    }
    q 1
}

Parameter DstName = "%ZWebDev.Lib.jquery.plagin.TreeView.themes.default.dark.n32px.cls";

Parameter FileName = "C:\AppServ\vakata-jstree-0097fab\dist\themes\default-dark\32px.png";

Parameter Frag1 = "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
PvUfpTvkZYU96i8AAAAASUVORK5CYII=";

Parameter LongPath = "themes\default-dark\";

Parameter NameOnly = "32px.png";

Parameter PathApp = "C:\AppServ\vakata-jstree-0097fab\dist\";

Parameter PathOnly = "C:\AppServ\vakata-jstree-0097fab\dist\themes\default-dark\";

Parameter Rashirenie = "png";

Parameter SrcName = "themes/default-dark/32px.png";

Parameter isBinFile = 1;

}

