# 关于页码
1.页码溢出问题</br>
当我们的数据库中的总条数`（totalCount）`和每页显示数`（pageSize）`不能够整除的时候，我们可能会遇到页码溢出的问题,如我们当前的总页数只有5页的情况下，
可能会多出现第六页第第七页的情况，但是在第六页第七页根本就没有数据可以显示了，这个时候就需要在jsp页面上做出判断，针对当前页的前一页和当前页的后一页进行
赋值，页码溢出的具体情况如图所示</br>
![image](https://github.com/wangbingzhigit/BYSJ/blob/master/src/main/resources/pic1.png)
</br>
我们解决方式如下代码所示：</br>
```
<%--end代表当前页的后一页，begin代表当前页的前一页--%>
<c:if test="${end > articleListVoList[0].page.totalPageCount }">
     <c:set var="begin" value="${articleListVoList[0].page.totalPageCount-2 }"/>
     <c:set var="end" value="${articleListVoList[0].page.totalPageCount }"/>
</c:if>
```
解决溢出问题之后如图所示：</br>
![image](https://github.com/wangbingzhigit/BYSJ/blob/master/src/main/resources/pic2.png)
