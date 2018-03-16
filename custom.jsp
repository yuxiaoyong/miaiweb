<%@ page contentType="text/html;charset=UTF-8"%>
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
					<div>
						<img :src="detail.fullimageurl" style="width:1200px;height:350px;"/>
						<div style="margin-top: 20px;text-align:center;font-color:#666666;font-family: PingFangSC-Regular;font-size:30px;">
							{{detail.title}}
						</div>
						<div style="width:1042px;margin:auto;margin-top:20px;" v-html="detail.content">

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
  var miaiApp = new Vue({
      el: "#app",
	  data: function() {
      return {
          activeIndex: '0',
		  detail:{}
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
		  showCustomPage: function(id){
		      var $this = this;
              CustomPage.getDetail(id, function(data){
				  $this.detail = data;
			  });
		  }
	  }
  });

    var routes = {
        '/custompage/:id': miaiApp.showCustomPage
    };

    var router = Router(routes);
    router.init();

</script>