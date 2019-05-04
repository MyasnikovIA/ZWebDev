Class %ZWebDev.Lib.demo.demo Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{
	&html<
	    <script type="text/javascript" src="%25ZWebDev.Lib.js.cls"></script>
	    <script src='%25ZWebDev.Lib.jquery.v320.min.js.cls'  language='JavaScript'></script>  
	 
	    <label for="CommandText" class="label label-default" >ObjectScrit:</label>
	    <input id='CommandText' class="form-control form-control-sm"/><br>
	    <pre   id="ConsoleTerminal"  class='pre-scrollable'  slyle='overflow: hidden;border: dotted; '></pre>
        
	    
              <script language='javascript'> 
                 isOkFun=function(txt){
	              $('#ConsoleTerminal').append(txt);
                      $("#CommandText").removeAttr("disabled");
                      $("#TextMac").removeAttr("disabled");
	           } 
                   ProgrressBarFun=function(txt){ 
                      $('#ConsoleTerminal').append(txt);
	           } 
	           ExecTextCmd=function(cmd){
	              $('#ConsoleTerminal').text('');
	              #server(..Terminal(cmd,'#($zu(5))#',isOkFun,ProgrressBarFun))#; 
                  } 
               
               
                  $('#CommandText').keypress(function(event){
                      var keycode = (event.keyCode ? event.keyCode : event.which);
                      if(keycode == '13'){
	                   $("#CommandText").attr('disabled', true);
                           ExecTextCmd($("#CommandText").val());
                      }
                      event.stopPropagation();
                  });
               
              </script>  
	
	>
	Quit $$$OK
}

ClassMethod Terminal(cmd = "", NameSpace = {$zu(5)}) As %String
{
   s OldNameSpace=$zu(5)
    
	d $zu(5,NameSpace)
	s cmdTmp=$replace(cmd,$c(10)," ")
	s cmdTmp=$tr(cmdTmp,$c(13)," ")
	s $ztrap="ErrorCmd"
	x cmdTmp
	d $zu(5,OldNameSpace)
	q $c(10)
ErrorCmd
    q $c(10)_"Error:"_$ZE_$c(10)_"CMD: "_cmd_$c(10)
}

}

