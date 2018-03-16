<%@ page contentType="text/html;charset=UTF-8"%>
<header style="position:fixed;width:100%;background-color:#FFFFFF;box-shadow: 0px 0px 5px #DDDDDD;z-index:100;">
    <div class="page-width">
        <div style="float:left;padding-top:15px;margin-right:50px;">
            <img src="img/miai-logo1.png" style="width:41px;height:24px;"/>
        </div>
        <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
            <el-menu-item index="1"><a href="index.jsp">主页</a><i class="underline"></i></el-menu-item>
            <el-submenu index="2">
                <template slot="title">寻约记录<i class="underline"></i></template>
                <el-menu-item index="2-1"><a href="feedback.jsp">精彩反馈</a></el-menu-item>
                <el-menu-item index="2-2"><a href="photos.jsp">ID照</a></el-menu-item>
                <el-menu-item index="2-3"><a href="password.jsp">寻约信息</a></el-menu-item>
            </el-submenu>
            <el-menu-item index="3"><a href="carousel.jsp">翻牌</a><i class="underline"></i></el-menu-item>
            <el-menu-item index="4"><a href="joinus.jsp">加入我们</a><i class="underline"></i></el-menu-item>
        </el-menu>
    </div>
</header>