/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.fileexp.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.fileexp.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.fileexp Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 09/04/2019  13:14:41
ClassMethod OnPage() As %Library.Status [ Language = cache ]
{
   w $system.Encryption.Base64Decode(..#FragOnPage1)
   w $system.Encryption.Base64Decode(..#FragOnPage2)
   w $system.Encryption.Base64Decode(..#FragOnPage3)
   w $system.Encryption.Base64Decode(..#FragOnPage4)
   Quit $$$OK
}

ClassMethod OnPreHTTP() As %Library.Boolean
{
    Do %response.SetHeader("Content-Type","image/png") 
    if $d(%request.Data("download",1))
    {
       Do %response.SetHeader("Content-Disposition: attachment; filename=","FileExplorer.png") 
       Do %response.SetHeader("Content-Length","907") 
    }
    q 1
}

Parameter FileName = "FileExplorer.png";

Parameter FragOnPage1 = "iVBORw0KGgoAAAANSUhEUgAAABoAAAAaCAIAAAAmKNuZAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAMgSURBVEhLrVVdS1RBGJ4566r7oWZihmKrkl+h
CRUUCJWUIXTVz+jCEiSxm6CrCgRB6Gd00V0UlARdVKTVaqlZ2WZmaeTXfrnno2fe95zZ49aVOcw+
PPPOzHOe9z0ze6QYfi/2rpHcrTZ3RE06jiGEAXQc8AARdBDdDdsGFvGQ+MLNV5uRQ9jIGrrbjmHZ
gRz2bwcz2yWpdOkW+FZkbT3663f5yg==";

Parameter FragOnPage2 = "asXyz8ql5apFaCUOfFo4+OFj7SzkqtamIOPJCeE9uMRxQkJY8CWllcs1gCMqhJnJnE6ne1KpvmTy
opQmgsD19auYgsFwehkieTkpc1JmDSNpGBtCKP8QCgbnIEo7rVDoUTj8IBK5H43eYwlgRcUdlg5Y
WYhoOczZUgItIhYSVB4lhmo1kDk2M3pBNUTirKLkkBckgpZRnAuUbAfD2WIIQQ7792+WA9ld3WpN
bKW28Uf94e8xSFDQPLpwBIg3k5fDD77Moqyuva4Xag+k1eZS9RddeyVHwXjjhOJ+d5wX+4qkS8tS
Ye2oZq3K4yb7avnW1L7YzMkCj8938Q==";

Parameter FragOnPage3 = "ggI5m30lQxs4E94DTZwJIJXGZF9zde9m6uM6ONH8ArhDjs8E+9qXjBbUSxthXx2JVl0vLDg1e6LQ
HQ0s9sVnFQ/U9VIPJ86+pmNvfPUyn7c9A+58FSTHvqo3Kgvqxe6wB8SHrn2Xs5iWQ8h/h7BI1wvI
0rTT1eKgx/mQenK+CY15CXRO1q8F9NyRnJes+kepvhHDHDqiQPhSQ+KaIMizuqshZQYCU3PXxuKt
l4vYHXLUvjRqcuxz52TTS+3LQ9WJ2H0TvezOTRZRvkNYynfon2eie+Ykps5MdUPo3Nuzva97Lkye
V8l6tVPusBqL+ExgM98hPqvsDs8D8g==";

Parameter FragOnPage4 = "mYDu084nkHjc9RC+yKBNt141VbuG67W7q5ciyAwoRHz4LmonIDc+Ps7a/9M6L12BlKod2p4ootGn
53Z7zdAQvhPKOeHXkZGGwUGVBUXmR0dbBgaYqwsuxPTYWEd/P0i+LUok67pjFReprlqLh34tdN7y
d1PuypIJfIfw7eD/+103uKNk96oJ8QcunK0VhPYrhAAAAABJRU5ErkJggg==";

}

