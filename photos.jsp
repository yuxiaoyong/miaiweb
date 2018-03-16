<%@ page contentType="text/html;charset=UTF-8"%>
	<!DOCTYPE HTML>
	<html>
	<head>
		<jsp:include page="common.jsp" flush="true"/>
		<style>

		</style>
	</head>
	<body style="padding:0px;margin:0px;">
		<div id="app" v-cloak style="background-color:#EEEEEE;">
			<jsp:include page="header.jsp" flush="true"/>

			<div class="page-container">

				<template>
					<el-row type="flex" class="row-bg">
						<el-col :span="8">
							<div id="photo_container1" style="text-align: left;"></div>
						</el-col>
						<el-col :span="8">
							<div id="photo_container2" style="text-align: center;"></div>
						</el-col>
						<el-col :span="8">
							<div id="photo_container3" style="text-align: right;"></div>
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
          activeIndex: '2-2',
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
		  }
	  },
	  mounted: function(){
          var $this = this;
          var $container1 = $("#photo_container1");
          var $container2 = $("#photo_container2");
          var $container3 = $("#photo_container3");

          function getMinHeightContainer(){
              var $container = $container1;
			  if($container.height() > $container2.height()){
                  $container = $container2;
			  }
			  if($container.height() > $container3.height()){
			      $container = $container3;
			  }
			  return $container;
		  }

		  MiYue.getPhotoList(function(photos){
              var index = 0;
              var batch = 1;
              var state = true;
              $(photos).each(function(idx, item){
//                  if(idx >= batch*9){
//                      return;
//				  }
                  index = idx;
                  setTimeout(function(){
                      var $container = getMinHeightContainer();
                      $container.append('<a href="'+item.imageurl+'" data-fancybox="group"><img src="'+item.imageurl+'" class="animated zoomIn" style="width:393px;margin-bottom:10px;border-radius:4px;"/></a>');
                  }, idx*50);
              });
//		      $(document).scroll(function(e){
//					if(document.documentElement.scrollHeight <= document.documentElement.scrollTop+document.documentElement.clientHeight+300){
//					    if(state == false){
//					        return;
//						}
//					    batch += 1;
//                        state = false;
//                        $(photos).each(function(idx, item){
//                            if(idx <= index || idx >= batch*9){
//                                return;
//							}
//							index = idx;
//                            setTimeout(function(){
//                                var $container = getMinHeightContainer();
//                                $container.append('<a href="'+item.imageurl+'" data-fancybox="group"><img src="'+item.imageurl+'" class="animated zoomIn" style="width:393px;margin-bottom:10px;border-radius:4px;"/></a>');
//                            }, idx%9*100);
//                            setTimeout(function(){
//                                state = true;
//							}, 1000)
//                        });
//					}
//			  });

		  });
	  }
  });



</script>