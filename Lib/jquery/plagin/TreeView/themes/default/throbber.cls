/// 
Class %ZWebDev.Lib.jquery.plagin.TreeView.themes.default.throbber Extends %CSP.Page [ ProcedureBlock ]
{

/// Метод разбики исходного текста на Cache` код и HTML текст
ClassMethod ExecFrag(SrcCode = "", Beg = "", End = "")
{
     q:SrcCode=""   q:Beg=""    q:End=""    for ExecFragInd=1:1:$l(SrcCode,End){  s tmp=$p(SrcCode,End,ExecFragInd)   s Html=$p(tmp,Beg,1)     s Code=$p(tmp,Beg,2)   w Html   TRY {     x Code    } CATCH ErrorHandle {    zw ErrorHandle  }    }
}

/// 23/03/2018  15:42:05
ClassMethod OnPage() As %Library.Status [ Language = cache ]
{
   w $system.Encryption.Base64Decode(..#Frag1)
     Quit $$$OK
}

ClassMethod OnPreHTTP() As %Library.Boolean
{
    Do %response.SetHeader("Content-Type","image/gif") 
    if $d(%request.Data("download",1))
    {
       Do %response.SetHeader("Content-Disposition: attachment; filename=","C:\AppServ\vakata-jstree-0097fab\dist\themes\default\throbber.gif") 
    }
    q 1
}

Parameter DstName = "%ZWebDev.Lib.jquery.plagin.TreeView.themes.default.throbber.cls";

Parameter FileName = "C:\AppServ\vakata-jstree-0097fab\dist\themes\default\throbber.gif";

Parameter Frag1 = "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
YVsUCTAZExEAOw==";

Parameter LongPath = "themes\default\";

Parameter NameOnly = "throbber.gif";

Parameter PathApp = "C:\AppServ\vakata-jstree-0097fab\dist\";

Parameter PathOnly = "C:\AppServ\vakata-jstree-0097fab\dist\themes\default\";

Parameter Rashirenie = "gif";

Parameter SrcName = "themes/default/throbber.gif";

Parameter isBinFile = 1;

}

