/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.tools2.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.tools2.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.tools2 Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 09/04/2019  13:21:01
ClassMethod OnPage() As %Library.Status [ Language = cache ]
{
   w $system.Encryption.Base64Decode(..#FragOnPage1)
   w $system.Encryption.Base64Decode(..#FragOnPage2)
   w $system.Encryption.Base64Decode(..#FragOnPage3)
   w $system.Encryption.Base64Decode(..#FragOnPage4)
   w $system.Encryption.Base64Decode(..#FragOnPage5)
   w $system.Encryption.Base64Decode(..#FragOnPage6)
   w $system.Encryption.Base64Decode(..#FragOnPage7)
   w $system.Encryption.Base64Decode(..#FragOnPage8)
   w $system.Encryption.Base64Decode(..#FragOnPage9)
   w $system.Encryption.Base64Decode(..#FragOnPage10)
   w $system.Encryption.Base64Decode(..#FragOnPage11)
   w $system.Encryption.Base64Decode(..#FragOnPage12)
   w $system.Encryption.Base64Decode(..#FragOnPage13)
   w $system.Encryption.Base64Decode(..#FragOnPage14)
   Quit $$$OK
}

ClassMethod OnPreHTTP() As %Library.Boolean
{
    Do %response.SetHeader("Content-Type","image/png") 
    if $d(%request.Data("download",1))
    {
       Do %response.SetHeader("Content-Disposition: attachment; filename=","Tools2.png") 
       Do %response.SetHeader("Content-Length","3304") 
    }
    q 1
}

Parameter FileName = "Tools2.png";

Parameter FragOnPage1 = "iVBORw0KGgoAAAANSUhEUgAAACkAAAApCAIAAAAnApehAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAx9SURBVFhHtVgJUFz1GX/H3suyu9wEWG4IhHAH
iDkUbA5z1FjTGtOMiaa1HrF1WqcdrY097HRS69RR1KmdauMkJsaUaC6FnBggkEA4wg3Lci3LvSx7
sMc7+tt9G0gitpnO9Dc7zHv/6/t/3/f7jgfpdDqJe4DN7jCNTZhnZswW67r776MoCoN2h6O2vik4
SBus1USGh4pEImHxPcJ7xH8Fz/Offg==";

Parameter FragOnPage10 = "dBcXrCC0cj9dwAydmvzgGqcLorISIniCP36qfMu6YpAXx86zCvD356DApera9JRkwSCQERIU1Ns/
gCY1XafLVqiPT4/oXTYZRSsoWkJ5Y1oAfJ8RRn7czAVIeNhZML5SQuYtIY+1ciopxIeDYqEhwd/s
r/29w79Ol+Nea4vy5+8F8+Kj5HxlDdrQjSVrETZnLGMTbifYEkCLFL5lDo7NkWvyAzRulvi8g0sP
JcB/yBZO6DdzZ7u5VbHUslASzIDBtIoFpQG/bBSuqtr6R7duxNam1vbsjHSp1FtMnS4XvrUaWzt3
bf8uyt8cx1oYj41jEMRgnJIWhYikuA==";

Parameter FragOnPage11 = "CuRZXfyRFm9didf6BSC3jMzy719j5xhvVqZJAqwsiiE3JNMyX3z6ZaO2VFRWoxHW9w9pNSpNoHpj
yWokBEzhBrhZxeWqQKUSLZQCYSCVoE/G0Y45p8vtNiKWgrSpSQkQ8Pd6tiSBhPYo5175+LRw8BIR
AaWRmI2zfEUvBxs8lSuKDCT9siEA32Bo8zLTUuGYyqvXjKOjT+7YLuzHLCiKCEHDy7AMyq5cKmVZ
bs7lRv1F4w1mII2szM9xMsSpTjYhiMyJXBB/O5we/qseDon5p0Uiv2wAAvBX8Fbf4PChY5/vf2mf
b2YBSMsQzKIK+j4zQQ7ECADXoIFHjA==";

Parameter FragOnPage12 = "4MPR6iK+aGcLdGRqyB2Vw8PwKHQ6DSmiiH80MPGa2xjvJahP8Nyc87Mvvnzx6d14xqE9ff34GBYK
PoTBKgqFHF0AfqChRCJGeMIRD65dia+WQaNJJSUKdRTyq08XLxiOrxlkD1xhDGb+UBPTP8NvTqH1
Zn5B73mgnp45d1kmlRTmZdc33cQrqhFanwdXFwWqVP5Fd6Km/sbo2CSskRgXg8+fqgEODl4R7df7
Yh87aOa3pdPg2piVv9DHRavJjsnFZMP4IF2PoR8NV8ySyJ3f24JXRH+8LnppciJy8u//UuphWSQN
rVr9q30/hrV+86e/PrNnZ3hoMPIjXg==";

Parameter FragOnPage13 = "vzawQXIiI8Iru2aArRnifpQvUku9poUxkI+PtrAmK7HIBypWgMnLUpORX2Fkr52lkrZu/aqCPDBu
yjyjVCp//sweLNv38h9wLXQKanUgWDDfgUeqyOFZv8W/6uV+mEVrZH7ewavIPI9n0nXD3CL/dxCA
o3HWfKdhtdrxwdFjGLjwdQ36HrgaU4aBIdPY+MDwCOIuThctlEtAKyO+6mFR+iQ0WTPIwRRg/u20
F1EkSLeIzb8JIcbQ68+5XHa7IzkhThjHFwUiE9QDOVAkcF1hHOib5q4Nc9sz6CELj8K6IZkqSbg7
6u5J9v+GSgPrYYmCaGrQwh1q4h7Pog==";

Parameter FragOnPage14 = "l4ffUfj/j7I9LN8xwY/aQEq+a5IfshBP5tFpobeimiD+DURyLXeUmZAcAAAAAElFTkSuQmCC";

Parameter FragOnPage2 = "caZL3weRcpn0cnWdMP7eh5+Eh4bgBtV1DYeOn8QyYfwe8a2yWZadnIKSVuHV5fJseGB1fvby/OyM
IyfOwgb46QeHkxPiVhXkbV5fjINIksRKWGhm1spxnLDxP4B+9dVX/Y+3gOubZywXq+pa2jo6e/qW
p6dOTpuHjCaNRq1VB9I07fF4DIPDA8PGtOTE9NQkiGxovslyRGREmEQsOnisTN83aJ6dDQsJlojF
/kMXwyL+nrHMHjv5ZVZa6tKUxOtNN1vau8RicV5mWl7WcqlE4l90J7CloaWtqbVDFaCIjoxYmZdd
19hiGh/f9eg2sfhbSbCIbKfTVfrhoQ==";

Parameter FragOnPage3 = "vTu3azVqvIJfWo1GmPqvuFxTt7ZoBWgxNjF1pOzU83t3ib+dgIvzfNA48sHHx15/+UX/+y2ABLM2
u9Vmc7s9FElKpdJAVYBSIYfZBWfP43dvvPPskzthdv/7YliQPTk1fbW+cU3RCplUerjsZLBGu23T
d4QpMADCOnv7yi9VQZRMJhZRXkcyHGOzORRy6ZqigqR4HaggrAcOHi0LDg56qGQNqNfY2pGzPF2t
CvDP3YJfttvjOVl+MTAg4FxllS5qSVxM9NYNxRiHVOjape8vO10eFRX+1I7tQiAJwSRoCiaCH6bR
8Z/s3hEVES6EPgCbcxzf1tWTk7mM5w==";

Parameter FragOnPage4 = "+Ee3rL/9coBfdnt3b1tn79b1xTivtaMnIy0Z2kMMSHSxqhYM2FiyJkirsbFMm8M6zrqEzdiuE0uT
5ColRU/PzJw4UxERHlayukguk8EFs1bbjZvteZnLIPLs+crC3MyYqEj/Ph/8ss+cv4QI3rqhZJ4a
EIzjTpdfys3KSE9JnOP5Q5MDE4w7WRYQJVGIfd718LzRbe922pcr1A9pwl12R0+vob1H/8im9XDN
PAMYhj1z7lJgYGDxqgJhRMCCzU+crYApH9u2WZhwudyfnfwS5oLgHqftb+OGHIV2V2iMMHsXSkf1
vU7bLyOTIyXyXsNA480OcGU+uD86cg==";

Parameter FragOnPage5 = "HFbcvnUjYlUYEeD3DdRNiosFZ4VXKH3hytWw0GAIbrDNfDZlfCE8cV6wlwSc9ycAI/siEl+KTD46
bTQ47eAKHNfS1ilMCViRk/nNbE9Bvymz2WqzD5vG0lOThdHRsYnGm+2rC/Nw1uGpoSdCdXGyhWu9
W8+8Xcvi92YN2z3FM6z3BtFSxcPayHfH+mwEu27tfZeq65DnhS2Fudnt3Xpw1sMwt1+ILlxT/NHR
snOXq6H6qoIciUSC6dKPDr/03FOURPL2mP5AbIZatGAreLEgij7czBbHUVtT6TeusNMOPi2MpCky
SCQJpsRvjfdtC9eBnoYhY1KcDutFIg==";

Parameter FragOnPage6 = "+lT5xYOfnrhSWx8RFoKKJxxFf3/Hzsce3vyDhx8qzM2CYAxNTE71DxkLcrOaHBYLx6wI0ApLb8fS
UPKTFk4t5ffmicbtREUvvyyMEFNElEzR5bBqROKCxMRTFZdyMtKQU0H7++8r2LZpXUJszPDIaKLv
QjiEgh2kEvG8KfDQbejPXpaGMtTptBYoFxEMJGipFwpFx9r4k53suiQqTk2WtXLCEatUwS0OC54T
dNEIfd+YH+ATXMwwjPBKQcuf/fr1V/74JiJBGLLM2jSaQIbnhl1zcsqbDcAqMEuYnUeslizdIh6w
YJbYkkaP2Hm72zsOpe0c6+a5jLSUvg==";

Parameter FragOnPage7 = "gSHfWoJhWb1h8LU33jGNT+JZGKSefmLHwdI/w+Ddff14h94impaKxdg8w7qjJTIM4tC3apjm0btL
cpOJi1YRlC+MAyREn9lrPglJIe7BP4+HsTmQF7yXvtHcWlV3/f0Dv31m9w64wLthPsbsjrkAhVx4
BpAXoY2YpKV+vb0CGoe5C3r/lYFKA1fWym5OpQXnJWqpaR+vIZvlWBAa46Q/+XoPTEmKvyun+mVj
DulFeAaVYWQcaWU9FsZrR5ry/vbki8wOvtHk1b5hhLuoZ18pFikk/uRVb+RClNhKOHmOoGiR7xDe
n/IJtDF3JRaAjkxIRRpBFVlTlC9o0A==";

Parameter FragOnPage8 = "re9HZUQH2O20hUtk4WIZlL5u5FUyIieSrB3kLvazbobYk7sgGOiZ4uODyGA54UBxY5kUecDE+ATc
F70kAscq5PKKy9VXrtYPm0aT4mMxji307j17H9m0Do3YfP2ZtVrHJ6cTY2OM7rkAShwllUMC3Fla
y62JofNjqPwlVEY4JRUtCAaiA4nzvZxcQsaqRNESOUh6pbYhY2kK1MAsfJyflYEYGxkdR4wJVYNC
qnO5PYLGAB5iY6J6+gZwkSSpstwyKgymh1F7cqj3rjNTdl5Mk2gchPXzCFWSW1Kpd2tZg5lQweQE
MTRiQu/sn/YdgkYPD8jtwgj97HPPnw==";

Parameter FragOnPage9 = "vVD59dXr6MuS4mLkchm64IbmtiURYfFabbPDgmwVIpZiZ1QgKRcTx9s5miAdHn5yjp+w8xYnr5aB
iV4ESMmVMeQR5Bw5GYIyRvBo4uJ0UWgf/nm0rPpag9E0lpqYgJMF2aTdbgfLwECk1dSkeDgDo9Pm
mQOlH7z2ixdsIvK14fY9ofGFKm+SAXtm5vjmMR4dMIgkookpB5EYRGRGeKX7DiRMs9zJLi4viswK
5W+0tN7s6M5MS5k0zzywqhBRp1QokGKFlfT+/fthfTgbm681tmSmp2JUJpMGa7VX65sK0pfmKjVv
mnriZUqQDmtkIiJOQ8ZrSTArVkPi+Q==";

}

