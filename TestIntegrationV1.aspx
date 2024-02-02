<%@ Page language="C#" MasterPageFile="/_catalogs/masterpage/NewIntranet.master"    Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=12.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document" meta:webpartpageexpansion="full" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=12.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=12.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Import Namespace="Microsoft.SharePoint" %> <%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=12.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:Content ContentPlaceHolderId="PlaceHolderPageTitle" runat="server">
	<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,multipages_homelink_text%>" EncodeMethod="HtmlEncode"/> 
	- <SharePoint:ProjectProperty Property="Title" runat="server"/>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageImage" runat="server"><IMG SRC="/_layouts/images/blank.gif" width=1 height=1 alt=""></asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageTitleInTitleArea" runat="server">
			<label class="ms-hidden">
			<SharePoint:ProjectProperty Property="Title" runat="server"/></label>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderTitleBreadcrumb" runat="server"/>
<asp:Content ContentPlaceHolderId="PlaceHolderTitleAreaClass" runat="server">
<style type="text/css">
TD.ms-titleareaframe, .ms-pagetitleareaframe {
	height: 10px;
}
Div.ms-titleareaframe {
	height: 100%;
}
.ms-pagetitleareaframe table {
	background: none;
	height: 10px;
}
</style>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderAdditionalPageHead" runat="server">
	<META Name="CollaborationServer" Content="SharePoint Team Web Site">
	<script type="text/javascript">
	var navBarHelpOverrideKey = "wssmain";
	</script>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderSearchArea" runat="server">
	<SharePoint:DelegateControl runat="server"
		ControlId="SmallSearchInputBox"/>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderLeftActions" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageDescription" runat="server"/>
<asp:Content ContentPlaceHolderId="PlaceHolderBodyAreaClass" runat="server">
<style type="text/css">
.ms-bodyareaframe {
	padding: 0px;
}
</style>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderMain" runat="server">
	
 <link rel="stylesheet" href="src/bootstrap/b462.css">

    <link rel="stylesheet" href="src/calendar/mini-event-calendar2.css">
    <link rel="stylesheet" href="src/css/custom2.css" />
    <link rel="stylesheet" href="src/css/customCalendar.css" />


 


     <main role="main">

         <!-- Main jumbotron for a primary marketing message or call to action -->


         <div class="container width-full  bootstrap-box-sizing">
             <!-- Example row of columns -->
            
             <div class="row color-light">
                 <div class="col-md-2">
                     <div class="row menuLeft">
                         <div class="col-12 align-self-center">
                             <a href="https://www.google.gr">   <img src="src/imgs/Intranet_side_banner_dieuthinseis.png" /> </a>
                         </div>
                     </div>
                     <div class="row menuLeft">
                         <div class="col-12 align-self-center">
                             <img src="src/imgs/Intranet_side_banner_diadikasies.png" />
                         </div>
                     </div>
                     <div class="row menuLeft">
                         <div class="col-12 align-self-center">
                             <img src="src/imgs/Intranet_side_banner_systimata.png" />
                         </div>
                     </div>
                     <div class="row menuLeft">
                         <div class="col-12 align-self-center">
                             <img src="src/imgs/Intranet_side_banner_links.png" />
                         </div>
                     </div>
                     <div class="row menuLeft">
                         <div class="col-12 align-self-center">
                             <img src="src/imgs/Intranet_side_banner_arxeio.png" />
                         </div>
                     </div>
                 </div>

                 <div class="col-md-7">
                     <div id="demo" class="carousel slide" data-ride="carousel">

                         <!-- Indicators -->
                         <ul class="carousel-indicators">
                             <li data-target="#demo" data-slide-to="0" class="active"></li>
                             <li data-target="#demo" data-slide-to="1"></li>
                             <li data-target="#demo" data-slide-to="2"></li>
                         </ul>

                         <!-- The slideshow -->
                         <div class="carousel-inner">
                             <div class="carousel-item active">
                                 <img src="src/imgs/la.jpg" alt="Los Angeles" width="1100" height="500">
                             </div>
                             <div class="carousel-item">
                                 <img src="src/imgs/chicago.jpg" alt="Chicago" width="1100" height="500">
                             </div>
                             <div class="carousel-item">
                                 <img src="src/imgs/ny.jpg" alt="New York" width="1100" height="500">
                             </div>
                         </div>

                         <!-- Left and right controls -->
                         <a class="carousel-control-prev" href="#demo" data-slide="prev">
                             <span class="carousel-control-prev-icon"></span>
                         </a>
                         <a class="carousel-control-next" href="#demo" data-slide="next">
                             <span class="carousel-control-next-icon"></span>
                         </a>
                     </div>

                     <!--<div class="mt-4 p-5 bg-primary text-white rounded">-->
                     <div class="mt-4 p-5 color-middle text-white rounded">
                         <div class="row" style="text-align:center">
                             <h3 class="display-4">NEA/ΑΝΑΚΟΙΝΩΣΕΙΣ</h3>
                             <div class="col-md-12">
                             </div>
                         </div>
                         <div class="row">
                             <div class="col-md-6">
                                 <button type="button" class="btn btn-primary p-3 padding color-middle margin btn-block pagemenu">Εσωτερικά Νέα</button>
                             </div>
                             <div class="col-md-6">
                                 <button type="button" class="btn btn-primary p-3 color-middle margin btn-block pagemenu">Δελτία Τύπου</button>
                             </div>
                         </div>
                         <div class="row">
                             <div class="col-md-6">
                                 <button type="button" class="btn btn-primary p-3 color-middle margin btn-block pagemenu">Νέες Θέσεις Εργασίας</button>
                             </div>
                             <div class="col-md-6">
                                 <button type="button" class="btn btn-primary p-3 color-middle margin btn-block pagemenu">Πολιτικές που πρέπει να διαβάσω</button>
                             </div>
                         </div>


                     </div>

                     <div class="jumbotron color-middle mt-4 p-5 text-white rounded" id="home">
                         <h1 class="display-4">Ask CEO</h1>
                         <p class="lead">Στείτε την ερώτησή σας</p>
                         <hr class="my-4">
                         <p>Want to know more? Join our mailing list!</p>

                         <label class="sr-only" for="yourEmail">Email</label>

                         <textarea class="form-control margin" style="width:80%" rows="3" placeholder="What's up?"></textarea>

                         <button type="button" class="btn btn-primary color-dark">Αποστολή</button>

                     </div>
                     <!--<div class="jumbotron color-dark topmargin" id="home">
                        <h1 class="display-4">Ask CEO</h1>
                        <p class="lead">Στείτε την ερώτησή σας</p>
                        <hr class="my-4">
                        <p>Want to know more? Join our mailing list!</p>

                        <label class="sr-only" for="yourEmail">Email</label>

                        <textarea class="form-control" style="width:80%" rows="3" placeholder="What's up?"></textarea>

                        <button type="button" class="btn btn-primary color-dark2">Αποστολή</button>

                    </div>
                    <div class="jumbotron color-dark2 topmargin" id="home">
                        <h1 class="display-4">Ask CEO</h1>
                        <p class="lead">Στείτε την ερώτησή σας</p>
                        <hr class="my-4">
                        <p>Want to know more? Join our mailing list!</p>

                        <label class="sr-only" for="yourEmail">Email</label>

                        <textarea class="form-control" style="width:80%" rows="3" placeholder="What's up?"></textarea>

                        <button type="button" class="btn btn-primary my-2 my-sm-0">Αποστολή</button>

                    </div>-->
                 </div>
                 <div class="col-md-3 calendarColumn">
                     <table height="90%">
                         <tr>
                             <td class="calendarColumn">
                                 <div id="calendar"></div>
                             </td>
                         </tr>
                     </table>

                 </div>
             </div>

             <hr>



         </div> <!-- /container -->

     </main>

   
     <!-- Bootstrap core JavaScript
    ================================================== -->
     <!-- Placed at the end of the document so the pages load faster -->
     <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
     <!-- <script>window.jQuery || document.write('<script src="https://getbootstrap.com/docs/4.0/assets/js/vendor/jquery-slim.min.js"><\/script>')</script> -->
     <!-- <script src="https://getbootstrap.com/docs/4.0/assets/js/vendor/popper.min.js"></script> -->
     <!-- <script src="https://getbootstrap.com/docs/4.0/dist/js/bootstrap.min.js"></script> -->
     <script src="src/jquery/jquery371.js"></script>
     <script src="src/bootstrap/b462.js"></script>
     <!--<script src="https://code.jquery.com/jquery-3.3.1.slim.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script> --> 
     <script src="src/calendar/mini-event-calendar.js?v=1"></script>

     <script>
         var sameDaylastWeek = new Date().setDate(new Date().getDate() - 7);
         var someDaynextMonth = new Date().setDate(new Date().getDate() + 31);

         // All dates should be provided in timestamps
         var sampleEvents = [
             {
                 title: "<ul><li>Something in English event with a <a href=\"https://www.atticabank.gr/el\"> link </a> </li><li>Η ετήσια κοπή πίτας </li><li>Το ΙΤ της Τράπεζας Ατικής σας καλεί σε μία βραδειά Καραόκε</li></ul><ul><li>Το ΙΤ της Τράπεζας Ατικής σας καλεί σε μία βραδειά που ... δεν ξέρουμε τι έχει αλλά πρέπει να σας καλέσουμε για να δούμε πως φαίνεται ένας μεγάλος τίτλος στο ημερολόγιο!</li></ul>",
                 date: sameDaylastWeek, // Same day as today, last week
                 link: "https://www.eventbrite.com/e/soulful-sundays-bay-area-edition-tickets-55214242285?aff=ehomecard"
             },
             {
                 title: "Άλλος ένας σχετικα μεγαλούτσικος  τίτλος στο ημερολόγιο!",
                 date: sameDaylastWeek, // Same day as today, last week
                 link: "https://www.eventbrite.com/e/soulful-sundays-bay-area-edition-tickets-55214242285?aff=ehomecard"
             },
             {
                 title: "Athens Bank Committe (Τράπεζα της Ελλάδος)",
                 date: new Date().getTime(), // Today
                 link: "https://www.eventbrite.co.uk/e/london-film-comic-con-summer-2019-tickets-49472593860?aff=ebdssbdestsearch"
             },
             {
                 title: "Και ένα μικρό event! ",
                 date: someDaynextMonth, // Some day as today, next month
                 link: "https://www.eventbrite.com/e/leaner-stronger-faster-tm-youth-athletic-camp-2021-tickets-38245970728?aff=ebdssbdestsearch"
             }
         ];

         $(document).ready(function () {
             $("#calendar").MEC({
                 events: sampleEvents
             });


         });
     </script>

</asp:Content>

