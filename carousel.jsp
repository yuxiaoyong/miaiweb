<%@ page contentType="text/html;charset=UTF-8"%>
	<html>
	<head>
		<jsp:include page="common.jsp" flush="true"/>
		<style>
			/**=========================翻牌样式BEGIN================================ */
			div.pic-stack{
				list-style:none;
				width:65%;
				display:block;
				position:relative;
				margin:auto;
				padding:0px;
				margin-top:150px;
			}
			div.pic-stack div{
				display:block;
				position:absolute;
				bottom:0px;
				left:0px;
				box-shadow: 0px 0px 10px #888888;
				background-color:#FFFFFF;
				padding:0px;
				margin:0px;
				width:100%;
				height:100%;
				border-radius:5px;
			}

			.pic-stack img{
				width:100%;
				height:100%;
				border-radius:5px;
			}
			.pic-stack span{
				background-color:#FFFFFF;
				opacity:0.8;
				height:60px;
				display:block;
				bottom:0px;
				position:absolute;
				width:100%;
				border-radius:0px 0px 5px 5px;
				text-align:center;
				line-height:60px;
				color:#666;
				font-size:14px;
			}

			.pic-stack .hate-button{
				position:absolute;
				display:block;
				width:40px;
				height:40px;
				bottom:10px;
				background-image:url(img/icon-notlike.png);
				background-size:40px 40px;
				right:60px;
				cursor: pointer;
			}
			.pic-stack .hate-button:hover{
				background-image:url(img/icon-notlike-active.png);
			}

			.pic-stack .like-button{
				position:absolute;
				display:block;
				width:40px;
				height:40px;
				bottom:10px;
				background-image:url(img/icon-like.png);
				background-size:40px 40px;
				right:10px;
				cursor: pointer;
			}
			.pic-stack .like-button:hover{
				background-image:url(img/icon-like-active.png);
			}

			@keyframes bounce1 {
				from {;
					transform: scaleX(1) scaleY(1) translateY(0px);
				}

				to {
					transform: scaleX(1.1) scaleY(1.1) translateY(-35px);
				}
			}

			@keyframes bounce2 {
				from {;
					transform: scaleX(1) scaleY(1) translateY(0px);
				}

				to {
					transform: scaleX(1.2) scaleY(1.2) translateY(-65px);
				}
			}

			.track1{
				animation-name: bounce1;
				animation-duration: 0.3s;
				transform: scaleX(1.1) scaleY(1.1) translateY(-35px);
				z-index:5;
			}

			.track0{
				animation-name: bounce2;
				animation-duration: 0.3s;
				transform: scaleX(1.2) scaleY(1.2) translateY(-65px);
				z-index:6;
			}

			/**=========================翻牌样式END================================ */
		</style>
	</head>
	<body style="padding:0px;margin:0px;">
		<div id="app" v-cloak style="background-color:#EEEEEE;">
			<jsp:include page="header.jsp" flush="true"/>

			<div class="page-container">

				<template>
					<div  @click="chooseCity" style="height:50px;line-height:50px;margin-left:20px;float:left;color:#333333;cursor:pointer;">
						地区选择:<span style="margin-left:20px;color:#666666;">{{currentCity}}</span><img src="img/icon-arrow-down.png" style="width:25px;height:13px;vertical-align: middle;margin-left:5px;"/>
					</div>

					<div style="margin-top:160px;">
						<div id="fanpai-container" style="width:400px;height:400px;" class="pic-stack">

						</div>
						<div style="clear: both;"></div>
					</div>
					<a href="hougong.jsp"><div style="width:230px;height:50px;background-color:#EA6591;color:#FFFFFF;margin:auto;margin-top:40px;line-height:50px;text-align:center;border-radius:4px;">我的后宫 {{selectedCount}}</div></a>
				</template>

			</div>

			<jsp:include page="footer.jsp" flush="true"/>

		</div>
	</body>
</html>
<jsp:include page="template.jsp" flush="true"/>
<script type="text/javascript" src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script>
<script>

    var currentCity = remote_ip_info['province'];

	function setCurrentCity(city){
        currentCity = decodeURIComponent(city);
	}

    var routes = {
        '/carousel/:city': setCurrentCity
    };
    var router = Router(routes);
    router.init();

    var miaiApp = new Vue({
      el: "#app",
	  data: function() {
      return {
          activeIndex: '3',
          currentCity:currentCity,
		  selectedCount:0
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
          chooseCity: function(){
		      location.href = "cities.jsp?type=1";
		  }
	  },
	  mounted: function(){
		  var $this = this;
          var currentIndex = 0;
          var remainList = FanPai.getRemainList(currentCity);
          var selectedCount = FanPai.getSelectedList().length;
          $this.selectedCount = selectedCount;
          function addOneItem(item){
				if(!item){
				    return;
				}
              $("#fanpai-container").append(
                  '<div id="'+item.id+'">' +
                  '<img src="'+item.imageurl+'" data-preview-src="'+item.sourceurl+'" data-preview-group="'+currentIndex*10+'"/>' +
                  '<span>'+item.age+'岁 '+item.height+'cm '+item.weight+'kg</span>' +
                  '<a class="hate-button"></a><a class="like-button"></a>' +
                  '</div>');
              currentIndex++;
		  }

          $(remainList).each(function(idx, item){
              if(idx>=3){
                  return;
			  }
              addOneItem(item);
          });

          $("#fanpai-container div").each(function(idx, obj){
              $(obj).removeClass("track0").removeClass("track1").removeClass("track2").addClass("track"+idx);
          });

          var state = true;
//          //不喜欢
          $(document).on("click", ".hate-button", function(){
                if(!state){
					return false;
			    }
                state = false;
				var id = $(this).parent().attr("id");
				$("#"+id).removeClass("track0").css("zIndex", "99").addClass("animated fadeOutLeft").on("animationend", function(){
                    $(this).remove();
                    state = true;
                });
              addOneItem(remainList[currentIndex]);
              $("#fanpai-container div").each(function(idx, obj){
                  $(obj).removeClass("track0").removeClass("track1").removeClass("track2").addClass("track"+(idx-1));
              });

          });
//          //喜欢
          $(document).on("click", ".like-button", function(){
              if(!state){
                  return false;
              }
              state = false;
              var id = $(this).parent().attr("id");
              $("#"+id).removeClass("track0").css("zIndex", "99").addClass("animated fadeOutRight").on("animationend", function(){
                  $(this).remove();
                  state = true;
			  });
              addOneItem(remainList[currentIndex]);
              $("#fanpai-container div").each(function(idx, obj){
                  $(obj).removeClass("track0").removeClass("track1").removeClass("track2").addClass("track"+(idx-1));
              });

              FanPai.addToHougong(id, function(){
					$this.selectedCount ++;
			  });

          });

	  }
  });



</script>