/// 
/// ///<br>Скрипт(JS):  
/// ///<br> &lt;script src='%25ZWebDev.Lib.jquery.plagin.tabs.js.cls'&gt;&lt;/script&gt; 
/// ///<br> <!--  <script src='%25ZWebDev.Lib.jquery.plagin.tabs.js.cls'  language='JavaScript'></script>   -->
Class %ZWebDev.Lib.jquery.plagin.tabs.js Extends %CSP.Page
{

ClassMethod OnPreHTTP() As %Library.Boolean
{
     Do %response.SetHeader("Content-Type","application/javascript")   
     q 1
}

ClassMethod OnPage() As %Status
{
	
	&js<
	
	
   $(function() {
            var total_tabs = 0;
            
            // Инициализируем первую закладку
           //  addtab(total_tabs,'-----' );
            
            
           var  addtab=function (URLContent,TitleTab) {
	            var count=#server(..GetHachID(URLContent))#;
                var closetab = '<a href="" id="close'+count+'" class="close">X</a>';
                $(".tabs ul").append('<li id="t'+count+'" class="ntabs">'+TitleTab+' '+closetab+'</li>');
                $(".tabs div ").append('<p id="c'+count+'">'+#server(..GetContent(URLContent))#+'</p>');
                
                
                $(".tabs ul li").removeClass("ctab");
                $("#t"+count).addClass("ctab");
                
                $("#t"+count).bind("click", function() {
                    $(".tabs ul li").removeClass("ctab");
                    $("#t"+count).addClass("ctab");
                    $(".tabs div p").hide();
                    $("#c"+count).fadeIn('slow');
                });
                
                $("#close"+count).bind("click", function() {
                    // Активируем предыдущую закладку
                    $(".tabs ul li").removeClass("ctab");
                    $(".tabs div p").hide();
                    $(this).parent().prev().addClass("ctab");
                    $("#c"+count).prev().fadeIn('slow');
                    
                    $(this).parent().remove();
                    $("#c"+count).remove();
                    return false;
                });
            }

            $("#addtab, #litab").click(function() {
                total_tabs++;
                $(".tabs div p").hide();
                addtab('sdasdsfsf '+total_tabs,'ccccc');
                return false;
            });
          
        var newRule = '';// "body{ /*your CSS rule here...*/ }";
            newRule += '<style>';
	        newRule += '           .tabs ul {';
            newRule += '                padding: 0;';
            newRule += '                margin: 0;';
            newRule += '                padding: 5px 0;';
            newRule += '                z-index: 10;';
            newRule += '            }';
            newRule += '            .tabs ul li {';
            newRule += '                display: inline;';
            newRule += '                -webkit-border-radius: .3em .3em 0 0;';
            newRule += '                -moz-border-radius: .3em .3em 0 0;';
            newRule += '                border-radius: .3em .3em 0 0;';
            newRule += '                cursor: pointer;';
            newRule += '            }';
            newRule += '            .ntabs {';
            newRule += '                background: #BDC7D5;';
            newRule += '                margin-right: 1px;';
            newRule += '                font-size: 11px;';
            newRule += '                font-weight: bold;';
            newRule += '                color: #333;';
            newRule += '                border: 1px solid #BDC7D5;';
            newRule += '                padding: 5px 3px 5px 8px;';
            newRule += '            }';
            newRule += '            .add {';
            newRule += '                padding: 5px 8px;';
            newRule += '            }';
            newRule += '            #addtab {';
            newRule += '                font-size: 16px;';
            newRule += '                text-decoration: none;';
            newRule += '                position: relative;';
            newRule += '                top: 2px;';
            newRule += '                color: #333;';
            newRule += '            }';
            newRule += '            #addtab:hover {';
            newRule += '                color: #999;';
            newRule += '            }';
            newRule += '            .ctab {';
            newRule += '                background: #E7EDF6;';
            newRule += '                position: relative;';
            newRule += '                top: 2px;';
            newRule += '                border-bottom-width: 0;';
            newRule += '            }';
            newRule += '            .close {';
            newRule += '                text-decoration: none;';
            newRule += '                color: #999;';
            newRule += '                font-weight: bold;';
            newRule += '                font-size: 14px;';
            newRule += '                padding: 0 4px;';
            newRule += '                -webkit-border-radius: .2em;';
            newRule += '                -moz-border-radius: .2em;';
            newRule += '                border-radius: .2em;';
            newRule += '            }';
            newRule += '            .close:hover {';
            newRule += '                background: #999;';
            newRule += '                color: #333;';
            newRule += '            }';
            newRule += '            .tabs div {';
            newRule += '	            z-index: -10;';
            newRule += '                position: relative;';
            newRule += '                top: -1px;';
            newRule += '                border: 1px solid #BDC7D5;';
            newRule += '                background: #E7EDF6;';
            newRule += '                padding: 10px;';
            newRule += '                text-align: center;';
            newRule += '                font-weight: bold;';
            newRule += '                color: #666;';
            newRule += '                font-size: 24px;';
            newRule += '            }';
            newRule += '</style>';
	  
	   $("html").append(newRule);
   });
 
   >
	Quit $$$OK
}

/// w ##class(%ZWebDev.Lib.jquery.plagin.tabs.js).GetHachID("dddd")
ClassMethod GetHachID(pwd As %String = "") As %String [ ProcedureBlock = 1 ]
{
	set hash = ""
	for type=1:1:7 {
		set hash = hash_$zcrc(pwd, type)
	}
	quit hash
}

ClassMethod GetContent(url = "fffffffffff") As %String
{
   zw url
     w "  "_$zdt($h,4)
  q ""
}

}

