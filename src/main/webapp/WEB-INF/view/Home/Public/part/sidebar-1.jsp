<%--
    一般用于正文侧边栏：
    包括 搜索，热评文章，所有标签，随机文章 等小工具
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--博客主体-右侧侧边栏 start--%>
<div id="sidebar" class="widget-area all-sidebar"
     style="position: relative; overflow: visible; box-sizing: border-box; min-height: 1px;">

        <%--搜索框--%>
        <aside class="widget widget_search">
            <div class="searchbar">
                <form method="get" id="searchform1" action="/search">
                        <span> <input type="text" value="" name="query" id="s1" placeholder="输入搜索内容" required="">
                            <button type="submit" id="searchsubmit1">搜索</button>
                        </span>
                </form>
            </div>
            <div class="clear"></div>
        </aside>
        <%--搜索框--%>

        <%--博客主体-右侧侧边栏-随机文章 start--%>
        <aside id="random_post-7" class="widget random_post wow fadeInUp" data-wow-delay="0.3s">
            <h3 class="widget-title">
                <i class="fa fa-bars"></i>推荐图片
            </h3>
            <div id="random_post_widget">
                <ul>
                    <c:forEach items="${randomArticleList}" var="r">
                        <li>
                            <a href="/article/${r.articleId}" rel="bookmark">
                                    ${r.articleTitle}
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="clear"></div>
        </aside>
        <%--博客主体-右侧侧边栏-近期文章 end--%>

</div>
<%--博客主体-右侧侧边栏 end--%>