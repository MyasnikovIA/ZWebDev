/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.txt.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.txt.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.txt Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 26/03/2018  08:28:34
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","txt.png") 
       Do %response.SetHeader("Content-Length","556") 
    }
    q 1
}

Parameter FileName = "txt.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAABEAAAASCAYAAAC9+TVUAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTAw9HKhAAABqElEQVQ4T5WTO07DQBCGMSmQaKChp4IbcA7OkwOkjuhzg6SIokhRHkoaSygHQBENQciIMn6/NhnmH+8GG2yJWPq14/XMN/8+fEZEtyyMp+iC9cA6Zz1iwsLLarUiyPcjGZviJElIKWWzrk2tId8hQeU5LRYL2mxeab9Xx1ipYn69XtNsNiPXcwF60pCWgVjL5ZLyPKPt+wc5zpdATHw47CW2bZuiKKL5fE673Y7Lqk4sdMqyVEBwhO4AQYBA0+mUJpOJCDE/LdQLAAI9S5MClAHEqgF9Og5t394M5KYCweTzy/bfght+cEoWIDgmC5NJHFGaxJTCUfrLkao60hAs5wcyHo9rOzYJ+ab2CBmNRhSFIcVRWONIb7g4KvYJ+agzEAmGw2FtxyYh/w9kMBhQ6PsUBgE7Co6Okpgd8S2tOOIrgPwyRJbT7/drOzYJ+WWI7HCv1yPf8yhgVRzJPpUdFXcJ+WWInHW3263t2CTklyHipNPpkMf/g++67MgVR4E48mscxYR8XSs3Vvak3W7TqUKdgdyzQBRHWld6xHczd8nC0qWpHrmGrG+LWQKvWBXg1wAAAABJRU5ErkJggg==";

}

