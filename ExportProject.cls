Class %ZWebDev.ExportProject Extends %CSP.Page
{

Parameter FileName = {"ZWebDev("_$ZU(5)_").xml"};

///  d ##class(%ZWebDev.ExportProject).ExportProject("C:\!WOR\DEV.xml")
ClassMethod ExportProject(path = "")
{
	k all
	s ClassName="" 
    For { 
       s ClassName=$o(^oddDEF(ClassName)) 
       q:ClassName="" 
       continue:$l(ClassName,"%ZWebDev.")=1
       s all(ClassName_".cls")=""
    }
    //d $system.OBJ.Export(.all,path,,,"CP1251")
    d $system.OBJ.Export(.all,path)
    k all
}

/// d ##class(%ZWebDev.ExportProject).ExportProjectUDL("C:\!WOR\DEV")
ClassMethod ExportProjectUDL(path = "")
{
	s ClassName="" 
    For { 
       s ClassName=$o(^oddDEF(ClassName)) 
       q:ClassName="" 
       continue:$l(ClassName,"%ZWebDev.")=1
       s newpath=path_"\"_ClassName  ; //
       s newpath=$replace(newpath,".","\")
       s newpath=newpath _".cls"
       s newpath=$tr(newpath,"%")
       d $system.OBJ.ExportUDL(ClassName_".cls", newpath,"/diffexport")
    }
    k all
}

ClassMethod OnPage() As %Status
{
    if ##class(%File).Exists(..#FileName)=1   {
           S stream=##class(%FileBinaryStream).%New()
           S stream.Filename=..#FileName
           While 'stream.AtEnd  {
                s readFrag=stream.Read(32000)
                w readFrag
           }
           d stream.%Close()
           d ##class(%File).Delete(..#FileName)
           ; Do $system.OBJ.Delete(##THIS,"c",.errorlog)
	  Quit $$$OK
    }
    w "<pre>"
     d ..ExportProject(..#FileName)
     ; Do $system.OBJ.ExportAllClasses("D:\sirena\EcoClass.tx_","Sirena",.errorlog)
     w "</pre>"
     w "<script>",$c(13,10)
     w "    window.location.href=window.location.toString();",$c(13,10)
     w "    alert('Перезагрузите страницу!!!!');",$c(13,10)
     w "</script>",$c(13,10)
  Quit $$$OK
}

ClassMethod OnPreHTTP() As %Library.Boolean
{
    if ##class(%File).Exists(..#FileName)=1   {
       do %response.SetHeader("Content-Disposition","attachment;filename="""_..#FileName_"""")
      set %response.Expires = "Thu, 01 Apr 2003 00:00:00 GMT"
      set %response.HeaderCharSet ="windows-1251"
      set %response.ContentType="application/x-msexcel"
    }else{
      Do %response.SetHeader("Content-Type","text/html")   
    }
    q 1
}

}

