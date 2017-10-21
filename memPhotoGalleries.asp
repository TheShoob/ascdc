<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Untitled Document</title>
<link rel="stylesheet" type="text/css" href="page.css">
</head>
<body>
    <span class="pageTitle">Photo Galleries<div class="arrow-down"></div></span>
    <p>Special thanks to Executive Presentations, Inc. who serves as the official ASCDC Photographer. To view the photo galleries of ASCDC events, please click the link below and select an album. When prompted for a password, use: "ASCDC". Enjoy.</p>
    <div class="boxes b">
        <a href="http://www.epphotosonline.com/ASCDC/" class="btn" target="_blank"><svg class="icon30"><use xlink:href="icons.svg#globe-icon"></use></svg><span>ASCDC Event Photo Galleries</span></a>            
    </div>
    <div class="boxes">            
        <div id="expand" class="expand">
            <div id="open"><svg><use xlink:href="icons.svg#photo-icon"></use></svg><span>ASCDC Annual Seminar 2017</span><svg><use xlink:href="icons.svg#x-dark-icon"></use></svg></div>
            <div id="content" class="content">
                <div class="boxes b">
                i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>i<br>
                </div>
            </div>
        </div>
    </div>
    <div class="boxes">            
            <div id="expand" class="expand">
                <div id="open"><svg><use xlink:href="icons.svg#photo-icon"></use></svg><span>ASCDC Hall of Fame 2017 (special thanks to Trial Tech)</span><svg><use xlink:href="icons.svg#x-dark-icon"></use></svg></div>
                <div id="content" class="content">
                    <div class="boxes b">

                    </div>
                </div>
            </div>
        </div>     
    <p>For further assistance, click here to send e-mail to ASCDC or call (800) 564-6791</p>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="jquery-3.2.1.min.js">\x3C/script>')</script>
    <script>

            $('#expand > #open').click(function() {
                var numberChild = $(this).next().children().length;
                var heightChild = $(this).next().children().height();
                var total = (numberChild * heightChild);
			
				$(this).parent().toggleClass('open');
				if ($(this).parent().hasClass('open')) {
                    $(this).next().css('max-height', total + 'px');
                    $(this).children('svg:last-child').css('-webkit-transform', 'rotate(45deg)','-moz-transform:', 'rotate(45deg)','-ms-transform', 'rotate(45deg)','-o-transform', 'rotate(45deg)','transform', 'rotate(45deg)');
					setTimeout( function(){ 
						var objIframe = parent.document.getElementById('changeSrc');
						objIframe.style.height = 'auto';
						objIframe.style.height = objIframe.contentDocument.body.scrollHeight +'px';					
					}  , 400 );
					return false;
                }
                else if ($(this).parent().not('open')) {
                    $(this).next().css('max-height', 0 + 'px');
                    $(this).children('svg:last-child').css('-webkit-transform','rotate(0deg)','-moz-transform:','rotate(0deg)','-ms-transform','rotate(0deg)','-o-transform','rotate(0deg)','transform','rotate(0deg)');
					setTimeout( function(){ 
						var objIframe = parent.document.getElementById('changeSrc');
						objIframe.style.height = 'auto';
						objIframe.style.height = objIframe.contentDocument.body.scrollHeight +'px';					
					}  , 400 );
					return false;
                }
			});

    </script>
</body>
</html>
