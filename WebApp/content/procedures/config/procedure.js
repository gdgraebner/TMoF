function loadProcedure()
{
    fillExtrefs();
}

function fillExtrefs()
{
    var spans;
    var navitem;
    var tm_ref;
    var i = 0;
    
    spans = document.getElementsByTagName("span");
    for (i=0;i<spans.length;i++)
    {
        if (spans[i].getAttribute("class") == "extref")
        {
            tm_ref = spans[i].getAttribute("tm_ref");
            spans[i].innerHTML = searchNav(navdata,tm_ref);
            spans[i].title = searchNav(navdata,tm_ref);
        }
    }
}

function searchNav(data,tm_ref)
{
    var arr = data;
    var i = 0;
    var count = 0;
    var navitem = "Not found";
    
    for(i = 0; i < arr.length; i++)
    {
        count = 0;
        pos = arr[i].id.indexOf('_');

        while (pos !== -1) 
        {
          count++;
          pos = arr[i].id.indexOf('_', pos + 1);
        }
        if(count == 2)
        {
            if(arr[i].tmid == tm_ref)
            {               
                navitem = arr[i].tmid + ": " + arr[i].display;
            }
        }
    }
    
    return navitem;
}