<!DOCTYPE html>

<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.2.0/css/bootstrap.min.css"/>
</head>
<body>
<div class="container">
    <#if news??>
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                ${news.name}
                <small>
                    <span class="glyphicon glyphicon-time"></span>
                    Posted on ${news.date}
                </small>
            </h1>
        </div>
        <div class="col-lg-12">
            ${news.text}
        </div>
    </div>
        <hr>
        <div class="well">
            <h4>Leave a Comment:</h4>
            <div class="form-group">
                <textarea id="textAreaComment" class="form-control" rows="3"></textarea>
            </div>
            <button class="btn btn-primary" onclick="sendComment()">Submit</button>
            <span id="msg"></span>
        </div>

        <#list news.comments as item >
            <hr>
            <div class="media">
                <a class="pull-left" href="#">
                    <img class="media-object" src="http://placehold.it/64x64" alt="">
                </a>
                <div class="media-body">
                    <h4 class="media-heading">${item.authorId}</h4>
                    ${item.text}
                </div>
            </div>
        </#list>
    </#if>
</div>


<script type="text/javascript">
    function sendComment() {
        var responseLabel = document.getElementById("msg");
        var text = document.getElementById("textAreaComment");
        var xhr = new XMLHttpRequest();
        var comment = {
            news: ${news.id},
            authorId: 1,
            text: text.value
        };
        var body = JSON.stringify(comment);
        xhr.open('POST', 'http://localhost:8080/news-system/comment', true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(body);
        xhr.onreadystatechange = function () {
            if (this.readyState !==4) return;
            if (this.status !== 201) {
                if (this.status === 404) {
                    responseLabel.innerHTML="  NOT FOUNT";
                    responseLabel.style.color="RED";
                }
                if (this.status === 400) {
                    responseLabel.innerHTML="  BAD REQUEST";
                    responseLabel.style.color="RED";
                }
                if (this.status === 409) {
                    responseLabel.innerHTML="  CONFLICT";
                    responseLabel.style.color="RED";
                }
                responseLabel.innerHTML=xhr.statusText;
                return;
            }
            responseLabel.innerHTML="  SUCCESSFUL";
            responseLabel.style.color="GREEN";
            text.value='';
        }
    }
</script>
</body>
</html>