<%@ page import="java.io.*" %>  
<%@ page import="java.util.*" %>  

<%!  
    // --- String Join Function converts from Java array to javascript string.  
    public String join(ArrayList<?> arr, String del)  
    {  

        StringBuilder output = new StringBuilder();  

        for (int i = 0; i < arr.size(); i++)  
        {  

            if (i > 0) output.append(del);  

              // --- Quote strings, only, for JS syntax  
              if (arr.get(i) instanceof String) output.append("\"");  
              output.append(arr.get(i));  
              if (arr.get(i) instanceof String) output.append("\"");  
        }  

        return output.toString();  
    }  
%> 

<%@ page contentType="text/html;charset=ISO-8859-1" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"
    prefix="fmt" %>
	
<dspace:layout>

<head>  
    <title>Simple JSP Demo</title>  
    <script type="text/javascript" src="https://cdn.zingchart.com/zingchart.min.js"></script>  
</head>   
    <script>  
        <%  
           // --- Create two Java Arrays  
            ArrayList<String> months = new ArrayList<String>();  
            ArrayList<Integer> users = new ArrayList<Integer>();  

           // --- Loop 10 times and create 10 string dates and 10 users  
            int counter = 1;  
            while(counter < 11)  
            {  
                months.add("Aug " + counter);  
                users.add(counter++);  
            }  
        %>  

       // --- add a comma after each value in the array and convert to javascript string representing an array  
        var monthData = [<%= join(months, ",") %>];  
        var userData = [<%= join(users, ",") %>];  

    </script>  
    
    <script>  
window.onload = function() {  
  zingchart.render({
    id: "myChart",
    width: "100%",
    height: 400,
    data: {
      "type": "bar",
      "title": {
        "text": "Simple JSP Example"
      },
      "scale-x": {
        "labels": monthData
      },
      "plot": {
        "line-width": 1
      },
      "series": [{
        "values": userData
      }]
    }
  });
};
</script>

  <h1>Data From JSP Page Using Docker</h1>  
  <div id="myChart"></div>
    
    

</dspace:layout>