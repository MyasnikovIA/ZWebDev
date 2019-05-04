/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.arhiv.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.arhiv.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.arhiv Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 26/03/2018  08:21:31
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","arhiv.png") 
       Do %response.SetHeader("Content-Length","524") 
    }
    q 1
}

Parameter FileName = "arhiv.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAABEAAAARCAIAAAC0D9CtAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGhSURBVDhPYwjhV4wVkU4WkcSFgLIRsgx/YOD///8MixYvCxGSyJdSmDaN4eJFhokTGYDsEhGdbAF1ZBKoBqEHSB09fgYoVMXkDdQA1AbUXM/q1sLsDxSBkI1MAeVclhBtID1r12388fv/6fNXgUKzuJIWCGRgJadyxLcxBQOdCtKjpqZ27vylP3//A20DigKF/u/78H/x0/9T7/1vv/6/9tL/ygv/c059ST7wImor0G8gPUD/MDAw3Lz9AMgB+uToUblJTFFYUS9TcAADA0gPxD8QbUBjGhoYgBJ4EEgP3D/a2tpAnfgBNAyQ/cOWvBUotOHJ/yV3/8+4/r/34v/G0//Ljv7P2v8/fuf/4M3/GYwCQHqQ/cMQsRzoHyAJQuGLGMLmg9EchpBpYDQFqBKkDNk/DL4dQP8w2KTjRBB7KPUPYzMofnZ/fdjz/mzR60NxL3dFvtjh9HSdzqOlYvdnM9yZJGgGcxvQBqh/Cjx27mRg6Ipi6IhAR+3hQBOBVkH1wLUxpDsB/SPphxMh7IEABwcHiKPxAKAykB4gJg38/w8AWyOSQ/E4xeQAAAAASUVORK5CYII=";

}

