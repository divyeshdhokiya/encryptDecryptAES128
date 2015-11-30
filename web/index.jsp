<%@page contentType="application/json; charset=UTF-8"%>
<%@page import ="com.toml.dp.util.AES128Bit" %>
<%@page import="org.json.simple.JSONObject"%>

<%! 
    public void printJSON(JspWriter out,String key,String value){
    try{
        JSONObject json = new JSONObject();
        json.put(key ,value);
        String jString = JSONObject.toJSONString(json);
        out.println(jString);
    }catch(Exception e){
//    out.println("error:"+e);
    }
}
%>
<% 
    String inputValue,key,encrytValue,errorMessage;
    errorMessage = "Sorry, Something went wrong! Please provide the proper details.";
    try{
        key = request.getParameter("key");
            inputValue = request.getParameter("value");
            if (key.equals("") || inputValue.equals("")) {
                printJSON(out, "error", errorMessage);
            } else {
                encrytValue = AES128Bit.encrypt(inputValue, key);
                printJSON(out, "value", encrytValue);
            }
    }catch(Exception e){ 
       printJSON(out,"error", errorMessage);
    }   
%>