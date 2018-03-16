<%@ page contentType="text/html;charset=UTF-8"%>
	<html>
	<head>
		<jsp:include page="common.jsp" flush="true"/>
		<style>
			.tab-label{
				width:120px;
				height:60px;
				line-height:60px;
				text-align: center;
				color:#666666;
				font-size:18px;
				font-family: PingFangSC-Regular;
				float:left;
			}
			.tab-label a{
				display:block;
				height:60px;
				width:38px;
				text-align: center;
				margin:auto;
				cursor:pointer;
			}
			.tab-label.active a{
				color:#EA6591;
				border-bottom: 3px solid #EA6591;
			}
			.city-label{
				cursor:pointer;
				margin-left:30px;
				font-size:18px;
				font-family: PingFangSC-Regular;
				color:#666666;
			}
		</style>
	</head>
	<body style="padding:0px;margin:0px;">
		<div id="app" v-cloak style="background-color:#EEEEEE;">
			<jsp:include page="header.jsp" flush="true"/>

			<div class="page-container" >

				<template>
					<div style="background-color:#FFFFFF;padding:0px 30px;margin-top:8px;height:600px;">
						<div>
							<div id="inside-tab" class="tab-label active"><a>境内</a></div>
							<div id="outside-tab" class="tab-label"><a>境外</a></div>
							<div style="clear: both;border-bottom:1px solid #DDDDDD;height:2px;"></div>
						</div>
						<div id="inside-tab-content">
							<div>
								<div style="height:80px;">
									<div style="float:left;line-height:80px;color:#333333;font-family: PingFangSC-Regular;font-size:18px;">热门地区：</div>
									<div v-for="item in data.hotInside" style="float:left;line-height:80px;">
										<span class="city-label">{{item}}</span>
									</div>
								</div>
								<div style="clear: both;border-bottom:1px solid #DDDDDD;"></div>
							</div>
							<div>
								<div style="margin-top:30px;">
									<div style="color:#EA6591;height:17px;border-left:3px solid #EA6591;line-height:17px;float:left;padding-left:5px;font-size:18px;">华东地区</div>
									<div style="float:left;line-height:17px;">
										<span class="city-label">山东</span>
										<span class="city-label">江苏</span>
										<span class="city-label">安徽</span>
										<span class="city-label">浙江</span>
										<span class="city-label">福建</span>
										<span class="city-label">上海</span>
									</div>
									<div style="clear: both;"></div>
								</div>
								<div style="margin-top:30px;">
									<div style="color:#EA6591;height:17px;border-left:3px solid #EA6591;line-height:17px;float:left;padding-left:5px;font-size:18px;">华南地区</div>
									<div style="float:left;line-height:17px;">
										<span class="city-label">广东</span>
										<span class="city-label">广西</span>
										<span class="city-label">海南</span>
									</div>
									<div style="clear: both;"></div>
								</div>
								<div style="margin-top:30px;">
									<div style="color:#EA6591;height:17px;border-left:3px solid #EA6591;line-height:17px;float:left;padding-left:5px;font-size:18px;">华中地区</div>
									<div style="float:left;line-height:17px;">
										<span class="city-label">湖北</span>
										<span class="city-label">湖南</span>
										<span class="city-label">河南</span>
										<span class="city-label">江西</span>
									</div>
									<div style="clear: both;"></div>
								</div>
								<div style="margin-top:30px;">
									<div style="color:#EA6591;height:17px;border-left:3px solid #EA6591;line-height:17px;float:left;padding-left:5px;font-size:18px;">华北地区</div>
									<div style="float:left;line-height:17px;">
										<span class="city-label">北京</span>
										<span class="city-label">天津</span>
										<span class="city-label">河北</span>
										<span class="city-label">山西</span>
										<span class="city-label">内蒙古</span>
									</div>
									<div style="clear: both;"></div>
								</div>
								<div style="margin-top:30px;">
									<div style="color:#EA6591;height:17px;border-left:3px solid #EA6591;line-height:17px;float:left;padding-left:5px;font-size:18px;">西北地区</div>
									<div style="float:left;line-height:17px;">
										<span class="city-label">宁夏</span>
										<span class="city-label">新疆</span>
										<span class="city-label">青海</span>
										<span class="city-label">陕西</span>
										<span class="city-label">甘肃</span>
									</div>
									<div style="clear: both;"></div>
								</div>
								<div style="margin-top:30px;">
									<div style="color:#EA6591;height:17px;border-left:3px solid #EA6591;line-height:17px;float:left;padding-left:5px;font-size:18px;">华北地区</div>
									<div style="float:left;line-height:17px;">
										<span class="city-label">四川</span>
										<span class="city-label">云南</span>
										<span class="city-label">贵州</span>
										<span class="city-label">西藏</span>
										<span class="city-label">重庆</span>
									</div>
									<div style="clear: both;"></div>
								</div>
								<div style="margin-top:30px;">
									<div style="color:#EA6591;height:17px;border-left:3px solid #EA6591;line-height:17px;float:left;padding-left:5px;font-size:18px;">东北地区</div>
									<div style="float:left;line-height:17px;">
										<span class="city-label">辽宁</span>
										<span class="city-label">吉林</span>
										<span class="city-label">黑龙江</span>
									</div>
									<div style="clear: both;"></div>
								</div>
							</div>
						</div>

						<div id="outside-tab-content" style="display: none;">
							<div>
								<div style="height:80px;">
									<div style="float:left;line-height:80px;color:#333333;font-family: PingFangSC-Regular;font-size:18px;">热门地区：</div>
									<div v-for="item in data.hotInside" style="float:left;line-height:80px;">
										<span class="city-label">{{item}}</span>
									</div>
								</div>
								<div style="clear: both;border-bottom:1px solid #DDDDDD;"></div>
							</div>
							<div>
								<div style="margin-top:30px;">
									<div style="color:#EA6591;height:17px;border-left:3px solid #EA6591;line-height:17px;float:left;padding-left:5px;font-size:18px;">境外国家</div>
									<div  style="float:left;line-height:17px;width:700px;">
										<span v-for="item in data.outside" style="width:100px;display: inline-block;margin-bottom:30px;" class="city-label">{{item}}</span>
									</div>
									<div style="clear: both;"></div>
								</div>
							</div>
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
	var type = "${param.type}";
    var miaiApp = new Vue({
      el: "#app",
	  data: function() {
      return {
          activeIndex: '0',
		  data: {}
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
	  },
	  mounted: function(){
          var $this = this;
          Cities.getData(function(data){
			  $this.data = data;
		  });
	  }
  });

    $("#inside-tab").click(function(){
		$(".tab-label").removeClass("active");
		$(this).addClass("active");
		$("#inside-tab-content").show();
		$("#outside-tab-content").hide();
	});

    $("#outside-tab").click(function(){
        $(".tab-label").removeClass("active");
        $(this).addClass("active");
        $("#inside-tab-content").hide();
        $("#outside-tab-content").show();
	});

    $(document).on("click", ".city-label", function(){
		var city = $(this).text();
		if(type == "1"){
		    location.href = "carousel.jsp#/carousel/"+encodeURIComponent(city);
		}
		if(type == "2"){
		    location.href = "miyue.jsp#/miyue/history/"+encodeURIComponent(city);
		}
	});
</script>