/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.themes.default.n40px.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.themes.default.n40px.cls'  alt='Нет фото'  width=320 height=240 >    -->
Class %ZWebDev.Lib.jquery.plagin.TreeView.themes.default.n40px Extends %CSP.Page [ ProcedureBlock ]
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
    Do %response.SetHeader("Content-Type","image/png") 
    if $d(%request.Data("download",1))
    {
       Do %response.SetHeader("Content-Disposition: attachment; filename=","C:\AppServ\vakata-jstree-0097fab\dist\themes\default\40px.png") 
    }
    q 1
}

Parameter DstName = "%ZWebDev.Lib.jquery.plagin.TreeView.themes.default.n40px.cls";

Parameter FileName = "C:\AppServ\vakata-jstree-0097fab\dist\themes\default\40px.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAAPAAAAHgCAMAAACsKhCPAAAAP1BMVEUAAAAzMzMzMzMzMzMzMzMz
MzMzMzPS0tL///8zMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzPt7e0zMzMzMzM8PDx7bmBmAAAAE3RS
TlMADv4GXAL9HwH8CFkdIRQKXQZQ61O9/gAABrVJREFUeNrt3euS3CYQhmFiJ5ZydBL2/q81h8o6
Y+uE4EN00y//RlqpeGo0ApqGTWmSklOwAhgwYMCAAQMGDBgw4KnByxILvOS8RAL/7ZWJsxevSpzd
eEXi7MerEWdHXok4e/IqxAJwznXnKrwCcRZ4j1Vn56q87eKs8B6pzs5VeoeD3+tx99wobyv4/5rc
OzfM2wh+rcudc+O8beCva1N+bqC3CfxtfUrPjfS2gLc1Kjs31KsF54JTg73SR/oLy7BX+dL6ArPs
FTZLX2imvbqOx1kx5JV1Lb14VYMHN17R8FDm9QBOSq+DR/pCbKcTrYxpKb3Gm6ULsaWBsDZqqfQa
7lpeiG0Fs8TgpPQaHR7eCAcYEgtnHpRemyEeddjOfhDvWKy4m8Uw7ZFYczeLgfh9sepuFqda9sS6
uy32wSlL77hYf6TlZbH90uotDpDyEC+pJV7aUrzEtHiph/GSS+OlDys7RoABAwYMGDBgwIABAwYM
GDBgwIABAwYMGDBgwIABAwYMuKksSyzwIl5PZR28SNdhZG3mdQewNrEo9xRrU7mXDl6xOCu9mmRI
82BR+me+VQaCNQm+S75ZllFgUQq3G7AqSd8z2HYPxOwKMrs9LWdiu2vmDPelFWI/zZJI7AssEDsD
t4u9gZvF7sCtYn/gRrFDcJvYI7hJ7BLcIgbMI81Li2aJjgddSwYPDA8JABDiEQXxHIE1QUvHc0t1
lQk31cJkGtOlVl9a00+Ii1IevHY8lhQBrEhb8jl4WFIUcHvqoccAQKjk0njpw24KYMCAAQMGDBgw
YMCAAQMGDBgwYMCAAQMGDBgwYMCAAQMGDPjkNtJ/Ia6/nxas3iCow5ZDSnBB7bKGKyHnJ7x36tlt
XykRuMxbXs+OO2lJwKXe0np23TtMAC73ltWz825pzeA73pJ6dt8fTgUuIgjuNxr8tFciFoBV3pLX
m23w3V+ddXDpL+6mN7f+zSjw7beqQ3B1e+QU/PqhotV0B379VNNL8AZ+/VjVK3IGfiXW9QLdgmt7
vV4f6epevtOXVv2oxmez1BDUctnxOBoUz9q1bAriuexLHwU95h08NAQtnY6W9n/XMw8Pq4O0bsfD
e+/tCAEAwO7B8qCb+6jlrGBZ4Nx8IF4+NWJ9qkU++WV+Mk0+vWl9ulQ/gW19QlyfomA95UGfhGI9
qUWfZmQ9bSnpE8mMJ6Yd1tHS/eRgPwUwYMCAAQMGDBgwYMCAAQMGDBgwYMCAAQMGDBgwYMCAAQMG
DDguuF8SikVw1zQje+DOiWTmwL1TBa2BuyeDGgP3T/e1BX4godsU+ImUfZPg2vPewI8suzEIbvwT
n+CjX+5U4BfY4bvK3jMNGDBgwIABAwYMGHAUsDrGwDcMGDBgwIDnAIcL4oUN08YJxIebaok3mRZu
ujTehHi8lId4SS3x0pZSuMS0dNa1nBbspwAGDBgwYMCAAQMGDBgwYMCAAQMG7K2CgAEDBgwYMGDA
gAEDBvzI/bqnOgAGDHgEOIcD51+CgT/k72KBP2WR2BFYI/YElohdgfNP0cD5YzRw/hwN3Pw79tMO
v5dfg/S0rPwb+6cGDz+8l4+/MVoC7Bz88/ev5fc/pwdrv3F/4A/RwD8CBgw4NNjOflrPgFO0bxgw
YMCAAQMGDBgwYMCAAQMGDNgg+FM08GTbPLorgAEDBgwYMGDAgAEDBgwYMGDAgAEDBgwYMGDAgD2C
18cu8gxOgGOBV8B2wKuNmwIGDBgw4PDg/KasWzYPzvkf8Vpx2eVhk+B/8w/fbtftIG3x68MWwf9l
XL6tVZddHDYIrkwyPbjq28P2wJVptQdXbQ6bA9cu1N+/anvYGrgydfrgqp3DxsCVyeIHV+0dtgWu
TY6/3oTNJrh+McDelft3swRuWfxQvFWJIXDbYo/SpSN2wNsarkkpttbx2KnhmoRia13LvRquSSce
PHjY/Dw1LUjJ0q8h4M0LSdaCXC91GwHeVELWgqTrpX0DwJtq6FqQffHgmNamIsIWpKA1fxy8qYqy
BTH4DW+qIm1B7P2GN1URtyDW3tL3FkvP0A7fWhw+RU/rzmL4OfrSNxb/TzJaKt/sYNW+Hob3tC7H
+6v2dTgu4lG6mcXacktTMa3CzTvWJq+pqGXZZiUN4OPDgyIeRfG6+kf65PCoEE9JfLL6pXV2eFhM
qyAeW9ssnR4eF8S7jj9XdjzODw+MWl7G26fLALiaX5gvx+NiPmXCLJ7z+aMZ87T+SFJwQSH1sB94
rSuBvuEuX7l/cPcnhm/YOHgF7Acc7i09pgAGDBgwYMAOwX8BjFtKB7+K+X8AAAAASUVORK5CYII=";

Parameter LongPath = "themes\default\";

Parameter NameOnly = "40px.png";

Parameter PathApp = "C:\AppServ\vakata-jstree-0097fab\dist\";

Parameter PathOnly = "C:\AppServ\vakata-jstree-0097fab\dist\themes\default\";

Parameter Rashirenie = "png";

Parameter SrcName = "themes/default/40px.png";

Parameter isBinFile = 1;

}

