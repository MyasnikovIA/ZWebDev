/// ///<br>Изображение:
/// ///<br>  &lt;img src='%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.document.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.document.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.document Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 13/04/2018  15:55:19
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","document.png") 
       Do %response.SetHeader("Content-Length","940") 
    }
    q 1
}

Parameter FileName = "document.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAABMAAAASCAYAAAC5DOVpAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTAw9HKhAAADKElEQVQ4T42STWhTaRSGv+92pAXduBrciRsXjgtxBBcziLhQ8WeYxVBUOnUU7FCJFRV1V8GlYFvipLVgNNaSpmmTND9tmqSpza32llZSLRJbB+oYm1gy/aGVFmPD6znXezW6UA88nO/nvA8f3CsAfItS4gdCEopxto84bKyZTdyLA+Ywd/N8TT6/vGtg8D4abzvQ0HQTgVAXMplMG939aMzwvI4oFArMOn/iGUwiw/8ikXyBZOoFHO0exBKDyOb+x8vXOdzz+HGt3orFpTcVlJMG7JAin89LQmHJl9U/qKK3P6Gv360CSysFZOZWYbW3o9XVAcptIdjBlIjl5WVJKN7+p3qo/k4EDY4obrkHYLM7MD2T+yh6vfAOE9N5BNRnsJw9C8r9SpgOKRYXFyWhuKOPdVlx1TU249XM7AfR/CqJ3kKbWMHNTg1V1dWg3EaCHYeJUjE3NyeJtc7uUV3QQC+ztcbQ0a3BGwjA39uP7Dy9KJPH0OQKQo/ewHKpFv/YbIj3eEHZSs4TQuRyOUmUtfg1XVZcmek06qw3cKstCJ+aQpNHg+ViLcqP/IG2+gr4m2oQC3WC8lcIRdBnlkSJ3aMais/rwfAYGpsbUW2x4M/jJ3Cs/HdYz+9B9s5eFB7+Bcf1cxjVVP5dKkU6nZaE0uyK6+GHo08QHRhGMKKiKzwATygOd1cELS4fnN4wztScw9+HfsZY7Q68atqN2UA5Llb9BnJcF1NTU5KxtUZ0GYtY8Ik+uP1ROD3dcAYSqKy5irDXiaqD29F3aSdO7duKoM8FclwWk5OTpYS03u3RZaHYIDqDfegIREkSQXtXL9o8PXB5e2B3x3Gg4gJo/kbQ3YJftm2Gq9XO+6PEepFKpdYSH2Ujyafw0ms8wRhcvrAu8dELw/Eh2O71Ysf+k6D5EmKr0X/iPCHE+Pi4ZEwZ19v8KrIzC3j+Xw6PJ7IYGksj8egleIZlRkYxuukQIplMMttMGfevwTKal0aOu2KshRgZGWE2mIPfA82vMXKMNLvQNI2RRBlRQhwz9ibKF3um1Oini86kUFWVUYzOyKJ1MTzDdybFd7RX5XszZeir4L9qeQAAAABJRU5ErkJggg==";

}

