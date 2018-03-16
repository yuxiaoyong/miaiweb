/**
 * Created by atlantisholic on 2018/1/24.
 */
basepath = "http://www.melovepp.com/jeesite";

HomePage = {

    getBannerList: function(callback){
        $.ajax({
            url: basepath + "/a/miai/miaiBanner/get/bannerList",
            type: "get",
            success: function(res){
                $(res.data).each(function(idx, banner){
                    banner.fullimageurl = basepath + banner.imageUrl+"?width=1800&height=675";
                    if(/^http.*$/ig.test(banner.url) == false){
                        if(banner.url == "#/miyue/feedback"){
                            banner.linkurl = "feedback.jsp";
                        }else {
                            banner.linkurl = "custom.jsp" + banner.url;
                        }
                    }else{
                        banner.linkurl = banner.url;
                    }
                });
                if(typeof callback == "function"){
                    callback.apply(this, [res.data]);
                }
            }
        });
    },

    getTodayList: function(callback){
        $.ajax({
            url: basepath + "/a/miai/miaiUser/get/todayList",
            type: "get",
            success: function(res){
                $(res.girl).each(function(idx, item){
                    item.fullimageurl = basepath + item.photoUrl02+"?width=200&height=200";
                });
                $(res.boy).each(function(idx, item){
                    item.fullimageurl = basepath + item.photoUrl02+"?width=200&height=200";
                });
                if(typeof callback == "function"){
                    callback.apply(this, [res]);
                }
            }
        });
    },

    getUserDetail: function(id, callback){
        $.ajax({
            url: basepath + "/a/miai/miaiUser/get/one",
            type: "get",
            data:{id: id},
            success: function(res){
                res.data.photo1 = basepath + res.data.photoUrl01+"?width=786&height=1040";
                res.data.photo2 = basepath + res.data.photoUrl02+"?width=786&height=1040";
                res.data.photo3 = basepath + res.data.photoUrl03+"?width=786&height=1040";
                res.data.source1 = basepath + res.data.photoUrl01;
                res.data.source2 = basepath + res.data.photoUrl02;
                res.data.source3 = basepath + res.data.photoUrl03;
                if(typeof callback == "function"){
                    callback.apply(this, [res.data]);
                }
            }
        });
    }

}


MiYue = {

    getCurrentList: function(callback){
        $.ajax({
            url: basepath+"/a/miai/miaiAppointment/get/list",
            type: "get",
            data: {type: 1},
            success: function(res){
                $(res.data).each(function(idx, item){
                    item.imageurl = basepath+item.photoUrl02+"?width=300&height=300"
                });
                if(typeof callback == "function"){
                    callback.apply(this, [res.data]);
                }
            }
        });
    },

    getHistoryList: function(place, callback){
        $.ajax({
            url: basepath+"/a/miai/miaiAppointment/get/list",
            type: "get",
            data: {type: 0, place: place},
            success: function(res){
                $(res.data).each(function(idx, item){
                    item.imageurl = basepath+item.photoUrl02+"?width=300&height=300"
                });
                if(typeof callback == "function"){
                    callback.apply(this, [res.data]);
                }
            }
        });
    },

    getDetail: function(id, callback){
        $.ajax({
            url: basepath+"/a/miai/miaiAppointment/get/one",
            type: "get",
            data: {id: id},
            success: function(res){
                res.data.photo1 = basepath + res.data.photoUrl01+"?width=786&height=1040";
                res.data.photo2 = basepath + res.data.photoUrl02+"?width=786&height=1040";
                res.data.photo3 = basepath + res.data.photoUrl03+"?width=786&height=1040";
                res.data.source1 = basepath + res.data.photoUrl01;
                res.data.source2 = basepath + res.data.photoUrl02;
                res.data.source3 = basepath + res.data.photoUrl03;
                if(typeof callback == "function"){
                    callback.apply(this, [res.data]);
                }
            }
        });
    },

    getFeedbackList: function(callback){
        $.ajax({
            url: basepath+"/a/miai/miaiFeedback/get/feedBackList",
            type: "get",
            success: function(res){
                $(res.data).each(function(idx, item){
                    item.imageurl = basepath + item.imageurl+"?width=1800&height=495";
                    if(/^http.*$/ig.test(item.linkurl) == false){
                        item.linkurl = "custom.jsp"+item.linkurl;
                    }
                });
                if(typeof callback == "function"){
                    callback.apply(this, [res.data]);
                }
            }
        });
    },

    getPhotoList: function(callback){
        $.ajax({
            url: basepath+"/a/miai/miaiPhoto/get/list",
            type: "get",
            success: function(res){
                var imageList = [];
                $(res.data).each(function(idx, url){
                    imageList.push({imageurl:basepath + url+"?width=750", sourceurl: basepath+url});
                });
                if(typeof callback == "function"){
                    callback.apply(this, [imageList]);
                }
            }
        });
    },

    validate: function(password, callback){
        $.ajax({
            url: basepath+"/a/miai/miaiPassword/validate",
            type: "post",
            data: {password: password},
            success: function(res){
                if(res.success){
                    $.cookie("X-AUTH-TOKEN", new Date().getTime()+"");
                }
                if(typeof callback == "function"){
                    callback.apply(this, [res.success]);
                }
            }
        });
    },

    isValidated: function(){
        var token = $.cookie("X-AUTH-TOKEN");
        if(token){
            return true;
        }
        return false;
    }
}

FanPai = {

    getAllList: function(place){
        var allList = [];
        $.ajax({
            url: basepath + "/a/miai/miaiUser/getTransferList",
            type: "get",
            data: { place: place },
            async: false,
            success: function (res) {
                allList = res.data;
            }
        });
        $(allList).each(function (idx, record) {
            record.imageurl = basepath + record.photoUrl02 + "?width=600&height=600";
            record.sourceurl = basepath + record.photoUrl02 + "?width=750";
        });
        return allList;
    },

    getSelectedList: function(){
        var uuid = FanPai.getCachedUUID();
        var selectedList = [];
        $.ajax({
            url: basepath + "/a/miai/miaiHarem/get/some?userId=" + uuid,
            type: "get",
            async: false,
            success: function (res) {
                selectedList = res.data;
            }
        });
        $(selectedList).each(function (idx, record) {
            record.imageurl = basepath + record.photoUrl02 + "?width=600&height=600";
            record.sourceurl = basepath + record.photoUrl02;
        });
        return selectedList;
    },

    getRemainList: function(place){
        var allList = FanPai.getAllList(place);
        var selectedList = FanPai.getSelectedList();
        var remainList = [];
        function isSelected(obj){
            for(var i=0;i<selectedList.length;i++){
                if(selectedList[i].id == obj.id){
                    return true;
                }
            }
            return false;
        }

        $(allList).each(function(idx, item){
            if(!isSelected(item)){
                remainList.push(item);
            }
        });
        return remainList;
    },

    getCachedUUID: function(){
        var uuid = $.cookie('fanpai_uuid');
        if(uuid == null){
            uuid = new Date().getTime();
            $.cookie('fanpai_uuid', uuid);
        }
        return uuid;
    },

    removeAllFromHougong: function(callback){
        var uuid = FanPai.getCachedUUID();
        $.ajax({
            url: basepath+"/a/miai/miaiHarem/remove/some",
            data: {userId:uuid},
            type: "get",
            success: function(res){
                if(typeof callback == "function"){
                    callback.apply(this, []);
                }
            }
        });
    },

    removeFromHougong: function(id, callback){
        var uuid = FanPai.getCachedUUID();
        $.ajax({
            url: basepath+"/a/miai/miaiHarem/remove/one",
            data: {userId:uuid, targetId: id},
            type: "get",
            success: function(res){
                if(typeof callback == 'function'){
                    callback.apply(this, [res]);
                }
            }
        });
    },

    addToHougong: function(id, callback){
        var uuid = FanPai.getCachedUUID();
        $.ajax({
            url: basepath+"/a/miai/miaiHarem/save/one",
            data: {userId:uuid, targetId: id},
            type: "get",
            success: function(res){
                if(typeof callback == 'function'){
                    callback.apply(this, [res]);
                }
            }
        });
    },
}

CustomPage = {
    getDetail: function(id, callback){
        $.ajax({
            url: basepath + "/a/miai/miaiPage/get/one",
            type: "get",
            data: {id: id},
            success: function (res) {
                res.data.fullimageurl = basepath + res.data.imageurl+"?width=1200&height=350"
                if(typeof callback == "function"){
                    callback.apply(this, [res.data]);
                }
            }
        });
    }
}

Cities = {
    getData: function(callback){
        var pageData = {inside:[], outside:[], hotInside:[], hotOutside:[]};
        $.ajax({
            url: basepath+"/a/miai/miaiProvince/get/List",
            type: "get",
            async:false,
            success: function(res){

                $(Object.keys(res.inside)).each(function(idx, key){
                    var values = res.inside[key];
                    $(values).each(function(idx, value){
                        pageData.inside.push(value);
                    });
                });

                $(Object.keys(res.outside)).each(function(idx, key){
                    var values = res.outside[key];
                    $(values).each(function(idx, value){
                        pageData.outside.push(value);
                    });
                });
                pageData.hotInside = res.hotInside;
                pageData.hotOutside = res.hotOutside;

                if(typeof callback == "function"){
                    callback.apply(this, [pageData]);
                }

            }
        });
    }
}

QrCode = {

    TYPE_BOY: "1",
    TYPE_GIRL: "2",
    TYPE_MEMBER: "3",
    TYPE_WEIXIN: "4",

    getBoyQrCode: function(callback){
        $.ajax({
            url: basepath + "/a/miai/miaiQrcode/get/list",
            type: "get",
            success: function(res){
                $(res.data).each(function(idx, record){
                    if(record.type == QrCode.TYPE_BOY && typeof callback == "function"){
                        record.imageurl = basepath + record.url;
                        callback.apply(this, [record]);
                    }
                });
            }
        });
    },

    getGirlQrCode: function(callback){
        $.ajax({
            url: basepath + "/a/miai/miaiQrcode/get/list",
            type: "get",
            success: function(res){
                $(res.data).each(function(idx, record){
                    if(record.type == QrCode.TYPE_GIRL && typeof callback == "function"){
                        record.imageurl = basepath + record.url;
                        callback.apply(this, [record]);
                    }
                });
            }
        });
    },

    getMemberQrCode: function(callback){
        $.ajax({
            url: basepath + "/a/miai/miaiQrcode/get/list",
            type: "get",
            success: function(res){
                $(res.data).each(function(idx, record){
                    if(record.type == QrCode.TYPE_MEMBER && typeof callback == "function"){
                        record.imageurl = basepath + record.url;
                        callback.apply(this, [record]);
                    }
                });
            }
        });
    },

    getWeiXinQrCode: function(callback){
        $.ajax({
            url: basepath + "/a/miai/miaiQrcode/get/list",
            type: "get",
            success: function(res){
                $(res.data).each(function(idx, record){
                    if(record.type == QrCode.TYPE_WEIXIN && typeof callback == "function"){
                        record.imageurl = basepath + record.url;
                        callback.apply(this, [record]);
                    }
                });
            }
        });
    }
}