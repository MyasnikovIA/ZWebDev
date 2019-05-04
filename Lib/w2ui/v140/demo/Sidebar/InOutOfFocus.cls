Class %ZWebDev.Lib.w2ui.v140.demo.Sidebar.InOutOfFocus Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{
	&html<<html>
    <head>
         <script src='%25ZWebDev.Lib.jquery.v320.min.js.cls'  language='JavaScript'></script>  
        <script src='%25ZWebDev.Lib.w2ui.v140.min.js.cls'></script> 
        <link  href='%25ZWebDev.Lib.w2ui.v140.min.css.cls'  rel='stylesheet' >  
    </head>
<body>

<div id="sidebar" style="height: 300px; width: 200px; float: left"></div>
<div style="margin-left: 220px;">
  <span id="hasFocus"></span>
</div>
<div style="clear: both"></div>

<script type="text/javascript">
$(function () {
    $('#sidebar').w2sidebar({
        name : 'sidebar',
        nodes: [
            { id: 'level-1', text: 'Level 1', img: 'icon-folder', expanded: true, group: true,
              nodes: [ { id: 'level-1-1', text: 'Level 1.1', icon: 'fa-home' },
                       { id: 'level-1-2', text: 'Level 1.2', icon: 'fa-coffee' },
                       { id: 'level-1-3', text: 'Level 1.3', icon: 'fa-comment-alt' }
                     ]
            },
            { id: 'level-2', text: 'Level 2', img: 'icon-folder', group: true,
              nodes: [ { id: 'level-2-1', text: 'Level 2.1', icon: 'fa-star-empty' },
                       { id: 'level-2-2', text: 'Level 2.2', icon: 'fa-star-empty' },
                       { id: 'level-2-3', text: 'Level 2.3', icon: 'fa-star-empty' }
                     ]
            },
            { id: 'level-3', text: 'Level 3', img: 'icon-folder', group: true,
              nodes: [ { id: 'level-3-1', text: 'Level 3.1', icon: 'fa-star-empty' },
                       { id: 'level-3-2', text: 'Level 3.2', icon: 'fa-star-empty' },
                       { id: 'level-3-3', text: 'Level 3.3', icon: 'fa-star-empty' }
                     ]
            }
        ],
        onFocus: function (event) {
          console.log('focus', event);
          $('#hasFocus').html('<span style="background-color: #eee; padding: 5px; border-radius: 3px;">HAS FOCUS</span>');
        },
        onBlur: function (event) {
          console.log('blur', event);
          $('#hasFocus').html('');
        }
    });
});
</script>

</body>
   </html>>
	Quit $$$OK
}

}

