<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/head.jsp"%>

<div class="hotel-main">
    <div class="container">
        <div class="h-title">订酒店</div>
        <div class="row data-warp">
            <div class="col-lg-3" style="padding-left: 0;">
                <div class="form-group">
                    <input class="form-control" id="destName" placeholder="出行目的地" />
                </div>
            </div>
            <div class="col-lg-1">
                <button type="button" class="btn btn-warning" id="search">
                    <span class="glyphicon glyphicon-search search"></span>
                </button>
            </div>
            <div class="col-lg-3">
                <div class="form-group">
                    <div class="input-group date" id="live">
                        <input type="text" class="form-control" id="liveTime" placeholder="住店日期"  />
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="form-group">
                    <div class="input-group date" id="leave">
                        <input type="text" class="form-control" id="leaveTime" placeholder="离店日期"  />
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-lg-2">
                <div class="form-group">
                    <input type="text" class="form-control" id="peopleCount" placeholder="人数" />
                </div>
            </div>
        </div>
        <ul class="list-inline h-notice">
            <li class="notice01">
                <img src="../../images/游记攻略.png" />
                <div class="notice-info">
                    <h4>住宿攻略</h4>
                    <p>区域攻略到特色主题，应有尽有</p>
                </div>
            </li>
            <li class="notice02">
                <img src="../../images/价格.png" />
                <div class="notice-info">
                    <h4>实惠价格</h4>
                    <p>价格便宜实惠，天天专享特惠</p>
                </div>
            </li>
            <li class="notice03">
                <img src="../../images/点评.png" />
                <div class="notice-info">
                    <h4>真实点评</h4>
                    <p>超过100万真实用户点评和游记</p>
                </div>
            </li>
        </ul>
        <hr>
        <div class="h-detail" id="h-detail">
        </div>
    </div>
</div>

</body>
</html>
<script src="/js/hotel_book.js"></script>