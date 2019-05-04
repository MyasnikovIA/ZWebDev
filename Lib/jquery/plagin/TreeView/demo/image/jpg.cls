/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.jpg.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.jpg.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.jpg Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 24/03/2018  16:51:11
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","jpg.png") 
       Do %response.SetHeader("Content-Length","583") 
    }
    q 1
}

Parameter FileName = "jpg.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAOCAIAAACpTQvdAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwwAADsMBx2+oZAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTFH80I3AAABw0lEQVQoU5WPz0sUUQDHv+/Nm3FmZ2dSp92sbd0sW10VlIrWQiHoGkZE0L3+jujWJYIOHRY6GUHnBS+C9AdEIIpLiR3yRyrqrrPuzu7ozDzf7BO6hX0uDx6fD9/3SLlcxn8hAn5uhMxkVnyzFKJLIZxSMAWejwTF3QJGr2DPg5Mk5Lj14t6EMJlM06Y+NJ6vNuD7uNSNeht3BjB2E2MMPvDuB3qbq9JkUYfnRT5djKcWf0Ph2Knh6BheA3ULzQAzGSysSzGiYRiKI5+1XMACZnLIXcVEHrcHYHahQUAYJi08yEFoQqadLHo/+2X204casCdeyaCbmLYxYkClUBT8ire5NJlc+LNZqfre28/V4csPn07dz2g4BEKgF3BiGz7RhCbkOBBs7H4/OQjXNiqV7PL8t4/ZwesHPsmYIwHvT3e7TwrjtibFTiDS1n5/MtWH/cAlCVdn61u7Fx19qz3X4yRXNXVpeyUbnLx+/DIO4ndFUfLGo55rQ4ZG0tYFU1MtnWkqMwzdNrRBx0jZCW/npzTPFtREENXXuKq4TXpE4TKFhxGhvM826qYRgrT91q1C6u/C11fPOn/7F9IkpVLp7OI8AKeNtCEFq6J6QAAAAABJRU5ErkJggg==";

}

