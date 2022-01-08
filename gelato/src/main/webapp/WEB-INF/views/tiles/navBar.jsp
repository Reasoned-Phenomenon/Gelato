<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- Sidebar  -->
         <nav id="sidebar">
            <div class="sidebar_blog_1">
               <div class="sidebar-header">
                  <div class="logo_section">
                     <a href="index.html"><img class="logo_icon img-responsive" src="${path}/resources/images/logo/logo_icon.png" alt="#" /></a>
                  </div>
               </div>
               <div class="sidebar_user_info">
                  <div class="icon_setting"></div>
                  <div class="user_profle_side">
                     <div class="user_img"><img class="img-responsive" src="${path}/resources/images/layout_img/user_img.jpg" alt="#" /></div>
                     <div class="user_info">
                        <h6>John David</h6>
                        <p><span class="online_animation"></span> Online</p>
                     </div>
                  </div>
               </div>
            </div>
            <div class="sidebar_blog_2">
               <h4>Gelato</h4>
               <!-- 메뉴 시작 -->
               <ul class="list-unstyled components">
               
               	<!-- 정보 메뉴 -->
                  <li class="active">
                     <a href="#common" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-cog yellow_color"></i> <span>정보 관리</span></a>
                     <ul class="collapse list-unstyled" id="common">
                        <li>
                           <a href="${path }/com/comCode.do">> <span>공통 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>자재 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>BOM 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>완제품 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>거래처 코드 관리</span></a>
                        </li>
                      
                     </ul>
                  </li>
                  
                  <!-- 영업 관리 메뉴 -->
                  <li class="active">
                     <a href="#sales" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-cog yellow_color"></i> <span>영업 관리</span></a>
                     <ul class="collapse list-unstyled" id="sales">
                        <li>
                           <a href="#">> <span>공통 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>자재 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>BOM 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>완제품 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>거래처 코드 관리</span></a>
                        </li>
                        
                     </ul>
                  </li>
                  
                  <!-- 자재관리 메뉴 -->
                  <li class="active">
                     <a href="#MATERIAL" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-cog yellow_color"></i> <span>자재 관리</span></a>
                     <ul class="collapse list-unstyled" id="MATERIAL">
                        <li>
                           <a href="#">> <span>공통 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>자재 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>BOM 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>완제품 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>거래처 코드 관리</span></a>
                        </li>
                        
                     </ul>
                  </li>
                  
                <!-- 생산관리 메뉴 -->
                  <li class="active">
                     <a href="#production" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-cog yellow_color"></i> <span>생산 관리</span></a>
                     <ul class="collapse list-unstyled" id="production">
                        <li>
                           <a href="#">> <span>공통 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>자재 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>BOM 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>완제품 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>거래처 코드 관리</span></a>
                        </li>
                        
                     </ul>
                  </li>
                  
                  <!-- 설비관리 메뉴 -->
                  <li class="active">
                     <a href="#EQUIPMENT" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-cog yellow_color"></i> <span>설비 관리</span></a>
                     <ul class="collapse list-unstyled" id="EQUIPMENT">
                        <li>
                           <a href="#">> <span>공통 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>자재 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>BOM 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>완제품 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>거래처 코드 관리</span></a>
                        </li>
                        
                     </ul>
                  </li>
                  
                  <!-- 관리자 메뉴 -->
                  <li class="active">
                     <a href="#ADMIN" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-cog yellow_color"></i> <span>관리자</span></a>
                     <ul class="collapse list-unstyled" id="ADMIN">
                        <li>
                           <a href="#">> <span>공통 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>자재 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>BOM 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>완제품 코드 관리</span></a>
                        </li>
                        
                        <li>
                           <a href="#">> <span>거래처 코드 관리</span></a>
                        </li>
                      
                     </ul>
                  </li>
                  
                  <!-- 
                  <li class="active">
                     <a href="#dashboard" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-dashboard yellow_color"></i> <span>Dashboard</span></a>
                     <ul class="collapse list-unstyled" id="dashboard">
                        <li>
                           <a href="#">> <span>Default Dashboard</span></a>
                        </li>
                        <li>
                           <a href="#">> <span>Dashboard style 2</span></a>
                        </li>
                     </ul>
                  </li>
                  <li><a href="widgets.html"><i class="fa fa-clock-o orange_color"></i> <span>Widgets</span></a></li>
                  <li>
                     <a href="#element" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-diamond purple_color"></i> <span>Elements</span></a>
                     <ul class="collapse list-unstyled" id="element">
                        <li><a href="#">> <span>General Elements</span></a></li>
                        <li><a href="#">> <span>Media Gallery</span></a></li>
                        <li><a href="#">> <span>Icons</span></a></li>
                        <li><a href="#">> <span>Invoice</span></a></li>
                     </ul>
                  </li>
                  <li><a href="tables.html"><i class="fa fa-table purple_color2"></i> <span>Tables</span></a></li>
                  <li>
                     <a href="#apps" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-object-group blue2_color"></i> <span>Apps</span></a>
                     <ul class="collapse list-unstyled" id="apps">
                        <li><a href="#">> <span>Email</span></a></li>
                        <li><a href="#">> <span>Calendar</span></a></li>
                        <li><a href="#">> <span>Media Gallery</span></a></li>
                     </ul>
                  </li>
                  <li><a href="price.html"><i class="fa fa-briefcase blue1_color"></i> <span>Pricing Tables</span></a></li>
                  <li>
                     <a href="contact.html">
                     <i class="fa fa-paper-plane red_color"></i> <span>Contact</span></a>
                  </li>
                  <li class="active">
                     <a href="#additional_page" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-clone yellow_color"></i> <span>Additional Pages</span></a>
                     <ul class="collapse list-unstyled" id="additional_page">
                        <li>
                           <a href="#">> <span>Profile</span></a>
                        </li>
                        <li>
                           <a href="#">> <span>Projects</span></a>
                        </li>
                        <li>
                           <a href="#">> <span>Login</span></a>
                        </li>
                        <li>
                           <a href="#">> <span>404 Error</span></a>
                        </li>
                     </ul>
                  </li>
                  <li><a href="#"><i class="fa fa-map purple_color2"></i> <span>Map</span></a></li>
                  <li><a href="#"><i class="fa fa-bar-chart-o green_color"></i> <span>Charts</span></a></li>
                  <li><a href="#"><i class="fa fa-cog yellow_color"></i> <span>Settings</span></a></li>
                   -->
               </ul>
            </div>
         </nav>
         <!-- end sidebar -->