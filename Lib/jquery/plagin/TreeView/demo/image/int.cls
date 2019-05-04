/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.int.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.int.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.int Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 28/03/2018  09:02:32
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","int.png") 
       Do %response.SetHeader("Content-Length","630") 
    }
    q 1
}

Parameter FileName = "int.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAAAwAAAAQCAYAAAAiYZ4HAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTAw9HKhAAAB8klEQVQ4T3WRW09TURCF97s/x//igw8STbwhNd6IgogNCWok0UhbqW1ULAJiEahCCfTCobQFioW2UChXAUO5VKPBYBBKP/c+tBESO8nKmb3WrNkzZwv/SApveIa+YJLewCTuwQQffeM43aM0dQV45fTj6NCQcVLihJiYXlYHcjnIZnP82Tvg9+4B2ztZfvzax63FqDW1YG3uVWVxEZ1a0g3FwhOM4Q0lOXW5hjprByISX8hLx0O/8SBHanGN0koTpw0PKasyI4YnZvUCa/cWDa40zztXsDjneNY6yZOmz7qmDLG5bxjuWRDBsRmEMOYhjuT/8H17n0gyIw0NiIHhKb2LCiVqmobRePhVUJx7aIlQfJMrytA/FNMLFJRYyI9yq1u7aNENyqpfILr90Xz/4zcUQnHt3nk8kTSlVdLQ2T+Wl4ob2vrmcYfXuFhpRbzvGdHJQ/xvaUFicYeuwa9cqJCGZlco36v40o2fZnH6VjlXLt/h9YfAsQUL+VHuZVeKlr5lzt4yIWzvBsj83ONx2zoPmlepaVyg2p6kwhKl/GmYa3Ua5rYkjp4vlNyoR5jfehmbzhBObKKNb+AZTesLuuTM7b4VvfMbWWySpjPKcPuRg6tGG4b7NvmfFezygexcumvj/J0GObdFH6XkZj3Xa1v5Cx3ANNUDaYW2AAAAAElFTkSuQmCC";

}

