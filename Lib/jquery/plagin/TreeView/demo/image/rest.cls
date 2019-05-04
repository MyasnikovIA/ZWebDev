/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.rest.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.rest.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.rest Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 08/04/2019  21:01:07
ClassMethod OnPage() As %Library.Status [ Language = cache ]
{
   w $system.Encryption.Base64Decode(..#FragOnPage1)
   w $system.Encryption.Base64Decode(..#FragOnPage2)
   w $system.Encryption.Base64Decode(..#FragOnPage3)
   w $system.Encryption.Base64Decode(..#FragOnPage4)
   w $system.Encryption.Base64Decode(..#FragOnPage5)
   w $system.Encryption.Base64Decode(..#FragOnPage6)
   w $system.Encryption.Base64Decode(..#FragOnPage7)
   Quit $$$OK
}

ClassMethod OnPreHTTP() As %Library.Boolean
{
    Do %response.SetHeader("Content-Type","image/png") 
    if $d(%request.Data("download",1))
    {
       Do %response.SetHeader("Content-Disposition: attachment; filename=","restok.png") 
       Do %response.SetHeader("Content-Length","1750") 
    }
    q 1
}

Parameter FileName = "restok.png";

Parameter FragOnPage1 = "iVBORw0KGgoAAAANSUhEUgAAACUAAAAlCAIAAABK/LdUAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAAZrSURBVFhHvVdpUFNXFH6OjKhoVXAZtVZHUcQF
i1CXIlsERkUdHX9ox2k7rbW2Lq22irVCBEVFobiwaoS6IJS61VqnWCFkgaAJixAgyL6YaISigmyC
0i/vPh+PZwg40/Gbk8xdzj3fXc499zyqs2+oeKJKrYhIUG+NVK0KUbgGp7v8onCLVq1JzN8urxI9
aFAzer2hF76nLbrLBTuFqdP3S+0OyQ==";

Parameter FragOnPage2 = "PwpKW3g0fRHICCXKaDkocwyQzA6QzLpxP6C1/Tkzsgf0yPfyVUdc7iZf8bTD8nmEwLQEpztjQr7i
qVc1exgTxmCcT62/KUy16SMTV6BPllv1NIux1R1G+K4X+WEDjTIdSXMKlDkEyuZiG3ldXDma7uwr
tpZVnWYscsDni8/bHCC1C1EYIQNN2N1ld2ouKLUJp7PW7pfO4SlwBdPdl2qbVBLE2H2NbnzXi4Q0
GX8wBGdzqeBHRo9GSvmJA1J7nhpXQIl9UlSfZQbQ6OLL1//9U/KEfakzoBQgscPWkWFwQtoRrBk9
DkIzBOhlCd4UUO4VWz9s1DADWL5Xrw==";

Parameter FragOnPage3 = "Xv5wa+St0mC4JaqPGouOZXjAxeE1GIMTLf03nWhyceO+P3yKx8ETTAhHzgxg+X7N+Typ9Agps8jU
XXrR0cxUjCFBvSUobQGP4E3BwWMlZIiB71mrfkfSCFLvCeX1d+qbq5kKDeyEv2SGUTfmCX2QNmSU
ge9KoQ/OjNS5aGyrE5eHibLWCVNt/SUzheIunbqmClxw9ox7FWyppDISAw18cFy4SUt7A22qC/Hq
LejCVcME8R+b8ylph/tA37Sn8ATKmBzGUggE8IsD0jlRqjXEHIu65krwEbuBMvtMbSIan7RosVyu
LeOSwW+BqYZWPYUd8xNPu1kcmFJ+Eg==";

Parameter FragOnPage4 = "lz2j5nxZvSKtOpZQ1jfXYOtBuTdlSltHE1pklacOyhyiizxFpV6iEs9I9WLYitJ4kGr4PcGJbPeo
gsWhSveIXAHUzpR5EQnJdMx99CeVoN5GTBNk6S773B6P47xW9DNpwVHtTZl8/t5XpHryztIIjdso
q/4UDYfVEy7olo4da0aqLhutfWLnkLLXDpuh5qRowMcbxku0wdTjpjJiiEVc3ibw7UmeBD9imjiI
UK4I17gMMaO+PTfvQrE7DEVWe48YQm2IcrzcuOLcgyXjxpoJtk77o2UlgmL0fU9hgj104vXLQlVO
uD/M/eOirb2puE6KOJmY/3227irTyg==";

Parameter FragOnPage5 = "QYTGxXIoZeM8arbT8GEfDLlY6z1mdH+riRaTZg0V3nb+QmgNginzR4ao3E/mCHbH2KF6ptTzaLrT
mez1VPvLVsZMn5H9PNZiELVw7YRB5tRq4czz2iVWI/q5fTn5O5F9kNwVB3kwaYGlVf+BYyxiyr18
YmYb+ErAt0iU9QmFdTBmXiO5/Hie/qauofBFRwvT1B0VHf/0o6jPTtgHXnWArXN672GDqeW7pgdJ
FgUrXNfvs4mpWrJu+0TKfAD4dolYPnp9eKs0tcmMJcPhfYOrfUD6Id7M7UnDs3VXmA4OpI9DbR0H
bDo1N7bSa9LUQVvj5ruuGm05bqDFew==";

Parameter FragOnPage6 = "Zt47p6/Y+D4IBlua+/7lBF/1S5w7ynYYPBY32HB+v6m34WYcks8Lu+sNpsPy+Vg4yOAvt8tCGQYO
2jqa0RuuFhxXueEmRBZ4oBCuXhyt8YCE5biH5QpOF3tGF3kcUxoUQpVuIEMBFHgOKWll1CG5I4IT
1os4Qt9ut9qmMnLbALwmj5+XkDKgqDkLPox/W0HUNtw/Q3zhvLHIw7QN+YxtOkz7iaciekGSy46R
RrxBCE59idRcYeILxqPEDkZse9b6iNgFwpXLDfFTgXU7szE95+E1f8kszMB0FsMVbBsTP/G7Urgb
m0s6cH4X8zbTZjtrnuXCLjsVhDFkmA==";

Parameter FragOnPage7 = "pAtobW+MVK2GPuk1Ld3eB7x/yBtZu+DGKxqhXMklg8BpM7W/01xdgCZ95IyOUYGRbu8fgDVxMwPs
Hu+EUAY9UeYCST4STlbNqPDfdwD5C44HXspTZYVOnx2JMhfKB/Ewx1PmClZvJH8BkJ+R7Ig34LUg
n5zx5udBXN7XJlIYWDOenxGYyD8h8Ebem1xYm4xJ9DRFtGPPesw/CUzk1xASfZCoZ+ku0dmGKTJc
s17yawIT3w8Q8MFBcGaH0xb0rNPn7weC/+P7KJux1R3G+YB3+v3H4mnLw3f0fcuD8e/3zLf8fu/s
/A+jfP28kJDrwQAAAABJRU5ErkJggg==";

}

