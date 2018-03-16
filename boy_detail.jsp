<%@ page contentType="text/html;charset=UTF-8"%>
	<html>
	<head>
		<jsp:include page="common.jsp" flush="true"/>
		<style>
			.melove-button-know{
				width:230px;
				height:50px;
				line-height:50px;
				font-size:18px;
				border-radius:4px;
				color:#FFFFFF;
				background-color:#6378F2;
				float:right;
				text-align:center;
				margin-top:40px;
				cursor: pointer;
			}
			.melove-button-know:hover{
				background-color:#94A4FF;
			}

			.melove-button-know:before{
				content:"";
				display:inline-block;
				width:24px;
				height:16px;
				background-image:url(img/icon-heart.png);
				background-size: 24px 16px;
				background-repeat: no-repeat;
				margin-right:5px;
			}
			.melove-button-up{
				width:230px;
				height:50px;
				line-height:50px;
				font-size:18px;
				border-radius:4px;
				color:#FFFFFF;
				background-color:#6378F2;
				float:right;
				text-align:center;
				margin-top:25px;
				margin-bottom:150px;
				cursor: pointer;
			}
			.melove-button-up:hover{
				background-color:#94A4FF;
			}

			.melove-button-up:before{
				content:"";
				display:inline-block;
				width:16px;
				height:16px;
				background-image:url(img/icon-up.png);
				background-size: 16px 16px;
				background-repeat: no-repeat;
				margin-right:5px;
			}

			.user-code{
				font-size:16px;
				color:#666666;
				font-family:PingFangSC-Regular;
				margin-top:30px;
			}

			.user-label{
				border-left:2px solid #EA6591;
				padding-left:9px;
				height:15px;
				line-height:14px;
				font-size:16px;
				color:#666666;
				font-family:PingFangSC-Regular;
				margin-right:10px;
				float:left;
			}
			.friend-label{
				border-left:2px solid #6378F2;
				padding-left:9px;
				height:15px;
				line-height:14px;
				font-size:16px;
				color:#666666;
				font-family:PingFangSC-Regular;
				margin-right:10px;
				float:left;
			}
			.tag-pink{
				width:130px;
				height:35px;
				color:#EA6591;
				font-size:16px;
				border: 1px solid #EA6591;
				border-radius: 17.5px;
				line-height:35px;
				text-align:center;
				float:left;
				margin-top:-10px;
				margin-left:10px;
			}
			.tag-pink:before{
				content: "";
				display:inline-block;
				width:14px;
				height:14px;
				background-image:url(img/icon-tag-girl.png);
				background-repeat: no-repeat;
				background-size:14px 14px;
				margin-right:4px;
			}
			.tag-blue{
				width:130px;
				height:35px;
				color:#6378F2;
				font-size:16px;
				border: 1px solid #6378F2;
				border-radius: 17.5px;
				line-height:35px;
				text-align:center;
				float:left;
				margin-top:-10px;
				margin-left:10px;
			}
			.tag-blue:before{
				content: "";
				display:inline-block;
				width:14px;
				height:14px;
				background-image:url(img/icon-tag-boy.png);
				background-repeat: no-repeat;
				background-size:14px 14px;
				margin-right:4px;
			}

		</style>
	</head>
	<body style="padding:0px;margin:0px;">
		<div id="app" v-cloak style="background-color:#EEEEEE;">
			<jsp:include page="header.jsp" flush="true"/>

			<div class="page-container">

				<template>
					<el-row type="flex" class="row-bg" style="margin-top:10px;">
						<el-col :span="8" style="text-align:left;"><a :href="detail.source1" data-fancybox="group"><img :src="detail.photo1" style="width:393px;height:520px;border-radius:4px;"/></a></el-col>
						<el-col :span="8" style="text-align: center;"><a :href="detail.source2" data-fancybox="group"><img :src="detail.photo2" style="width:393px;height:520px;border-radius:4px;"/></a></el-col>
						<el-col :span="8" style="text-align: right;"><a :href="detail.source3" data-fancybox="group"><img :src="detail.photo3" style="width:393px;height:520px;border-radius:4px;"/></a></el-col>
					</el-row>
					<el-row type="flex" class="row-bg" style="margin-top:10px;">
						<el-col :span="16">
							<div class="user-code">编号：{{detail.code}}</div>
							<div style="margin-top:30px;width:100%;">
								<div class="user-label">用户标签</div>
									<div v-for="tag in detail.tags" class="tag-blue">{{tag}}</div>
								<div style="clear:both;"></div>
							</div>
							<div style="margin-top:30px;width:100%;">
								<div class="friend-label">交友标签</div>
								<div v-for="demand in detail.demands" class="tag-pink">{{demand}}</div>
								<div style="clear:both;"></div>
							</div>
						</el-col>
						<el-col :span="8">
							<div @click="showGirlQrCode" class="melove-button-know">认识他</div>
							<div @click="showMemberQrCode" class="melove-button-up">我要上墙</div>
						</el-col>
					</el-row>
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
          activeIndex: '1',
		  activeIndex2: '1',
		  detail: {}
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
		  }
	  }
  });

  HomePage.getUserDetail(userId, function(detail){
      miaiApp.detail = detail;
  });

</script>