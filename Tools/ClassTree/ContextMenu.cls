///   w ##class(%ZWebDev.Tools.ClassTree.ContextMenu).Draw() 
Class %ZWebDev.Tools.ClassTree.ContextMenu Extends %CSP.Page
{

/// контекстное меню области сервера
ClassMethod Draw() As %String
{
	 &js<
	ContextMenuWorkSpace= {
	           "items": function ($node) {
                return {
                    /*  Создать новый объект  */
	                "Create new Object": {
                        "separator_before": false,
                        "separator_after": false,
                        "label": "New",
                        "icon":"%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.newdoc.cls",
                        "action": function (obj) {
   	                         SelectItem=localStorage.getItem('SelectItem');
                             var res=#server(..CreateNewObject(SelectItem))#;
                             try { eval(res); }catch (e) { alert(res);}
                        }
                        
                    },
                    /* Компилировать активный элемент */
	                "Compile selkect Object": {
                        "separator_before": false,
                        "separator_after": false,
                        "label": "Compile",
                        "icon":"%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.compile.cls",
                        "action": function (obj) {
   	                         SelectItem=localStorage.getItem('SelectItem');
                             var res=#server(..CreateNewObject(SelectItem))#;
                             try { eval(res); }catch (e) { alert(res);}
                        }
                    }	      
                   /*  Показать документы  */
                   ,"EditCode": {
                       "separator_before": true,
                        "separator_after": false,
                        "label": "**Edit",
                        "icon":"%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.edit.cls",
                        "action": function (obj) {
	                       SelectItem=localStorage.getItem('SelectItem');
                           var res=#server(..EditObject(SelectItem))#;
                           try { eval(res); }catch (e) { alert(res);}
                        }
                  }                    
          /* Инструменты */
          ,"Tools": {
             "separator_before": false,
             "separator_after": false,
             "label": "Tools",
             "icon":"%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.tools2.cls",
             "submenu" : {             
                    /*  Работа с файлами  */
	                "File": {
                        "separator_before": false,
                        "separator_after": false,
                        "label": "File",
                        "icon":"%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.fileexp.cls",
                        "action": function (obj) {
   	                         SelectItem=localStorage.getItem('SelectItem');
                             var res=#server(..ClassFromFile(SelectItem))#;
                             try { eval(res); }catch (e) { alert(res);}
                        }
                    },	      
                    /* Запустить Терминал */
                     "ToolsTerminal": {
                        "separator_before": false,
                        "separator_after": false,
                        "label": "Terminal",
                        "icon":"%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.terminal.cls",
                        "action": function (obj) {
   	                         SelectItem=localStorage.getItem('SelectItem');
                             var res=#server(..Terminal(SelectItem))#;
                             try { eval(res); }catch (e) { alert(res);}
                        }
                     },	   
                    /* Запустить SQL запроса */
                     "ToolsSQLquery": {
                        "separator_before": false,
                        "separator_after": false,
                        "label": "SQLquery",
                        "icon":"%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.sqlexplorer.cls",
                        "action": function (obj) {
   	                         SelectItem=localStorage.getItem('SelectItem');
                             var res=#server(..SQLquery(SelectItem))#;
                             try { eval(res); }catch (e) { alert(res);}
                        }
                     },	   
                    /* Запустить прсмотр Global */
                     "ToolsGlobalExpolorer": {
                        "separator_before": false,
                        "separator_after": false,
                        "label": "GlobalExpolorer",
                        "icon":"%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.globals.cls",
                        "action": function (obj) {
   	                         SelectItem=localStorage.getItem('SelectItem');
                             var res=#server(..GlobalExpolorer(SelectItem))#;
                             try { eval(res); }catch (e) { alert(res);}
                        }
                     },	   
                    
                   }
                 }       
                 /*  Показать документы  */ 
                 ,"GetDoc": {
                     "separator_before": false,
                     "separator_after": false,
                     "label": "Document",
                     "icon":"%25ZWebDev.Lib.jquery.plagin.TreeView.demo.image.document.cls",
                     "action": function (obj) {
	                    SelectItem=localStorage.getItem('SelectItem');
                        var res=#server(..GetCacheDoc(SelectItem))#;
                        try { eval(res); }catch (e) { alert(res);}
                      }
                 }
              };
          }
       };
     >
         q ""
}

/// Открыть редактирование объекта по  полю urledit
ClassMethod EditObject(override = "") As %String
{
   q:override="" ""
   s json=override 
   do ##class(%ZEN.Auxiliary.jsonProvider).%ConvertJSONToObject(override,,.overrideTmp,1)
   
   /*
   if $d(overrideTmp.%data("window")),$l(overrideTmp.%data("window"))>0, $d(overrideTmp.%data("urledit")) {
	  s gl="^mtempHistor"
	  s ip=..GetIP()
	  s @gl@(ip,overrideTmp.window)=json
      &js< $('#WorkSpaceServerItem').jstree().refresh();  >
   }
   */
   if $d(overrideTmp.%data("urledit")) {
	   if '$d(overrideTmp.%data("window")){
		   s overrideTmp.window=overrideTmp.%data("urledit")
	   }
	   &js<
	       var w =-30+screen.width;
	       var h =-120+screen.height;
	       var y = 10;
	       var x = 400;
	   	   var win=window.open('#(overrideTmp.urledit)#?json=#(json)#',"#(overrideTmp.window)#" , 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + y + ', left=' + x);
               win.focus();
	   >
   }
   // s override.window
   // s override.urledit=..#URLEditClass
   q ""
}

/// создать новый объект из Work Space
ClassMethod CreateNewObject(override = "") As %String
{
   q:override="" ""
   do ##class(%ZEN.Auxiliary.jsonProvider).%ConvertJSONToObject(override,,.overrideTmp,1)

   &js<alert("#($REPLACE(override,"""","\"""))#");>
   &js< $('#WorkSpaceServerItem').jstree().refresh();  >
   q ""
}

/// Получить документацию объекта
ClassMethod GetCacheDoc(override = "") As %String
{
   q:override="" ""
   do ##class(%ZEN.Auxiliary.jsonProvider).%ConvertJSONToObject(override,,.overrideTmp,1)
   &js<alert("#($REPLACE(override,"""","\"""))#");>
   
   q ""
}

ClassMethod ClassFromFile(override = "") As %String
{
	 s override=$zcvt(override,"O","JS")
	 &js<
      var w =800;var h =600; var y = 10;  var x = 10;
      SelectItem=localStorage.getItem('SelectItem');
	  var winImport=window.open('%25ZWebDev.Tools.ClassFromFile.cls?json=#(override)#','Export to XML' , 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + y + ', left=' + x);
	  winImport.focus(); 
	  >
   q ""
}

ClassMethod Terminal(override = "") As %String
{
	 s override=$zcvt(override,"O","JS")
	 &js<
      var w =800;var h =600; var y = 10;  var x = 10;
	  var winImport=window.open('%25ZWebDev.Tools.Terminal.cls?json=#(override)#','' , 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + y + ', left=' + x);
	  winImport.focus(); 
	  >
	  q ""
}

ClassMethod SQLquery(override = "") As %String
{
	 s override=$zcvt(override,"O","JS")
	 &js<
      var w =800;var h =600; var y = 10;  var x = 10;
	  var winImport=window.open('%25ZWebDev.Tools.SQLquery.cls?json=#(override)#','' , 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + y + ', left=' + x);
	  winImport.focus(); 
	  >
	  q ""
}

ClassMethod GlobalExpolorer(override = "") As %String
{
	 s override=$zcvt(override,"O","JS")
	 &js<
      var w =800;var h =600; var y = 10;  var x = 10;
	  var winImport=window.open('%25ZWebDev.Tools.GlobalExpolorer.cls?json=#(override)#','' , 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + y + ', left=' + x);
	  winImport.focus(); 
	  >
	  q ""
}

}

