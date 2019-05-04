/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.themes.default.dark.n40px.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.themes.default.dark.n40px.cls'  alt='Нет фото'  width=320 height=240 >    -->
Class %ZWebDev.Lib.jquery.plagin.TreeView.themes.default.dark.n40px Extends %CSP.Page [ ProcedureBlock ]
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","C:\AppServ\vakata-jstree-0097fab\dist\themes\default-dark\40px.png") 
    }
    q 1
}

Parameter DstName = "%ZWebDev.Lib.jquery.plagin.TreeView.themes.default.dark.n40px.cls";

Parameter FileName = "C:\AppServ\vakata-jstree-0097fab\dist\themes\default-dark\40px.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAAPAAAAHgCAMAAACsKhCPAAACRlBMVEUAAABzc3NWVlYAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAACAgIAAAAAAAABeXl4AAABvb29OTk4AAAAAAAD///9VVVVUVFRSUlKh
oaFQUFAAAAAKCgpTU1MAAABPT09/f3/l5eVdXV1WVlZXV1dRUVFkZGQAAAAwMDAAAAB9fX17e3t1
dXV0dHR3d3d5eXlcXFxbW1taWlpZWVlYWFgAAABoaGgAAAAAAAB+fn52dnZ8fHwEBAR6enoUFBR4
eHhMTEz9/f1LS0tVVVXc3NweHh7n5+fx8fH09PT6+vr5+fnj4+P7+/vl5eX39/fz8/P29vbt7e3v
7+/r6+vp6enh4eHf39/d3d3a2toXFxfm5uYAAADi4uIAAACNjY0ZGRlUVFSioqIAAAAkJCRbW1up
qakAAACioqJYWFgbGxv///+ZmZn+/v77+/vX19f4+PjBwcGzs7Px8fHd3d3i4uL19fXn5+ft7e29
vb3o6Ojf39/Ozs7w8PDNzc3Y2NjIyMjj4+P5+fns7OzCwsLk5OT09PTg4OCrq6vT09Pl5eX8/Py4
uLj29vb9/f3S0tLy8vLa2tr39/fGxsbp6enz8/Pb29vr6+ve3t76+vq5ubnQ0NCurq7Hx8ewsLDm
5ubu7u7q6urDw8Ovr6/U1NTMzMy+vr6qqqrh4eHV1dWysrLKysrv7+/Ly8vR0dHW1ta1tbWsrKy8
vLzc3Ny6urqoqKi7u7u3t7epqanFxcW/v7/Z2dnAwMDPz8/ExMS0tLTJycmxsbGtra22trbkM1sT
AAAAaXRSTlMAAlxJAhIlMQw9BgIFMFQBR1wYEQFcXFySXA8zXA5cAgFUVFRcRyZLFAICAgICAlRU
VFRUPkdhVQICAj4CDQJo/mhU/kX+/v7+/v7+/v7+/v7+/v7+/v7+Q/4Q/iihNliRG0dceQSSOjlO
mCs4AAATVUlEQVR42u3diV8aaZoHcHu0uZKdTjKd9CbbV5LpmT6nz+nZmZ3ZOfa+7/u+lygaTilA
uWRFUe5DgoCtGYwIaXF1jdE23f/ZvtxVUKV1vFAv8DyfT39aq6iH90sVUJe/jI0NSd0bFgiAAQxg
AAMYwAAGMIABDGCWmrh8eWKUwBPPX7ny/MTogCee/5pW+zVM4gEA17zYxOSDG15cYuLBLS8mMelg
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
VY6NBOMAAAAASUVORK5CYII=";

Parameter LongPath = "themes\default-dark\";

Parameter NameOnly = "40px.png";

Parameter PathApp = "C:\AppServ\vakata-jstree-0097fab\dist\";

Parameter PathOnly = "C:\AppServ\vakata-jstree-0097fab\dist\themes\default-dark\";

Parameter Rashirenie = "png";

Parameter SrcName = "themes/default-dark/40px.png";

Parameter isBinFile = 1;

}

