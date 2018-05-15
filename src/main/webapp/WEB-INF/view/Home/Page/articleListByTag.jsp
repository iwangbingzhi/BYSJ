<%--
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/myTag.tld" prefix="lyz" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
&lt;%&ndash;文章分类列表的页面&ndash;%&gt;
    <rapid:override name="description">
        <meta name="description" content="${tagCustom.tagName}"/>
    </rapid:override>

    <rapid:override name="keywords">
        <meta name="keywords" content="${tagCustom.tagName}"/>
    </rapid:override>

    <rapid:override name="title">
        <title>${tagCustom.tagName}</title>
    </rapid:override>

    <rapid:override name="breadcrumb">
        &lt;%&ndash;面包屑导航 start&ndash;%&gt;
        <nav class="breadcrumb">
            <a class="crumbs" href="/">
                <i class="fa fa-home"></i>首页</a>
            <i class="fa fa-angle-right"></i>
            <c:choose>
                <c:when test="${articleListVoList!=null}">
                    <c:choose>
                        <c:when test="${articleListVoList.size()!=0}">
                            <a href="/tag/${articleListVoList[0].tagCustomList[0].tagId}">${articleListVoList[0].tagCustomList[0].tagName}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="/tag/${tagCustom.tagId}">${tagCustom.tagName}</a>
                        </c:otherwise>
                    </c:choose>
                    <i class="fa fa-angle-right"></i>
                    文章
                </c:when>
                <c:otherwise>
                    该标签不存在
                </c:otherwise>
            </c:choose>



        </nav>
        &lt;%&ndash;面包屑导航 end&ndash;%&gt;
    </rapid:override>


    <rapid:override name="left">
        &lt;%&ndash;博客主体-左侧正文 start&ndash;%&gt;
        <div id="primary" class="content-area">
            <main id="main" class="site-main" role="main">

                <c:choose>
                    <c:when test="${articleListVoList!=null}">
                        <c:choose>
                            <c:when test="${articleListVoList.size()!=0}">
                                &lt;%&ndash;文章列表-start&ndash;%&gt;
                                <c:forEach items="${articleListVoList}" var="a">

                                    <article class="post"
                                             data-wow-delay="0.3s">

                                        <figure class="thumbnail">
                                        &lt;%&ndash;    <a href="/article/${a.articleCustom.articleId}">
                                                <img width="280" height="210"
                                                     src="/img/thumbnail/random/img_${a.articleCustom.articleId%400}.jpg"
                                                     class="attachment-content size-content wp-post-image"
                                                     alt="${a.articleCustom.articleTitle}">
                                            </a>&ndash;%&gt;
                                            <span class="cat">
                               <a href="/category/${a.categoryCustomList[a.categoryCustomList.size()-1].categoryId}">
                                       ${a.categoryCustomList[a.categoryCustomList.size()-1].categoryName}
                               </a>
                            </span>
                                        </figure>

                                        <header class="entry-header">
                                            <h2 class="entry-title">
                                                <a href="/article/${a.articleCustom.articleId}"
                                                   rel="bookmark">
                                                        ${a.articleCustom.articleTitle}
                                                </a>
                                            </h2>
                                        </header><!-- .entry-header -->

                                        <div class="entry-content">
                                            <div class="archive-content">
                                                <lyz:htmlFilter>${a.articleCustom.articleContent}</lyz:htmlFilter>......
                                            </div>
                                            <span class="title-l"></span>
                                            <span class="new-icon">
                                <c:choose>
                                    <c:when test="${a.articleCustom.articleStatus==2}">
                                        <i class="fa fa-bookmark-o"></i>
                                    </c:when>
                                    <c:otherwise>
                                        <jsp:useBean id="nowDate" class="java.util.Date"/> &lt;%&ndash;当前时间&ndash;%&gt;
                                        <c:set var="interval"
                                               value="${nowDate.time - a.articleCustom.articlePostTime.time}"/>&lt;%&ndash;时间差毫秒数&ndash;%&gt;
                                        <fmt:formatNumber value="${interval/1000/60/60/24}" pattern="#0"
                                                          var="days"/>&lt;%&ndash;取天数整数&ndash;%&gt;
                                        <c:if test="${days <= 7}">NEW</c:if>
                                    </c:otherwise>
                                </c:choose>


                            </span>
                                            <span class="entry-meta">
                                <span class="date">
                                    <fmt:formatDate value="${a.articleCustom.articlePostTime}" pattern="yyyy年MM月dd日"/>
                                &nbsp;&nbsp;
                                </span>
                                <span class="views">
                                    <i class="fa fa-eye"></i>
                                        ${a.articleCustom.articleViewCount} views
                                </span>
                                <span class="comment">&nbsp;&nbsp;
                                    <a href="/article/${a.articleCustom.articleId}#comments" rel="external nofollow">
                                      <i class="fa fa-comment-o"></i>
                                        <c:choose>
                                            <c:when test="${a.articleCustom.articleCommentCount==0}">
                                                发表评论
                                            </c:when>
                                            <c:otherwise>
                                                ${a.articleCustom.articleCommentCount}
                                            </c:otherwise>
                                        </c:choose>

                                    </a>
                                </span>
                            </span>
                                            <div class="clear"></div>
                                        </div><!-- .entry-content -->

                                        <span class="entry-more"><a href="/article/${a.articleCustom.articleId}"
                                                                    rel="bookmark">阅读全文</a></span>
                                    </article>
                                </c:forEach>
                                &lt;%&ndash;文章列表-end&ndash;%&gt;
                            </c:when>
                            <c:otherwise>
                                <section class="no-results not-found">
                                    <div class="post">
                                        <p>该标签目前还没有文章！</p>
                                        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                                    </div>
                                </section>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <section class="no-results not-found">
                            <div class="post">
                                <p>该标签不存在！</p>
                                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                            </div>
                        </section>
                    </c:otherwise>
                </c:choose>

            </main><!-- .site-main -->

            <c:choose>
                <c:when test="${articleListVoList!=null}">
                    <c:if test="${articleListVoList.size()!=0}">
                        &lt;%&ndash;分页 start&ndash;%&gt;
                        <nav class="navigation pagination" role="navigation">
                            <div class="nav-links">
                                <c:choose>
                                    <c:when test="${articleListVoList[0].page.totalPageCount <= 3 }">
                                        <c:set var="begin" value="1"/>
                                        <c:set var="end" value="${articleListVoList[0].page.totalPageCount }"/>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="begin" value="${articleListVoList[0].page.pageNow-1 }"/>
                                        <c:set var="end" value="${articleListVoList[0].page.pageNow + 2}"/>
                                        <c:if test="${begin < 2 }">
                                            <c:set var="begin" value="1"/>
                                            <c:set var="end" value="3"/>
                                        </c:if>
                                        <c:if test="${end > articleListVoList[0].page.totalPageCount }">
                                            <c:set var="begin" value="${articleListVoList[0].page.totalPageCount-2 }"/>
                                            <c:set var="end" value="${articleListVoList[0].page.totalPageCount }"/>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                                    &lt;%&ndash;上一页 &ndash;%&gt;
                                <c:choose>
                                    <c:when test="${articleListVoList[0].page.pageNow eq 1 }">
                                        &lt;%&ndash;当前页为第一页，隐藏上一页按钮&ndash;%&gt;
                                    </c:when>
                                    <c:otherwise>
                                        <a class="page-numbers" href="/tag/${articleListVoList[0].tagCustomList[0].tagId}/p/${articleListVoList[0].page.pageNow-1}" >
                                            <span class="fa fa-angle-left"></span>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                                    &lt;%&ndash;显示第一页的页码&ndash;%&gt;
                                <c:if test="${begin >= 2 }">
                                    <a class="page-numbers" href="/tag/${articleListVoList[0].tagCustomList[0].tagId}/p/1">1</a>
                                </c:if>
                                    &lt;%&ndash;显示点点点&ndash;%&gt;
                                <c:if test="${begin  > 2 }">
                                    <span class="page-numbers dots">…</span>
                                </c:if>
                                    &lt;%&ndash;打印 页码&ndash;%&gt;
                                <c:forEach begin="${begin }" end="${end }" var="i">
                                    <c:choose>
                                        <c:when test="${i eq articleListVoList[0].page.pageNow }">
                                            <a class="page-numbers current" >${i}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a  class="page-numbers" href="/tag/${articleListVoList[0].tagCustomList[0].tagId}/p/${i}">${i }</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                    &lt;%&ndash; 显示点点点 &ndash;%&gt;
                                <c:if test="${end < articleListVoList[0].page.totalPageCount-1 }">
                                    <span class="page-numbers dots">…</span>
                                </c:if>
                                    &lt;%&ndash; 显示最后一页的数字 &ndash;%&gt;
                                <c:if test="${end < articleListVoList[0].page.totalPageCount }">
                                    <a href="/tag/${articleListVoList[0].tagCustomList[0].tagId}/p/${articleListVoList[0].page.totalPageCount}">
                                            ${articleListVoList[0].page.totalPageCount}
                                    </a>
                                </c:if>
                                    &lt;%&ndash;下一页 &ndash;%&gt;
                                <c:choose>
                                    <c:when test="${articleListVoList[0].page.pageNow eq articleListVoList[0].page.totalPageCount }">
                                        &lt;%&ndash;到了尾页隐藏，下一页按钮&ndash;%&gt;
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="articleListVoList[0].page.totalPageCount>0">
                                            <a class="page-numbers" href="/tag/${articleListVoList[0].tagCustomList[0].tagId}/p/${articleListVoList[0].page.pageNow+1}">
                                                <span class="fa fa-angle-right"></span>
                                            </a>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </nav>
                        &lt;%&ndash;分页 end&ndash;%&gt;
                    </c:if>
                </c:when>
            </c:choose>


        </div><!-- .content-area -->
        &lt;%&ndash;  博客主体-左侧正文 end&ndash;%&gt;
    </rapid:override>





<%@ include file="../Public/framework.jsp" %>--%>
