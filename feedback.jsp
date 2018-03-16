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

				<template v-for="feedback in feedbacks">
					<a :href="feedback.linkurl"><img :src="feedback.imageurl" style="width:1200px;height:330px;margin-bottom: 10px;"/></a>
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
          activeIndex: '2-1',
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
		MiYue.getFeedbackList(function(data){
			$this.feedbacks = data;
		});
	  }
  });

</script>