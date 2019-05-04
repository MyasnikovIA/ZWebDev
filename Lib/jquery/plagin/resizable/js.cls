/// 
/// ///<br>Скрипт(JS):  
/// ///<br> &lt;script src='%25ZWebDev.Lib.jquery.plagin.resizable.js.cls'&gt;&lt;/script&gt; 
/// ///<br> <!--  <script src='%25ZWebDev.Lib.jquery.plagin.resizable.js.cls'  language='JavaScript'></script>   -->
Class %ZWebDev.Lib.jquery.plagin.resizable.js Extends %CSP.Page
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
	
/// <reference path="../bower_components/jquery/dist/jquery.js" />
/*
jquery-resizable
Version 0.32 - 5/5/2018
© 2015-2018 Rick Strahl, West Wind Technologies
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
    
    if ($.fn.resizable)
        return;

    $.fn.resizable = function fnResizable(options) {
        var defaultOptions = {
            // selector for handle that starts dragging
            handleSelector: null,
            // resize the width
            resizeWidth: true,
            // resize the height
            resizeHeight: true,
            // the side that the width resizing is relative to
            resizeWidthFrom: 'right',
            // the side that the height resizing is relative to
            resizeHeightFrom: 'bottom',
            // hook into start drag operation (event passed)
            onDragStart: null,
            // hook into stop drag operation (event passed)
            onDragEnd: null,
            // hook into each drag operation (event passed)
            onDrag: null,
            // disable touch-action on $handle
            // prevents browser level actions like forward back gestures
            touchActionNone: true,
            // instance id
            instanceId: null
    };
        if (typeof options == "object")
            defaultOptions = $.extend(defaultOptions, options);

        return this.each(function () {
            var opt = $.extend({}, defaultOptions);
            if (!opt.instanceId)
                opt.instanceId = "rsz_" + new Date().getTime();            

            var startPos, startTransition;

            // get the element to resize 
            var $el = $(this);
            var $handle;

            if (options === 'destroy') {            
                opt = $el.data('resizable');
                if (!opt)
                    return;

                $handle = getHandle(opt.handleSelector, $el);
                $handle.off("mousedown." + opt.instanceId + " touchstart." + opt.instanceId);
                if (opt.touchActionNone)
                    $handle.css("touch-action", "");
                $el.removeClass("resizable");
                return;
            }
          
            $el.data('resizable', opt);

            // get the drag handle

            $handle = getHandle(opt.handleSelector, $el);

            if (opt.touchActionNone)
                $handle.css("touch-action", "none");

            $el.addClass("resizable");
            $handle.on("mousedown." + opt.instanceId + " touchstart." + opt.instanceId, startDragging);

            function noop(e) {
                e.stopPropagation();
                e.preventDefault();
            };

            function startDragging(e) {
                // Prevent dragging a ghost image in HTML5 / Firefox and maybe others    
                if ( e.preventDefault ) {
                  e.preventDefault();
                }
                
                startPos = getMousePos(e);
                startPos.width = parseInt($el.width(), 10);
                startPos.height = parseInt($el.height(), 10);

                startTransition = $el.css("transition");
                $el.css("transition", "none");

                if (opt.onDragStart) {
                    if (opt.onDragStart(e, $el, opt) === false)
                        return;
                }
                
                $(document).on('mousemove.' + opt.instanceId, doDrag);
                $(document).on('mouseup.' + opt.instanceId, stopDragging);
                if (window.Touch || navigator.maxTouchPoints) {
                    $(document).on('touchmove.' + opt.instanceId, doDrag);
                    $(document).on('touchend.' + opt.instanceId, stopDragging);
                }
                $(document).on('selectstart.' + opt.instanceId, noop); // disable selection
                $("iframe").css("pointer-events","none");
            }

            function doDrag(e) {
                
                var pos = getMousePos(e), newWidth, newHeight;

                if (opt.resizeWidthFrom === 'left')
                    newWidth = startPos.width - pos.x + startPos.x;
                else
                    newWidth = startPos.width + pos.x - startPos.x;

                if (opt.resizeHeightFrom === 'top')
                    newHeight = startPos.height - pos.y + startPos.y;
                else
                    newHeight = startPos.height + pos.y - startPos.y;

                if (!opt.onDrag || opt.onDrag(e, $el, newWidth, newHeight, opt) !== false) {
                    if (opt.resizeHeight)
                        $el.height(newHeight);                    

                    if (opt.resizeWidth)
                        $el.width(newWidth);                    
                }
            }

            function stopDragging(e) {
                e.stopPropagation();
                e.preventDefault();

                $(document).off('mousemove.' + opt.instanceId);
                $(document).off('mouseup.' + opt.instanceId);

                if (window.Touch || navigator.maxTouchPoints) {
                    $(document).off('touchmove.' + opt.instanceId);
                    $(document).off('touchend.' + opt.instanceId);
                }
                $(document).off('selectstart.' + opt.instanceId, noop);                

                // reset changed values
                $el.css("transition", startTransition);
                $("iframe").css("pointer-events","auto");

                if (opt.onDragEnd)
                    opt.onDragEnd(e, $el, opt);

                return false;
            }

            function getMousePos(e) {
                var pos = { x: 0, y: 0, width: 0, height: 0 };
                if (typeof e.clientX === "number") {
                    pos.x = e.clientX;
                    pos.y = e.clientY;
                } else if (e.originalEvent.touches) {
                    pos.x = e.originalEvent.touches[0].clientX;
                    pos.y = e.originalEvent.touches[0].clientY;
                } else
                    return null;

                return pos;
            }

            function getHandle(selector, $el) {
                if (selector && selector.trim()[0] === ">") {
                    selector = selector.trim().replace(/^>\s*/, "");
                    return $el.find(selector);
                }

                // Search for the selector, but only in the parent element to limit the scope
                // This works for multiple objects on a page (using .class syntax most likely)
                // as long as each has a separate parent container. 
                return selector ? $el.parent().find(selector) : $el;
            } 
        });
    };
}));


  $(document).ready(function () {
 	   var newRule = '';// "body{ /*your CSS rule here...*/ }";
	   newRule += '<style>';
	   newRule += '.page-container { margin: 20px; }';
       newRule += ' .panel-container {';
       newRule += '     display: flex;';
       newRule += '     flex-direction: row;   ';
       newRule += '     border: 1px solid silver;';         
       newRule += '     overflow: hidden;          ';         
       newRule += ' }';
       newRule += ' .panel-left,.panel2-left {';
       newRule += '     min-height: 200px;';
       newRule += '     min-width: 150px;';
       newRule += '  }';
       newRule += ' .splitter, .splitter2,.splitter3 {';
       newRule += '     flex: 0 0 auto;';
       newRule += '     width: 18px;';
       newRule += '     background: url(%25ZWebDev.Lib.jquery.plagin.resizable.images.vsizegrip.cls) center center no-repeat #535353;';
       newRule += '     min-height: 200px;';
       newRule += '     cursor: col-resize;';
       newRule += ' }';
	   newRule += '       /* vertical panel */'; 
	   newRule += '       .panel-container-vertical {'; 
	   newRule += '            display: flex;'; 
	   newRule += '            flex-direction: column;   '; 
	   newRule += '            height: 500px;'; 
	   newRule += '            border: 1px solid silver;         '; 
	   newRule += '            overflow: hidden;'; 
	   newRule += '        }'; 
	   newRule += '        .panel-top {'; 
	   newRule += '            flex: 0 0 auto;  /* only manually resize */'; 
	   newRule += '            padding: 10px;'; 
	   newRule += '            height: 150px;'; 
	   newRule += '            width: 100%;                        '; 
	   newRule += '        }'; 
	   newRule += '        .splitter-horizontal {'; 
	   newRule += '            flex: 0 0 auto;'; 
	   newRule += '            height: 18px;'; 
	   newRule += '            background: url(%25ZWebDev.Lib.jquery.plagin.resizable.images.hsizegrip.cls) center center no-repeat #535353;            '; 
	   newRule += '            cursor: row-resize;'; 
	   newRule += '        .splitter, .splitter2,.splitter3 {'; 
	   newRule += '            flex: 0 0 auto;'; 
	   newRule += '            width: 18px;'; 
	   newRule += '            background: url(%25ZWebDev.Lib.jquery.plagin.resizable.images.vsizegrip.cls) center center no-repeat #535353;'; 
	   newRule += '            min-height: 200px;'; 
	   newRule += '            cursor: col-resize;'; 
	   newRule += '        }'; 
	   newRule += '        }';
	   newRule += '      .win-size-grip {'; 
	   newRule += '            position: absolute;'; 
	   newRule += '            width: 16px;'; 
	   newRule += '            height: 16px;'; 
	   newRule += '            padding: 4px;'; 
	   newRule += '            bottom: 0;'; 
	   newRule += '            right: 0;'; 
	   newRule += '            cursor: nwse-resize;'; 
	   newRule += '            background: url(%25ZWebDev.Lib.jquery.plagin.resizable.images.wingrip.cls) no-repeat;'; 
	   newRule += '        }'; 
	   
       newRule += '</style>';
	   
	   $("html").append(newRule);
   });
}

}

