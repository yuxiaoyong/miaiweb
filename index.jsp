<%@ page contentType="text/html;charset=UTF-8"%>
	<html>
	<head>
		<jsp:include page="common.jsp" flush="true"/>
		<style>
			.el-carousel__button {
				display: block;
				opacity: 0.48;
				width: 10px;
				height: 10px;
				background-color: #fff;
				border: none;
				outline: none;
				padding: 0;
				margin: 0;
				cursor: pointer;
				-webkit-transition: .3s;
				transition: .3s;
				border-radius:5px;
			}
		</style>
	</head>
	<body style="padding:0px;margin:0px;">
		<div id="app" v-cloak style="background-color:#EEEEEE;">
			<jsp:include page="header.jsp" flush="true"/>

			<div class="page-container">

				<template>
					<div class="block" style="padding-top: 5px;">
						<el-carousel trigger="click" height="450px">
							<el-carousel-item v-for="banner in banners">
								<a :href="banner.linkurl"><img style="width:1200px;height:450px;" :src="banner.fullimageurl"/></a>
							</el-carousel-item>
						</el-carousel>
					</div>

					<div style="line-height:60px;padding-left:20px;">
						<img src="img/icon-medal-girl.png" style="width:14px;height:17px;vertical-align: middle;"/>
						<a style="font-size:16px;font-family:MicrosoftYaHei;color:#333333;">今日女生</a>
					</div>
					<div id="girls_slider" class="page-width" style="position:relative;margin:0 auto;top:0px;left:0px;height:170px;overflow:hidden;visibility:hidden;width:1150px;">
						<!-- Loading Screen -->
						<div data-u="slides" class="page-width" style="cursor:default;position:relative;top:0px;left:0px;height:170px;overflow:hidden;">
							<div v-for="girl in girlList">
								<a :href="'girl_detail.jsp?id='+girl.id">
									<img data-u="image" :src="girl.fullimageurl" style="border-radius:4px;"/>
									<div style="position:absolute;height:50px;width:100%;background: linear-gradient(to bottom, rgba(0,0,0,0.0),rgba(0,0,0,0.9));bottom:0px;text-align:center;line-height:70px;color:#FFFFFF;">{{girl.code}}</div>
								</a>
							</div>
						</div>
					</div>

					<div style="line-height:60px;padding-left:20px;">
						<img src="img/icon-medal-boy.png" style="width:14px;height:17px;vertical-align: middle;"/>
						<a style="font-size:16px;font-family:MicrosoftYaHei;color:#333333;">今日男生</a>
					</div>
					<div id="boys_slider" class="page-width" style="position:relative;margin:0 auto;top:0px;left:0px;height:170px;overflow:hidden;visibility:hidden;width:1150px;margin-bottom:30px;">
						<!-- Loading Screen -->
						<div data-u="slides" class="page-width" style="cursor:default;position:relative;top:0px;left:0px;height:170px;overflow:hidden;">
							<div v-for="boy in boyList">
								<a :href="'boy_detail.jsp?id='+boy.id">
									<img data-u="image" :src="boy.fullimageurl" style="border-radius:4px;"/>
									<div style="position:absolute;height:50px;width:100%;background: linear-gradient(to bottom, rgba(0,0,0,0.0),rgba(0,0,0,0.9));bottom:0px;text-align:center;line-height:70px;color:#FFFFFF;">{{boy.code}}</div>
								</a>
							</div>
						</div>
					</div>

				</template>

				<div id="qrcode_trigger" style="width:62px;position:fixed;bottom:150px;right:80px;z-index:999;">
					<img src="img/icon-boy-link.png" style="width:62px;height:62px;"/>
					<img src="img/icon-girl-link.png" style="width:62px;height:62px;"/>
				</div>

			</div>

			<jsp:include page="footer.jsp" flush="true"/>

		</div>

		<div id="qrcode-mask" style="width:100%;height:100%;background-color:rgba(0,0,0,0.5);position:fixed;top:0px;left:0px;z-index:500;display:none;"></div>
	</body>
</html>
<jsp:include page="template.jsp" flush="true"/>

<script>
  var miaiApp = new Vue({
      el: "#app",
	  data: function() {
      return {
          activeIndex: '1',
		  activeIndex2: '1',
		  banners: [],
		  boyList:[],
		  girlList:[]
      };
    },
	  methods:{
          handleSelect: function(){

		  }
	  }
  });

  HomePage.getBannerList(function(data){
      miaiApp.banners = data;
  });
  HomePage.getTodayList(function(data){
      miaiApp.boyList = data.boy;
      miaiApp.girlList = data.girl;

      var slider_options = {
          $AutoPlay: 0,
          $AutoPlaySteps: 3,
          $SlideDuration: 160,
          $SlideWidth: 170,
          $SlideSpacing: 20,
          $Cols: 6,
          $Align: 390,
          $ArrowNavigatorOptions: {
              $Class: $JssorArrowNavigator$,
              $Steps: 1
          },
          $BulletNavigatorOptions: {
              $Class: $JssorBulletNavigator$
          }
      };
	  setTimeout(function(){
          var girls_slider = new $JssorSlider$("girls_slider", slider_options);
          var boys_slider = new $JssorSlider$("boys_slider", slider_options);
	  }, 100);

  });

  QrCode.getBoyQrCode(function(data){
      var template = $("#boyindex-qrcode-template").html();
      var rendered = Mustache.render(template, data);
      $(document.body).append(rendered);
  });

  QrCode.getGirlQrCode(function(data){
      var template = $("#girlindex-qrcode-template").html();
      var rendered = Mustache.render(template, data);
      $(document.body).append(rendered);
  });

  $("#qrcode_trigger").mouseover(function(){
	  $("#boyindex-qrcode").show();
      $("#girlindex-qrcode").show();
      $("#qrcode-mask").show();
  }).mouseleave(function(){
      $("#boyindex-qrcode").hide();
      $("#girlindex-qrcode").hide();
      $("#qrcode-mask").hide();
  });
</script>