Class %ZWebDev.main Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{
	&html<
	 <html>
        <head>
         <script type="text/javascript" src="%25ZWebDev.Lib.js.cls"></script>
          <script src='%25ZWebDev.Lib.jquery.v331.js.cls'></script>  
          <script src='%25ZWebDev.Lib.w2ui.v140.min.js.cls'></script> 
          <link  href='%25ZWebDev.Lib.w2ui.v140.min.css.cls'  rel='stylesheet' >  
          <script src='%25ZWebDev.Lib.bootstrap.v337.min.js.cls'></script> 
	      <link  href='%25ZWebDev.Lib.bootstrap.v337.min.css.cls'  rel='stylesheet' >   
        </head>
        <body>
           #(##class(%ZWebDev.Tools.NavBar).DrawBody())#
          <div id="layout" style="width: 100%; height: 90%;position:fixed;top:53px;"></div>
          <script type="text/javascript">
            var SelectItem="";
            var SelectItemObject={};
            var ind = 1;
            function addTab(item) {
	           var SelectItemObject = JSON.parse(item) 
               var isExistTab=false;
               $( "#tabs" ).each(function( index ) {
                   // console.log( index + ": " + $( this ).text()+':'+ $( this ).id );
                  console.log( index);
               });
               if ((SelectItemObject.window!=undefined)&&(SelectItemObject.window+'"  src="'+SelectItemObject.urledit!=undefined)){
	              console.log(SelectItemObject.window)
                  w2ui.tabs.add({ id: 'tab'+ind, text: SelectItemObject.window,closable: true,jsonitemtext:SelectItem});
                  $('#selected-tab').html('<iframe id="'+SelectItemObject.window+'"  src="'+SelectItemObject.urledit+'?json='+item+'" width="100%" height="94%" align="left"></iframe> ' );
                  ind++;
               }
            } 
             
             
var config = {
    tabs: {
        name: 'tabs',
        active: 'tab1',
        tabs: [
            { id: 'tab1', caption: 'Tab 1' },
            { id: 'tab2', caption: 'Tab 2' },
            { id: 'tab3', caption: 'Tab 3' },
        ],
        onClick: function (event) {
            $('#tab-example .tab').hide();
            $('#tab-example #' + event.target).show();
        }
    }
}

             
            $(function () {
                var pstyle = 'border: 1px solid #dfdfdf; padding: 5px;';
                $('#layout').w2layout({
                    name: 'layout',
                    padding: 4,
                    panels: [
                      { type: 'left', size: 200, resizable: true, style: pstyle, content: 'left' },
                      //{ type: 'main', style: pstyle + 'border-top: 0px;', content: 'main' }
                      { type: 'main', style: pstyle + 'border-top: 0px;', content: 'main'
                        
                      }
                    ]
                });
                
                w2ui['layout'].content('left','<iframe src="%25ZWebDev.Tools.ClassTree.cls" width="100%" height="99.5%" align="left"></iframe> ');
                w2ui['layout'].content('main','<div id="tabs" style="width: 100%;"></div> <div id="selected-tab" style="padding: 10px 0px"></div> ');
               
                $('#tabs').w2tabs({
                   name: 'tabs',
                   active: 'first',
                   tabs:[
                     //        { id: 'first', text: 'First Tab' ,closable: true}
                   ],
                   onClick: function (event) {
                     // $('#selected-tab').html(event.target);
                     console.log(event.object)

                     SelectItemObject=event.object;
                     if ((SelectItemObject.window!=undefined)&&(SelectItemObject.window+'"  src="'+SelectItemObject.urledit!=undefined)){
	                                 $('#selected-tab').html('<iframe id="'+event.object.text+'"  src="'+SelectItemObject.urledit+'?json='+event.object.jsonitemtext+'" width="100%" height="94%" align="left"></iframe> ' );
                     }
                   }
                });
           
            });
            </script>


        </body>
     </html>
    >
	Quit $$$OK
}

}

