/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.terminal.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.terminal.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.terminal Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 09/04/2019  13:11:24
ClassMethod OnPage() As %Library.Status [ Language = cache ]
{
   w $system.Encryption.Base64Decode(..#FragOnPage1)
   w $system.Encryption.Base64Decode(..#FragOnPage2)
   w $system.Encryption.Base64Decode(..#FragOnPage3)
   Quit $$$OK
}

ClassMethod OnPreHTTP() As %Library.Boolean
{
    Do %response.SetHeader("Content-Type","image/png") 
    if $d(%request.Data("download",1))
    {
       Do %response.SetHeader("Content-Disposition: attachment; filename=","Terminal.png") 
       Do %response.SetHeader("Content-Length","744") 
    }
    q 1
}

Parameter FileName = "Terminal.png";

Parameter FragOnPage1 = "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAIAAABvFaqvAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAJ9SURBVDhPlVQ9aJpRFL1+aP0LJmrFKIoSYkVU
EEEhyZKltVOGZsmYwc0li6OzdE2yipuLg3TvoHQoCpUQECMYsbooSjWGxAiW9Pi9hzXEfDEHf869
993jfc/3Hdnj4yOJyOfzjKyOvb09hULBOBeKRqN2u52lVketVstkMozPhKCi0WgODw9R6Pf7rPAq
3G43xkmn07lcDqEc79FoZDAYhsPh5Q==";

Parameter FragOnPage2 = "5WUqlXp4eBBXSmFzc/Ps7GxjYwNdLCOwLwYc0yoqQKfTwVbk8tkcDE+EluCAKL7wOuLp55AUOqL9
L6Ty0mcv7XvJpSNS8cpzSAmZElT/QJ9+0K/QjAgvqwBSQn9c1AnS96+cfOTp5ZCcqEK2n3QQ5eQb
Ty+HlNDfdzRV0r2REw1SL1/+N2ytdk7U5KXneG0iFd2/54R+8/xSPBHa2dlRKpU8kITJZLLZbDwQ
8f9qrq+vJxKJZDI59wMJCIKA9aVSicfsoY3FYjc3N6FQiOdWBgxDq9VGIpFZAKF2u318fCyW3oZ4
PI52Bu5HhUJh/hyvDpiP1Wr1er3gsg==";

Parameter FragOnPage3 = "arVaLBadTme9XsfTPJfz+XxwAiRZiAUwjYuLCxYGAoG7uzsI4TMcDuPsBRhCs9mEpVksFriSWq12
uVxbW1vX19cymQyEZXC6WAMCMwPQPxgMrq6uptMpk+b/Goyx1+uBBINBSGA0h8MxJ+VyGSX0mM1m
/Fij0cAsrVYLJXBRYOEebW9vYwT8o5PJBFOgWa/XM4J94X75/f61tbVutwuTxUQ6nY6VWLusUqlk
s1mPx4OlmB8qiwY6B9pub29xd1gJhwKDxmJsc3d3F6EcQ6JwcnIyHo/Flrfh9PTUaDQS0T9mjRQi
FbZslwAAAABJRU5ErkJggg==";

}

