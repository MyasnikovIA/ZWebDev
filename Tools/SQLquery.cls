Class %ZWebDev.Tools.SQLquery Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{
	
    &html<
	  <title>Create Object Script Class</title>
	  <script type="text/javascript" src="%25ZWebDev.Lib.js.cls"></script>
	  <script src='%25ZWebDev.Lib.jquery.v320.min.js.cls'  language='JavaScript'></script>  
	  <script src='%25ZWebDev.Lib.bootstrap.v337.min.js.cls'></script> 
	  <link  href='%25ZWebDev.Lib.bootstrap.v337.min.css.cls'  rel='stylesheet' >   
   >
  	d ..DrawBody()
	Quit $$$OK
}

ClassMethod DrawBody() As %String
{
	
	 if $d(%request.Data("json",1)) {
	    d ##class(%ZEN.Auxiliary.jsonProvider).%ConvertJSONToObject(%request.Get("json",""),,.override,1)
	    if $d(override.%data("namespace")){
           d $zu(5,override.namespace)
	    }
    }
	if '$d(override){
	   s override=##class(%ZEN.proxyObject).%New()
	   s override.namespace=$ZU(5)
	}
	s override.namespace=$zcvt(override.namespace,"U")
	d $zu(5,override.namespace)
	
	
     /* https://bootsnipp.com/snippets/oVlgM */
   w "<style>"
   w ".table-fixed thead {  width: 97%;}"
   w ".table-fixed tbody {  height: 230px;  overflow-y: auto;  width: 100%;}"
   w "</style>"
   &html<
	  <br>      
      <div id="exTab2" class="container">	
         <label for="sel1" class="label label-default">NameSpace:</label>
         <select class="form-control form-control-sm" id="NameSpaceList"  placeholder="Выберите шаблон SMS...">
               <option value='#(override.namespace)#'>#(override.namespace)#</option>
         </select>
        
         <label for="SqlQueryText"   class="label label-default" >SQL:</label>
         <textarea id="SqlQueryText" class="form-control form-control-sm" rows="10" > select * from %SYS.ProcessQuery </textarea>
         <label for="MaxRow" class="label label-default" >Max row:</label>
		 <input id='MaxRow' class="form-control form-control-sm" value="999"/><br>
         
         <div align="right">
           <button type="button" class="btn btn-xs btn-default " id='StopQuery'>Query break</button> 
           <button type="button" class="btn btn-xs btn-primary " id='StartQuery'>Start query</button>
         </div>
      </div>
         <div   id="ConsoleTerminal"  ></div>
	
	          <script language='javascript'> 
	           var activeNameSpace="#(override.namespace)#";
	           $("#NameSpaceList").html( #server(..GetNameSpace(activeNameSpace))#);
	           $("#NameSpaceList>option[value='"+activeNameSpace+"']").attr("selected", "selected");
	           
               isOkFun=function(txt){
	              $('#ConsoleTerminal').append(txt);
                  $("#SqlQueryText").removeAttr("disabled");
	           } 
               ProgrressBarFun=function(txt){ 
                  $('#ConsoleTerminal').append(txt);
	           } 
	           $('#StartQuery').click(function(){
                   $('#ConsoleTerminal').text('');
	               nameSpace=$("#NameSpaceList").val();
	               sqlText=$("#SqlQueryText").val();
	               MaxRow=$("#MaxRow").val();
	               
	               #server(..SqlQuery(sqlText,MaxRow,nameSpace,isOkFun,ProgrressBarFun))#; 
	               $("#SqlQueryText").attr('disabled', true);
               });
              </script>  
	
	>
 	
	q ""
}

ClassMethod GetNameSpace(zns = "") As %String
{
    k namespace
    For i=1:1:$ZU(90,0){ 
        if $l($ZU(90,2,0,i))>0 s namespace($ZCVT($ZU(90,2,0,i),"U"))=1
    }
    s ind=""
    for {
       s ind=$o(namespace(ind))
       q:ind=""
       if ind="%CACHELIB" continue
       &HTML< <option value='#(ind)#'>#(ind)#</option>>
         /*
       if zns=ind {
         &HTML< <option  selected= selected>#(ind)#   </option>>
       }else{
         &HTML< <option>#(ind)#</option>>
       }
       */
    }
    q ""
}

///  d ##class(%ZWebDev.Tools.SQLquery).SqlQuery(" select * from %SYS.ProcessQuery")
ClassMethod SqlQuery(SqlStr = "", MaxRow = 999, nameSpace = {$zu(5)}) As %String
{
	if MaxRow'="" , +MaxRow=0{
		s MaxRow=999
	}
	s oldNS=$zu(5)
	d $zu(5,nameSpace)
    if $l(SqlStr)=0  {
	   d $zu(5,oldNS)
	   q ""
    }
    s $ztrap="ztError"
      s SQLobj=##class(%SQL.Statement).%New()
      d SQLobj.%Prepare(SqlStr)
      s DataSet=SQLobj.%Execute()
      s QMeta=DataSet.%GetMetaData()
      &html<
        <table class="table table-fixed" border=1>
          <thead>
          <tr>
      >
      //     <th class="col-xs-2">#</th><th class="col-xs-8">Name</th><th class="col-xs-2">Points</th>
      for ColNum=1:1:QMeta.columnCount
      {
        s nam=QMeta.columns.GetAt(ColNum).colName  
        w "<th class='active' >"_$zcvt(nam,"o","XML")_"</th>"
      }
      &html< 
         </tr>
         </thead>
         <tbody>
      >
      s countRaw=0
      while DataSet.%Next()
      {
       s countRaw=countRaw+1
       w "<tr>"
         for ColNum=1:1:QMeta.columnCount
         {
            s val=DataSet.%GetData(ColNum)
            s nam=QMeta.columns.GetAt(ColNum).colName
            s typ=QMeta.columns.GetAt(ColNum).ODBCType
            &html< <td>#($zcvt(val,"o","XML"))#</td> >
         }  
         w "</tr>"
         if MaxRow'=""{
           if countRaw>MaxRow q
         }
      }
     d $zu(5,oldNS)
     &html< </tbody>
        </table>
     <left>countRaw: #(countRaw)#</left>
>
     q ""
ztError   
    d $zu(5,oldNS)
     &html< </tbody>
        </table>
     <left>countRaw#(countRaw)#</left>
>
    q "OK"
}

}

