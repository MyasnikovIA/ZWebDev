/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.themes.default.n32px.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.themes.default.n32px.cls'  alt='Нет фото'  width=320 height=240 >    -->
Class %ZWebDev.Lib.jquery.plagin.TreeView.themes.default.n32px Extends %CSP.Page [ ProcedureBlock ]
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","C:\AppServ\vakata-jstree-0097fab\dist\themes\default\32px.png") 
    }
    q 1
}

Parameter DstName = "%ZWebDev.Lib.jquery.plagin.TreeView.themes.default.n32px.cls";

Parameter FileName = "C:\AppServ\vakata-jstree-0097fab\dist\themes\default\32px.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAAUAAAABgCAMAAABblVsaAAADAFBMVEUAAABaoVUEYBipAAA5OTkE
BAQAAACFZUcJAAAECgLirGt+fn6lpaalpaW5GBhbolUGYhmqAACop6n5+fnBAgKmAQEAWxrfn2UC
XhkIDQZ1d3wWhwSlAAAPcRu+EhL3qamnBQWlpaVYuC6xEBD//f+yCQl2d3wvkCQVhQbJLS3BISEq
hyxVrz10x00fjwarBQUAWRMrmgyoAgLng4OtCAjvk5MPfAelBwf18/VhuUHLDAz1k5NmukkHYRaK
z2t0wVmb23pesUqP1W+P0nDsZ2fUSUm1FxfnWVnqY2O0BASNAADq2p2+GxuwVzj8+PIdHRukpKTh
q2n////s7O0mJib+/P3enWP67uFVV1uop6kkmwD459b99tVcY3D29fb9+O3x8vHf3+Dp6Oj78ung
yI337caYmZihjFU1rwACNrDx8vHT09Tw0rfz3Lv03cbp157Js3u3oWfOwJLdzKdGbUOAgonw8O82
rgb35dSluaX67uDq6+ua5mfO48Ph4uJ0dnstowAyqwD78uhdxCovpgB910i38YzP9q9arkL8+/vS
AADoAADr7O3S58Y5sAbn5+f249DjAADtAQGpy6JAtwU1lxuC2E2z74hPvxbV1NX99+uvr+NKvQ/3
6tmy6JHFwJ0ilgR41ELl5eXy9PLd3t7U1dbKAQHC1Meg3oCR1nBozDFerUYnngBgxywjihLV09X/
mJjZBQX24MrxAAD+Zmb9+Oz7i4sqiR1uwku4zL2c427W+Lrs7+x7x1r58+Sv3JmOy213vlpxu1d/
f7iwxbXW1tn/tLTdAAD9d3f4Jibx1rrwPT3rEBBRxBRlxDeH0mGI02KJ1WCo34qs8HhvzjjJz7iw
za337d62FBRiuUP2MTHezKn/q6uDloeguqRRozrM1b6Lz2yi2IeGvm4/ohyrmVWV416c1Xui6W+/
0bU7jjS98ZUxjSm5vJaXsZ8slBFSvh7/3t7/ycn/fHzdzqmww7bL2cO3nFnodXV1mHacnFB4kX+k
vKuq7HuwuY6orohs99ZiAAAA7XRSTlMA/S4cWkEmAQkW/YD+/1v+NSL+/v5cR/k5F/3prEVM9qH9
+27//fzZ2ayEYN3t2LQZ6avdnPrZg/ro8/rVIunV66/o0PLQV/v50hJqkwX9/////////v//////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////m1ZoxUAAAH80lEQVR42u2ceVjTZhzHCwXa
eiAoc865TSbqDq8d7r7v4w9bwmjLUZ6uUFlKW8BRIqgoOEZBiYgKniBT0LlNcYrXnAdem+50uts5
dzvdfd/vm7RMHn5JWUInxvcDNDzPm7xpPnyTvG/4gUrVtYwLcvvppru/PwJJIIEkkCSQJJAkkKDE
BGq4z4BoJL/5CRy5ubnZDyowgXZ9716xsb166WN76/V2qB0Ti9YRa/dhB/2l+UhJyVFgAvVWDwft
oWlWD7TTFo/nOYTHY6HBdq+PpmOH9bBAozGNT2B2jvISqC+kKQrJs1gsXgsoaPK2yTNnzpyMgAVS
GNpSvWLLkl9BgSkpxglcACVHUN+JdRJkJEzfiQQK9K+JbZjBsjOwQhpMWF/qs5rSxxFfPr5thhnY
96aPDrNIYPXKJSteX3kBsItcJG4Cpy8jQ2IC9ebA/hLkpEhG/7EN7JQpbCEXIlBg4fZJn9eUlpbW
1GwvBPbz/taDW49QVPWHm1975dVVoaDAjJTcNKxPWGCgA6QCZTDBJCuBMvqPbbBarVMaHkYKaQ8o
cMe8TychNs/bUdi3Q3PUxUvfmLfxSPXGJ0tKXv7gfRUsMAOnMENGAr2UPcDxmWQlUEb/WOAyZBCF
kIYSaC7c+Rhm6ZPfrAIEDvi4dtGcl8reXpSZmTm3Cfw5ZiNx2XwAM8ZLPUAvmyd+fAET2P4D6l+4
ne8fbkcCl+9GBqewLOWBBdaWPF1SUjunchV0Cv8+F6mbUzlt2rS5TTQsMMPJCXQixgclgQkcwUug
aP961upw7F6GFLIUnMCy/PzKysr8/Pwy8Cay6+vp06dPnTp1QxO4PfLnznJmY39ut3t8sK6BMoci
MvrXsw6HY/5qFEIrCwqk+iQlJT2FvpLKKEgg/dUzuHXDJnB7rSonA4lzZ6e43enp6VITaFYFV6CM
/jmB2CG6l8ACQ5J8hMACHV89U1+/4Ud4e50ux4nEuXPEBXbBOFCWQJVcgauXr57vsMID5YkhIX3Q
R0jILnCgbXE4/jhxfBPyxwLtuvAcd3ZubnpOSnq69AR265kIZeFBkzFQEMtPNfBAEZzqWVm2YVMT
i7ECpzAWiAgg8AzGrjdj+uIXgYcFZh+SHiZoI8ZzKDaB/xe8RuLhND1tIhBIAgkkgQQCSSD5EQWp
nSSQQBJIIAkkCSSQBBJIAjug4SAJBElsB9BuMBh6cKBvBNrbSBTeT5E5LzUvz6S8BCa6bG0wgACD
bX3B84jiBcVpNgPU7q8PPHqs2iD8BuypeQ6TKVWBCSwwImy4gtSbBgks5usDcYFgMSjQyHeA6wN/
g/aQymEyIYFoKf2div3yNqELEijev3ACGWMyk1zAOVwPCSzw1wdu2VYACfzio5MMMihcH5gaj/FS
eQtN8UIR7EQCzaIHmCA7SRL71yQyyQzjMwgKfNNXH1hasx0S+MnWg1vrjMY64frA1PhHMPFiAjuR
P9HylYSA1W3jgtS/5txZzFokMLmgwGgrBgT2WOyrD/xz3k5AIF8fWFfH1wf+rJIoMGAC7ZRX/ABN
8jIouX8s0OWahRUajQICl/L1gbVlxo4C29UH/mRQBSmBeaw30AF2OELxksD27VD/p7YLFyBqzl3r
etHpWjsLGwQEanos3vnN04jaykxIoOqTf+sDj6YZTlsC5VYISu4fJdCV5TNYACbwzVX5HJmwQMNh
X33g3ENGW9AS2H1LBJFAZ1ZWltPpcjFMMXgT6eMvb4MF2v7i6wMPMYyQQJ6iIN6FuwCJ/aO7cBYH
NmgDhzFtAkNggVl/4/rAOrw9PJDmB4KpRQsT0EtwxoFdkkGJA2km6913f+AcukCBtolccSCuD4Su
cYY0p/PkieN1aCzEwNdAlRWD/C1sNdkpBc5E0hasX4BAkzFwJsIY/dgYSCA69ZkvDmF/jEtkKmdq
bS1qbTWZVUoj8ZSnAYkSHhZ09mHCLnwSm1Lt5HkgoTtCEkggCSSQBBIIJIEEkkACgSSQQBJIIJAE
njU8wC+0JIHSGHJVJF5EXnWhwApahMj2up4cYYq3HHXn5aC/X94biwxGXvTtRbBBrS4iQidiMIz7
rauF7anwBIbetmUJYHBI+YH9LWMjI2/cs+c72KA2gqLCI7TiAr2UI76nMoN3we03c/m7A66fu7q8
quLAupaWljVr3ttzGXiKhlMTxQzyCaQdtLenEhM4YOTBW8eg/N2C6+dGdKif06gHlVdUPLt/377v
W9ZcqhYQ+KiYQV6gl3Y4HOEKvPDh+rmbxoSOxPVzw4H6Q436yvKK2c++sG7dvkvVGiGB2KDQdZAX
GOelKTpMeQkccAWunxtxPa6fGxUFrqK+v4ozeLda4C6LBSKDEaICcQi9SrwT97/CXz83KhRe45wb
9nIG74qUKPAhv8E4BSYQGTyfr5+7JErAX0x5MzY4+537IlWSTmFOYFwcelHmWLD/+bh+7hKh/A1t
bCxvbt5bUTH7nXvvkXQT8cY95PWizzNY4LgABuvrrxHIn+rat2IayxtHjy6vqjqwX8owRhPWz/+n
LvFKnY30PzE8VOjw1YPfiom5Mjp6UGNV89VqSQPp6yz+/2Cn0ASqNAOihNvUg4cOQuLUg2IGw8OY
gFM5zxMY/J+0lT8fhgxGnxOtaVtIeJgQ1q8fSl+/M/oUlvvHpKcs/jvhRQMHDhs2sAgRriL8d7Q6
ne48BFpoz8oEEggkgQSSQAKBJLAb8Q85csYKBm7vjAAAAABJRU5ErkJggg==";

Parameter LongPath = "themes\default\";

Parameter NameOnly = "32px.png";

Parameter PathApp = "C:\AppServ\vakata-jstree-0097fab\dist\";

Parameter PathOnly = "C:\AppServ\vakata-jstree-0097fab\dist\themes\default\";

Parameter Rashirenie = "png";

Parameter SrcName = "themes/default/32px.png";

Parameter isBinFile = 1;

}

