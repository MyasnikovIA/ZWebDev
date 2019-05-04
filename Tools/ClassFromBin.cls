Class %ZWebDev.Tools.ClassFromBin Extends %CSP.Page
{

ClassMethod Style()
{
  &html<
   <style>
  #progress_bar {
    margin: 10px 0;
    padding: 3px;
    border: 1px solid #000;
    font-size: 14px;
    clear: both;
    opacity: 0;
    -moz-transition: opacity 1s linear;
    -o-transition: opacity 1s linear;
    -webkit-transition: opacity 1s linear;
  }
  #progress_bar.loading {
    opacity: 1.0;
  }
  #progress_bar .percent {
    background-color: #99ccff;
    height: auto;
    width: 0;
  }
</style>
 >
}

ClassMethod CreateMyClass(FileName, Descript = "", PacName, BlobsFile, siz, CountFile) As %String
{
    s Typ=..ContentTypeLocal(FileName)
    s rashirenie=$ZCVT($p(FileName ,".", $l(FileName,".")),"L")
    if CountFile=1 {
	   s classname=PacName
    }else{
	   s classname=PacName_"."_$e(FileName,1,$l(FileName)-$l(rashirenie)-1)
	}
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
    
    s ind=0
    if $isObject(BlobsFile){
       While 'BlobsFile.AtEnd  {
           s ind=ind+1
           s html=BlobsFile.Read(500)
           // s ^debug(ind)=$system.Encryption.Base64Encode(html)
           if siz<1000000 {
               s paramName="Frag"_ind
               s param=##class(%Dictionary.ParameterDefinition).%New(tt.Name_"."_paramName)
               s param.Name=paramName    
               s val=html
               s param.Default=val
               d param.%Save()
               d tt.Parameters.Insert(param)
               d tt.%Save()
               s param=""
               d MethodDestroy.Implementation.WriteLine("   w $system.Encryption.Base64Decode(..#"_paramName_")")
           }else{
	              s paramName="Frag"_ind
                  s MethodPoleDestroy=##class(%Dictionary.MethodDefinition).%New(tt.Name_"."_MethodName)
                  s MethodPoleDestroy.Name=paramName
                  s MethodPoleDestroy.ClassMethod=1
                  d MethodPoleDestroy.Implementation.WriteLine("  w $system.Encryption.Base64Decode("""_html_""")   q ")
                  d tt.Methods.Insert(MethodPoleDestroy)
                  s fl=tt.%Save()
                  d MethodDestroy.Implementation.WriteLine("   d .."_paramName_"()")
           }
           // d MethodDestroy.Implementation.WriteLine("   w ..#"_paramName_" "_$c(13,10))
       }
    }else {
	   s ind=ind+1
       // s ^debug(ind)=BlobsFile
       // s paramName="Frag"_$job_$replace($h,",","")_$random(100000000000)
       s paramName="Frag"_ind
       s param=##class(%Dictionary.ParameterDefinition).%New(tt.Name_"."_paramName)
       s param.Name=paramName    
       // s val=$system.Encryption.Base64Encode(BlobsFile)
       s val=BlobsFile
       s param.Default=val
       d param.%Save()
       d tt.Parameters.Insert(param)
       d tt.%Save()
       s param=""
       d MethodDestroy.Implementation.WriteLine("   w $system.Encryption.Base64Decode(..#"_paramName_")")
    }
    d MethodDestroy.Implementation.WriteLine("     Quit $$$OK ")
    s MethodDestroy.Internal=0
    d MethodDestroy.%Save()
    d tt.Methods.Insert(MethodDestroy)
    s fl=tt.%Save()
    Do $system.OBJ.Compile(classname,"cuk /checkuptodate=expandedonly")
    q "OK"
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

ClassMethod OnPage() As %Status
{
   &html<
     <!--
     <script language="JavaScript" type="text/javascript" src="/csp/broker/cspxmlhttp.js"></script>
     <script language="JavaScript" type="text/javascript" src="/csp/broker/cspbroker.js"></script>
     <script src='HTML.Lib.cls' type='text/javascript' ></script>
     -->
     <script language="JavaScript" type="text/javascript" src="HTML.RunJob.cls"></script>  
      
     
     
   >
   d ..Style()
   &html<
      <h2>Загрузка бинарных файлов в Cache` классы</h2>
      <br>Имя класса
      <br><input id='PacName' name='PacName' value='User.delete'/>
      <br>Описание класса<textarea align=left id="Descript" style='width:98%;'></textarea>
      <br>Исходный файл для конвертации
      <input type="file" id="files" name="file" multiple/>
      <br><button onclick="abortRead();">прервать создание</button>
      <br><button id='StartConvertFiles'>Запуск</button>
      <div id="progress_bar"><div class="percent" id='percent'>0%</div></div>
      <output id="list"></output>
      <pre>
         <div id="info"></div>
      </pre>
   <script   language="javascript">
  var reader;
  // var progress = document.querySelector('.percent');
  var progress = document.getElementById('percent')
  function abortRead() {
     reader.abort();
  }

  function errorHandler(evt) {
    switch(evt.target.error.code) {
      case evt.target.error.NOT_FOUND_ERR:
        alert('File Not Found!');
        break;
      case evt.target.error.NOT_READABLE_ERR:
        alert('File is not readable');
        break;
      case evt.target.error.ABORT_ERR:
        break; // noop
      default:
        alert('An error occurred reading this file.');
    };
  }

  function updateProgress(evt) {
    // evt is an ProgressEvent.
    if (evt.lengthComputable) {
      var percentLoaded = Math.round((evt.loaded / evt.total) * 100);
      // Increase the progress bar length.
      if (percentLoaded < 100) {
        progress.style.width = percentLoaded + '%';
        progress.textContent = percentLoaded + '%';
      }
    }
  }
  
  
  function arrayBufferToBase64(ab){

    var dView = new Uint8Array(ab);   //Get a byte view        

    var arr = Array.prototype.slice.call(dView); //Create a normal array        

    var arr1 = arr.map(function(item){        
      return String.fromCharCode(item);    //Convert
    });

    return window.btoa(arr1.join(''));   //Form a string

}
 
function handleFileSelect1(evt) {
	// var files = evt.target.files; // FileList object
    var files = document.getElementById('files').files; 
    var output = [];
    var CountFile=0;// files.length;
    document.getElementById('info').innerHTML='';
    for (var i = 0, f; f = files[i]; i++) {
          	    
          output.push('<li><strong>', escape(f.name), '</strong> (', f.type || 'n/a', ') - ',
          f.size, ' bytes, last modified: ',
          f.lastModifiedDate.toLocaleDateString(), '</li>');
          progress.style.width = '0%';
          progress.textContent = '0%';
          var reader = new FileReader();
          reader.onerror = errorHandler;
          reader.onprogress = updateProgress;
          reader.onabort = function(e) {   alert('File read cancelled');   };
          reader.onloadstart = function(e){  document.getElementById('progress_bar').className = 'loading'; };
          reader.onload = (function(theFile) {
              return function(e) {
                  
                  progress.style.width = '100%';
                  progress.textContent = '100%';
                  setTimeout("document.getElementById('progress_bar').className='';", 2000);
                   // alert(document.getElementById('PacName').value);
                   // alert(document.getElementById('Descript').value);
                   // alert(arrayBufferToBase64(e.target.result));
                   var PacName=document.getElementById('PacName').value;
                   var FileName=escape(theFile.name);
                   var FileNameOne=FileName.replace(/\.\w+/,'');
                   var Descript=document.getElementById('Descript').value;
                   Descript = Descript.replace(/(\r\n|\n|\r)/gm,"\r///<br>");
                   document.getElementById('info').innerHTML+='\r\n';
                   // document.getElementById('info').innerHTML+=#server(..CreateMyClass(FileName,Descript,PacName,arrayBufferToBase64(e.target.result),theFile.size,CountFile))#;
                   document.getElementById('info').innerHTML+=#server(..CreateMyClass(FileName,Descript,PacName,arrayBufferToBase64(e.target.result),theFile.size,1))#;
                   // alert(#server(..CreateMyClass(FileName,Descript,PacName,e.target.result))#);
                   var span = document.createElement('span');
                   //  span.innerHTML = ['<img class="thumb" src="', e.target.result,'" title="', escape(theFile.name), '"/>'].join('');
                   //  span.innerHTML = ['<img class="thumb" src="', PacName+'.'+FileNameOne+'.cls','" title="', escape(theFile.name), '"/>'].join('');
                   //  document.getElementById('list').insertBefore(span, null);

                };
          })(f);
          
          reader.readAsArrayBuffer(f);
      //   reader.readAsDataURL(f);
      //   reader.readAsBinaryString(f);
      //   reader.readAsArrayBuffer(f);
    }
    document.getElementById('list').innerHTML = '<ul>' + output.join('') + '</ul>';
  }
  // document.getElementById('files').addEventListener('change', handleFileSelect1, false);
  // document.getElementById('StartConvertFiles').addEventListener('click', handleFileSelect1, false);
  document.getElementById('StartConvertFiles').onclick=handleFileSelect1;
  
  
</script>
   >
   
   
   Quit $$$OK
}

}

