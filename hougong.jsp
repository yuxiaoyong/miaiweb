<%@ page contentType="text/html;charset=UTF-8"%>
    <!DOCTYPE HTML>
	<html>
	<head>
		<jsp:include page="common.jsp" flush="true"/>
		<style>
			.melove-button{
				width:100px;
				height:30px;
				text-align: center;
				border:1px solid #999999;
				border-radius:15px;
				color:#999999;
				float:left;
				line-height:30px;
				margin-right:20px;
				box-sizing: border-box;
				font-size:14px;
				font-family:MicrosoftYaHei;
				cursor:pointer;
			}
			.melove-button:hover{
				border:1px solid #EA6591;
				color:#EA6591;
			}

			.item-container{
				width:25%;
				height:292px;
				float:left;
				border-radius:4px;
				margin-top:10px;
				position: relative;
			}
			.item-container .item-mask{
				position: absolute;
				width:292px;
				height:56px;
				bottom:0px;
				left:0px;
				background-color:rgba(255,255,255,0.9);
				display: block;
				border-radius:4px;
			}
		</style>
	</head>
	<body style="padding:0px;margin:0px;">
		<div id="app" v-cloak style="background-color:#EEEEEE;">
			<jsp:include page="header.jsp" flush="true"/>

			<div class="page-container">

				<template>
					<div style="margin-top:15px;">
						<div @click="sendResult" class="melove-button active">发送结果</div>
						<div @click="clearAll" class="melove-button">清空列表</div>
					</div>
					<div style="clear: both;"></div>
					<div>
						<div class="item-container" v-for="item in selectedList">
							<a :href="item.sourceurl" data-fancybox="group"><img :src="item.imageurl" style="width:292px;height:292px;border-radius:4px;"/></a>
							<div class="item-mask">
								<div style="float:left;line-height:56px;color:#666666;font-size:14px;font-family: PingFangSC-Regular;margin-left:20px;">{{item.code}}</div>
								<div style="float:left;line-height:56px;color:#999999;font-size:14px;font-family: PingFangSC-Regular;margin-left:30px;">{{item.age}}岁 {{item.height}}cm {{item.weight}}kg</div>
							</div>
						</div>
						<div style="clear: both;"></div>
					</div>

					<div id="qrcode_container" style="width:100%;margin:auto;position:absolute;top:0px;background-color:rgba(0,0,0,0.5);height:100%;left:0px;z-index:500;display: none;">
						<div class="body-content" style="width:500px;height:561px;background-color:#FFFFFF;margin:auto;margin-top:100px;position: absolute;border-radius:10px;">
                            <div style="width:177px;height:177px;margin:auto;margin-top:-88px;">
                                <img src="img/icon-face.png" style="width:100%;height:100%;"/>
                            </div>
                            <div style="margin-top:29px;text-align:center;color:#EA6591;font-size:25px;font-family: PingFangSC-Regular;">约会秘籍</div>
                            <div style="margin-top:30px;color:#333333;text-align: center;font-size:18px;font-family: PingFangSC-Regular;">1.请添加微信号melovept</div>
                            <div style="width:190px;height:190px;border:9px solid #EA6591;margin:auto;margin-top:15px;box-sizing: border-box;">
                                <img :src="qrcodeurl" style="width:100%;height:100%;"/>
                            </div>
                            <div style="margin-top:30px;color:#333333;text-align: center;font-size:18px;font-family: PingFangSC-Regular;">2.请复制本页链接后微信发送给秘爱酱</div>
                            <div id="copy_url_button" style="width:200px;height:50px;border:1px solid #EA6591;border-radius:4px;margin:auto;margin-top:15px;line-height:50px;color:#EA6591;font-size:18px;text-align:center;cursor:pointer;">复制链接</div>
                            <div class="close-button" style="width:250px;height:70px;text-align: center;color:#FFFFFF;background-color:#EA6591;font-size:20px;line-height:70px;margin:auto;margin-top:80px;border-radius:4px;cursor:pointer;">我知道了</div>
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
          activeIndex: '3',
		  selectedList:[],
          qrcodeurl:null
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
		  clearAll: function(){
		      var $this = this;
              FanPai.removeAllFromHougong(function(){
				  $this.selectedList = [];
			  });
		  },
		  sendResult: function(){
		      var $this = this;
              QrCode.getWeiXinQrCode(function(data){
                    $this.qrcodeurl = data.imageurl;
              });
              $("#qrcode_container").height($(document).height()+100).show();
              var $bodycontent = $(".body-content");
              $bodycontent
                  .css("left", ($(document).width()-$bodycontent.width())/2+"px")
                  .css("top", $(document).scrollTop()+50+"px")
                  .click(function(e){
                      e.stopPropagation();
                  });
              $("#qrcode_container").click(function(){
                  $(this).hide();
              });
              $(".close-button").click(function(){
                  $("#qrcode_container").hide();
              });

              $("#copy_url_button").zclip({
                  path: "js/ZeroClipboard.swf",
                  copy: function(){
                      var uuid = FanPai.getCachedUUID();
                      $this.$message({
                          message: "复制成功",
                          type: "success"
                      });
                      return "http://www.melovepp.com/share.html#/share/"+uuid;
                  }
              });
		  }
	  },
	  mounted: function(){
          var selectedList = FanPai.getSelectedList();
		  this.selectedList = selectedList;
	  }
  });


</script>