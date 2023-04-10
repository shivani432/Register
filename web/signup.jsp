<%-- 
    Document   : signup
    Created on : 08-Apr-2023, 9:25:10 am
    Author     : shivani kantak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </head>


    <!---------------------------------------backround of formmm--------------------------------------------------------------------->
    <body style="background: url(img/pexels-photos.jpg.jpg); background-size: cover; background-attachment: fixed ">



        <div class="container">
            <div class="row">
                <div class="col m6 offset-m3">
                    <div class="card">
                        <div class="card-content">



                            <!---------------------------------------heading of form------------------------------------------------------>
                            <h3 style="margin-top:10px" class="center-align">Register here !!</h3>
                            <h6 id="msg" class="center-align"></h6>



                            <!--------------------------------------MMMMMMMMMMMMMMMMMY FORMMMMMMMMMMM--------------------------------------------------------->
                            <div class="form center-align">
                                <form action="Register" method="post" id="myform">
                                    <input type="text" name="user_name" placeholder="Enter here name"/>
                                    <input type="password" name="user_password" placeholder="Enter here password"/>
                                    <input type="text" name="user_email" placeholder="Enter here email"/>
                           
                                    <!-------------------------------------input field-------------------------->        
                                    <div class="file-field input-field">
                                        <div class="btn #c51162 pink accent-4 ">
                                            <span>File</span>
                                            <input name="image" type="file">
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input class="file-path validate" type="text">
                                        </div>
                                    </div>

                                    <button type="submit" class="btn #c51162 pink accent-4">submit</button>

                                </form>

                            </div>

                            <!-----------------------------------------------MY LOADERRRRRRRRR---------------------------------------------------------------->
                            <div class="loader center-align" style="margin-top: 10px display; display: none;">
                                <div class="preloader-wrapper active">
                                    <div class="spinner-layer spinner-red-only">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
                                </div>

                                <h5>please wait...</h5>

                            </div>
                            <!-------------------------------------------------LOADER ENDING------------------------------------------------------------------>

                        </div>                       
                    </div>     
                </div>
            </div>


            <!-----------------------------------------------------ADD JQUERY CDN------------------------------------------------------------->
            <script src="https://code.jquery.com/jquery-3.6.4.min.js"
                    integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
            crossorigin="anonymous"></script>
            <!---------------------------------------------------------X-X-X------------------------------------------------------------------> 

            <script>

                $(document).ready(function () {

                    console.log("page is ready...");

                    $("#myform").on('submit', function (event) {
                        event.preventDefault();

//                        var f = $(this).serialize();
                    
        let f= new FormData(this);

                        console.log(f);
                        $(".loader").show();
                        $(".form").hide();


                        $.ajax({
                            url: "Register",
                            data: f,
                            type: 'POST',

                            success: function (data, textStatus, jqXHR) {
                                console.log(data);
                                console.log("success....");
                                $(".loader").hide();
                                $(".form").show();

                                if (data.trim() === 'done') {
                                    $('#msg').html("successfully Registered !!")
                                    $('#msg').addClass('green-text')

                                } else {
                                    $('#msg').html("Somthing went wrong on server")
                                    $('#msg').addClass('red-text')
                                }
                            },

                            error: function () {
                                console.log(data);
                                console.log("error....");
                                $(".loader").hide();
                                $(".form").show();
                                $('#msg').html("Somthing went wrong on server")
                                $('#msg').addClass('red-text')
                            },
                            
                            processData: false,
                            contentType: false
                            
                        })
                    })
                });

            </script>

    </body>
</html>
