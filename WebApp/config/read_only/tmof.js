function loadPage()
{
    var winwidth;
    var navwidth = 0;
    var logowidth = 0;
    var navwidthtxt = "";
    var logowidthtxt = "";
    var contentwidth = 0;
    var contentwidthtxt = "";
    var mainheight = 0;
    var mainheighttxt = "";
    var navitemsheight = 0;
    var logoheight = 0;
    var navitemsheighttxt = "";
    var contentheight = 0;
    var contentheighttxt = "";
    var toolbarheight = 0;
    var toolbarheighttxt = "";
    var contentheight = 0;
    var contentheighttxt = "";
    
    try
    {
        loadNav(navdata);
        winwidth = window.innerWidth;
        navwidth = 300;
        logowidth = navwidth;
        logoheight = logowidth * 200 / 464;
        contentwidth = winwidth - navwidth;
        contentwidth = contentwidth - 3;
        navwidthtxt = String(navwidth);
        logowidthtxt = String(logowidth);
        contentwidthtxt = String(contentwidth);
        document.getElementById("div_nav").style.width = navwidthtxt + "px";
        document.getElementById("div_nav_items").style.width = navwidthtxt + "px";
        document.getElementById("img_logo").style.width = logowidthtxt + "px";
        document.getElementById("div_content").style.width = contentwidthtxt + "px";
        document.getElementById("iframe_content").style.width = contentwidthtxt + "px";
        
        mainheight = window.innerHeight;
        mainheight = mainheight - 102;
        mainheighttxt = String(mainheight);
        toolbarheight = 25;
        toolbarheighttxt = String(toolbarheight);
        navitemsheight = mainheight - logoheight - toolbarheight - 16;
        navitemsheighttxt = String(navitemsheight);
        contentheight = mainheight - toolbarheight - 4;
        contentheighttxt = String(contentheight);
        document.getElementById("div_main").style.height = mainheighttxt + "px";
        document.getElementById("div_nav").style.height = mainheighttxt + "px";
        document.getElementById("div_nav").style.height = mainheighttxt + "px";
        document.getElementById("div_toolbar").style.height = toolbarheighttxt + "px";
        document.getElementById("div_nav_items").style.height = navitemsheighttxt + "px";
        document.getElementById("div_separator").style.height = mainheighttxt + "px";
        document.getElementById("iframe_content").style.height = contentheighttxt + "px";
        document.getElementById("div_menu").style.height = toolbarheighttxt + "px";
    }
    catch(ex)
    {
        alert(ex.message);
    }
}

function loadNav(data) {
    
    try
    {
        var arr = data;
        var out = "";
        var i;
        var count = 0;
        var pos = 0;

        for(i = 0; i < arr.length; i++)
        {
            count = 0;
            pos = arr[i].id.indexOf('_');

            while (pos !== -1) {
              count++;
              pos = arr[i].id.indexOf('_', pos + 1);
            }
            
            if(count == 0)
            {
                out += '<div id="navdiv_' + arr[i].id + '" tmid="' + arr[i].tmid + '" selected="0" class="div_nav_track" location="' + arr[i].url + '" onmouseover="mouseOn(this.id)" onmouseout="mouseOff(this.id)" onClick="selectItem(this.id);">' + arr[i].display + '</div>';
            }
            if(count == 1)
            {
                out += '<div id="navdiv_' + arr[i].id + '" tmid="' + arr[i].tmid + '" selected="0" class="div_nav_folder" location="' + arr[i].url + '" onmouseover="mouseOn(this.id)" onmouseout="mouseOff(this.id)" onClick="selectItem(this.id);">' + arr[i].display + '</div>';
            }
            if(count == 2)
            {
                out += '<div id="navdiv_' + arr[i].id + '" tmid="' + arr[i].tmid + '" selected="0" title="' + arr[i].display + '" class="div_nav_item" location="' + arr[i].url + '" change="' + arr[i].change + '" effdate="' + arr[i].effdate + '" security="' + arr[i].security + '" onmouseover="mouseOn(this.id)" onmouseout="mouseOff(this.id)" onClick="selectItem(this.id);">' + arr[i].display + '</div>';
            }
        }
        document.getElementById("div_nav_items").innerHTML = out;
    }
    catch(ex)
    {
        alert(ex.message);   
    }
}

function updateSecHeader(secabbr,secdata)
{
	var arr = secdata;
	
	try
	{
        for(i = 0; i < arr.length; i++)
        {
        	if(arr[i].abbr.toLowerCase() == secabbr.toLowerCase())
        	{
        		//alert(arr[i].color);
        		document.getElementById("div_security").innerHTML = arr[i].longtitle;
        		document.getElementById("div_security").style.backgroundColor = arr[i].color;
        	}
        }
	}
	catch(ex)
	{
		alert(ex.message);
	}
}

function selectItem(item)
{
    var contentloc;
    var navitems;
    var i = 0;
    var counti = 0;
    var countitem = 0;

    navitems = document.getElementsByTagName("div");
    countitem = countchars(document.getElementById(item).id);
    
    //Clear all selected items colors
    for(i=0;i<navitems.length;i++)
    {
        if(navitems[i].getAttribute("class") == "div_nav_item")
        {            
            navitems[i].style.backgroundColor = "";
        }
    }
    
    //Hide all folder and link items
    
    if(countitem == 1)
    {
        for(i=0;i<navitems.length;i++)
        {
            if(navitems[i].id.indexOf("navdiv") == 0)
            {
            	if(navitems[i].id != item)
            	{
            		navitems[i].setAttribute("selected","0");
            	}            	
                counti = countchars(navitems[i].id);
                if(counti > 1)
                {
                    navitems[i].style.display = "none";
                }
            }
        }        
    }
    
    //Folder interactivity
    
    document.getElementById(item).style.display = "inline";

    if(document.getElementById(item).getAttribute("selected") == "0")
    {
        for(i=0;i<navitems.length;i++)
        {
            if(navitems[i].id.indexOf(document.getElementById(item).id) == 0)
            {
            	if(countitem == 1)
            	{
                	if(countchars(navitems[i].id) == 2)
                	{
                		navitems[i].style.display = "inline";
                	}
                	if(countchars(navitems[i].id) == 3)
                	{
                		navitems[i].style.display = "none";
                	}
            	}
            	if(countitem == 2)
            	{
                	if(countchars(navitems[i].id) == 3)
                	{
                		navitems[i].style.display = "inline";
                	}
            	}
            	//navitems[i].setAttribute("selected","1");
            }
        }
        document.getElementById(item).setAttribute("selected","1");
    }
    else
    {
    	//alert('hey');
        for(i=0;i<navitems.length;i++)
        {
            if(navitems[i].id.indexOf(document.getElementById(item).id) == 0)
            {
                navitems[i].style.display = "none";
                //navitems[i].setAttribute("selected","0");
            }
        }
        document.getElementById(item).setAttribute("selected","0");
    }
    
    document.getElementById(item).style.display = "inline";
    
    if(countitem == 3) //Show linked content
    {
        contentloc = document.getElementById(item).getAttribute("location");
        document.getElementById(item).style.backgroundColor = "#bbddbb";
        document.getElementById(item).setAttribute("selected","1");
        document.getElementById("iframe_content").src = contentloc;

        if(document.getElementById(item).getAttribute("tmid").length > 0)
        	{
        		document.getElementById("tb_title").innerHTML = document.getElementById(item).getAttribute("tmid") + ': ' + document.getElementById(item).getAttribute("title");      	
        		document.getElementById("flink1").innerHTML = document.getElementById(item).getAttribute("tmid");      	
        		document.getElementById("flink1").title = document.getElementById(item).getAttribute("tmid") + ': ' + document.getElementById(item).getAttribute("title");      	
                document.getElementById("flink1").style.display = "inline";
}
        else
        	{
        		document.getElementById("tb_title").innerHTML = document.getElementById(item).getAttribute("title");       	
        		document.getElementById("flink1").innerHTML = document.getElementById(item).getAttribute("title");       	
        		document.getElementById("flink1").title = document.getElementById(item).getAttribute("title");
        		document.getElementById("flink1").style.display = "inline";
        	}
        document.getElementById("tb_change").innerHTML = document.getElementById(item).getAttribute("change");
        document.getElementById("tb_effdate").innerHTML = document.getElementById(item).getAttribute("effdate");

        //alert(document.getElementById(item).getAttribute("security"));
        //Add security header here
        updateSecHeader(document.getElementById(item).getAttribute("security"),secdata);
    }
}

function countchars(str1,char1)
{
    var count = 0;
    var pos = 0;
    
    pos = str1.indexOf('_');
    
    while (pos !== -1) {
      count++;
      pos = str1.indexOf('_', pos + 1);
    }
    return count;
}

function mouseOn(item)
{
    if(document.getElementById(item).getAttribute("class") == "div_nav_item")
    {
        if(document.getElementById(item).getAttribute("selected") != "1")
        {
            document.getElementById(item).style.backgroundColor = "#eeeeee";
        }       
    }    
}

function mouseOff(item)
{
    if(document.getElementById(item).getAttribute("class") == "div_nav_item")
    {
        if(document.getElementById(item).getAttribute("selected") != "1")
        {
            document.getElementById(item).style.backgroundColor = "";
        }   
    }    
}

function hoverSeparator()
{
    document.getElementById("div_separator").style.borderColor = "#888888";
    document.getElementById("div_separator").style.borderStyle = "solid";
}

function leaveSeparator()
{
    document.getElementById("div_separator").style.borderColor = "#dfdfdf";
    document.getElementById("div_separator").style.borderStyle = "solid";
}

function toggleNav()
{
    var winwidth = 0;
    var contentwidth = 0;
    var contentwidthtxt = "";
    var navwidth = 0;
    
    if (document.getElementById("div_nav").style.display == "none")
    {
        document.getElementById("div_nav").style.display = "inline";
        navwidth =  document.getElementById("div_nav").clientWidth;
    }
    else
    {
        document.getElementById("div_nav").style.display = "none";
        navwidth =  0;
    }
        winwidth = window.innerWidth;
        contentwidth = winwidth - navwidth;
        contentwidth = contentwidth - 3;
        contentwidthtxt = String(contentwidth);
        //alert(contentwidthtxt);
        document.getElementById("div_content").style.width = contentwidthtxt + "px";
        document.getElementById("iframe_content").style.width = contentwidthtxt + "px";
}