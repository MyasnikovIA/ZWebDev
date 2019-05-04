/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.inc.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.inc.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.inc Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 28/03/2018  09:06:40
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","inc.png") 
       Do %response.SetHeader("Content-Length","628") 
    }
    q 1
}

Parameter FileName = "inc.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAAAwAAAAQCAYAAAAiYZ4HAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTAw9HKhAAAB8ElEQVQ4T32RW09TQRSF52f4y3zwQaKJNwTjjSiI2JCgBhKJtJXaRkUQsBahVSgpvXBa2gLFQikUylWoAbkZFQJBaPs5ZwIJRHAlK5Oz9v7m7JkRgYE0vugknnCK7tAY7mCST/5hHO5BmpwhXjsCNLZrSFVLnxEjEwv6B/k8ZLN5/uzl2NnNsbmd5efWPm4tQZWxBUtzt95WK+Lj8wo4Td5wAl8kxdlrldRY2hGx0dmD0nGpP+bypOeWKCwzcq74CUXlJkT/yJRqsHSuUe9a5kXHImbHNM9bx3jW9IWtnSw/NvdJTG9Q/NCMCA9NKsBgMKj1HwmBu2+eWGpdAvWI3v5xFZ5qqczaLpHRVa7rQE9fQoUGWdQ07ZgPgTbfDFp8haKKl4jOQFyFJwEH/dg9M3hjyxSWS6CjZ0iFOqDrKHBIJOe2cUeXuFJmQXzoGlChDuj1k4CGz1M4g9+4XCqBZldEhXpNh45ahdKvnGkc/gwXS+Q7vPkY+u+V6gomftPiWeDCXSPC+r6X9V97VNu/87g5Q2XDLBW2FKXmOCW1UW7WaJjsKRq7vlJwuw5heudjaGKdaHIVbXgF7+CyOqBLztzmX1Q7v5XNRgmd14F7Txu5YbBS/Mgq71m3TT6QjasPrFy6Xy/nNqtRCu7Ucauqlb+FPle4lc0rmgAAAABJRU5ErkJggg==";

}

