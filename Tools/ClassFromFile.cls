Class %ZWebDev.Tools.ClassFromFile Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{

	&html<
	  <title>Create Object Script Class</title>

	  <script type="text/javascript" src="%25ZWebDev.Lib.js.cls"></script>
	  <script src='%25ZWebDev.Lib.jquery.v320.min.js.cls'  language='JavaScript'></script>  
	  <script src='%25ZWebDev.Lib.bootstrap.v337.min.js.cls'></script> 
	  <link  href='%25ZWebDev.Lib.bootstrap.v337.min.css.cls'  rel='stylesheet' >   
	  <script src='%25ZWebDev.Lib.bootstrap.plagin.confirm.js.cls'></script> 
      <br>      
      >
    d ..DrawBody()
	Quit $$$OK
}

ClassMethod DrawBody() As %String
{

	 if $d(%request.Data("json",1)) {
	    d ##class(%ZEN.Auxiliary.jsonProvider).%ConvertJSONToObject(%request.Get("json",""),,.override,1)
	    if $d(override.%data("namespace")){
           d $zu(5,override.%data("namespace"))
	    }
     }
	if '$d(override){
	   s override=##class(%ZEN.proxyObject).%New()
	   s override.namespace=$ZU(5)
	}

	
 &html<     


      <div id="exTab2" class="container">	
           
           
           <label for="FileName" class="label label-default" >File Name source:</label>
 	       <input id='FileName'  class="form-control form-control-sm" type="file" /><br>
          <ul class="nav nav-tabs" id="WorkTabs">
              <li class="active"><a href="#CspTab"      data-toggle="tab">CSP class</a></li>
              <li               ><a href="#RestTab"      data-toggle="tab">Rest class</a></li>
              <li               ><a href="#GlobalTab"    data-toggle="tab">Global</a></li>
              <li               ><a href="#FileDstTab"    data-toggle="tab">Server file</a></li>
          </ul>
          <div class="tab-content ">
		   <!-- CSP -->
		   <div  class="tab-pane active" id="CspTab">
		       <br>  	       
               <label for="ClassNameDst" class="label label-default" >ClassName:</label>
  	           <input id='ClassNameDst'  class="form-control form-control-sm"/><br>
               <label for="DescriptorClass"   class="label label-default" >Descriptor class:</label>
               <textarea id="DescriptorClass" class="form-control form-control-sm" rows="10" ></textarea>
               <div align="right">
                  <button type="button" class="btn btn-xs btn-primary " id='ExecuteCreateCSPclass'>Create class</button>
               </div>
               <br>
	       </div>
		   <!-- REST -->
		   <div class="tab-pane " id="RestTab">
		       <BR>
               <label for="ClassNameRestDst" class="label label-default" >Class name:</label>
  	           <input id='ClassNameRestDst'  class="form-control form-control-sm"/><br>
               <label for="ClassMethodRestDst" class="label label-default" >Method name:</label>
  	           <input id='ClassMethodRestDst'  class="form-control form-control-sm"/><br>
               <label for="DescriptorRestClass"   class="label label-default" >Descriptor classmethod:</label>
               <textarea id="DescriptorRestClass" class="form-control form-control-sm" rows="10" ></textarea>
               <div align="right">
                  <button type="button" class="btn btn-xs btn-primary " id='ExecuteCreateRestclass'>Create rest class</button>
               </div>
               <br>
	       </div>
		   <!-- global -->
		   <div class="tab-pane " id="GlobalTab">
		       <BR>
               <label for="GlobalNameDst" class="label label-default" >Global name:</label>
  	           <input id='GlobalNameDst'  class="form-control form-control-sm"/><br>
               <div align="right">
                  <button type="button" class="btn btn-xs btn-primary " id='ExecuteCreateGlobal'>Create global</button>
               </div>
               <br>
	       </div>
		   <div class="tab-pane " id="FileDstTab">
		       <BR>
               <label for="PathNameDst" class="label label-default" >Path dst name:</label>
  	           <input id='PathNameDst'  class="form-control form-control-sm"/><br>
               <div align="right">
                  <button type="button" class="btn btn-xs btn-primary " id='ExecuteCopyFile'>Copy file</button>
               </div>
               <br>
	       </div>

  	      </div>
           <pre   id="ConsoleTerminal"  class='pre-scrollable'  slyle='overflow: hidden;border: dotted; '></pre>
     </div>
        
        
    

	    
              <script language='javascript'> 
              
              var arrayBufferToBase64=function(ab){
                  var dView = new Uint8Array(ab);   
                  var arr = Array.prototype.slice.call(dView); 
                  var arr1 = arr.map(function(item){        
                     return String.fromCharCode(item);    
                  });
                  return window.btoa(arr1.join(''));   
               }
              

               var SelTypeClass='csp';
               $('input:radio[name="postage"]').change(function() {
                  SelTypeClass=$(this).val() ;
               });
               
              
               isOkFun=function(txt){
	              $('#ConsoleTerminal').append(txt);
                  $("#CommandText").removeAttr("disabled");
                  $("#TextMac").removeAttr("disabled");
	           } 
               ProgrressBarFun=function(txt){ 
                  $('#ConsoleTerminal').append(txt);
	           } 
               
               
               
               
               var ActiveFileName='';
               CreateClassCache=function(PacName,Descript){
	               $('#ConsoleTerminal').text('');
                   var f = document.getElementById('FileName').files[0];
                   var reader = new FileReader();
                   // reader.onerror = errorHandler;
                   // reader.onprogress = updateProgress;
                   reader.onabort = function(e) {   alert('File read cancelled');   };
                   // reader.onloadstart = function(e){  document.getElementById('progress_bar').className = 'loading'; };
                   reader.onload = (function(theFile) {
                        return function(e) {
                             var FileName=escape(theFile.name);
                             var FileNameOne=FileName.replace(/\.\w+/,'');
                             Descript = Descript.replace(/(\r\n|\n|\r)/gm,"\r///<br>");
                             #server(..CreateMyClass(FileName,Descript,PacName,  arrayBufferToBase64(e.target.result),theFile.size,SelTypeClass,"#(override.namespace)#",isOkFun,ProgrressBarFun))#; 
                             
                        };
                   })(f);
                   reader.readAsArrayBuffer(f);
                   //  reader.readAsDataURL(f);
                   //  reader.readAsBinaryString(f);
                   //  reader.readAsArrayBuffer(f);   
               }
               
               $('#ExecuteCreateCSPclass').click(function(){
                  SelTypeClass='csp'
                  PacName=$("#ClassNameDst").val();
                  var Descript=$("#DescriptorClass").val();
                  CreateClassCache(PacName,Descript);
               });
               
               $('#ExecuteCreateGlobal').click(function(){
                   SelTypeClass='global'
                   PacName=$("#GlobalNameDst").val();
                   CreateClassCache(PacName,'');
               });
               
               $('#ExecuteCreateRestclass').click(function(){
                   SelTypeClass='rest'
                   PacName=$("#ClassNameRestDst").val();
                   MethodName=$("#ClassMethodRestDst").val();
                   if (MethodName.length>0){
	                   PacName+='.'+MethodName;
                   }
                   var Descript=$("#DescriptorRestClass").val();                   
                   CreateClassCache(PacName,Descript);
               });
               
               $('#ExecuteCopyFile').click(function(){
                   SelTypeClass='file'
                   PacName=$("#PathNameDst").val();
                   CreateClassCache(PacName,'');
               });
               
              </script>  
	
	>
	q ""
}

ClassMethod ContentTypeLocal(FileName) As %String
{
     s rashirenie=$p(FileName ,".", $l(FileName,"."))
     q:rashirenie="css" "text/css"
     q:rashirenie="js" "application/x-javascript"
     q:rashirenie="xml" "text/xml"
     q:rashirenie="dtd" "text/xml"
   ; -------------------------------------
     q:rashirenie="txt" "text/plain"
     q:rashirenie="inf" "text/plain"
     q:rashirenie="nfo" "text/plain"
   ; -------------------------------------
     q:rashirenie="html" "text/html"
     q:rashirenie="htm" "text/html"
     q:rashirenie="shtml" "text/html"
     q:rashirenie="shtm" "text/html"
     q:rashirenie="stm" "text/html"
     q:rashirenie="sht" "text/html"
     q:rashirenie="sht" "text/html"
     q:rashirenie="csp" "text/html"
     q:rashirenie="mac" "text/html"
     q:rashirenie="cls" "text/html"
     ; q:rashirenie="cos" "text/html" ; каше обжект скрипт
   ; -------------------------------------
     q:rashirenie="mpeg" "video/mpeg"
     q:rashirenie="mpg" "video/mpeg"
     q:rashirenie="mpe" "video/mpeg"
   ; -------------------------------------
     q:rashirenie="ai" "application/postscript"
     q:rashirenie="zip" "application/zip"
                  q:rashirenie="zsh" "text/x-script.zsh"
                  q:rashirenie="x-png" "image/png"
                  q:rashirenie="xls" "application/x-excel"
                  q:rashirenie="xlm" "application/excel"
                  q:rashirenie="wav" "audio/x-wav"
                  q:rashirenie="txt" "text/plain"
                  q:rashirenie="tiff" "image/tiff"
                  q:rashirenie="tif" "image/x-tiff"
                  q:rashirenie="text" "text/plain"
                  q:rashirenie="swf" "application/x-shockwave-flash"
                  q:rashirenie="sprite" "application/x-sprite"
                  q:rashirenie="smil" "application/smil"
                  q:rashirenie="sh" "text/x-script.sh"
                  q:rashirenie="rtx" "text/richtext"
                  q:rashirenie="rtf" "text/richtext"
                  q:rashirenie="pyc" "application/x-bytecode.python"
                  q:rashirenie="py" "text/x-script.phyton"
                  q:rashirenie="png" "image/png"
                  q:rashirenie="pic" "image/pict"
                  q:rashirenie="mp3" "video/mpeg"
                  q:rashirenie="mp2" "video/mpeg"
                  q:rashirenie="movie" "video/x-sgi-movie"
                  q:rashirenie="mov" "video/quicktime"
                  q:rashirenie="mjpg" "video/x-motion-jpeg"
                  q:rashirenie="mime" "www/mime"
                  q:rashirenie="mif" "application/x-mif"
                  q:rashirenie="midi" "audio/midi"
                  q:rashirenie="js" "application/javascript"
                  q:rashirenie="jpeg" "image/jpeg"
                  q:rashirenie="jpg" "image/jpeg"
                  q:rashirenie="jps" "image/x-jps"
                  q:rashirenie="jam" "audio/x-jam"
                  q:rashirenie="jav" "text/plain"
                  q:rashirenie="java" "text/x-java-source"
                  q:rashirenie="htm" "text/html"
                  q:rashirenie="html" "text/html"
                  q:rashirenie="gzip" "application/x-gzip"
                  q:rashirenie="gif" "image/gif"
                  q:rashirenie="gl" "video/gl"
                  q:rashirenie="csh" "text/x-script.csh"
                  q:rashirenie="css" "text/css"
                  q:rashirenie="bsh" "application/x-bsh"
                  q:rashirenie="bz" "application/x-bzip"
                  q:rashirenie="bz2" "application/x-bzip2"
                  q:rashirenie="c" "text/plain"
                  q:rashirenie="c++" "text/plain"
                  q:rashirenie="cat" "application/vnd.ms-pki.seccat"
                  q:rashirenie="cc" "text/plain"
                  q:rashirenie="htmls" "text/html"
                  q:rashirenie="bmp" "image/bmp"
                  q:rashirenie="bm" "image/bmp"
                  q:rashirenie="avi" "video/avi"
                  q:rashirenie="avs" "video/avs-video"
                  q:rashirenie="au" "audio/basic"
                  q:rashirenie="arj" "application/arj"
                  q:rashirenie="art" "image/x-jg"
                  q:rashirenie="asf" "video/x-ms-asf"
                  q:rashirenie="asm" "text/x-asm"
                  q:rashirenie="asp" "text/asp"
     q "application/octet-stream"
}

ClassMethod CreateMyClass(FileName, Descript, PacName, BlobsFile, siz, SelTypeClass, NameSpace = {$ZU(5)}) As %String
{
	d $zu(5,NameSpace)
	
	s FileName=$zcvt(FileName,"I","URL")
	s Descript=$zcvt(Descript,"I","URL")
	s PacName=$zcvt(PacName,"I","URL")
	; zw FileName
    ; zw Descript
    ; zw PacName
    ; zw BlobsFile, siz, SelTypeClass
    
	s ind=0
	if SelTypeClass="global"{
	   s ind=ind+1
	   s html=BlobsFile
	   s html=$system.Encryption.Base64Decode(html)
	   // s @PacName@(ind)=html
	   s @PacName=html
       w "File write to global:"_PacName
	   q $c(10)_"OK"
	}
	
	
	
	if SelTypeClass="file"{
	   if $l(PacName)=0{
		 w "No select path dst"   
		 q $c(10)_"OK"
	   }
	   ; if ##class(%File).Exists(PacName)  d $system.OBJ.Delete(PacName)   
       s val=$system.Encryption.Base64Decode(BlobsFile)
       // FileName
	   Set file=##class(%File).%New(PacName)
       Do file.Open("WSN")
       Do file.Write(val)
       Do file.Close()
       set file=""
       w "File "_FileName_" save to "_PacName,!
	   q $c(10)_"OK"
	}
	s rashirenie=$ZCVT($p(FileName ,".", $l(FileName,".")),"L")
    s Typ=..ContentTypeLocal(FileName)
    if $l(PacName,".")=1{
       s classname="User."_PacName
    }else{
       s classname=PacName
    }
    
    
    
    if SelTypeClass="rest"{
       s classnameSrc=classname
       s MethodName=$p(classname,".",$l(classname,"."))
       s classname=$e(classname,1,$l(classname)-$l(MethodName)-1)
       if $zObjClassMethod("%CompiledClass","%ExistsId",classname)=1 {
	      s tt=##class(%Dictionary.ClassDefinition).%OpenId(classname)
          s distrTmp=tt.Description
          s tt.Description="-----"_$h
          s tt.Description=distrTmp
       }else{   
          s tt=##class(%Dictionary.ClassDefinition).%New(classname)
          s tt.Description=""
          s tt.Super="%CSP.REST"
            s paramName="UrlMap"
            s param1=##class(%Dictionary.XDataDefinition).%New(classname_"."_paramName)
            s param1.Name=paramName
            s param1.XMLNamespace="http://www.intersystems.com/urlmap"
            d param1.Data.Write($c(10)_"<Routes>")
            d param1.Data.Write($c(10)_"</Routes>")
            d param1.%Save()
            d tt.XDatas.Insert(param1)
            d tt.%Save()
            s distrTmp=tt.Description
            s tt.Description="-----"_$h
            s tt.Description=distrTmp
       }
       if $l(tt.Description)=0{
          s tt.Description=tt.Description_$c(10)_"///      <Routes>"
          s tt.Description=tt.Description_$c(10)_"///      </Routes>"
       }
       s newdesc="<Route Url=""/"_classname_"_"_MethodName_""" Method=""GET"" Call="""_classname_":"_MethodName_"""/>"

       /// добавить "UrlMap" Если есть Xdata
       if $d(^oddDEF("User.rest","x","UrlMap")) {
           if $d(^oddDEF(classname,"x","UrlMap",21)){
               m ^mtempCopyXdata($job)=^oddDEF(classname,"x","UrlMap",21)
               s CountLine=0
               for {
	              s ind=$o(^mtempCopyXdata($job,ind))
	              q:ind=""
	              s line=^mtempCopyXdata($job,ind)
	              s CountLine=CountLine+1
	              s ^oddDEF(classname,"x","UrlMap",21,CountLine)=line
	              if $l(line,"<Routes>")>1{
	                 s CountLine=CountLine+1
	                 s ^oddDEF(classname,"x","UrlMap",21,CountLine)=newdesc
	              }
               }
               k ^mtempCopyXdata($job)
               s ^oddDEF(classname,"x","UrlMap",21)=CountLine
           }
       }
       if $l(tt.Description,newdesc)=1 {
           s tt.Description=$replace(tt.Description, "<Routes>", "<Routes>"_$c(10)_"/// "_newdesc )
       }
       s MethodDestroy=##class(%Dictionary.MethodDefinition).%New(classname_"."_MethodName)
       s MethodDestroy.ReturnType="%Library.String" 
       s MethodDestroy.Description= Descript
       s MethodDestroy.CodeMode="code"
       s MethodDestroy.Name=MethodName
       s MethodDestroy.Language="cache"
       s MethodDestroy.ClassMethod=1
       ; d MethodDestroy.Implementation.WriteLine("  Set %response.ContentType=""text/plain"" ")
       d MethodDestroy.Implementation.WriteLine("   Set %response.ContentType="""_Typ_"""  ")
       d tt.%Save()
	   s lengFrag=600
       s val=$system.Encryption.Base64Decode(BlobsFile)
       for  {
           q:$l(val)=0 
           s SubVal=$e(val,1,lengFrag)
           q:$l(SubVal)=0
           s val=$e(val,lengFrag+1,$l(val))
  	       s ind=ind+1
           s paramName="Frag"_MethodDestroy.Name_ind
           s param=##class(%Dictionary.ParameterDefinition).%New(tt.Name_"."_paramName)
           s param.Name=paramName    
           s param.Default=$system.Encryption.Base64Encode(SubVal)
           d param.%Save()
           d tt.Parameters.Insert(param)
           d tt.%Save()
           d MethodDestroy.Implementation.WriteLine("   w $system.Encryption.Base64Decode(..#"_paramName_")")
           s param=""
       }
       d MethodDestroy.Implementation.WriteLine("   Quit $$$OK ")
       s MethodDestroy.Internal=0
       d MethodDestroy.%Save()
       d tt.Methods.Insert(MethodDestroy)
       s fl=tt.%Save()
       Do $system.OBJ.Compile(classname,"cuk /checkuptodate=expandedonly")
       w $c(10)_newdesc_$c(10)
       q $c(10)_""
    
    }
   
    if SelTypeClass="csp"{
       // Удаляем старый класс если он есть
       Do:$zObjClassMethod("%CompiledClass","%ExistsId",classname)=1 $system.OBJ.Delete(classname)    
       s tt=##class(%Dictionary.ClassDefinition).%New(classname)
       s tt.Super="%CSP.Page"
       s tt.Description=""
       if $l("js",rashirenie)'=1{
	      s tt.Description=tt.Description_$c(10)_"///<br>Скрипт(JS):"
	      s tt.Description=tt.Description_$c(10)_"///<br> &lt;script src='"_classname_".cls'&gt;&lt;/script&gt; " 
	      s tt.Description=tt.Description_$c(10)_"///<br> <!--  <script src='"_classname_".cls'></script>   -->" 
       }
       if $l("css",rashirenie)'=1{
	      s tt.Description=tt.Description_$c(10)_"///<br>Файл стилей:"
	      s tt.Description=tt.Description_$c(10)_"///<br>  &lt;link href='"_classname_".cls'  rel='stylesheet' &gt;" 
	      s tt.Description=tt.Description_$c(10)_"///<br>  <!--  <link  href='"_classname_".cls'  rel='stylesheet' >    -->" 
       }
    
       if $l("jpeg,jpg,bmp,tiff,tif,png",rashirenie)'=1{
	      s tt.Description=tt.Description_$c(10)_"///<br>Изображение:"
	      s tt.Description=tt.Description_$c(10)_"///<br>  &lt;img src='"_classname_".cls'  alt='Нет фото'  width=320 height=240 &gt;" 
	      s tt.Description=tt.Description_$c(10)_"///<br>  <!--  <img  src='"_classname_".cls'  alt='Нет фото'  width=320 height=240 >    -->" 
	      // <img src='HTML.img.NoFoto.cls' alt='Нет фото' >
       }
       ///    &lt;script src="HTML.bootstrap.v337.bootstrap.min.cls"&gt;&lt;/script&gt;
       ///    <!--   <script src='HTML.bootstrap.v337.bootstrap.min.cls'/>-->
       s tt.Description=tt.Description_$c(10)_"///"_Descript
       s fl=tt.%Save()
       s MethodNameHead="OnPreHTTP"
       s MethodHead=##class(%Dictionary.MethodDefinition).%New(classname_"."_MethodNameHead)
       d MethodHead.Implementation.WriteLine("    Do %response.SetHeader(""Content-Type"","""_Typ_""") ")
       if Typ="application/octet-stream" {
           d MethodHead.Implementation.WriteLine("       Do %response.SetHeader(""Content-Disposition: attachment; filename="","""_FileName_""") ")
           d MethodHead.Implementation.WriteLine("       Do %response.SetHeader(""Content-Length"","""_siz_""") ")
       }else{
           d MethodHead.Implementation.WriteLine("    if $d(%request.Data(""download"",1))") 
           d MethodHead.Implementation.WriteLine("    {")
           d MethodHead.Implementation.WriteLine("       Do %response.SetHeader(""Content-Disposition: attachment; filename="","""_FileName_""") ")
           d MethodHead.Implementation.WriteLine("       Do %response.SetHeader(""Content-Length"","""_siz_""") ")
           d MethodHead.Implementation.WriteLine("    }")
       }
       d MethodHead.Implementation.WriteLine("    q 1  ")
       s MethodHead.Internal=0
       s MethodHead.CodeMode="code"
       s MethodHead.Name=MethodNameHead
       s MethodHead.ReturnType="%Library.Boolean" 
       // s MethodHead.Language="cache"
       s MethodHead.ClassMethod=1         
       d MethodHead.%Save()
       d tt.Methods.Insert(MethodHead)
       s fl=tt.%Save()
       s MethodName="OnPage"
       s MethodDestroy=##class(%Dictionary.MethodDefinition).%New(classname_"."_MethodName)
       s MethodDestroy.ReturnType="%Library.Status" 
       s MethodDestroy.Description=$zd($h,4)_"  "_$zt($p($h,",",2))
       ; s MethodDestroy.FormalSpec="head" ; входные параметры
       s MethodDestroy.CodeMode="code"
       s MethodDestroy.Name=MethodName
       s MethodDestroy.Language="cache"
       s MethodDestroy.ClassMethod=1
   
       // имя  источника файла     
       s param=##class(%Dictionary.ParameterDefinition).%New(tt.Name_".FileName")
       s param.Name="FileName"    
       s param.Default=FileName
       d param.%Save()
       d tt.Parameters.Insert(param)
       d tt.%Save()
	   s lengFrag=600
       s val=$system.Encryption.Base64Decode(BlobsFile)
       for  {
           q:$l(val)=0 
           s SubVal=$e(val,1,lengFrag)
           q:$l(SubVal)=0
           s val=$e(val,lengFrag+1,$l(val))
  	       s ind=ind+1
           s paramName="Frag"_MethodDestroy.Name_ind
           s param=##class(%Dictionary.ParameterDefinition).%New(tt.Name_"."_paramName)
           s param.Name=paramName    
           s param.Default=$system.Encryption.Base64Encode(SubVal)
           d param.%Save()
           d tt.Parameters.Insert(param)
           d tt.%Save()
           d MethodDestroy.Implementation.WriteLine("   w $system.Encryption.Base64Decode(..#"_paramName_")")
           s param=""
       }
       d MethodDestroy.Implementation.WriteLine("   Quit $$$OK ")
       s MethodDestroy.Internal=0
       d MethodDestroy.%Save()
       d tt.Methods.Insert(MethodDestroy)
       s fl=tt.%Save()
       Do $system.OBJ.Compile(classname,"cuk /checkuptodate=expandedonly")
       q $c(10)_"OK"
    }
    q "OK"
}

}

