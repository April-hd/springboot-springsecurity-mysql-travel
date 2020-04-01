<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/head.jsp"%>

<div class="route-001">
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
                                    <p>大理->丽江->泸沽湖</p>
                                </div>
                                <div class="col-lg-6">
                                    <h4>Tips</h4>
                                    <p>无论环游洱海还是泸沽湖，包车都是比较省时又省力的方式，旺季记得要提前预定车辆</p>
                                </div>
                                <div class="col-lg-6">
                                    <h4>总结</h4>
                                    <p>这条线路是游玩云南的经典线路，从大理开始一路向北，风景交替变换，适合初次到云南的朋友，即使重新到访也会有新的发现</p>
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
                                <li><a href="#D5">D5</a></li>
                                <li><a href="#D6">D6</a></li>
                                <li><a href="#D7">D7</a></li>
                                <li><a href="#D8">D8</a></li>
                                <li><a href="#D9">D9</a></li>
                            </ul>
                        </div>
                        <div class="col-lg-12">
                            <div id="D1">
                                <h3><span class="day-num">D1</span>大理</h3>
                                <hr>
                                <p class="day-pio">今日到达大理后，先游玩大理古城。漫步在古城的各条街道，感受古城的生活气息；之后前往崇圣寺三塔公园，近距离接触大理国时期皇家寺院仅存的古迹；再到三塔南侧的三塔倒影公园，这里可以拍到三塔在水潭里的倒影，最佳拍摄时间是16:00-17:00。傍晚回到大理古城，开始大理的夜生活，夜间的人民路才真正的热闹起来。</p>
                                <ul class="list-unstyled">
                                    <li>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">大理古城</a></span><span>（1小时）</span></span>
                                        <span class="day-transport">公交车15分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">崇圣寺三塔</a></span><span>（2小时）</span></span>
                                        <span class="day-transport">步行10分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">三塔倒影公园</a></span><span>（1小时）</span></span>
                                        <span class="day-transport">公交车15分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">人民路</a></span><span>（1-2小时）</span></span>
                                    </li>
                                </ul>
                                <div class="row">
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D1_大理古城.jpg" alt="...">
                                        </a>
                                    </div>
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D1_崇圣寺山塔.jpg" alt="...">
                                        </a>
                                    </div>
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D1_三塔倒影公园.jpg" alt="...">
                                        </a>
                                    </div>
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D1_人民路.jpg" alt="...">
                                        </a>
                                    </div>
                                </div>
                                <h4><img src="../../images/交通.jpg" /><span style="margin-left: 20px;">交通攻略</span></h4>
                                <hr>
                                <p class="day-pio">大理古城内步行即可，崇圣寺三塔可在大理古城北门乘19路或打车前往。</p>
                                <h4><img src="../../images/住宿.jpg" /><span style="margin-left: 20px;">住宿攻略</span></h4>
                                <hr>
                                <p class="day-pio">大理的住宿主要集中在古城、下关和双廊，古城内的住宿以客栈和青旅居多，各类设施最为方便。其中洋人街上的客栈各有特色，来古城玩的蜂蜂通常会选择住在这里。</p>
                                <p class="day-pio">大理照澜院精品客栈位于洱海门脚下，出门左转就是人民路，客栈为传统大理白族砖木结构建筑，整个客栈的装修典雅中透着时尚的味道。</p>
                                <p class="day-pio">e栈合一（大理古城1店）位于大理古城中心地带，一进客栈大门，就是满园的花草和果树，建有凉亭，可饮茶聊天，院子小溪流水，鱼儿撒欢，还有牡丹和仿古亭台，非常惬意。</p>
                            </div>
                            <div id="D2">
                                <h3><span class="day-num">D2</span>大理</h3>
                                <hr>
                                <p class="day-pio">今日主要包车环游洱海，早上从古城出发开始顺时针环洱海。包车行程可自己决定，也可听取包车司机的建议。建议顺序游玩的景点：喜洲镇-蝴蝶泉-双廊-南诏风情岛-挖色镇-小普陀，时间的话允许记得在洱海东岸等待大理最美的日落。</p>
                                <ul class="list-unstyled">
                                    <li>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">大理古城</a></span><span>（出发）</span></span>
                                        <span class="day-transport">包车25分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">喜洲古镇</a></span><span>（1-2小时）</span></span>
                                        <span class="day-transport">包车13分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">蝴蝶泉</a></span><span>（1小时）</span></span>
                                        <span class="day-transport">包车40分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">双廊古镇</a></span><span>（2小时）</span></span>
                                        <span class="day-transport">摆渡船5分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">南诏风情岛</a></span><span>（1小时）</span></span>
                                        <span class="day-transport">包车20分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">挖色镇</a></span><span>（2小时）</span></span>
                                        <span class="day-transport">游船30分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">小普陀</a></span><span>（30分钟）</span></span>
                                        <span class="day-transport">包车70分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">大理古城</a></span><span>（返回）</span></span>
                                    </li>
                                </ul>
                                <div class="row">
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D2_大理古城.jpg" alt="...">
                                        </a>
                                    </div>
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D2_喜洲古镇.jpg" alt="...">
                                        </a>
                                    </div>
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D2_蝴蝶泉.jpg" alt="...">
                                        </a>
                                    </div>
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D2_双廊古镇.jpg" alt="...">
                                        </a>
                                    </div>
                                </div>
                                <h4><img src="../../images/交通.jpg" /><span style="margin-left: 20px;">交通攻略</span></h4>
                                <hr>
                                <p class="day-pio">游玩洱海最便利的方式就是包车，行程和时间安排都会相对自由，包车一天的价格在300元左右。</p>
                                <h4><img src="../../images/住宿.jpg" /><span style="margin-left: 20px;">住宿攻略</span></h4>
                                <hr>
                                <p class="day-pio">今日依然住在古城内，古城内的住宿以客栈和青旅居多，各类设施最为方便。其中洋人街上的客栈各有特色，来古城玩的朋友通常会选择住在这里。</p>
                            </div>
                            <div id="D3">
                                <h3><span class="day-num">D3</span>大理</h3>
                                <hr>
                                <p class="day-pio">今日主要游览苍山，建议选择乘坐大索道上山，在大索道上感受山间云雾变幻莫测，随着索道的逐渐升高可以俯瞰整个洱海。如果是五六月份，在大索道的终点——洗马潭可以看到满山的杜鹃。之后可以沿着玉带路一路向北，边走边玩。</p>
                                <ul class="list-unstyled">
                                    <li>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">苍山</a></span><span>（1天）</span></span>
                                    </li>
                                </ul>
                                <div class="row">
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D3_苍山.jpg" alt="...">
                                        </a>
                                    </div>
                                </div>
                                <h4><img src="../../images/交通.jpg" /><span style="margin-left: 20px;">交通攻略</span></h4>
                                <hr>
                                <p class="day-pio">在古城乘坐4路或打车到达苍山脚上，之后可选择步行或乘坐摆渡车前往大索道下站；从大理古城西侧出来，步行大约20分钟也可到达大索道山下站点。</p>
                                <p class="day-pio">上苍山有两个途径：乘坐索道、步行走登山步道。索道有三条，感通索道、中和索道和苍山大索道。索道互不相通，山下站点也不在同一位置，三条索道分别可达山腰玉带路上的清碧溪、中和寺和洗马潭。这里建议选择乘坐大索道，大索道最长，风光自然也更好。</p>
                                <p class="day-pio">如果时间充裕，体力也充沛，也可以选择步行上山。天龙八部影视城西侧，建有登山步道，这也是当地人晨练的路线。步道的石阶很平整，上行约1小时可达玉带路（凤眼洞附近），先往北前行约2公里抵达中和寺，之后折返回来向南，游玩洗马潭、七龙女池等。之后可原路返回，也可经感通索道返回。</p>
                                <h4><img src="../../images/住宿.jpg" /><span style="margin-left: 20px;">住宿攻略</span></h4>
                                <hr>
                                <p class="day-pio">今日依然住在古城内，古城内的住宿以客栈和青旅居多，各类设施最为方便。其中洋人街上的客栈各有特色，来古城玩的蜂蜂通常会住在这里。</p>
                                <p class="day-pio">大理照澜院精品客栈位于洱海门脚下，出门左转就是人民路，客栈为传统大理白族砖木结构建筑，整个客栈的装修典雅中透着时尚的味道。</p>
                                <p class="day-pio">e栈合一（大理古城1店）位于大理古城中心地带，一进客栈大门，就是满园的花草和果树，建有凉亭，可饮茶聊天，院子小溪流水，鱼儿撒欢，还有牡丹和仿古亭台，非常惬意。</p>
                            </div>
                            <div id="D4">
                                <h3><span class="day-num">D4</span><span>大理</span><span class="day-transport">大巴3小时<i class="i-arrow"></i></span><span>丽江</span></h3>
                                <hr>
                                <p class="day-pio">今日到达丽江后，先游览丽江古城，漫步在古城小巷，尽情享受古城慵懒的氛围，还可以在街头巷尾寻觅各式丽江特色小吃来填补肚子。之后前往狮子山，登上狮子山的制高点—万古楼，俯瞰整个丽江古城，运气足够好的话向北可以远眺到玉龙雪山。下了狮子山顺路去木府，近距离欣赏古城内这座仿紫禁城的纳西宫廷式建筑。傍晚回到古城，在四方街感受古城的夜生活，还可以去酒吧消遣一番， 说不定会碰上美好的艳遇。</p>
                                <ul class="list-unstyled">
                                    <li>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">丽江古城</a></span><span>（1小时）</span></span>
                                        <span class="day-transport">步行20分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">狮子山</a></span><span>（1小时）</span></span>
                                        <span class="day-transport">步行10分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">木府</a></span><span>（1小时）</span></span>
                                        <span class="day-transport">步行15分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">丽江四方街</a></span><span>（1-2小时）</span></span>
                                        <span class="day-transport">步行15分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">人民路</a></span><span>（1-2小时）</span></span>
                                    </li>
                                </ul>
                                <div class="row">
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D4_丽江古城.jpg" alt="...">
                                        </a>
                                    </div>
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D4_狮子山.jpg" alt="...">
                                        </a>
                                    </div>
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D4_木府.jpg" alt="...">
                                        </a>
                                    </div>
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D4_丽江四方街.jpg" alt="...">
                                        </a>
                                    </div>
                                </div>
                                <h4><img src="../../images/交通.jpg" /><span style="margin-left: 20px;">交通攻略</span></h4>
                                <hr>
                                <p class="day-pio">从大理到丽江可选择乘火车或大巴，火车每天从上午4点多到下午3点多共有7个班次，车程2.5小时左右，票价从34-111元不等，如果选择乘坐火车建议乘坐上午9:15那一班，到达丽江刚好中午。大理汽车客运站每天有5班车发往丽江，时间分别为8:30/9:30/14:00/16:00/19:00，票价52.5元，车程3小时；汽车客运北站每天从7:00-18:30每30分钟有一班车发往丽江，票价38元，车程3.5小时。如果运气好的话，还可以在大理拼到车前往丽江，费用90元左右/人。丽江古城内步行即可到达各个景点。</p>
                                <h4><img src="../../images/住宿.jpg" /><span style="margin-left: 20px;">住宿攻略</span></h4>
                                <hr>
                                <p class="day-pio">四方街是古城最繁华的地方，周围食肆、酒吧、商铺林立，晚上更是热闹非，建议选择该区域入住。</p>
                            </div>
                            <div id="D5">
                                <h3><span class="day-num">D5</span><span>丽江</span></h3>
                                <hr>
                                <p class="day-pio">今日先前往丽江城西10公里处的拉市海游玩，观鸟、划船、骑马体验茶马古道是游玩这里的主要方式。骑马有不同的路线供选择，可以选择前往高山峡谷中的茶马古道，或是走到湖对面湿地深处的环湖路线；骑马后，可以邀上船家开启一场划船观鸟之旅。回到丽江古城休息后，再前往丽江古城西北部的束河古镇游玩，体验不同的古镇风情。</p>
                                <ul class="list-unstyled">
                                    <li>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">拉海市湿地公园</a></span><span>（4小时）</span></span>
                                        <span class="day-transport">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">束河古镇</a></span><span>（2小时）</span></span>
                                    </li>
                                </ul>
                                <div class="row">
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D5_拉海市湿地公园.jpg" alt="...">
                                        </a>
                                    </div>
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D5_束河古镇.jpg" alt="...">
                                        </a>
                                    </div>
                                </div>
                                <h4><img src="../../images/交通.jpg" /><span style="margin-left: 20px;">交通攻略</span></h4>
                                <hr>
                                <p class="day-pio">拉市海位于丽江城西10公里处，可以在古城忠义市场旁乘坐面包车前往，票价3-5元；也可以选择从古城包车前往，包车费用50-70元。大多数一日游包含骑马、划船、往返接送和午餐，很方便。</p>
                                <p class="day-pio">束河古镇位于丽江古城西北约5公里处。可在古城乘坐11路公交车到束河路口下车，再步行至古镇大门；也可在古城包车前往，5元/人，打车约20元；如果体力充足，也可租一辆自行车前往。</p>
                                <h4><img src="../../images/住宿.jpg" /><span style="margin-left: 20px;">住宿攻略</span></h4>
                                <hr>
                                <p class="day-pio">建议返回丽江古城住宿，四方街是古城最繁华的地方，周围食肆、酒吧、商铺林立，晚上更是热闹非，建议选择该区域入住。</p>
                            </div>
                            <div id="D6">
                                <h3><span class="day-num">D6</span><span>丽江</span></h3>
                                <hr>
                                <p class="day-pio">今日主要去探访玉龙雪山，先乘坐大索道到冰川公园，感受全球中低纬度山岳冰川的精华。下山后建议先吃午饭，午饭后时间来得及的话可以在蓝月谷剧场看13:30场的《印象丽江》。或是直接前往牦牛坪，在这里观赏玉龙雪山十三峰；之后前往云杉坪，探索隐藏在原始云杉林中的巨大草坪，记住乘坐索道到达雪山半山腰时是拍摄雪山全景的最佳位置。最后回到山脚蓝月谷，看山谷中这一湾近乎凝固的湛蓝。</p>
                                <ul class="list-unstyled">
                                    <li>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">冰川公园</a></span><span>（3小时）</span></span>
                                        <span class="day-transport">索道+观光车30分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">牦牛坪景区</a></span><span>（1-2小时）</span></span>
                                        <span class="day-transport">索道+观光车30分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">云山坪</a></span><span>（1-2小时）</span></span>
                                        <span class="day-transport">索道+观光车20分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">蓝月谷</a></span><span>（1小时）</span></span>
                                    </li>
                                </ul>
                                <div class="row">
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D6_冰川公园.jpg" alt="...">
                                        </a>
                                    </div>
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D6_牦牛坪景区.jpg" alt="...">
                                        </a>
                                    </div>
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D6_云山坪.jpg" alt="...">
                                        </a>
                                    </div>
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D6_蓝月谷.jpg" alt="...">
                                        </a>
                                    </div>
                                </div>
                                <h4><img src="../../images/交通.jpg" /><span style="margin-left: 20px;">交通攻略</span></h4>
                                <hr>
                                <p class="day-pio">玉龙雪山距离丽江市区约15公里，可乘巴士或包车前往。在古城周围的玉河停车场、南门停车场、丽君酒店和束河大门每天早上9:00有发往甘海子的雪山直通车，下午17:00返回，票价40元/人。可以在玉河走廊C区2-3号、客运中心站及高快客运站购票。从丽江包车去玉龙雪山，根据车型座数不同价格在300-500元不等。还可以购买玉龙雪山一日游，大多一日游包含门票和往返交通费用。</p>
                                <p class="day-pio">景区内可乘坐环保车到达各个景点的缆车乘坐处，再分别乘缆车到达。注意，冰川公园大索道只到达海拔4506米处，剩下的路程需要一步步走上去，须量力而行。</p>
                                <h4><img src="../../images/住宿.jpg" /><span style="margin-left: 20px;">住宿攻略</span></h4>
                                <hr>
                                <p class="day-pio">建议返回丽江古城住宿，四方街是古城最繁华的地方，周围食肆、酒吧、商铺林立，晚上更是热闹非，建议选择该区域入住。</p>
                            </div>
                            <div id="D7">
                                <h3><span class="day-num">D7</span><span>丽江</span><span class="day-transport">大巴6小时<i class="i-arrow"></i></span><span>泸沽湖</span></h3>
                                <hr>
                                <p class="day-pio">今日由丽江前往泸沽湖，大概需要半天时间，到达泸沽湖已经是下午。建议乘坐旅游专线车，途中会经过《千里走单骑》的取景点—丽宁十八弯观景台和宁泸公路旁的泸沽湖观景台，无论是乘巴士还是包车都会在这两处稍作停留。旅游专线车会先到达大落水码头，到达后车会在这里停一段时间等乘客。从这里你可以选择乘猪槽船前往洛克岛或里务比岛，推荐去游客较少、位于湖中心的洛克岛。游岛结束后，可以继续乘坐旅游专线车前往里格岛，在里格岛随意逛逛就休息吧。</p>
                                <ul class="list-unstyled">
                                    <li>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">丽宁十八弯观景台</a></span><span>（15分钟）</span></span>
                                        <span class="day-transport">旅游专线车5小时<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">泸沽湖观景台</a></span><span>（15分钟）</span></span>
                                        <span class="day-transport">旅游专线车30分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">大落水码头</a></span><span>（10分钟）</span></span>
                                        <span class="day-transport">猪槽船30分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">泸沽湖景区-泸沽湖洛克岛</a></span><span>（2小时）</span></span>
                                        <span class="day-transport">旅游专线车30分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">里格岛</a></span><span>（2小时）</span></span>
                                    </li>
                                </ul>
                                <div class="row">
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D7_丽宁十八弯.jpg" alt="...">
                                        </a>
                                    </div>
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D7_泸沽湖观景台.jpg" alt="...">
                                        </a>
                                    </div>
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D7_大落水码头.jpg" alt="...">
                                        </a>
                                    </div>
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D7_泸沽湖景区-泸沽湖洛克岛.jpg" alt="...">
                                        </a>
                                    </div>
                                </div>
                                <h4><img src="../../images/交通.jpg" /><span style="margin-left: 20px;">交通攻略</span></h4>
                                <hr>
                                <p class="day-pio">从丽江前往泸沽湖，建议在丽江古城口玉河广场停车场乘坐丽江—泸沽湖的旅游专线车，可抵达大洛水村和里格岛，还会途经丽宁十八弯和泸沽湖观景台并停靠。往返车费160元/人，单程100元/人，早上8:00发车，车程7小时左右。</p>
                                <p class="day-pio">另外，丽江高快客运站每天有两班车发往泸沽湖大落水村，分别是8:00和8:30，车程9小时左右，车费100元/人；丽江汽车客运站每天有两班车发往泸沽湖大落水村，分别是8:30和9:00，车程7-8小时，车费约106元/人。从大落水村到里格岛需包车，费用50元左右。运气好的话可以凑够人拼车前往，10元左右/人。</p>
                                <p class="day-pio">若直接从丽江包车前往泸沽湖，根据车型不同，一般淡季为350-550元，旺季为550-800元。</p>
                                <h4><img src="../../images/住宿.jpg" /><span style="margin-left: 20px;">住宿攻略</span></h4>
                                <hr>
                                <p class="day-pio">里格地理位置独特，这里的房间窗下即是湖水，建议选择该区域入住。</p>
                            </div>
                            <div id="D8">
                                <h3><span class="day-num">D8</span><span>泸沽湖</span></h3>
                                <hr>
                                <p class="day-pio">今日建议选择包车环湖，上午可以早起在里格岛欣赏泸沽湖的日出。环湖开始，到尼塞村寻找著名的情人树和早恋树；到摩梭族最古老村寨之一的小落水感受原生态的摩梭族风情；到情人滩感受十里沙岸、杨柳依依；到末代土司王妃府感受当年“摩梭女王”的一生荣华与艰难坎坷；到草海看水中芦苇一片片，在走婚桥上背起心爱的姑娘从头走到尾；到女神湾遥望女神山，等待泸沽湖最美的日落。泸沽湖另一半景点很少，看完日落后可根据自身情况选择继续环湖返回，或原路返回里格岛。</p>
                                <ul class="list-unstyled">
                                    <li>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">里格岛</a></span><span>（30分钟）</span></span>
                                        <span class="day-transport">包车6分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">尼塞村</a></span><span>（30分钟）</span></span>
                                        <span class="day-transport">包车10分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">小洛水</a></span><span>（1小时）</span></span>
                                        <span class="day-transport">包车18分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">里拜情人滩</a></span><span>（30分钟）</span></span>
                                        <span class="day-transport">包车15分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">末代王妃府</a></span><span>（40分钟）</span></span>
                                        <span class="day-transport">包车13分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">草海</a></span><span>（2-3小时）</span></span>
                                        <span class="day-transport">包车40分钟<i class="i-arrow"></i></span>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">女神湾</a></span><span>（2小时）</span></span>
                                    </li>
                                </ul>
                                <div class="row">
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D8_里格岛.jpg" alt="...">
                                        </a>
                                    </div>
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D8_尼塞村.jpg" alt="...">
                                        </a>
                                    </div>
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D8_小洛水.jpg" alt="...">
                                        </a>
                                    </div>
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D8_末代王妃府.jpg" alt="...">
                                        </a>
                                    </div>
                                </div>
                                <h4><img src="../../images/交通.jpg" /><span style="margin-left: 20px;">交通攻略</span></h4>
                                <hr>
                                <p class="day-pio">包车环游泸沽湖是比较方便的方式之一，根据车型和季节的不同价格在400-600元/天。如果时间和体力充足，租辆自行车和电动车环湖也是不错的选择，但会比较辛苦。</p>
                                <p class="day-pio">若选择租自行车或电动车环湖，电动车价格60元左右/天，自行车30元左右/天。建议逆时针环湖，因为从里格出发，逆时针向大落水方向走都是平路，顺时针向尼塞、小落水方向走会先走很多山路。想要轻松一些，也可以选择环湖区半圈，因为另一半湖区景点很少，电动车的电量有时可能无法支持环湖一周(租车时向老板咨询清楚电动车车况)。</p>
                                <h4><img src="../../images/住宿.jpg" /><span style="margin-left: 20px;">住宿攻略</span></h4>
                                <hr>
                                <p class="day-pio">里格地理位置独特，这里的房间窗下即是湖水，建议选择该区域入住。</p>
                            </div>
                            <div id="D9">
                                <h3><span class="day-num">D9</span><span>泸沽湖</span><span class="day-transport">大巴7小时<i class="i-arrow"></i></span><span>丽江</span></h3>
                                <hr>
                                <p class="day-pio">今日由泸沽湖先返回丽江，有时间的话，可以逛逛丽江的市场、商业街，购买特色伴手礼，再由丽江直接返回不同目的地。</p>
                                <ul class="list-unstyled">
                                    <li>
                                        <span><img src="../../images/地点.jpg"><span class="place-link"><a href="">忠义市场</a></span><span>（1-2小时）</span></span>
                                    </li>
                                </ul>
                                <div class="row">
                                    <div class="col-xs-6 col-md-3">
                                        <a href="#" class="thumbnail">
                                            <img src="../../images/route/route_001/D9_忠义市场.jpg" alt="...">
                                        </a>
                                    </div>
                                </div>
                                <h4><img src="../../images/交通.jpg" /><span style="margin-left: 20px;">交通攻略</span></h4>
                                <hr>
                                <p class="day-pio">由泸沽湖返回丽江，可以继续乘坐旅游专线车，每天8:30出发，9:00到达大落水接人，车程约7小时。如果确定返回时乘坐旅游专线，可以在到达泸沽湖时就与司机确定回程的车票。</p>
                                <p class="day-pio">在大落水客运站每天有两班车发往丽江，分别是8:30和9:00，单程100元，车程8小时左右。</p>
                                <p class="day-pio">若直接包车从泸沽湖返回丽江，价格在500-700元之间。</p>
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
                            <a href="${pageContext.request.contextPath}/travel/route/001?routeId=${route.id}&page=1&size=${pageInfo.pageSize}#forum">首页</a>
                            <c:if test="${pageInfo.pageNum > 1}">
                                <a href="${pageContext.request.contextPath}/travel/route/001?routeId=${route.id}&page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}#forum">上一页</a>
                            </c:if>
                            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNumber">
                                <a href="${pageContext.request.contextPath}/travel/route/001?routeId=${route.id}&page=${pageNumber}&size=${pageInfo.pageSize}#forum">${pageNumber}</a>
                            </c:forEach>
                            <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                                <a href="${pageContext.request.contextPath}/travel/route/001?routeId=${route.id}&page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}#forum">下一页</a>
                            </c:if>
                            <a href="${pageContext.request.contextPath}/travel/route/001?routeId=${route.id}&page=${pageInfo.pages}&size=${pageInfo.pageSize}#forum">尾页</a>
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