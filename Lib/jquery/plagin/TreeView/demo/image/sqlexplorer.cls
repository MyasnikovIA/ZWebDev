/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.sqlexplorer.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.sqlexplorer.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.sqlexplorer Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 09/04/2019  13:07:08
ClassMethod OnPage() As %Library.Status [ Language = cache ]
{
   w $system.Encryption.Base64Decode(..#FragOnPage1)
   w $system.Encryption.Base64Decode(..#FragOnPage2)
   w $system.Encryption.Base64Decode(..#FragOnPage3)
   w $system.Encryption.Base64Decode(..#FragOnPage4)
   w $system.Encryption.Base64Decode(..#FragOnPage5)
   w $system.Encryption.Base64Decode(..#FragOnPage6)
   Quit $$$OK
}

ClassMethod OnPreHTTP() As %Library.Boolean
{
    Do %response.SetHeader("Content-Type","image/png") 
    if $d(%request.Data("download",1))
    {
       Do %response.SetHeader("Content-Disposition: attachment; filename=","SQLexplorer.png") 
       Do %response.SetHeader("Content-Length","1367") 
    }
    q 1
}

Parameter FileName = "SQLexplorer.png";

Parameter FragOnPage1 = "iVBORw0KGgoAAAANSUhEUgAAABsAAAAgCAIAAABsC5RsAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAATsSURBVEhLvZZrbFRFFMdn5j727t1Xl922uzys
W6QtKaGY1DRuaflCNIAJQvCRKDaKwU9qNClfkEYDwReCEhJCjI9g+GICHzAEg1ESeUhDArRFsLxa
u1jWdnfb0rvdvc/xzN7tsm23BCXxn8nszLlzfnPvnHPPXUwpRbMoo41OaLdGJq5gZJo0w2PJQpzP
WSOLC12OYH7RDJUgJpSu7tvt45lehA==";

Parameter FragOnPage2 = "NYwdBPOwLNfYSkp1i2qUElmMLJ2/M+Rrsb0KukccHD1x7taLsrgAM8SDilIrqw/WhrYuDr9lW0iu
Z1AlO0CwiBDHrJjwmBMILxKB3Z29KeuxQASw84TjsO2LCZEyWn9uzMTu8dDZ+EvREEx6bu+4MbzP
wXuHM2pan1C0TNbIqKaVfwrGRiJHJF6SeckruipkWTVGw751TdX74eqRzvj6phAjPv5p18X2BtvH
svTOgf3f97xtUiQSRAji7TO0RRHYoekms62pe78l8qYkzLEvRrac7fskyoirD1w5/vsISusL57ve
aQ2/0Fge9DnsRfeXkjWOdSUPnr5z6g==";

Parameter FragOnPage3 = "xl2fk3vE7zizrXGSeG0MDpntrllIt1Ys8Uer3PUh16Kgoz4sSwLheKKbVDOsK0OZWCLbO5S5HFOO
Xko6eSyLnMhjUNDFTyUWBGgD6BbbAM7QYiaIhYewIcZIgITisMBhiSdsPimbaMdrqnJOSOKRS0Ae
EXkF5BUrPWKFV6jwQBP9LsED0RG4YlxBpYjTZLuxjj0aG99XD0D8l/ofiCwsFlJNiDgb541QNcy0
amY1M29BEDkW+vykSEVE8B/XzryxmH7RTPctp3ubNy7xI83saA3RPdHk582xPc1/7m5urS1Lwvuk
mauXzOnbFe0b1fLukyoiatbm1nC01g==";

Parameter FragOnPage4 = "D8On9vYcPj9kwR2o1gdrI2D5sSfZceRmd2z8y1frmiIezaCqYaWz+sxIFRFN2vSoG37jI9mfro5u
+Lr3UHeK5SNCu07EVu3u/urXOw0d52F64JXaxITBXEqpiOjkNh28seNYf8gv0f0th1+rQWPay9EK
uNJ+8Nq8cifkYFVAgun8oDNcJhYVkCkqIkKuufltRwcCW87BbP0Tldufr76eVNkll2D7W5MURdFn
y80pkXHk1qQU/YcLwzDYsCzY2ZWEwXurFsRTajprxFJsg5vxtGJQgmEDpGUNsEPJKMS9qFxnzW82
PhbyOXb98tfymjIwXP97AmovDLY/Gw==";

Parameter FragOnPage5 = "WTZXPtWvvP4kO4TN3/YGZOboEMi7a6p8Tt7Bk9N/pFLjOhin1h7VXFlXtnSu6+LA+MnLI/A6M+K4
7vUJz9X7P1pXHfSJuO3nRSEZnh6gdWEZECCoGr3xjEXpjNqTrzoUcZhV2sJJmdRnUY5aib3Le2JK
y8eXKt08QIszXOBIyCvMqD2AYFWHY33xwRPkljifg6vf2mmZ9MO1VWnN4gh2ilyhQX2bXPvAEnmi
6nTlZ107j8fcDvaBKylGLJ1XpQQ3EnALrllwNocR4ZOeGz+s7ENlxE2N5ffKzEPo6aUB6Fms2U/b
SVQmIvhulBSl83jiJrOej2HS+F0tfQ==";

Parameter FragOnPage6 = "YAWM80RbkNJ7Tg5+dyGhjGksgSAZ7YZoJZf/ckHSGRaFf1bQuyTumYZAW3O4MeLNI6YRC/rt5lhn
TOlLZK8m1MSoSjHyEizk/q0EPWK1X4yUO2vnyitypW+aShP/uxD6B7jvOqszCG+UAAAAAElFTkSu
QmCC";

}

