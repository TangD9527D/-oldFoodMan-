<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <jsp:include page="menu.jsp" />
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
        <title>${title}</title>
        <style>
            .outside {
                background-color: rgba(240, 148, 235, 0.9);
                height: 1000px;
            }
            
            .roadImg{
                width: 75%;
                height: auto;
            }

            .road{
                margin-top: 20px;
                text-align: center
            }


        </style>
    </head>

    <body>
        <div class="container">
            <div class="outside">
                <h5>Message : <span>${message}</span></h5>
                <div class="road">
                <img src="images/road.png" class="roadImg">
                </div>
            </div>

        </div>
    </body>

    </html>