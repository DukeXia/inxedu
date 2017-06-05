function publish(id) {
    if(confirm("你确定要发布吗？")){
        $.ajax({
            type: "GET",
            url: "/admin/questionare/publish/" + id + "?time=" + new Date().getTime(),
            data: null,
            dataType: 'json',
            success: function (data) {
                if(data.success){
                    alert(data.message);
                    window.location.href="/admin/questionare/list";
                }
                if(!data.success){
                    alert(data.message);
                }
            },
            error:function (data) {

            }
        });
    }
}
    function closeSurvey(id) {
        if(confirm("你确定要关闭吗？")){
            $.ajax({
                type: "GET",
                url: "/admin/questionare/close/" + id + "?time=" + new Date().getTime(),
                data: null,
                dataType: 'json',
                success: function (data) {
                    if(data.success){
                        alert(data.message);
                        window.location.href="/admin/questionare/list";
                    }
                    if(!data.success){
                        alert(data.message);
                    }
                },
                error:function (data) {
                }
            });
    }
}