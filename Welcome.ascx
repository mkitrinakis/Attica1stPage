<%@ Control Language="C#"  %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="helpeServices" Namespace="helpeServices" Assembly="helpeServices, Version=1.0.0.0, Culture=neutral, PublicKeyToken=60a055a2aa37bb8b" %>

<!DOCTYPE html>
<html lang="el">

    <head>
        <meta charset="UTF-8">
        <title>Helpe Intranet</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Linking stylesheets start -->

        <!-- Global stylesheet to be used everywhere -->
        <link rel="stylesheet" href="/_layouts/15/helpe/assets/css/global.min.css?v3"> 

        <!-- Slider section stylesheet -->
        <link rel="stylesheet" href="/_layouts/15/helpe/assets/css/slider.min.css?v2"> 

        <!-- Stock section stylesheet -->
        <link rel="stylesheet" href="/_layouts/15/helpe/assets/css/stock.min.css?v1"> 

        <!-- Application section stylesheet -->
        <link rel="stylesheet" href="/_layouts/15/helpe/assets/css/applications.min.css?v3"> 

        <!-- Articles section stylesheet -->
        <link rel="stylesheet" href="/_layouts/15/helpe/assets/css/articles.min.css?v2"> 

        <!-- Union section stylesheet -->
        <link rel="stylesheet" href="/_layouts/15/helpe/assets/css/union.min.css?v1"> 

        <!-- News section stylesheet -->
        <link rel="stylesheet" href="/_layouts/15/helpe/assets/css/news.min.css?v1"> 


        <!-- Linking stylesheets end -->

    </head>
    <script>
        setTimeout(function(){
   window.location.reload(1);
}, 600000);
    </script>
    <body>

        <!-- All page container start -->
        <div id="all">

            <!-- Page content start -->
            <div id="content">
                <div id="backToTop">
                    <img class="img-fluid" src="/_layouts/15/helpe/assets/images/top.svg" alt="Πίσω στην κορυφή">
                </div>

                <!-- Header start -->
                <header id="main-header" class="w-100">
                    <nav class="navbar py-0">
                        <div class="container-fluid pe-0 d-flex align-items-center justify-content-between">
                            <div class="d-flex align-items-center">
                                <a class="navbar-brand" href="/">
                                    <img class="img-fluid" src="/_layouts/15/helpe/assets/images/logo_blue.svg" alt="HELPE">
                                </a>
                                <ul id="primary-nav" class="d-none d-lg-flex ms-5">
                                 <!--   <li><a href="">Ο Όμιλός μας</a></li>
                                    <li><a href="">Εφαρμογές</a></li>
                                    <li><a href="">Θυρίδα Προτάσεων</a></li> --> 
                                    <%=helpeServices.TopMenu.getTopMenu(Page.Request.Url.ToString()) %> 
                                </ul>
                            </div>
                            <div class="d-flex align-items-center end">
                                <span class="collapsed icon-phone color-orange" role="button" data-bs-toggle="collapse" data-bs-target="#collapsedPhone" aria-controls="collapsedPhone" aria-expanded="false" aria-label="Toggle phone"></span>
                                <span class="collapsed icon-Search color-orange" role="button" data-bs-toggle="collapse" data-bs-target="#collapsedSearch" aria-controls="collapsedSearch" aria-expanded="false" aria-label="Toggle search"></span>
                                <button class="navbar-toggler d-flex flex-column align-items-center justify-content-center collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapsedNav" aria-controls="collapsedNav" aria-expanded="false" aria-label="Toggle navigation">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </button>
                            </div>
                        </div>

                        <!-- Main menu start -->
                        <div class="collapse navbar-collapse bg-center" id="collapsedNav" style="background-image: url(/_layouts/15/helpe/assets/images/menu_back.jpg);">
                            <div class="inner-menu px-global flex-column d-flex align-items-start align-items-sm-center">
                                <div id="collapsedMenuLogo">
                                  <a href="/">  <img class="img-fluid" src="/_layouts/15/helpe/assets/images/logo_white.svg" alt="HELPE">  </a>
                                </div>
                                <div class="container-fluid w-100 p-0 collapsed-menu-container pb-6">
                                    <div class="row">
                                             <%=helpeServices.GlobalMenu.getGlobalMenu() %> 
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Main menu end -->
                        
                        <!-- Phone number menu start -->
                       <div id="collapsedPhone" class="collapse navbar-collapse">
                            <div class="inner container-fluid px-global">
                                <div class="content-box-normal mx-auto pt-5 pt-xxl-14 pb-6">
                                    <h2 class="color-white title title-lg mb-4">Αναζήτηση συναδέλφου</h2>
                                    <div class="bb-white">
                                        <input class="search color-white pb-3 text text-sm" type="text" placeholder="Πληκτρολογήστε όνομα επώνυμο ή τηλέφωνο" id="searchTermContact" onkeyup="searchContacts()">
                                        <a href="/SitePages/AltPhoneCatalog.aspx?Title=">    <span role="button" class="icon-Search search pb-3 text-lg color-white"></span>  </a>
                                        
                                    </div>
                                    <div class="search-content mt-5" id="contentContact">

                                     
                                        <!-- Phone Number Menu End -->

                                    </div>
                                </div>
                            </div>
                        </div>
                   

                         <div id="collapsedSearch" class="collapse navbar-collapse">
                            <div class="inner container-fluid px-global">
                                <div class="content-box-normal mx-auto pt-5 pt-xxl-14 pb-6">
                                    <h2 class="color-white title title-lg mb-4">Αναζήτηση περιεχομένου</h2>
                                    <div class="bb-white">
                                        <input class="search color-white pb-3 text text-sm" type="text" placeholder="Πληκτρολογήστε τον όρο που θέλετε να αναζητήσετε" id="searchTerm">
                                    <a href="javascript:window.location.href = '/_layouts/15/osssearchresults.aspx?k=' + $('#searchTerm').val()">    <span role="button" class="icon-Search search pb-3 text-lg color-white"></span>  </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </nav>
                </header>
                <!-- Header end -->

                <!-- Slider start -->
                 <section id="slider" class="slider mb-5">

                   <%=helpeServices.Slider.getSlider() %>   
                </section>
                    <!-- Individual slider end -->

             

              
                <!-- Slider end -->

                <!-- Background wrapper start 
                All sections in this div will share its background -->
                <div class="bg" style="background-image: url('/_layouts/15/helpe/assets/images/backgrounds/lines_background.png')">
                
                    <!-- Stock price section start -->
                    <section id="stock" class="container-fluid px-global mb-7">

                        <div class="row">

                            <%=helpeServices.PricesWeather.getPricesWeather() %>   

                        </div>

                    </section>
                    <!-- Stock price section end -->


                     <!-- Banner section start -->
                    <section class="container-fluid px-global mb-10 mb-md-14">
                        
                           <%=helpeServices.AdPromote.getAdPromote() %>
                        </section> 

                    <!-- Banner section end -->

                                   

                      
                    <a id="applications_anchor"></a>
                    <section id="applications" class="container-fluid px-global mb-10 mb-md-17">
                        <h2 class="title title-lg mb-9 color-blue-dark">Εφαρμογές</h2>

                          <div id="application-slider" class="row">

                          <%=helpeServices.Efarmoges.getEfarmoges() %>

                        </div>

                        <!-- See all applications button start 
                        <div class="text-center">
                            <a class="btn btn-green d-block d-sm-inline-block">Δες όλες τις εφαρμογές</a>
                        </div>
                        <!-- See all applications button end -->

                    </section>
                    <!-- Application section end -->
                    

                   <!-- Articles section start -->
                    <div id="articles" class="container-fluid px-global mb-8 mb-md-18">
                        <div class="row">
                           <%=helpeServices.Ads.getAds() %>
                        </div>
                    
                    </div>
                    <!-- Articles section end -->

                </div>
                <!-- Background wrapper end -->

                
              
                

                  <!-- News section start -->
                <section id="news" class="container-fluid bg-top-right px-global py-8 py-md-10 py-lg-14 mb-8 mb-md-10 mb-lg-14" style="background-image: url('/_layouts/15/helpe/assets/images/backgrounds/news_background.jpg')">
                    <div class="row gx-lg-5 gx-xl-8 gx-xxl-18">
                        <div class="news col-12 col-lg-6 coorporate-news mb-8 mb-md-0">
                            <h2 class="title title-lg mb-6 mb-md-8 color-white">Εταιρικά νέα</h2>
                            <%=helpeServices.Nea.getEtairikaNea() %>
                            <div class="text-center">
                                <a href="/nea/Lists/announce2/EndUserView.aspx" class="btn btn-green mt-6 mt-md-9 d-block d-sm-inline-block">Δείτε όλα τα εταιρικά νέα</a>
                            </div>
                        </div>
                        <div class="news col-12 col-lg-6 energy-news">
                            <h2 class="title title-lg mb-6 mb-md-8 color-white">Ενεργειακά νέα</h2>
                              <%=helpeServices.Nea.getEnergiakaNea() %>
                            <div class="text-center">
                                <a href="/nea/Documents/Forms/EndUserView.aspx"  class="btn btn-green mt-6 mt-md-9 d-block d-sm-inline-block">Δείτε όλα τα ενεργειακά νέα</a>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- News section end -->

                <!-- Social section start   With all Socials 
                <section class="container-fluid px-global">
                    <h2 class="title title-lg color-blue-dark mb-7">Social Media</h2>
                    <div class="tagembed-container" style=" width:100%;height:100%;overflow: auto;">
                        <div class="tagembed-socialwall" data-wall-id="49426" data-view-url="https://widget.tagembed.com/49426?view"></div>
                            <script src="//widget.tagembed.com/embed.min.js"></script>
                        </div>
                </section>   --> 
               
                <!-- Social section Start (only LinkedIn)-->
                <section class="container-fluid px-global">

                    <h2 class="title title-lg color-blue-dark mb-7">Social Media</h2>

                    <div class="tagembed-container" style=" width:100%;height:100%;overflow: auto;">

                        <div class="tagembed-socialwall" data-wall-id="57563" view-url="https://widget.tagembed.com/57563?view"></div>

                        <script src="//widget.tagembed.com/embed.min.js" type="text/javascript"></script>

                    </div>

                </section>  
                <!-- Social section end -->
                <a id="opinion_anchor"> </a>
                <!-- Opinion section start -->
                <section id="opinion" class="container-fluid px-global bg-center py-18" style="background-image: url('/_layouts/15/helpe/assets/images/backgrounds/opinion_background.jpg')">
                    
                    <div class="content-box">
                        <h2 class="title title-xl color-white mb-3">H γνώμη σου μετράει!</h2>
                        <p class="text text-lg color-white mb-8">Η γνώμη σου μετράει! Στείλε μας τις ιδέες και τις προτάσεις σου με email μέσω της θυρίδας προτάσεων</p>
                         <a class="btn btn-green d-block d-sm-inline-block" href="mailto:thyridaprotaseon@helleniq.gr">Αποστολή προτάσεων</a>
                    </div>
                </section>
                 <a id="footer_logo_anchor"> </a>
                  <footer class="bg-grey bg-footer" style="background-image: url('/_layouts/15/helpe/assets/images/backgrounds/lines_background.png')">
                     <section class="container-fluid px-global pt-5">
                    <div id="union" class="d-flex h-100 justify-content-between align-items-center pb-5">
                        <div class="d-flex flex-column flex-lg-row h-100 align-items-start align-items-lg-center">
                             <h2 class="title title-md color-blue-dark">Συνδικαλιστικοί Φορείς</h2>
                             <p class="text text-sm mt-3 mt-lg-1 union-max-width ps-0 ps-lg-5 color-blue-darker"><a href="/union/SitePages/union.aspx" class="color-blue-darker">
                                Οι ανακοινώσεις των συνδικαλιστικών φορέων των εταιρειών του Ομίλου</a></p>
                        </div>
                        <!-- If has news add the has news class -->
                        <%=helpeServices.Union.getUnionAlert() %>
                         
                        </div>
                </section>
                    <div class="footer-top container-fluid px-global pt-5 pb-7">
                        
                        <div id="footer-logo" class="mb-5">
                            <img src="/_layouts/15/helpe/assets/images/logo_blue.svg" alt="HELPE">
                        </div>
                        <div class="row">
                            <div class="col-12 col-lg-6 col-xxl-6 mb-5">
                                <h2 class="title title-sm mb-4 color-blue-dark">Sites ομίλου</h2>
                                <nav class="group-sites">
                                    <ul>
                                    <%=helpeServices.Footer.getSites() %>
                                    </ul>
                                </nav>
                            </div>
                          <div class="col-12 col-lg-6 col-xxl-6">
                                <h2 class="title title-sm mb-4 color-blue-dark">Ακολουθήστε μας στα social</h2>
                                 <%=helpeServices.Footer.getSocials() %>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid px-global d-flex flex-column flex-md-row align-items-center justify-content-between py-3">
        <span class="text text-xs color-blue-darker mb-3 mb-md-0">Copyright © 2022 Helpe &nbsp;&nbsp; | &nbsp;&nbsp; <a class="color-blue-darker" href="/SitePages/%CE%8C%CF%81%CE%BF%CE%B9%20%CE%A7%CF%81%CE%AE%CF%83%CE%B7%CF%82.aspx">Intranet - Όροι Χρήσης </a></span>
        
    </div>
                </footer>

            </div>
            <!-- Page content end -->

        </div>
        <!-- All page container start -->

        <script defer src="/_layouts/15/helpe/assets/js/dist/global.js"></script>
        <script defer src="/_layouts/15/helpe/assets/js/dist/slider.js"></script>
        <script defer src="/_layouts/15/helpe/assets/js/dist/stock.js"></script>
        <script defer src="/_layouts/15/helpe/assets/js/dist/application.js"></script> 
          <script defer src="/_layouts/15/helpe/assets/js/phone/phone.js?v1"></script>  <!-- InTTrust implementation --> 
      

    </body>

</html>