<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
  <%--引入bootstrap--%>
  <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
  <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="<%=basePath %>/static/css/style.css" rel="stylesheet" type="text/css" />
<%--<script type="text/javascript" src="<%=basePath %>/static/js/jquery.js"></script>--%>
<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>
  <!-- 引入bootstrap分页 -->
  <link rel="stylesheet" href="<%=basePath%>/static/js/bootstrap/bootstrap.css" />
  <script src="<%=basePath%>/static/js/bootstrap/jquery.min.js"></script>
  <script src="<%=basePath%>/static/js/bootstrap/bootstrap.min.js"></script>
  <script src="<%=basePath%>/static/js/bootstrap/bootstrap-paginator.js"></script>
  <script>
      $(function() {
          $('#pagination').bootstrapPaginator({
              bootstrapMajorVersion: 3,
              currentPage: ${requestScope.pageInfo.pageNum },
              totalPages: ${requestScope.pageInfo.pages },
              pageUrl: function(type, page, current) {
                  return 'inroominfo/toInRoomInfo.do?pageNum=' + page+"&flag=${flag}&value=${value}";
              },
              itemTexts: function(type, page, current) {
                  switch(type) {
                      case "first":
                          return "首页";
                      case "prev":
                          return "上一页";
                      case "next":
                          return "下一页";
                      case "last":
                          return "末页";
                      case "page":
                          return page;
                  }
              }
          });
      });
  </script>
</head>

<body>
<div class="place"> <span>位置：</span>
  <ul class="placeul">
    <li><a href="main.html">首页</a></li>
    <li><a href="#">入住管理</a></li>
    <li><a href="#">入住信息查询</a></li>
  </ul>
</div>
<div class="rightinfo">
  <div class="tools">
    <ul class="toolbar">
      <li class="click"><span><img src="<%=basePath %>/static/images/t01.png" /></span>添加</li>
      <li class="click"><span><img src="<%=basePath %>/static/images/t02.png" /></span>修改</li>
      <li><span><img src="images/t03.png" /></span>删除</li>
    </ul>
    
    <div class="toolbar1">
      <table>
        <form method="post" action="<%=basePath %>/inroominfo/toInRoomInfo.do" name="serch">
          <tr>
            <td class="zi"><span>选择分类：</span></td>
            <td>
              <select name="flag">
                <option value="0" <c:if test="${flag=='0'}">selected</c:if>>全部</option>
                <option value="1" <c:if test="${flag=='1'}">selected</c:if>>房间号</option>
                <option value="2" <c:if test="${flag=='2'}">selected</c:if>>客人姓名</option>
                <option value="3" <c:if test="${flag=='3'}">selected</c:if>>手机号码</option>
                <option value="4" <c:if test="${flag=='4'}">selected</c:if>>身份证号码</option>
              </select></td>
            <td class="zi"><span>关键字：</span></td>
            <td><input type="text" name="value" value="${value}"/></td>
            <td><input type="submit" value="查询" class="button"/></td>
          </tr>
        </form>
      </table>
    </div>
    
  </div>
  <table class="tablelist">
    <thead>
      <tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>编号</th>
        <th>房间号</th><th>房间类型</th>
        <th>客人姓名</th>
        <th>性别</th>
        <th>身份证号码</th>
        <th>手机号码</th>
        <th>押金</th>
        <th>入住时间</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${pageInfo.list}" var="map" varStatus="num">
        <tr>
          <td><input name="" type="checkbox" value="" /></td>
          <td>${num.count}</td>
          <td>${map.room_num}</td>
          <td>${map.room_type_name}</td>
          <td>${map.customer_name}</td>
          <td>${map.gender}</td>
          <td>${map.idcard}</td>
          <td>${map.phone}</td>
          <td>${map.money}</td>
          <td>${map.create_date}</td>
          <td>
              <c:choose>
                  <c:when test="${map.out_room_status=='0'}"><a href="out.jsp" class="tablelink">退房</a></c:when>
                  <c:otherwise><a href="javascript:void(0)" class="tablelink" style="color: red">已退房</a></c:otherwise>
              </c:choose>
              <%--<a href="javascript:void(0)" class="tablelink" onclick="singleDel(${map.id})"  data-toggle="modal"
                 data-target="#myModal">删除</a>--%>
            <a href="javascript:void(0)" class="tablelink" onclick="singleDel(${map.id})">删除</a>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>

  <!-- 把分页搞出来 -->
  <ul id="pagination"></ul>

  <div class="tip">
    <div class="tiptop"><span>提示信息</span><a></a></div>
    <div class="tipinfo"> <span><img src="images/ticon.png" /></span>
      <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite> </div>
    </div>
    <div class="tipbtn">
      <input name="" type="button"  class="sure" value="确定" />
      &nbsp;
      <input name="" type="button"  class="cancel" value="取消" />
    </div>
  </div>
</div>

<%--删除时触发模态框--%>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close"
                data-dismiss="modal" aria-hidden="true">
          &times;
        </button>
        <h4 class="modal-title" id="myModalLabel">
          提示
        </h4>
      </div>
      <div class="modal-body">
        您确认删除本条记录吗
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default"
                data-dismiss="modal">关闭
        </button>
        <button onclick="ok()" type="button" class="btn btn-primary">
          确定
        </button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal -->
</div>

<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');

	/*单个删除，触发单击事件*/
	function singleDel(id){
	    //手动打开模态框
        $('#myModal').modal('show');
    }

    /*单个删除确定，关闭模态框*/
    function ok(){
        $('#myModal').modal('hide');
        //触发ajax
    }
</script>
</body>
</html>
