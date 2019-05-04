///   <script src="%25ZWebDev.Lib.jquery.plagin.resizable.TableColumns.cls"  language='JavaScript'></script>
Class %ZWebDev.Lib.jquery.plagin.resizable.TableColumns Extends %CSP.Page
{

ClassMethod OnPreHTTP() As %Library.Boolean
{
     Do %response.SetHeader("Content-Type","application/javascript")   
     q 1
}

ClassMethod OnPage() As %Status
{
	 s ParentClassName1=##this
     s MethodName="Draw"
     s ind=""
     for {
	    s ind=$o(^oddDEF(ParentClassName1,"m",MethodName,30,ind) )
        q:ind=""
        w ^oddDEF(ParentClassName1,"m",MethodName,30,ind)_$c(13,10)
     }	
	
	Quit $$$OK
}

ClientMethod Draw() [ Language = javascript ]
{
	/// <reference path="jquery.js" />
/// <reference path="jquery-resizable.js" />
/*
jquery-resizable-table-columns
Version 0.17 - 1/4/2015
© 2015-2016 Rick Strahl, West Wind Technologies 
www.west-wind.com
Licensed under MIT License
*/
(function(factory, undefined) {
	if (typeof define === 'function' && define.amd) {
		// AMD
		define(['jquery'], factory);
	} else if (typeof module === 'object' && typeof module.exports === 'object') {
		// CommonJS
		module.exports = factory(require('jquery'));
	} else {
		// Global jQuery
		factory(jQuery);
	}
}(function($, undefined) {
    $.fn.resizableTableColumns = function(opt) {
        opt = $.extend({
            resizeHeight: false,
            handleSelector: "> .resizer",
        }, opt);

        return this.each(function() {
            $(this)
                .css({ position: "relative" })
                .prepend("<div class='resizer'></div>")
                .resizable(opt);
        });
    };
}));
}

}

