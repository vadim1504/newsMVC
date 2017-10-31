<!DOCTYPE html>

<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.2.0/css/bootstrap.min.css"/>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">News page
            <small>
                <a class="btn btn-primary" href="/news-system/new">Create News</a>
            </small>
            </h1>
        </div>
    </div>

    <#if news??>
        <#list news as item >
            <div class="row">
                <div class="col-md">
                    <h3>${item.name}</h3>
                    <p>${item.text}</p>
                    <a class="btn btn-primary" href="/news-system/${item.id}">View News <span class="glyphicon glyphicon-chevron-right"></span></a>
                    <a class="btn btn-primary" href="/news-system/edit-${item.id}-news">Edit News <span class="glyphicon glyphicon-wrench"></span></a>
                    <a class="btn btn-primary" href="/news-system/delete-${item.id}-news">Delete News <span class="glyphicon glyphicon-trash"></span></a>
                </div>
            </div>
        </#list>
    </#if>

    <div class="row text-center">
        <div class="col-lg-12">
            <ul class="pagination">
                <li>
                    <#if currentPage==0>
                        <a href="">&laquo;</a>
                    <#else>
                        <a href="/news-system?page=${currentPage-1}">&laquo;</a>
                    </#if>
                </li>
                <#if nPage??>
                    <#list 0..nPage-1 as i>
                        <#if i==currentPage>
                            <li class="active">
                        <#else>
                            <li>
                        </#if>
                        <a href="/news-system?page=${i}">${i+1}</a>
                        </li>
                    </#list>
                </#if>
                <li>
                <#if currentPage==nPage-1>
                    <a href="">&raquo;</a>
                <#else>
                    <a href="/news-system?page=${currentPage+1}">&raquo;</a>
                </#if>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>