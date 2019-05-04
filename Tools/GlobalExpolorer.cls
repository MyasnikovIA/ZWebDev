Class %ZWebDev.Tools.GlobalExpolorer Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{
	 &html<
		<title>Global Expolorer</title>
		<script type="text/javascript" src="%25ZWebDev.Lib.js.cls"></script>
	    <script src='%25ZWebDev.Lib.jquery.v320.min.js.cls'  language='JavaScript'></script>  
	    <script src='%25ZWebDev.Lib.bootstrap.v337.min.js.cls'></script> 
	    <link  href='%25ZWebDev.Lib.bootstrap.v337.min.css.cls'  rel='stylesheet' >   
        <link   href="%25ZWebDev.Lib.jquery.plagin.TreeView.themes.default.style.min.cls"  rel="stylesheet" />
        <script src="%25ZWebDev.Lib.jquery.plagin.TreeView.jstree.min.cls"></script>
     >
  
	  d ..DrawBody()
	Quit $$$OK
}

ClassMethod DrawBody() As %String
{
	
    // Обработка дерева
    if $d(%request.Data("LoadTree",1)) {
       d ..LoadTree(%request.Get("json",""))
       Quit $$$OK
    }
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

		  &html<
	<body>
       
       
       
       
       
      <div id="exTab2" class="container">	
            <br>
            <div class="row">
               <div class="col-md-8">
                   <label for="FileName" class="label label-default" >Global Name:</label>
 	               <input id='GlobalName'  class="form-control form-control-sm" type="text"  list="GlobalList" /><br>
 	           </div>
               <div class="col-md-4">
                    <label for="sel1" class="label label-default">NameSpace:</label>
                    <select class="form-control form-control-sm" id="NameSpaceList"  >
                           <option value='#(override.namespace)#'>#(override.namespace)#</option>
                    </select>
               </div>
            </div>
           
           <datalist id="GlobalList">
               <option value="Internet Explorer">
               <option value="Safari">
           </datalist>
           
           
           <button class="btn btn-xs btn-default " id="btn-confirm">Kill global</button>
           <ul class="nav nav-tabs" id="WorkTabs">
              <li class="active"><a href="#ValueTab"      data-toggle="tab">Value</a></li>
              <li               ><a href="#RowTab"      data-toggle="tab">Row</a></li>
           </ul>
           <div class="tab-content ">
  		      <!-- Val -->
		      <div  class="tab-pane active" id="ValueTab">
 	            <input id='ValueText'  class="form-control form-control-sm" type="text"  /><br>
                <button type="button" class="btn btn-xs btn-primary " id='SaveChange'>Save change</button>
              </div>
              <!-- Row -->
              <div  class="tab-pane" id="RowTab">
                  <textarea id="RowText" class="form-control form-control-sm" rows="10" ></textarea>
                  <button type="button" class="btn btn-xs btn-primary " id='SaveChangeRow'>Save change</button>
               </div>
  	        </div>
  	        
  	        
  	        
 	        <div id="GlobhalItem"></div> 
         </div>
      </div>
      
      



<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="mi-modal">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">You are sure...?</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" id="modal-btn-si">Kill</button>
        <button type="button" class="btn btn-primary" id="modal-btn-no">Cancel</button>
      </div>
    </div>
  </div>
</div>

<div class="alert" role="alert" id="result"></div>
 <script language='javascript'> 
/// ---------------------------  
/// Удаление глобала  
var modalConfirm = function(callback){
  $("#btn-confirm").on("click", function(){ $("#mi-modal").modal('show');});
  $("#modal-btn-si").on("click", function(){callback(true); $("#mi-modal").modal('hide'); });
  $("#modal-btn-no").on("click", function(){ callback(false); $("#mi-modal").modal('hide');});
};
modalConfirm(function(confirm){
  if(confirm){
      var res=#server(..KillGlobFun($("#GlobalName").val(),activeNameSpace))#;
      try { eval(res); }catch (e) { alert(res);}
  }
});
/// ---------------------------
</script>      

      
      <script language='javascript'> 
          var activeNameSpace="#(override.namespace)#";
          $("#NameSpaceList").html( #server(..GetNameSpace(activeNameSpace))#);
          $("#GlobalList").html( #server(..GetGlobalList(activeNameSpace))#);
          $("#NameSpaceList").change(function() {
	         var activeNameSpace=$("#NameSpaceList").val();
             $("#GlobalList").html( #server(..GetGlobalList(activeNameSpace))#);
          });
          
          // Обработка ENTER
          $('#GlobalName').keypress(function(event){
	          var keycode = (event.keyCode ? event.keyCode : event.which);
	          if(keycode == '13'){
		          
	          }
         });


         
         
         
         /// Сохранение глобала
         var SaveGlob=function(GlobValue){
             var res=#server(..SaveGlobFun($("#GlobalName").val(),GlobValue,activeNameSpace))#;
             try { eval(res); }catch (e) { alert(res);}
         }
         $('#SaveChangeRow').click(function(){
              SaveGlob($("#RowText").val());
         });
         $('#SaveChange').click(function(){
              SaveGlob($("#ValueText").val());
         });
        /// ---------------------------



/// ------------------
/// ------------------
/// Работа с  деревом
         ParseTree=function (node) { 
              var SelObj={}; SelObj.text=node.text; SelObj.id=node.id;
              var obj=node["data"]
              for (var ind in obj) {
                  if(ind =='parent'){ continue ;}
                  if(ind =='parents'){ continue ;}
                  // w:isData=2 " data-jstree='{""icon"":"""_override.%data(ind)_"""}' "
                  var val=obj[ind];
                  if (typeof val === 'object'){
	                if (obj[ind]["icon"]!=undefined){
		               SelObj["icon"]=obj[ind]["icon"];
	                }   
	              }else{
                     SelObj[ind]=val;
                  }
               }
             return JSON.stringify(SelObj);
         }        
         $("#GlobhalItem").jstree({
            "core" : {
                "check_callback" : true,
                'data' : {
                       'url'  : function (node) { 
                             GlobalItem=ParseTree(node);
                             console.log(GlobalItem);
                             return '%25ZWebDev.Tools.GlobalExpolorer?LoadTree='+node.id+"&json="+GlobalItem;}
                      ,'data' : function (node) {  return { 'id' : node.id }; }
                }
             },"plugins" : [  "wholerow" ]                
            // },"plugins" : [  "wholerow" ,"contextmenu"]
            //  , "contextmenu":ContextMenuWorkSpace
         });
         var GlobalItem=""; 
         var GlobalItemArr=[];
         $("#GlobhalItem").on("changed.jstree", function (e, data) {
                var node =data.instance.get_node(data.selected[0]);
                GlobalItem=ParseTree(node);
                console.log(GlobalItem);
                localStorage.setItem('GlobalItem',GlobalItem);
                //  var res=#server(..onClick(GlobalItem))#;
                try { eval(res); }catch (e) { alert(res);}
         });

/// ------------------
/// ------------------
          
         
         
     </script>  
    </body> 
    > 
   q ""
}

/// Список Областей имен
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
    }
    q ""
}

/// Получить корневой список глобалов в области имен
/// d ##class(%ZWebDev.Tools.GlobalExpolorer).GetGlobalList()
ClassMethod GetGlobalList(NameSpace = {$zu(5)}) As %String
{
          s gl="inv"
          D GetDirNSP^%SYS.GD(NameSpace,gl) 
          s GlobalName=""
          for {
             s GlobalName=$O(@gl@(GlobalName))
             q:GlobalName=""
             if $l(GlobalName,"%")>1,NameSpace'="%SYS" continue
             &HTML< <option>#("^"_GlobalName)#</option>>
          }    
    q ""
}

/// Сохранение значения глобала
ClassMethod SaveGlobFun(GlobName = "", Value = "", NameSpace = {$zu(5)}) As %String
{
	d $zu(5,NameSpace)
	s $ztrap="errSave"
	s @GlobName=Value
	q ""
errSave
   w "Error: "_$ze
   q ""
}

ClassMethod KillGlobFun(GlobName = "", NameSpace = {$zu(5)}) As %String
{
	d $zu(5,NameSpace)
	if $d(@GlobName) {
		k @GlobName
	    w !,"Kill: "_GlobName,!
	}else{
	   w "Global not found: "_GlobName
	}
	q ""
}

/// Добавление записи в дерево
ClassMethod addRec(override = "", icon = "", Data = "")
{
       q:override=""
       s text=override.text
       if text="" s text=override.id
          w "<li class='jstree-closed' "
          s ind=""
          for {
             s ind=$o(override.%data(ind))
             q:ind=""
             s name=$zcvt(ind,"L")
             s isData=1
             s:name="id" isData=0
             continue:name="text"
             s:name="icon" isData=2
             w:isData=1 " data-"_name_"="""_override.%data(ind)_""" "
             w:isData=2 " data-jstree='{""icon"":"""_override.%data(ind)_"""}' "
             w:isData=0 " "_name_"="""_override.%data(ind)_""" "
             w !
          }
          w "  "_Data_" >"_text_"</li>"
}

/// Заполняем дерево элементами
ClassMethod LoadTree(override = "")
{
    s:override="" override=##class(%ZEN.proxyObject).%New()
    if '$isObject(override){
       d ##class(%ZEN.Auxiliary.jsonProvider).%ConvertJSONToObject(override,,.override,1) 
    }
    &HTML< <ul> >
       s override.text="ind"
       s override.block="NameSpace"
       s override.namespace="ind"
       s override.icon="%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.namespace.cls"
       d ..addRec(override)
     &HTML< </ul> >
     q ""
}

}

