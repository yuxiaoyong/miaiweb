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
					<div style="width:450px;margin:auto;margin-top:192px;">
						<div style="text-align: center;"><img src="img/miai-logo.png" style="width:225px;height:97px;"/></div>
						<div style="margin-top:42px;">
							<input type="password" v-model="password" style="width:450px;height:60px;" class="el-input__inner" placeholder="请输入查看密码"/>
						</div>
						<div style="margin-top:20px;">
							<div @click="doValidate" style="width:450px;height:60px;background-color:#EA6591;color:#FFFFFF;line-height:60px;text-align:center;border-radius:10px;font-size:18px;font-family: PingFangSC-Regular;cursor: pointer;">确认</div>
						</div>
						<div style="margin-top:50px;text-align: center;color:#666666;font-size:18x;">
							获取密码方式
						</div>
						<el-row type="flex" class="row-bg" style="margin-top:20px;margin-bottom:200px;">
							<el-col :span="12"><div style="font-size:18px;color:#999999;font-family: PingFangSC-Regular;height:40px;line-height:40px;">会员:联系备案客服索取</div></el-col>
							<el-col :span="12" style="text-align:right;">
								<span style="font-size:18px;color:#999999;font-family: PingFangSC-Regular;">非会员:</span>
								<div @click="showBoyQrCode" style="color:#EA6591;width:150px;height:40px;background-color:#FFFFFF;text-align:center;line-height:40px;border-radius:10px;display:inline-block;cursor: pointer;">请点击</div>
							</el-col>
						</el-row>
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
          activeIndex: '2-1',
		  password: ""
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
          doValidate: function(){
		      var $this = this;
		      if(this.password == ''){
		          $this.$message({
		              message: "请填写密码",
					  type: "warning"
				  });
		          return false;
			  }
              MiYue.validate(this.password, function(result){
					if(result){
						location.href = "miyue.jsp";
					}else{
                        $this.$message.error('密码不正确');
					}
			  });
		  }
	  }
  });

  if(MiYue.isValidated()){
      location.href = "miyue.jsp";
  }

</script>