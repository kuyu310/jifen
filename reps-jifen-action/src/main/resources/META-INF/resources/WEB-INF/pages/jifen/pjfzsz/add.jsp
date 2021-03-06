<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/commons/tags.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
     <title>评价指标修改</title>
	 <reps:theme/>
  </head>
  <body>
    <reps:container>
  	<reps:panel id="myform" dock="none" border="true" action="save.mvc" formId="xform" validForm="true" method="post" title="新增评价指标" style="width:900px;">
		<input type="hidden" name="category" id="category" value="${category}">
		<reps:formcontent style="margin-top:30px;">
           <reps:formfield label="指标项 " labelStyle="width:20%;" textStyle="width:20%;">
				<reps:input id="item" name="item" maxLength="15" required="true"></reps:input>
           </reps:formfield>
            <reps:formfield label="指标类型" labelStyle="width:20%;" textStyle="width:20%;" >
           		<reps:select name="mark" jsonData="{1:'奖励',0:'惩罚'}" headerValue="" style="width:180px;" required="true"></reps:select>
		   </reps:formfield>
		   <reps:formfield label="奖励/扣除积分" labelStyle="width:20%;" textStyle="width:20%;" >
           		<reps:select name="pointsScope" jsonData="{'1':'0~1','2':'0~2','3':'0~3','4':'0~4','5':'0~5'}" headerValue="" style="width:180px;" required="true"></reps:select>
		   </reps:formfield>
           <reps:formfield label="是否可用" labelStyle="width:20%;" textStyle="width:20%;" >
           		<reps:select name="isEnable" jsonData="{1:'是',0:'否'}" headerValue="" style="width:180px;" required="true"></reps:select>
		   </reps:formfield>
		   <reps:formfield label="上传标签/勋章" fullRow="true">
				<reps:upload id="picture" callBack="getPathName" value="上传图片"  flagAbsolute="true"  path="${imageUploadPath}/jifen/pjzb" reName="true" cssClass="uploading-a" fileType="png,jpg" ></reps:upload>
				<img name="img" width="50px",height="40px"/> 
				<input type="hidden" name="icon"/>
				<span style="color:red;font-size:18px">*</span>
           </reps:formfield>
            <reps:formfield label="详细说明" fullRow="true">
				<reps:input name="description"  multiLine="true" style="width:500px;height:80px;"></reps:input>
           </reps:formfield>
	   </reps:formcontent>
	    <reps:formbar style="margin-top:50px">
  		   <reps:ajax confirm="你确定要提交吗？" beforeCall="beforeCall" formId="xform"  type="link" cssClass="btn_save_a" callBack="my"  messageCode="edit.button.save"/>
      	 	<reps:button cssClass="btn_cancel_a" messageCode="add.button.cancel" onClick="back()"></reps:button>
      	 </reps:formbar>
  	</reps:panel>
  </reps:container>
  <script type="text/javascript">
  
  	var beforeCall = function(){
  		var picture = $("input[name='icon']").val();
  		if(!picture){
  			messager.info("请上传图标或勋章！");
  			return false;
  		}else{
  			return true;
  		}
  	}
	$(function(){
  		 $("#div").hide();
  		 $("#showImage").hide();
  	});
	var getPathName = function(a, b, c, d) {
		/* alert(a);//文件名
		alert(b);//图片类型
		alert(c);//大小
		alert(d);//路径 */

		d = d.replaceAll("\\\\","/");
		var picture = d.replace("${imageUploadPath}","");
		$("input[name='icon']").attr("value", picture);
		var imgValue = $("input[name='icon']").val();
		
		$("img[name='img']").attr("src", "${imagePath}" + picture);
		
		$("img[name='img']").mouseover(function() {
			$("#divImg").show();
			$("#showImage").show();
			$("#showImage").attr("src", '${imagePath}'+imgValue);
		});
	
		$("img[name='img']").mouseout(function() {
			$("#divImg").hide();
			$("#showImage").hide();
		});

	}
	var my = function(data){
		messager.message(data, function() {
			var category = $("#category").val();
			var url;
			if (category == '1') {
				url = "${ctx}/reps/jifen/pjfzsz/xxlist.mvc";
			} else {
				url = "${ctx}/reps/jifen/pjfzsz/xylist.mvc"
			}
			window.location.href = url;
		});
	}
	var back = function() {
		var category = $("#category").val();
		var url;
		if (category == '1') {
			url = "${ctx}/reps/jifen/pjfzsz/xxlist.mvc";
		} else {
			url = "${ctx}/reps/jifen/pjfzsz/xylist.mvc"
		}
		window.location.href = url;
	}
  </script>
  </body>
</html>