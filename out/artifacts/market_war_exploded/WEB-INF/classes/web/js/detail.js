// JavaScript Document



        var myVideo=document.getElementsByClassName("video1");
        function myFunction(){
        if(myVideo.paused){

        myVideo.play();

    }else{
        myVideo.pause();
    }

    }


    var vm = new Vue({
        el: '#app',
        data: {
            scrollTop: 0,
            opacity: 0,
            active: 'goods',

        },
        // 绑定滚动事件
        mounted() {
            window.addEventListener('scroll', this.handleScroll);
        },
        methods: {
            // 监听页面滚动
            handleScroll() {
                // 获取当前的滚动距离
                var scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop
                // console.log(scrollTop)

                if (scrollTop < 200) {
                    // 当滚动距离小于200时，计算导航透明度，可以考虑修改为每20增加0.1
                    // this.opacity = (scrollTop / 200).toFixed(1);
                    this.opacity = scrollTop / 200;
                    this.active = 'goods';
                    return
                } else {
                    this.opacity = 1
                }
                // 当滚动距离不小于200时，获取三个部分的顶部位置-45。
                let commentTop = this.$refs.comment.offsetTop - 45;
                let recommendTop = this.$refs.recommend.offsetTop - 45;
                let detailTop = this.$refs.detail.offsetTop - 45;
                // 计算滚动距离在哪个区间，修改this.active对应的样式名
                if (scrollTop < commentTop) { if (this.active != 'goods') this.active = 'goods'; }
                else if (scrollTop >= commentTop && scrollTop < recommendTop) { if (this.active != 'comment') this.active = 'comment'; }
                else if (scrollTop >= recommendTop && scrollTop < detailTop) { if (this.active != 'recommend') this.active = 'recommend'; }
                else if (scrollTop >= detailTop) { if (this.active != 'detail') this.active = 'detail'; }
            },

            // 点击导航栏第一个商品选项卡时，直接滚动到0
            onScrollGoods() {
                // document.documentElement.scrollTop = 0;
                window.scrollTo({top: 0, behavior: "smooth" });
            },
            // 点击导航栏其他选项卡时，直接滚动到对应ref的offsetTop-45(导航栏高度)
            onScrollComment() {
                if (!this.opacity) return;
                window.scrollTo({top: this.$refs.comment.offsetTop - 45, behavior: "smooth" });
            },
            onScrollRecommend() {
                if (!this.opacity) return;
                window.scrollTo({top: this.$refs.recommend.offsetTop - 45, behavior: "smooth" });
            },
            onScrollDetail() {
                if (!this.opacity) return;
                //document.documentElement.scrollTop = this.$refs.detail.offsetTop - 45;
                // behavior  类型String,表示滚动行为,支持参数 smooth(平滑滚动),instant(瞬间滚动),默认值auto,实测效果等同于instant
                window.scrollTo({top: this.$refs.detail.offsetTop - 45, behavior: "smooth" });

            },
        },
    })