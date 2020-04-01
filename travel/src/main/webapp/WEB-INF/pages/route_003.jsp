<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/head.jsp"%>

<div class="route-003">
    <div class="container">
        <!-- 路线头部 -->
        <div class="route-header">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-lg-12"><span>目的地>云南</span></div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4"><h3>${route.name}</h3></div>
                        <div class="col-lg-3">
                            <p>最佳季节：${route.season}月</p>
                            <h4>价格：<span id="price">${route.price}</span><small>元/人</small></h4>
                        </div>
                        <div class="col-lg-5">
                            <input type="hidden" id="routeId" value="${route.id}">
                        </div>
                    </div>
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation"><a href="#profile">行程概况</a></li>
                        <li role="presentation"><a href="#detail">行程详情</a></li>
                        <li role="presentation"><a href="#forum">讨论区</a></li>
                    </ul>
                </div>
                <div class="panel-body">
                    <!-- 行程概况 -->
                    <div id="profile">
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="col-lg-12">
                                    <h4>路线概览</h4>
                                    <p>D1丽江古城(2小时) → 狮子山(1小时) → 木府(1小时) → 丽江四方街(3小时)</p>
                                    <p>D2冰川公园(3小时) → 云杉坪(1-2小时) → 蓝月谷(1小时)</p>
                                    <p>D3束河古镇(2小时) → 束河四方街(0.5-1小时) → 束河古镇-青龙桥(10分钟) → 九鼎龙潭(30分钟) → 三圣宫(0.5-1小时) → 茶马古道博物馆(0.5-1小时)</p>
                                    <p>D4拉市海湿地公园(1天)</p>
                                </div>
                                <div class="col-lg-6">
                                    <h4>Tips</h4>
                                    <p>1.冰川公园海拔较高且温度较低，所以上山前要做好防寒和防高原反应的准备。</p>
                                    <p>2.雪山大索道排队的人很多，有时会排3-4小时，建议尽早到景区</p>
                                </div>
                                <div class="col-lg-6">
                                    <h4>总结</h4>
                                    <p>丽江虽有些商业化，但依然适合多用几天溜达闲逛。游览丽江古城至少需要1天时间，如果想把丽江的主要景点玩完则需要5-7天。</p>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <img src="..." alt="..." class="img-rounded">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 路线下单 -->
        <div class="route-order">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="alert alert-danger">
                        <a href="#" class="close" data-dismiss="alert">&times;</a>
                        <strong>警告！</strong><span>在下单之前，请先确认您的登录信息（刷新该网页）以及环境安全</span>
                    </div>
                    <div class="form-inline">
                        <div class="row">
                            <div class="col-lg-9">
                                <div class="form-group">
                                    <label>出发</label>
                                    <div class="input-group date"  id="reserve">
                                        <input type="text" class="form-control" name="reserveTime" id="reserveTime" placeholder="reserveTime"  />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>成人</label>
                                    <select class="form-control" id="adult" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="请注意：" data-content="成年人人数不能为0！">
                                        <option>0</option>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                        <option>7</option>
                                        <option>8</option>
                                        <option>9</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>儿童</label>
                                    <select class="form-control" id="child">
                                        <option>0</option>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                        <option>7</option>
                                        <option>8</option>
                                        <option>9</option>
                                    </select>
                                    <ins class="child-tip" data-toggle="tooltip" data-placement="bottom" title="2--12周岁（不含）不占床，含所选机票旅游车位，其余当地产生一切费用（如餐费、门票、小交通、体验费、住宿费等均自理，儿童/婴儿入住遵循酒店规则）">2-12周岁(不含12周岁)（半价）</ins>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label>总价：<span id="totalPrice">00</span>元</label>
                                </div>
                                <div class="form-group">
                                    <button class="btn btn-default" id="order">立即预定</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 路线详情 -->
        <div class="route-body">
            <div id="detail">
                <body data-spy="scroll" data-target="#myScrollspy" data-offset="20">
                <div class="row day-list">
                    <div id="myScrollspy">
                        <ul class="nav nav-pills nav-stacked" role="tablist" style="position: fixed;top: 40%;left: 80%;">
                            <li><a href="#D1">D1</a></li>
                            <li><a href="#D2">D2</a></li>
                            <li><a href="#D3">D3</a></li>
                            <li><a href="#D4">D4</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-12">
                        <div id="D1">
                            <h3><span class="day-num">D1</span><span>丽江</span></h3>
                            <hr>
                            <p class="day-pio">今日主要游览丽江古城，漫步在古城小巷，尽情享受古城慵懒的氛围，还可以在街头巷尾寻觅各式丽江特色小吃来填补肚子。之后前往狮子山，登上狮子山的制高点—万古楼，俯瞰整个丽江古城，运气足够好的话向北可以远眺到玉龙雪山。下了狮子山顺路去木府，欣赏古城内这座仿紫禁城的纳西宫廷式建筑。傍晚回到古城，在四方街感受古城的夜生活，还可以去酒吧消遣一番， 说不定会碰上美好的艳遇。</p>
                            <ul class="list-unstyled">
                                <li>
                                    <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">丽江古城</a></span><span>（2小时）</span></span>
                                    <span class="day-transport">步行20分钟<i class="i-arrow"></i></span>
                                    <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">狮子山</a></span><span>（1小时）</span></span>
                                    <span class="day-transport">步行10分钟<i class="i-arrow"></i></span>
                                    <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">木府</a></span><span>（1小时）</span></span>
                                    <span class="day-transport">步行15分钟<i class="i-arrow"></i></span>
                                    <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">丽江四方街</a></span><span>（3小时）</span></span>
                                </li>
                            </ul>
                            <div class="row">
                                <div class="col-xs-6 col-md-3">
                                    <a href="#" class="thumbnail">
                                        <img src="../../images/route/route_003/D1_丽江古城.jpg" alt="...">
                                    </a>
                                </div>
                                <div class="col-xs-6 col-md-3">
                                    <a href="#" class="thumbnail">
                                        <img src="../../images/route/route_003/D1_狮子山.jpg" alt="...">
                                    </a>
                                </div>
                                <div class="col-xs-6 col-md-3">
                                    <a href="#" class="thumbnail">
                                        <img src="../../images/route/route_003/D1_木府.jpg" alt="...">
                                    </a>
                                </div>
                                <div class="col-xs-6 col-md-3">
                                    <a href="#" class="thumbnail">
                                        <img src="../../images/route/route_003/D1_丽江四方街.jpg" alt="...">
                                    </a>
                                </div>
                            </div>
                            <h4><img src="../../images/交通.jpg" /><span style="margin-left: 20px;">交通攻略</span></h4>
                            <hr>
                            <p class="day-pio">丽江古城内步行即可到达各个景点。</p>
                            <h4><img src="../../images/餐饮.jpg" /><span style="margin-left: 20px;">餐饮攻略</span></h4>
                            <hr>
                            <p class="day-pio">丽江最著名的美食是小吃和火锅，鸡豆凉粉、纳西烤鱼、粑粑和东巴烤肉是最受欢迎的小吃，火锅则以腊排骨火锅、洋芋鸡火锅、黑山羊火锅、菌类火锅和牦牛肉火锅为代表。今天一日三餐均可在古城内解决，小吃与火锅任意搭配组合，还可以去品尝一下丽江特色的三文鱼。</p>
                            <h4><img src="../../images/住宿.jpg" /><span style="margin-left: 20px;">住宿攻略</span></h4>
                            <hr>
                            <p class="day-pio">以四方街为中心，往东便是五一街道。这是一条充满小资情调的街巷，各种特色小店、咖啡吧、文艺气息浓郁，建议选择该区域入住。</p>
                            <p class="day-pio">芝麻开花连锁芝麻开门客栈位于古城五一街，近四方街，地理位置优越，出行非常方便。客栈是非常典型的木式建筑，门前小桥流水潺潺，让你充分体会古城流水人家的韵味。</p>
                            <p class="day-pio">云端精品度假庭院（丽江纳西风情店）同样位于五一街，客栈是根据纳西传统四合院进行装修和布置，保留了纳西小院的特有风格，房间全部采用纳西雕花实木式家具，庭院更有假山流水摇椅凉亭。</p>
                        </div>
                        <div id="D2">
                            <h3><span class="day-num">D2</span><span>玉龙雪山</span></h3>
                            <hr>
                            <p class="day-pio">今日主要去探访玉龙雪山，先乘坐大索道到冰川公园，感受全球中低纬度山岳冰川的精华。下山后建议先吃午饭，玉龙雪山餐饮较少，午饭可自带干粮，也可在景区内解决。午饭后可以在蓝月谷剧场看13:30场的《印象丽江》。之后前往云杉坪，探索隐藏在原始云杉林中的巨大草坪，记住乘坐索道到达雪山半山腰时是拍摄雪山全景的最佳位置。最后回到山脚蓝月谷，看山谷中这一湾近乎凝固的湛蓝。</p>
                            <ul class="list-unstyled">
                                <li>
                                    <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">冰川公园</a></span><span>（3小时）</span></span>
                                    <span class="day-transport">索道+观光车30分钟<i class="i-arrow"></i></span>
                                    <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">云杉坪</a></span><span>（1-2小时）</span></span>
                                    <span class="day-transport">索道+观光车20分钟<i class="i-arrow"></i></span>
                                    <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">蓝月谷</a></span><span>（1）</span></span>
                                </li>
                            </ul>
                            <div class="row">
                                <div class="col-xs-6 col-md-3">
                                    <a href="#" class="thumbnail">
                                        <img src="../../images/route/route_003/D2_冰川公园.jpg" alt="...">
                                    </a>
                                </div>
                                <div class="col-xs-6 col-md-3">
                                    <a href="#" class="thumbnail">
                                        <img src="../../images/route/route_003/D2_云山坪.jpg" alt="...">
                                    </a>
                                </div>
                                <div class="col-xs-6 col-md-3">
                                    <a href="#" class="thumbnail">
                                        <img src="../../images/route/route_003/D2_蓝月谷.jpg" alt="...">
                                    </a>
                                </div>
                            </div>
                            <h4><img src="../../images/交通.jpg" /><span style="margin-left: 20px;">交通攻略</span></h4>
                            <hr>
                            <p class="day-pio">玉龙雪山距离丽江市区约15公里，可乘巴士或包车前往。在古城周围的玉河停车场、南门停车场、丽君酒店和束河大门每天早上9:00有发往甘海子的雪山直通车，下午17:00返回，票价40元/人。可以在玉河走廊C区2-3号、客运中心站及高快客运站购票。从丽江包车去玉龙雪山，根据车型座数不同价格在300-500元不等。还可以购买玉龙雪山一日游，大多一日游包含门票和往返交通费用。</p>
                            <p class="day-pio">景区内可乘坐环保车到达各个景点的缆车乘坐处，再分别乘缆车到达。注意，冰川公园大索道只到达海拔4506米处，剩下的路程需要一步步走上去，须量力而行。</p>
                            <h4><img src="../../images/餐饮.jpg" /><span style="margin-left: 20px;">餐饮攻略</span></h4>
                            <hr>
                            <p class="day-pio">玉龙雪山餐饮较少，午饭可自带干粮，也可在景区内解决。晚饭建议返回丽江古城解决。</p>
                            <h4><img src="../../images/住宿.jpg" /><span style="margin-left: 20px;">住宿攻略</span></h4>
                            <hr>
                            <p class="day-pio">建议返回丽江古城住宿，五一街是一条充满小资情调的街巷，各种特色小店、咖啡吧、文艺气息浓郁，建议选择该区域入住。</p>
                            <p class="day-pio">芝麻开花连锁芝麻开门客栈位于古城五一街，近四方街，地理位置优越，出行非常方便。客栈是非常典型的木式建筑，门前小桥流水潺潺，让你充分体会古城流水人家的韵味。</p>
                            <p class="day-pio">云端精品度假庭院（丽江纳西风情店）同样位于五一街，客栈是根据纳西传统四合院进行装修和布置，保留了纳西小院的特有风格，房间全部采用纳西雕花实木式家具，庭院更有假山流水摇椅凉亭。</p>
                        </div>
                        <div id="D3">
                            <h3><span class="day-num">D3</span>束河古镇</h3>
                            <hr>
                            <p class="day-pio">今日主要前往丽江古城西北部的束河古镇游玩，体验不同的古镇风情。从挂着“束河古镇”四个字的大牌坊走进去，沿着石板路面可以一直走到古镇中心—四方街；之后沿着四方街边的溪流逆流而上，走过青龙桥便可以看到九鼎龙潭；潭边建有龙泉寺，寺后有个小山坡，这里是俯瞰古镇全景的好地方。此外，位于古镇内中和路上的茶马古道博物馆也是值得一去的地方。这里没有那么多的游客，还可以逛一逛特色小店，累了找一家茶馆尽情泡茶发呆。</p>
                            <ul class="list-unstyled">
                                <li>
                                    <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">束河古镇</a></span><span>（2小时）</span></span>
                                    <span class="day-transport">步行5分钟<i class="i-arrow"></i></span>
                                    <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">束河四方街</a></span><span>（0.5-1小时）</span></span>
                                    <span class="day-transport">步行6分钟<i class="i-arrow"></i></span>
                                    <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">束河古镇-青龙桥</a></span><span>（10分钟）</span></span>
                                    <span class="day-transport">步行2分钟<i class="i-arrow"></i></span>
                                    <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">九鼎龙潭</a></span><span>（30分钟）</span></span>
                                    <span class="day-transport">步行3分钟<i class="i-arrow"></i></span>
                                    <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">三圣宫</a></span><span>（0.5-1小时）</span></span>
                                    <span class="day-transport">步行10分钟<i class="i-arrow"></i></span>
                                    <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">茶马古道博物馆</a></span><span>（0.5-1小时）</span></span>
                                </li>
                            </ul>
                            <div class="row">
                                <div class="col-xs-6 col-md-3">
                                    <a href="#" class="thumbnail">
                                        <img src="../../images/route/route_003/D3_束河古镇.jpg" alt="...">
                                    </a>
                                </div>
                                <div class="col-xs-6 col-md-3">
                                    <a href="#" class="thumbnail">
                                        <img src="../../images/route/route_003/D3_束河四方街.jpg" alt="...">
                                    </a>
                                </div>
                                <div class="col-xs-6 col-md-3">
                                    <a href="#" class="thumbnail">
                                        <img src="../../images/route/route_003/D3_束河古镇-青龙桥.jpg" alt="...">
                                    </a>
                                </div>
                                <div class="col-xs-6 col-md-3">
                                    <a href="#" class="thumbnail">
                                        <img src="../../images/route/route_003/D3_九鼎龙潭.jpg" alt="...">
                                    </a>
                                </div>
                            </div>
                            <h4><img src="../../images/交通.jpg" /><span style="margin-left: 20px;">交通攻略</span></h4>
                            <hr>
                            <p class="day-pio">束河古镇位于丽江古城西北约5公里处。可在古城乘坐11路公交车到束河路口下车，再步行至古镇大门；也可在古城包车前往，5元/人，打车约20元；如果体力充足，也可租一辆自行车前往。</p>
                            <h4><img src="../../images/餐饮.jpg" /><span style="margin-left: 20px;">餐饮攻略</span></h4>
                            <hr>
                            <p class="day-pio">束河古镇不乏美食，束河凉粉和虹鳟鱼是非常出名的，在束河很多餐厅都能吃到。四方街一带聚集了很多餐厅，是觅食的好地方。午饭可以任意找一家餐厅享用，也可以去找一找那些有名气的餐厅，晚饭在束河或者会丽江解决均可。</p>
                            <h4><img src="../../images/住宿.jpg" /><span style="margin-left: 20px;">住宿攻略</span></h4>
                            <hr>
                            <p class="day-pio">建议返回丽江古城住宿，五一街是一条充满小资情调的街巷，各种特色小店、咖啡吧、文艺气息浓郁，建议选择该区域入住。</p>
                            <p class="day-pio">芝麻开花连锁芝麻开门客栈位于古城五一街，近四方街，地理位置优越，出行非常方便。客栈是非常典型的木式建筑，门前小桥流水潺潺，让你充分体会古城流水人家的韵味。</p>
                            <p class="day-pio">云端精品度假庭院（丽江纳西风情店）同样位于五一街，客栈是根据纳西传统四合院进行装修和布置，保留了纳西小院的特有风格，房间全部采用纳西雕花实木式家具，庭院更有假山流水摇椅凉亭。</p>
                        </div>
                        <div id="D4">
                            <h3><span class="day-num">D4</span>拉海市</h3>
                            <hr>
                            <p class="day-pio">今日主要前往丽江城西10公里处的拉市海游玩，观鸟、划船、骑马体验茶马古道是游玩这里的主要方式。骑马有不同的路线供选择，可以选择前往高山峡谷中的茶马古道，或是走到湖对面湿地深处的环湖路线；骑马后，可以邀上船家开启一场划船观鸟之旅。拉市海可选择美食较少，可以自带干粮。</p>
                            <ul class="list-unstyled">
                                <li>
                                    <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">拉海市湿地公园</a></span><span>（1天）</span></span>
                                </li>
                            </ul>
                            <div class="row">
                                <div class="col-xs-6 col-md-3">
                                    <a href="#" class="thumbnail">
                                        <img src="../../images/route/route_003/D4_拉海市湿地公园.jpg" alt="...">
                                    </a>
                                </div>
                            </div>
                            <h4><img src="../../images/交通.jpg" /><span style="margin-left: 20px;">交通攻略</span></h4>
                            <hr>
                            <p class="day-pio">拉市海位于丽江城西10公里处，可以在古城忠义市场旁乘坐面包车前往，票价3-5元；也可以选择从古城包车前往，包车费用50-70元。大多数一日游包含骑马、划船、往返接送和午餐，很方便。</p>
                            <h4><img src="../../images/餐饮.jpg" /><span style="margin-left: 20px;">餐饮攻略</span></h4>
                            <hr>
                            <p class="day-pio">拉市海可选择美食较少，可以自带干粮，大多数一日游都会包含土鸡火锅作为午饭。湖边有买烤鱼的小摊子，都是新鲜捞上来的小鱼，15-20元一条，可以尝一尝。晚饭可以回丽江古城解决。</p>
                            <h4><img src="../../images/住宿.jpg" /><span style="margin-left: 20px;">住宿攻略</span></h4>
                            <hr>
                            <p class="day-pio">建议返回丽江古城住宿，五一街是一条充满小资情调的街巷，各种特色小店、咖啡吧、文艺气息浓郁，建议选择该区域入住。</p>
                            <p class="day-pio">芝麻开花连锁芝麻开门客栈位于古城五一街，近四方街，地理位置优越，出行非常方便。客栈是非常典型的木式建筑，门前小桥流水潺潺，让你充分体会古城流水人家的韵味。</p>
                            <p class="day-pio">云端精品度假庭院（丽江纳西风情店）同样位于五一街，客栈是根据纳西传统四合院进行装修和布置，保留了纳西小院的特有风格，房间全部采用纳西雕花实木式家具，庭院更有假山流水摇椅凉亭。</p>
                        </div>
                    </div>
                </div>
                </body>
            </div>
        </div>

        <!-- 路线讨论区 -->
        <div class="route-footer">
            <h3 class="page-header" style="text-align: center;">讨论区</h3>
            <div id="forum">
                <div class="comment-form">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-1">
                            <textarea class="form-control" id="comment-txt"></textarea>
                        </div>
                        <div class="col-lg-2">
                            <button class="btn btn-warning" id="comment-submit">点击发布</button>
                        </div>
                    </div>
                </div>
                <hr>
                <ul class="comment-list list-unstyled">
                    <c:forEach items="${pageInfo.list}" var="leaveWord">
                        <li class="item">
                            <div class="c-bar">
                                <a href="#">
                                    <img src="${leaveWord.userInfo.url}" class="img-circle" height="48" width="48" />
                                    <span class="c-user">@${leaveWord.userInfo.username}</span>
                                </a>
                                <span class="c-time">${leaveWord.createTime}</span>
                            </div>
                            <div class="c-txt">
                                <p>${leaveWord.txt}</p>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <div class="row">
                    <div class="col-lg-6 col-lg-offset-6">
                        <div class="list-inline">
                            <a href="${pageContext.request.contextPath}/travel/route/003?routeId=${route.id}&page=1&size=${pageInfo.pageSize}#forum">首页</a>
                            <c:if test="${pageInfo.pageNum > 1}">
                                <a href="${pageContext.request.contextPath}/travel/route/003?routeId=${route.id}&page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}#forum">上一页</a>
                            </c:if>
                            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNumber">
                                <a href="${pageContext.request.contextPath}/travel/route/003?routeId=${route.id}&page=${pageNumber}&size=${pageInfo.pageSize}#forum">${pageNumber}</a>
                            </c:forEach>
                            <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                                <a href="${pageContext.request.contextPath}/travel/route/003?routeId=${route.id}&page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}#forum">下一页</a>
                            </c:if>
                            <a href="${pageContext.request.contextPath}/travel/route/003?routeId=${route.id}&page=${pageInfo.pages}&size=${pageInfo.pageSize}#forum">尾页</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>

</body>
</html>
<script src="/js/route_order.js"></script>
<script src="/js/route_comment.js"></script>