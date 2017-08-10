<!DOCTYPE html>

<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://blackrockdigital.github.io/startbootstrap-1-col-portfolio/css/bootstrap.min.css"/>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <h1 id="header" class="page-header">
                <#if !edit>
                    Create News
                <#else>
                    Edit News: ${news.name}
                </#if>
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="well">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon1">Name: </span>
                <input type="text" id="name" class="form-control" aria-describedby="basic-addon1" value="<#if news.name??>${news.name}</#if>">
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon1">Date: </span>
                <input type="date"  id="date" class="form-control" aria-describedby="basic-addon1" value="<#if news.date??>${news.date?string["yyyy-MM-dd"]}</#if>">
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon1">Text: </span>
                <textarea id="text" class="form-control" rows="5" aria-describedby="basic-addon1"><#if news.text??>${news.text}</#if></textarea>
            </div>
            <br>
            <button class="btn btn-primary" onclick="<#if !edit>createNews()<#else>updateNews()</#if>">Save</button>
            <span id="msg"></span>
        </div>
    </div>

</div>
<script type="text/javascript">
    function updateNews() {
        var responseLabel = document.getElementById("msg");
        var xhr = new XMLHttpRequest();
        var news = {
            id: ${news.id},
            name: document.getElementById("name").value,
            date: document.getElementById("date").value,
            text: document.getElementById("text").value
        };
        var body = JSON.stringify(news);
        xhr.open('POST', 'http://localhost:8080/news-system/update', true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(body);
        xhr.onreadystatechange = function () {
            if (this.readyState !==4) return;
            if (this.status !== 200) {
                if (this.status === 404) {
                    responseLabel.innerHTML="  NOT FOUNT";
                    responseLabel.style.color="RED";
                }
                if (this.status === 400) {
                    responseLabel.innerHTML="  BAD REQUEST";
                    responseLabel.style.color="RED";
                }
                responseLabel.innerHTML=xhr.statusText;
                return;
            }
            responseLabel.innerHTML="  SUCCESSFUL";
            responseLabel.style.color="GREEN";
            document.getElementById("name").value='';
            document.getElementById("date").value='';
            document.getElementById("text").value='';
        }
    }
    function createNews() {
        var responseLabel = document.getElementById("msg");
        var xhr = new XMLHttpRequest();
        var news = {
            name: document.getElementById("name").value,
            date: document.getElementById("date").value,
            text: document.getElementById("text").value
        };
        var body = JSON.stringify(news);
        xhr.open('POST', 'http://localhost:8080/news-system/create', true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(body);
        xhr.onreadystatechange = function () {
            if (this.readyState !==4) return;
            if (this.status === 500) {
                responseLabel.innerHTML="  SERVER ERROR";
                responseLabel.style.color="RED";
            }
            if (this.status !== 201) {
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
            document.getElementById("name").value='';
            document.getElementById("date").value='';
            document.getElementById("text").value='';
        }
    }
</script>
</body>
</html>