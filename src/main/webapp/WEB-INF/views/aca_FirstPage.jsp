<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
response.setHeader("pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.addHeader("Cache-Control","No-store");
response.setDateHeader("Expires",1L);
%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        
        <title>환영합니다</title>
        <!-- Font Awesome icons (free version)-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
        <script src="login_bootstrap/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="mainpage_bootstrap/css/styles.css" rel="stylesheet">
        <!-- Fonts CSS-->
        <link rel="stylesheet" href="mainpage_bootstrap/css/heading.css">
        <link rel="stylesheet" href="mainpage_bootstrap/css/body.css">
    </head>
    <body id="page-top">

        <%
		String login_session = (String)request.getAttribute("conn_se");
		System.out.println("현재 Session :" + login_session);
	    %>
        
        <nav class="navbar navbar-expand-lg bg-secondary fixed-top" id="mainNav">
            <div class="container"><a class="navbar-brand js-scroll-trigger" href="#page-top">SKH</a>
                <button class="navbar-toggler navbar-toggler-right font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">Menu <i class="fas fa-bars"></i></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#portfolio">게시물</a>
                        </li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#about">ABOUT</a>
                        </li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#contact">연락처</a>
                        </li>
                        <%
                            if(login_session != null){
                        %>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="aca_Logout.p">로그아웃</a>
                        </li>
                        <% 
                            }else{
                        %>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="aca_LoginPage.p">로그인</a>
                        </li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="aca_membershipJoinPage.p">회원가입</a>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </div>
            </div>
        </nav>
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <img class="masthead-avatar mb-5" src="mainpage_bootstrap/assets/img/avataaars.svg" alt=""> 
                <%
                    if(login_session != null){
                %>
                <h1 class="masthead-heading mb-0">${user_name}님 환영합니다</h1>
                <% 
                    }else{
                %>
                <h1 class="masthead-heading mb-0">환영합니다</h1>
                <%
                    }
                %>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p class="pre-wrap masthead-subheading font-weight-light mb-0"> </p>
            </div>
        </header>
        <section class="page-section portfolio" id="portfolio">
            <div class="container">
                <!-- Portfolio Section Heading-->
                <div class="text-center">
                    <h2 class="page-section-heading text-secondary mb-0 d-inline-block">게시물</h2>
                </div>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Grid Items-->
                <div class="row justify-content-center"  id= "test11">
                    <!-- Portfolio Items-->
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal0">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="jb-text" class="lead font-weight-bold" id="port0"></div>
                                <div class="portfolio-item-caption-content text-center text-white"></div> <!-- <i class="fas fa-plus fa-3x"></i> -->
                            </div><img class="img-fluid" src="mainpage_bootstrap/assets/img/portfolio/Coding_img.png" alt="Ki Cake"/>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal1">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                            	<div class="jb-text" class="lead font-weight-bold" id="port1"></div>
                                <div class="portfolio-item-caption-content text-center text-white"></div> <!-- <i class="fas fa-plus fa-3x"></i> -->
                            </div><img class="img-fluid" src="mainpage_bootstrap/assets/img/portfolio/Coding_img.png" alt="Tasty Cake"/>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal2">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                            	<div class="jb-text" class="lead font-weight-bold" id="port2"></div>
                                <div class="portfolio-item-caption-content text-center text-white"></div> <!-- <i class="fas fa-plus fa-3x"></i> -->
                            </div><img class="img-fluid" src="mainpage_bootstrap/assets/img/portfolio/Coding_img.png" alt="Controller"/>
                        </div>
                    </div>
                </div>
                <div class="portfolio-item-caption-content text-center text-white" class="append_div">
                    <button type="button" class="appendboard">More</button>
                </div>
            </div>
        </section>
        <!-- Portfolio Modal-->
         
        <div class="portfolio-modal modal fade" id="portfolioModal0" tabindex="-1" role="dialog" aria-labelledby="#portfolioModal0Label" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fas fa-times"></i></span></button>
                    <div class="modal-body text-center">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    
                                    <h2 class="portfolio-modal-title text-secondary mb-0" id="">Log Cabin</h2>
                                   
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div> 
                                    <p class="mb-5">\</p>
                                    <button class="btn btn-primary" href="#" data-dismiss="modal"><i class="fas fa-times fa-fw"></i>Close Window</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-labelledby="#portfolioModal1Label" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fas fa-times"></i></span></button>
                    <div class="modal-body text-center">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                  
                                    <h2 class="portfolio-modal-title text-secondary mb-0">Tasty Cake</h2>
                                    
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    <img class="img-fluid rounded mb-5" src="mainpage_bootstrap/assets/img/portfolio/cake.png" alt="Tasty Cake"/>
                                    
                                    <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit.Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                                    <button class="btn btn-primary" href="#" data-dismiss="modal"><i class="fas fa-times fa-fw"></i>Close Window</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-labelledby="#portfolioModal2Label" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fas fa-times"></i></span></button>
                    <div class="modal-body text-center">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    
                                    <h2 class="portfolio-modal-title text-secondary mb-0">Controller</h2>
                                    
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    <img class="img-fluid rounded mb-5" src="mainpage_bootstrap/assets/img/portfolio/game.png" alt="Controller"/>
                                   
                                    <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit.Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                                    <button class="btn btn-primary" href="#" data-dismiss="modal"><i class="fas fa-times fa-fw"></i>Close Window</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <section class="page-section bg-primary text-white mb-0" id="about">
            <div class="container">
                <!-- About Section Heading-->
                <div class="text-center">
                    <h2 class="page-section-heading d-inline-block text-white">ABOUT</h2>
                </div>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- About Section Content-->
                <div class="row">
                    <div class="col-lg-4 ml-auto">
                        <p class="pre-wrap lead">Freelancer is a free bootstrap theme created by Start Bootstrap. The download includes the complete source files including HTML, CSS, and JavaScript as well as optional SASS stylesheets for easy customization.</p>
                    </div>
                    <div class="col-lg-4 mr-auto">
                        <p class="pre-wrap lead">You can create your own custom avatar for the masthead, change the icon in the dividers, and add your email address to the contact form to make it fully functional!</p>
                    </div>
                </div>
            </div>
        </section>
        <section class="page-section" id="contact">
            <div class="container">
                <!-- Contact Section Heading-->
                <div class="text-center">
                    <h2 class="page-section-heading text-secondary d-inline-block mb-0">연락처</h2>
                </div>
                <!-- Icon Divider-->
                <!--
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                -->
                <!-- Contact Section Content-->
                <div class="row justify-content-center">
                    <div class="col-lg-4">
                        <div class="d-flex flex-column align-items-center">
                            <div class="icon-contact mb-3"><i class="fas fa-mobile-alt"></i></div>
                            <div class="text-muted">Phone</div>
                            <div class="lead font-weight-bold">010-7750-6949</div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="d-flex flex-column align-items-center">
                            <div class="icon-contact mb-3"><i class="far fa-envelope"></i></div>
                            <div class="text-muted">Email</div><a class="lead font-weight-bold" href="mailto:gill1994@naver.com">gill1994@naver.com</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <script>

        var board_map = []
        var board_length = 0
        $(document).ready(function(){
        	$.ajax({
				url : "boardAll.p",
				type :"POST",
				success : function(data){
					board_map = data
					board_length = board_map.length
					console.log(board_length)
					for(var i=0; i<3; i++){
						$('#port'+i).text(board_map[i].title)
					}
	            },
	            error:function(request,status,error){
	    		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    		}
        	}); 
        });
        var count = 3

        
        $('.appendboard').click(function(){
            if(count < board_length){
	        	$('#test11').append(
	                    '<div class="col-md-6 col-lg-4 mb-5">'
	                    +	'<div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal'+count+'">'
	                    +  		'<div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">'
	                    +   		'<div class="jb-text" class="lead font-weight-bold" >'+board_map[count].title+'</div>'
	                    +    		'<div class="portfolio-item-caption-content text-center text-white"></div>'
	                    +  		'</div><img class="img-fluid" src="mainpage_bootstrap/assets/img/portfolio/Coding_img.png" alt="Ki Cake"/>'
	                    +  '</div>'
	                    + '</div>'
	            );
	            $('#page-top').append(
	            		'<div class="portfolio-modal modal fade" id="portfolioModal'+count+'" tabindex="-1" role="dialog" aria-labelledby="#portfolioModalLabel" aria-hidden="true">'
	                   +'<div class="modal-dialog modal-xl" role="document">'
	                   +    '<div class="modal-content">'
	                   +        '<button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fas fa-times"></i></span></button>'
	                   +         '<div class="modal-body text-center">'
	                   +             '<div class="container">'
	                   +                 '<div class="row justify-content-center">'
	                   +                    '<div class="col-lg-8">'
	                   +                         '<h2 class="portfolio-modal-title text-secondary mb-0">'+board_map[count].title+'</h2>'
	                   +                         '<div class="divider-custom">'
	                   +                             '<div class="divider-custom-line"></div>'
	                   +                             '<div class="divider-custom-icon"><i class="fas fa-star"></i></div>'
	                   +                            '<div class="divider-custom-line"></div>'
	                   +                         '</div>' 
	                                          //  '<img class="img-fluid rounded mb-5" src="mainpage_bootstrap/assets/img/portfolio/cabin.png" alt="Log Cabin"/>'
	                   +                         '<p class="mb-5">'+board_map[count].content+'</p>'
	                   +                         '<button class="btn btn-primary" href="#" data-dismiss="modal"><i class="fas fa-times fa-fw"></i>Close Window</button>'
	                   +                     '</div>'
	                   +                 '</div>'
	                   +             '</div>'
	                   +         '</div>'
	                   +     '</div>'
	                   +  '</div>'
	                   + '</div>'
				);
            	count += 1
            }else{
				alert("더이상 게시물이 존재하지 않습니다.")
            }
        })
    	
        </script>
        <!-- Copyright Section-->
        <section class="copyright py-4 text-center text-white">
            <div class="container"><small class="pre-wrap">Copyright © Your Website 2020</small></div>
        </section>
        <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->
        <div class="scroll-to-top d-lg-none position-fixed"><a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top"><i class="fa fa-chevron-up"></i></a></div>
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <!-- Core theme JS-->
        <script src="mainpage_bootstrap/js/scripts.js"></script>
    </body>
</html>