<%@ page contentType="text/html;charset=UTF-8"%>
<script id="boy-qrcode-template" type="x-tmpl-mustache">
    <div style="width:480px;height:520px;background-color:#FFFFFF;border-radius:10px; box-sizing:border-box;padding-top:80px;">
        <div style="text-align:center;"><img src="{{imageurl}}" style="width:250px;height:250px;border:12px solid #6378F2;border-radius:4px;"/></div>
        <div style="width:250px;margin:auto;margin-top:40px;text-align:center;">{{remark}}</div>
    </div>
</script>

<script id="girl-qrcode-template" type="x-tmpl-mustache">
    <div style="width:480px;height:520px;background-color:#FFFFFF;border-radius:10px; box-sizing:border-box;padding-top:80px;">
        <div style="text-align:center;"><img src="{{imageurl}}" style="width:250px;height:250px;border:12px solid #EA6591;border-radius:4px;"/></div>
        <div style="width:250px;margin:auto;margin-top:40px;text-align:center;">{{remark}}</div>
    </div>
</script>

<script id="member-qrcode-template" type="x-tmpl-mustache">
    <div style="width:480px;height:520px;background-color:#FFFFFF;border-radius:10px; box-sizing:border-box;padding-top:80px;">
        <div style="text-align:center;"><img src="{{imageurl}}" style="width:250px;height:250px;border:12px solid #6378F2;border-radius:4px;"/></div>
        <div style="width:250px;margin:auto;margin-top:40px;text-align:center;">{{remark}}</div>
    </div>
</script>

<script id="weixin-qrcode-template" type="x-tmpl-mustache">
    <div style="width:480px;height:520px;background-color:#FFFFFF;border-radius:10px; box-sizing:border-box;padding-top:80px;">
        <div style="text-align:center;"><img src="{{imageurl}}" style="width:250px;height:250px;border:12px solid #6378F2;border-radius:4px;"/></div>
        <div style="width:250px;margin:auto;margin-top:40px;text-align:center;">{{remark}}</div>
    </div>
</script>

<script id="boyindex-qrcode-template" type="x-tmpl-mustache">
    <div id="boyindex-qrcode" style="width:256px;height:291px;background-color:#FFFFFF;position:fixed;bottom:200px;right:440px;z-index:999;display:none;">
        <div style="color:#6378F2;font-size:35px;text-align:center;font-family:PingFangSC-Medium;margin-top:18px;">男生通道</div>
        <div style="width:190px;height:190px;border:8px solid #6378F2;margin:auto;margin-top:18px;box-sizing:border-box;">
            <img src="{{imageurl}}" style="width:100%;height:100%;"/>
        </div>
    </div>
</script>

<script id="girlindex-qrcode-template" type="x-tmpl-mustache">
    <div id="girlindex-qrcode" style="width:256px;height:291px;background-color:#FFFFFF;position:fixed;bottom:200px;right:150px;z-index:999;display:none;">
        <div style="color:#EA6591;font-size:35px;text-align:center;font-family:PingFangSC-Medium;margin-top:18px;">女生通道</div>
        <div style="width:190px;height:190px;border:8px solid #EA6591;margin:auto;margin-top:18px;box-sizing:border-box;">
            <img src="{{imageurl}}" style="width:100%;height:100%;"/>
        </div>
    </div>
</script>

<!--
<script id="boyindex-qrcode-template" type="x-tmpl-mustache">
    <div style="width:256px;height:387px;background-color:#FFFFFF;position:fixed;bottom:100px;left:20px;z-index:999;">
        <div style="width:67px;height:67px;margin:auto;margin-top:-33px;"><img style="width:100%;height:100%;" src="img/icon-boy.png"/></div>
        <div style="text-align: center;margin-top:30px;font-size:24px;font-family: PingFangSC-Regular;color:#666666;">男生通道</div>
        <div style="width:190px;height:190px;border:10px solid #6378F2;box-sizing: border-box;margin:auto;margin-top:20px;">
            <img style="width:100%;height:100%;" src="{{imageurl}}"/>
        </div>
        <div style="width:190px;font-size:24px;font-family: PingFangSC-Regular;color:#666666;margin:auto;margin-top:20px;word-break: break-all;text-align:center;">
            {{remark}}
        </div>
    </div>
</script>

<script id="girlindex-qrcode-template" type="x-tmpl-mustache">
    <div style="width:256px;height:387px;background-color:#FFFFFF;position:fixed;bottom:100px;right:20px;z-index:999;">
        <div style="width:67px;height:67px;margin:auto;margin-top:-33px;"><img style="width:100%;height:100%;" src="img/icon-girl.png"/></div>
        <div style="text-align: center;margin-top:30px;font-size:24px;font-family: PingFangSC-Regular;color:#666666;">女生通道</div>
        <div style="width:190px;height:190px;border:10px solid #EA6591;box-sizing: border-box;margin:auto;margin-top:20px;">
            <img style="width:100%;height:100%;" src="{{imageurl}}"/>
        </div>
        <div style="width:190px;font-size:24px;font-family: PingFangSC-Regular;color:#666666;margin:auto;margin-top:20px;word-break: break-all;text-align:center;">
            {{remark}}
        </div>
    </div>
</script>-->
