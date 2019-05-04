/// 
/// ///<br>Изображение:
/// ///<br>  &lt;img src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.doc.cls'  alt='Нет фото'  width=320 height=240 &gt;
/// ///<br>  <!--  <img  src='%ZWebDev.Lib.jquery.plagin.TreeView.demo.image.doc.cls'  alt='Нет фото'  width=320 height=240 >    -->
/// ///
Class %ZWebDev.Lib.jquery.plagin.TreeView.demo.image.doc Extends %CSP.Page [ Not ProcedureBlock ]
{

/// 28/03/2018  09:02:10
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
       Do %response.SetHeader("Content-Disposition: attachment; filename=","doc.png") 
       Do %response.SetHeader("Content-Length","868") 
    }
    q 1
}

Parameter FileName = "doc.png";

Parameter Frag1 = "iVBORw0KGgoAAAANSUhEUgAAABMAAAATCAYAAAByUDbMAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABp0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuMTAw9HKhAAAC4ElEQVQ4T5WT20tUURTGNS2DoP6BHnoIopfABwuJCOnFtB4CIYquVJJgT4WCJkYXMA1KxMoyoZpR0RzzwnhN7EZpajrpaOOMOtM43jKv1XjOGb/2WnO2jFpUGz722Zf1O99a65wgTdNIwf8geVfel88H9fXxlYfBla/6UPGyF8+brTA1daPshQWl9V0oqfuIYnM7Cs0fYKxuhaKosQFxpA0MyCn1gHTTOIb0Ag9S7/UhPrMHh9O6cCipFVEX3mD76RrM/VzE5LwP+aXN2BlzVgCVkABgyBLsb2N9TCXmBWxKwHINdah/2y2B0TowmGHkqKRpBtfybTh5pR1W+zjPdtc84hINyDI4/DCvD1Pffch5UsMgqWUwSo0CCXbi8mt+3pdQx/OBhCIkZeYz7I7Jyhqb8cHYaIehwSFhnC7DkrJ7OBWaCVLeOIgtsQ/YUeSR+2ixuLA26iHmvIt+2LQG51cNj+sdiNh/RsKCGEbFphGfVsWwY5dKERpxFeFHzdi2J5HPCDb7ww/zfNMwOK7iUe2AhHETGBaX0sEBVB9yUvN+nmGksvpOPgvbncHFJ5h7UoNjTEWeeWg1LPpimz9gRxZ2nTJhelZh0N5z1bxPg9ayZk7hyuZRkVvlkjDi+GGR52v1kD+PoPBkjE5pcIla2UdVWN0Kbld8CYT5G0AfJHVLiuojRemRK4JJZ73DKixOBZkm92qYvthEyituwui0T3TMx/OIcDMsauScUNlR77CCTy4FHQMLuPHME1gzhkkg625hg0hF5XSkk5XqGPCitd+LK0UjErb0na3RQbxBvwoV1zai4rOY+4QTq1sVblR0Di2gzeFFS/8C3tm8SDWMSViYEDdgmTv6VSwijYLaQW59brUL2RUu3Cp3I6NsGNfFf5wuHKUYR5H8dELCNlLsshRJdPi/EnGbhdgZW9RFKVO6/KYA0f46oa1Cobpoj2LlnaU0eaHPS4cr9Lu9AGnBvwCUfTWFl82T5AAAAABJRU5ErkJggg==";

}

