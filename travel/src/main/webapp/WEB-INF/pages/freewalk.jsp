<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/head.jsp"%>

<div class="freewalk">

    <div class="container">

        <div class="panel panel-default">
            <div class="panel-heading panel-head">
                自由行--DIY定制
            </div>
            <div class="panel-body">
                <div class="user-select" style="font-size: 16px;">
                    <div class="row" style="padding: 8px;">
                        <div class="col-lg-2">
                            <span style="float: right;">出发日期：</span>
                        </div>
                        <div class="col-lg-10" id="month">
                            <label class="radio-inline">
                                <input type="radio" name="month" value="">不限
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="month" value="Jan">1月
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="month" value="Feb">2月
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="month" value="Mar">3月
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="month" value="Apr">4月
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="month" value="May">5月
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="month" value="Jun">6月
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="month" value="Jul">7月
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="month" value="Aug">8月
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="month" value="Sep">9月
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="month" value="Oct">10月
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="month" value="Nov">11月
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="month" value="Dec">12月
                            </label>
                        </div>
                    </div>
                    <hr>
                    <div class="row" style="padding: 8px;">
                        <div class="col-lg-2">
                            <span style="float: right;">价格区间：</span>
                        </div>
                        <div class="col-lg-10" id="price">
                            <label class="radio-inline">
                                <input type="radio" name="price" value="">不限
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="price" value="0-1000">1000元以下
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="price" value="1000-2000">1000-2000元
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="price" value="2000-3000">2000-3000元
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="price" value="3000-99999">3000元以上
                            </label>
                        </div>
                    </div>
                    <hr>
                    <div class="row" style="padding: 8px;">
                        <div class="col-lg-2">
                            <span style="float: right;">游玩天数：</span>
                        </div>
                        <div class="col-lg-10" id="day">
                            <label class="radio-inline">
                                <input type="radio" name="day" value="">不限
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="day" value="1-4">1-4天
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="day" value="5-8">5-8天
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="day" value="9-14">9-14天
                            </label>
                        </div>
                    </div>
                    <hr>
                    <div class="row" style="padding: 8px;">
                        <div class="col-lg-2">
                            <span style="float: right;">游玩路线：</span>
                        </div>
                        <div class="col-lg-10" id="dest">
                            <label class="radio-inline">
                                <input type="radio" name="dest" value="">不限
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="dest" value="丽江">丽江
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="dest" value="昆明">昆明
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="dest" value="大理">大理
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="dest" value="西双版纳">西双版纳
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="dest" value="香格里拉">香格里拉
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="dest" value="腾冲">腾冲
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="dest" value="玉龙雪山">玉龙雪山
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="dest" value="泸沽湖">泸沽湖
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="dest" value="洱海">洱海
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="dest" value="双廊">双廊
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="dest" value="石林">石林
                            </label>
                        </div>
                    </div>
                    <hr>
                    <div class="row" style="padding: 8px;">
                        <div class="col-lg-2">
                            <span style="float: right;">您的选择：</span>
                        </div>
                        <div class="col-lg-10">
                            月份：<span id="selectedMonth"></span>
                            价格：<span id="selectedPrice"></span>元
                            天数：<span id="selectedDay"></span>天
                            目的地：<span id="selectedDest"></span>
                        </div>
                    </div>
                    <hr>

                </div>

                <div id="detail">

                </div>
            </div>
        </div>

    </div>

</div>
<%@ include file="public/foot.jsp"%>
<script src="/js/freewalk.js"></script>