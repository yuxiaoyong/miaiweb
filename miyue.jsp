<%@ page contentType="text/html;charset=UTF-8"%>
	<html>
	<head>
		<jsp:include page="common.jsp" flush="true"/>
		<style>
			.current-button{
				border:1px solid #EA6591;
				width:150px;
				height:50px;
				color:#EA6591;
				line-height:50px;
				text-align: center;
				box-sizing: border-box;
				border-radius:10px 0px 0px 10px;
				float:left;
				border-right:0px;
				cursor: pointer;
			}
			.current-button.active{
				color:#FFFFFF;
				background-color:#EA6591;
			}
			.before-button{
				border:1px solid #EA6591;
				width:150px;
				height:50px;
				color:#EA6591;
				line-height:50px;
				text-align: center;
				box-sizing: border-box;
				border-radius:0px 10px 10px 0px;
				float:left;
				cursor: pointer;
			}
			.before-button.active{
				color:#FFFFFF;
				background-color:#EA6591;
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

			.melove-button-join{
				width:230px;
				height:50px;
				line-height:50px;
				font-size:18px;
				border-radius:4px;
				color:#FFFFFF;
				background-color:#EA6591;
				text-align:center;
				margin:auto;
				margin-top:40px;
				cursor: pointer;
			}
			.melove-button-intro{
				width:230px;
				height:50px;
				line-height:50px;
				font-size:18px;
				border-radius:4px;
				color:#EA6591;
				background-color:#FFFFFF;
				border:1px solid #EA6591;
				text-align:center;
				margin:auto;
				margin-top:25px;
				cursor: pointer;
			}

			.melove-button-intro:before{
				content:"";
				display:inline-block;
				width:16px;
				height:16px;
				background-image:url(img/icon-plus.png);
				background-size: 16px 16px;
				background-repeat: no-repeat;
				margin-right:5px;
			}

		</style>
	</head>
	<body style="padding:0px;margin:0px;">
		<div id="app" v-cloak style="background-color:#EEEEEE;">
			<jsp:include page="header.jsp" flush="true"/>

			<div class="page-container">

				<template>
						<div style="margin-top:15px;">
							<template v-if="type == 1">
								<a href="#/miyue/current"><div class="current-button active">今日秘约</div></a>
								<a :href="'#/miyue/history/'+encodeURIComponent(currentCity)"><div class="before-button">往日秘约</div></a>
							</template>
							<template v-if="type == 0">
								<a href="#/miyue/current"><div class="current-button">今日秘约</div></a>
								<a :href="'#/miyue/history/'+encodeURIComponent(currentCity)"><div class="before-button active">往日秘约</div></a>
								<div @click="chooseCity" style="height:50px;line-height:50px;margin-left:20px;float:left;color:#333333;cursor: pointer;">
									地区选择:<span style="margin-left:20px;color:#666666;">{{currentCity}}</span><img src="img/icon-arrow-down.png" style="width:25px;height:13px;vertical-align: middle;margin-left:5px;"/>
								</div>
							</template>
							<div style="clear: both;"></div>
						</div>
						<div v-for="(detail, index) in dataList" class="animated slideInUp" :style="'width:100%;background-color:#FFFFFF;margin-top:15px;margin-bottom:10px;animation-duration:'+(0.5*(index+1))+'s;'">
							<div style="float:left;height:240px;width:240px;box-sizing: border-box;padding-top:30px;padding-left:30px;">
								<img @click="openMiyueDetail(detail.id)" :src="detail.imageurl" style="width:180px;height:180px;border-radius:4px;cursor: pointer;"/>
							</div>
							<div style="width:690px;float:left;box-sizing: border-box;padding-top:30px;">
								<div class="user-code">编号：{{detail.code}}</div>
								<div style="margin-top:30px;width:100%;">
									<div class="user-label">用户标签</div>
									<div v-for="tag in detail.tags" class="tag-pink">{{tag}}</div>
									<div style="clear:both;"></div>
								</div>
								<div style="margin-top:30px;width:100%;">
									<div class="friend-label">交友标签</div>
									<div v-for="demand in detail.demands" class="tag-blue">{{demand}}</div>
									<div style="clear:both;"></div>
								</div>
							</div>
							<div style="width:270px;float:left;padding-top:30px;">
								<div @click="showBoyQrCode" class="melove-button-join">我要入会</div>
								<div @click="showMemberQrCode" class="melove-button-intro">求推荐</div>
							</div>
							<div style="clear: both;"></div>
						</div>
				</template>

			</div>

			<jsp:include page="footer.jsp" flush="true"/>

		</div>
	</body>
</html>
<jsp:include page="template.jsp" flush="true"/>
<script type="text/javascript" src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script>
<script>
	var userId = "${param.id}";
    var miaiApp = new Vue({
		  el: "#app",
		  data: function() {
		  return {
			  activeIndex: '2-3',
			  type:1,
			  currentCity:"",
			  dataList: []
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
			  getCurrentList: function(){
				  this.type = 1;
				  MiYue.getCurrentList(function(data){
					  miaiApp.dataList = data;
				  });
			  },
			  getHistoryList: function(city){
				  this.type = 0;
                  this.currentCity = decodeURIComponent(city);
				  MiYue.getHistoryList(this.currentCity, function(data){
					  miaiApp.dataList = data;
				  });
			  },
              openMiyueDetail: function(id){
				  location.href = "miyue_detail.jsp?id="+id;
			  },
			  chooseCity: function(){
				  location.href = "cities.jsp?type=2";
			  }
		  }
	});

    var currentCity = remote_ip_info['province'];
    miaiApp.currentCity = currentCity;

    var routes = {
        '/miyue/current': miaiApp.getCurrentList,
        '/miyue/history/:city': miaiApp.getHistoryList
    };

    var router = Router(routes);
    router.init("/miyue/current");

    if(!MiYue.isValidated()){
        location.href = "password.jsp";
    }

</script>