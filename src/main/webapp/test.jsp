<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Document</title>
  <script src="./js/jquery-3.1.1.js"></script>
  <script>
	var defPostOpts={
		  /*
		  url: "http://127.0.0.1:8080/demo/json",
		  method: 'post',
		  contentType: 'application/json',
		  dataType:"json",
		  //dataType:'JSONP',
		  data: JSON.stringify({
				"zipcode":97201,
				"myarray":[1,2,3,4,5],
				"obj":{
					"objInner":{
						"name":"张晨","weight":170
						}
				}
				}),
		  */
		  dataType:"json",
		  success: function(result) {
			//alert(result);
			$("#responseContent").html( "<strong>" + JSON.stringify(result) + "</strong>" );
		  },
		  error:function(jqXHR,errTypeStr){
			$("#responseContent").html( "<strong> Status Code:<font color='red'>" +jqXHR.status+"</font><br />"+JSON.stringify(jqXHR) + "</strong>" );
		  }
	}

	function postServer(){
		$("#responseContent").html("");
		var mf = document.myForm;
		var newPostOpts = {};
		newPostOpts.url = mf.myUrl.value;
		newPostOpts.method = mf.method.value;
		newPostOpts.contentType = mf.contentType.value;
		newPostOpts.data = mf.jsonData.value;

		$.ajax($.extend(defPostOpts,newPostOpts));
	}
	
	function dbjson(){
		var sql = document.myForm.sqlTa.value;
		sql = encodeURI(sql);
		data = {"sql":sql}
		alert(sql);
		var url = "http://127.0.0.1/9090/demo/dbjson";
		$.post(url,data,function(data) {
		  $("#responseContent").html( data );
		});
	}

	$(function(){
		postServer();
	})
  </script>
 </head>
 <body>
	<form name="myForm">
	  url :<input type="txt" name="myUrl" value="http://127.0.0.1:9090/mbd/v01/metric/population/region" style="width:80%" />
	  <br />
	  method :
	  <select name="method">
		<option value="post">post</option>
		<option value="get">get</option>
	  </select>
	  <br />
	  contentType :
	  <select name="contentType">
		<option value="application/json">application/json</option>
		<option value="text/plain">text/plain</option>
	  </select>
	  <br />
	  jsonData:
	  <textarea  name="jsonData" value='{     "para": {         "dataView": "default",         "regionType": "1",         "regionCode":"813"             } }' style="width:50%;height:160px;"  ></textarea>
	  <br />
	
	  <input type="button" value="postServer" onclick="postServer();" />
	  <br /><br />
	  <textarea name="sqlTa" style="width:50%;height:160px;"></textarea>
	  <br />
	  <input type="button" value="db2json" onclick="dbjson();" />
	  <hr>
  </form>
  <div id="responseContent"></div>
 </body>
</html>
