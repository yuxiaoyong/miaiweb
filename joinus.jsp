<%@ page contentType="text/html;charset=UTF-8"%>
	<html>
	<head>
		<jsp:include page="common.jsp" flush="true"/>
		<style>
			.boy-channel-button{
				box-sizing: border-box;
				width:400px;
				height:80px;
				line-height: 80px;
				padding-left:120px;
				color:#FFFFFF;
				font-family: PingFangSC-Medium;
				font-size:25px;
				background-color:#6378F2;
				border-radius:4px;
				cursor: pointer;
			}
			.boy-channel-button:before{
				content: "";
				display:inline-block;
				width:29px;
				height:24px;
				background-image:url(img/icon-boy-channel.png);
				background-size: 29px 24px;
				background-repeat: no-repeat;
				line-height:80px;
				vertical-align: middle;
				margin-right:10px;
			}
			.girl-channel-button{
				margin-top:40px;
				box-sizing: border-box;
				width:400px;
				height:80px;
				line-height: 80px;
				padding-left:120px;
				color:#FFFFFF;
				font-family: PingFangSC-Medium;
				font-size:25px;
				background-color:#EA6591;
				border-radius:4px;
				cursor: pointer;
			}
			.girl-channel-button:before{
				content: "";
				display:inline-block;
				width:35px;
				height:24px;
				background-image:url(img/icon-girl-channel.png);
				background-size: 35px 24px;
				background-repeat: no-repeat;
				line-height:80px;
				vertical-align: middle;
				margin-right:6px;
			}
			.wechat-button{
				margin-top:40px;
				box-sizing: border-box;
				width:400px;
				height:80px;
				line-height: 80px;
				padding-left:120px;
				color:#FFFFFF;
				font-family: PingFangSC-Medium;
				font-size:25px;
				background-color:#6378F2;
				border-radius:4px;
				cursor: pointer;
			}
			.wechat-button:before{
				content: "";
				display:inline-block;
				width:29px;
				height:24px;
				background-image:url(img/icon-wechat.png);
				background-size: 29px 24px;
				background-repeat: no-repeat;
				line-height:80px;
				vertical-align: middle;
				margin-right:10px;
			}
			.aboutus-button{
				margin-top:40px;
				box-sizing: border-box;
				width:400px;
				height:80px;
				line-height: 80px;
				padding-left:120px;
				color:#FFFFFF;
				font-family: PingFangSC-Medium;
				font-size:25px;
				background-color:#EA6591;
				border-radius:4px;
				cursor: pointer;
			}
			.aboutus-button:before{
				content: "";
				display:inline-block;
				width:29px;
				height:24px;
				background-image:url(img/icon-aboutus.png);
				background-size: 29px 24px;
				background-repeat: no-repeat;
				line-height:80px;
				vertical-align: middle;
				margin-right:10px;
			}
		</style>
	</head>
	<body style="padding:0px;margin:0px;">
		<div id="app" v-cloak style="background-color:#EEEEEE;">
			<jsp:include page="header.jsp" flush="true"/>

			<div class="page-container" style="margin-bottom: 0px;">

				<template>
					<div style="width:100%;height:800px;background-image:url(img/bg-joinus.png);background-size:1200px 1000px;">
						<div style="width:400px;margin:auto;padding-top:214px;">
							<div @click="showBoyQrCode" class="boy-channel-button">男生通道</div>
							<div @click="showGirlQrCode" class="girl-channel-button">女生通道</div>
							<div @click="showWeiXinQrCode" class="wechat-button">微信公众号</div>
							<a href="custom.jsp#/custompage/351930f6aab649b7996da41216ffc0d5"><div @click="" class="aboutus-button">关于我们</div></a>
						</div>
					</div>
				</template>

			</div>

			<jsp:include page="footer.jsp" flush="true"/>

		</div>
	</body>
</html>
<jsp:include page="template.jsp" flush="true"/>
<script>
	var userId = "${param.id}";
  var miaiApp = new Vue({
      el: "#app",
	  data: function() {
      return {
          activeIndex: '4',
		  feedbacks:[]
      };
    },
	  methods:{
          handleSelect: function(){

		  },
		  showBoyQrCode: function(){
              PageMask.showBoyQrCode();
		  },
		  showGirlQrCode: function(){
              PageMask.showGirlQrCode();
		  },
		  showMemberQrCode: function(){
              PageMask.showMemberQrCode();
		  },
		  showWeiXinQrCode: function(){
              PageMask.showWeiXinQrCode();
		  }
	  }
  });

</script>