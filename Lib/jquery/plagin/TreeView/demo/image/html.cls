/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.html.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.html.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.html Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 24/03/2018  16:06:05
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","html.png") 
       Do %response.SetHeader("Content-Length","830") 
    }
    q 1
}

Parameter FileName = "html.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAABEAAAASCAYAAAC9+TVUAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTFH80I3AAACuklEQVQ4T5WUX0hTcRTHr0ZBZT2oSFBg5doErQgRCh/sKdH+aA8FPfUQFEGGIERQQtRDUOpmWYMSJSEnlFkNclhgbSI2bXfDudQR/plbklrm2t3/fTvn7iqrl+zAh/O7v3vO59zt/hEArCM2ENVEKXGGcBBlRI2SzxN5yrqEyCEKiM3EPpZsIjgf0+l0WAtms5nK0UkUERncnE6kEdu44F9hMBhkkdVq5cNzRGGq5ITB0EEpgUQigoT/FuLeQ4i4siF9zILkuoR4PAaTyUQ1kEWiKPKykyUHiP1AfEr/+h16bNcw696JXxMbMWQ+DcuEh5qjWHixQ5YMDAysXo1y5WksOUXTtQ8so3B9Lsby9BbMWHfjhrEbh1tFaBpFNPVNY7GnHLFYFFHC5/VianJyRSKwRNvr8uCZtQYJr4A5aznm/XPw/fCj2exBfpMDqgYRQyN2xKIRRBU4FEkuSeI5Lf1PEJ1Nx7wll/Z+0sSwPJGLb/d5oGl24uLzcUQiESIsw6FIqgQkAm1LU5n4Lmai1vgeBffsyLtrk1E12mVBvt6FUr1DEYQQCYdSJZkClusgudfjfu9TlD0aRGX7GI63ja5ypMUJTb0NV7rHEabmJMFUyQUh7lHD1leBig4Hzurfyid5olxMU1caQ6EgwgRnhkORXBYizgz0j03IP0Ots+PxoA+zi34sLAXw0u5DkU5E7s1BdA175OZgUCL+kGQI0rAaiZgfD80z0DR8wh5t8m7I0H+iqhdx3ehGiBqTAkIKpEqyhKC7Dt86szHXrsKH5lLUvvqCspYRHG11orprHCbnV2qSIAUDSk6uUySV/Jy0EvzWWnrfGHlTnsbF3JQkAOkvOBTJXpacJIqJQmVzzaHU72KJmuAXUMub/wvFVpawgLlDXCX4o8Pw47uyxx8rZjvRRlQRB5MZJb8Bx4fnDWbBp0oAAAAASUVORK5CYII=";

}

