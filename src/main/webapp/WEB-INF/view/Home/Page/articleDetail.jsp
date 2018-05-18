<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="title">
    <title>${articleDetailVo.articleCustom.articleTitle}</title>
</rapid:override>

<rapid:override name="header-style">
    <rapid:override name="header-style">
        <link rel="stylesheet" href="/css/highlight.css">
        <style>
            .entry-title {
                background: #f8f8f8;
            }
        </style>
    </rapid:override>
</rapid:override>

<rapid:override name="breadcrumb">
    <%--面包屑导航 start--%>
    <nav class="breadcrumb">
        <a class="crumbs" href="/">
            <i class="fa fa-home"></i>首页
        </a>
        <c:choose>
            <c:when test="${a.categoryCustomList.size()!=0}">
                <c:forEach items="${articleDetailVo.categoryCustomList}" var="c">
                    <i class="fa fa-angle-right"></i>
                    <a href="/category/${c.categoryId}">
                            ${c.categoryName}
                    </a>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <a>未分类</a>
            </c:otherwise>
        </c:choose>
        <i class="fa fa-angle-right"></i>
        正文
    </nav>
    <%--面包屑导航 end--%>
</rapid:override>


<rapid:override name="left">
    <%--博客主体-左侧文章正文 start--%>
    <div id="primary" class="content-area">
        <main id="main" class="site-main" role="main">
            <article class="post">
                <header class="entry-header">
                    <h1 class="entry-title">
                            ${articleDetailVo.articleCustom.articleTitle}
                    </h1>
                </header><!-- .entry-header -->
                <div class="entry-content">
                    <div class="single-content">
                            ${articleDetailVo.articleCustom.articleContent}
                    </div>

                    <div id="social">
                        <div class="social-main">
                                    <span class="like">
                                        <a href="javascript:;" data-action="ding" data-id="1" title="点赞"
                                           class="favorite" onclick="increaseLikeCount()">
                                            <i class="fa fa-thumbs-up"></i>赞
                                            <i class="count"
                                               id="count-${articleDetailVo.articleCustom.articleId}">${articleDetailVo.articleCustom.articleLikeCount}</i>
                                        </a>
                                    </span>
                            <div class="clear"></div>
                        </div>
                    </div>

                    <footer class="single-footer">
                        <ul class="single-meta">
                            <c:if test="${sessionScope.user!=null}">
                            <li class="edit-link">
                                <a target="_blank" class="post-edit-link"
                                   href="/admin/article/edit/${articleDetailVo.articleCustom.articleId}">编辑</a>
                            </li>
                            </c:if>

                            <li class="views">
                                <i class="fa fa-eye"></i> <span
                                    class="articleViewCount">${articleDetailVo.articleCustom.articleViewCount}</span>
                                查看
                            </li>
                            <li class="r-hide">
                                <a href="javascript:pr()" title="侧边栏">
                                    <i class="fa fa-caret-left"></i>
                                    <i class="fa fa-caret-right"></i>
                                </a>
                            </li>
                        </ul>
                        <ul id="fontsize">
                            <li>A+</li>
                        </ul>
                        <div class="single-cat-tag">
                            <div class="single-cat">所属分类：
                                <c:forEach items="${articleDetailVo.categoryCustomList}" var="c">
                                    <a href="/category/${c.categoryId}">
                                            ${c.categoryName}
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </footer><!-- .entry-footer -->


                    <div class="clear"></div>
                </div><!-- .entry-content -->
            </article><!-- #post -->

                <%--版权声明 start--%>
            <div class="authorbio wow fadeInUp" >
                <ul class="postinfo">
                    <li></li>
                    <li><strong>版权声明：</strong>本站原创图片，于<fmt:formatDate
                            value="${articleDetailVo.articleCustom.articlePostTime}"
                            pattern="yyyy-MM-dd"/>，由
                            <strong>
                                    ${articleDetailVo.userCustom.userNickname}
                            </strong>
                        发表。
                    </li>
                </ul>
                <div class="clear"></div>
            </div>


                <%--上一篇下一篇 start--%>
            <nav class="nav-single">
                <c:choose>
                    <c:when test="${preArticle!=null}">
                        <a href="/article/${preArticle.articleId}" rel="next">
                            <span class="meta-nav">
                                <span class="post-nav">上一篇
                                 <i class="fa fa-angle-left"></i>
                                </span>
                                <br>${preArticle.articleTitle}
                            </span>
                        </a>
                    </c:when>
                    <c:otherwise>
                              <span class="meta-nav">
                                    <span class="post-nav">
                                        没有了<br>
                                    </span>已是第一篇文章
                                </span>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${afterArticle!=null}">
                        <a href="/article/${afterArticle.articleId}" rel="next">
                            <span class="meta-nav">
                                <span class="post-nav">下一篇
                                 <i class="fa fa-angle-right"></i>
                                </span>
                                <br>${afterArticle.articleTitle}
                            </span>
                        </a>
                    </c:when>
                    <c:otherwise>
                            <span class="meta-nav">
                                <span class="post-nav">
                                    没有了<br>
                                </span>已是最后文章
                             </span>
                    </c:otherwise>
                </c:choose>
                <div class="clear"></div>
            </nav>
        </main>
        <!-- .site-main -->
    </div>
    <%--博客主体-左侧文章正文end--%>
</rapid:override>


<rapid:override name="footer-script">
    <script src="/js/jquery.cookie.js"></script>

    <script type="text/javascript">
        increaseViewCount();
        layui.code({
            elem: 'pre',//默认值为.layui-code
           // skin: 'notepad', //如果要默认风格，不用设定该key。
            about: false
        });
    </script>

</rapid:override>


<%@ include file="../Public/framework.jsp" %>