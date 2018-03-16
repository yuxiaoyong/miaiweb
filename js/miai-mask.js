/**
 * Created by atlantisholic on 2018/1/27.
 */
PageMask = {

    center: function(){
        var height = 0;
        if(document.body){
            height = document.body.clientHeight;
        }else{
            height = document.documentElement.clientHeight;
        }
        $(".layui-layer").css("top", (height-$(".layui-layer").height())/2+"px");
    },

    showBoyQrCode: function(){

        QrCode.getBoyQrCode(function(data){
            var template = $("#boy-qrcode-template").html();
            var rendered = Mustache.render(template, data);
            layer.open({
                type: 1,
                title: false,
                closeBtn: 0,
                shadeClose: true,
                area: '480px 520px',
                content:rendered
            });
            PageMask.center();
        });

    },

    showGirlQrCode: function(){
        QrCode.getGirlQrCode(function(data){
            var template = $("#girl-qrcode-template").html();
            var rendered = Mustache.render(template, data);
            layer.open({
                type: 1,
                title: false,
                closeBtn: 0,
                shadeClose: true,
                area: '480px 520px',
                content:rendered
            });
            PageMask.center();
        });
    },

    showMemberQrCode: function(){
        QrCode.getMemberQrCode(function(data){
            var template = $("#member-qrcode-template").html();
            var rendered = Mustache.render(template, data);
            layer.open({
                type: 1,
                title: false,
                closeBtn: 0,
                shadeClose: true,
                area: '480px 520px',
                content:rendered
            });
            PageMask.center();
        });
    },

    showWeiXinQrCode: function(){
        QrCode.getWeiXinQrCode(function(data){
            var template = $("#weixin-qrcode-template").html();
            var rendered = Mustache.render(template, data);
            layer.open({
                type: 1,
                title: false,
                closeBtn: 0,
                shadeClose: true,
                area: '480px 520px',
                content:rendered
            });
            PageMask.center();
        });
    }
}