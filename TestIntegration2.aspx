<%@ Page language="C#" MasterPageFile="/_catalogs/masterpage/NewIntranet.master"    Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=12.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document" %>
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
     <!--              <img src="src/imgs/la.jpg" alt="Los Angeles" width="770" height="350">  --> 
<!--     <img class="img-fluid w-100" src="src/imgs/Welcome.jpg" alt="Welcome" >  --> 
                     <!--<div class="mt-4 p-5 bg-primary text-white rounded">-->
                 <div class="welcome-parent">
   <img class="img-fluid w-100" src="src/imgs/Welcome.jpg" alt="">


   <div class="welcome-bottom-left">Καλως ήρθες  <asp:PlaceHolder runat="server"><%= FirstPage.WelcomeMsg.getUserName() %> </asp:PlaceHolder></div>
					 
</div>


   <div class="mt-4 p-5 color-middle text-white rounded">
                         <div class="row" style="text-align:center">
                             <h3 class="display-4">NEA/ΑΝΑΚΟΙΝΩΣΕΙΣ</h3>
                             <div class="col-md-12">
                             </div>
                         </div>
                         <div class="row">
                             <div class="col-md-4">
<img class="newsButton" src="src/imgs/deltiatypou.jpg" alt="Deltia Typou"/>
                             </div>
                             <div class="col-md-4">
<img class="newsButton" src="src/imgs/deltiatypou.jpg" alt="Deltia Typou"/>
                             </div>
                             <div class="col-md-4">
<img class="newsButton" src="src/imgs/deltiatypou.jpg" alt="Deltia Typou"/>
                             </div>
                         </div>
                         <div class="row">
                         <div class="col-md-12"></div>
                         <div class="newsFooter"></div>
                         </div>
                     </div>


                     <div class="jumbotron color-middle mt-4 p-5 text-white rounded" id="home">
                         <h1 class="display-4">Ask CEO</h1>
                         <p class="lead">Στείτε την ερώτησή σας</p>
                         <hr class="my-4">
                         <p>Want to know more? Join our mailing list!</p>

                         <label class="sr-only" for="yourEmail">Email</label>

                         <textarea id="askCEOTextArea" class="form-control margin" style="width:80%" rows="3" placeholder="What's up?"></textarea>

                         <button type="button" class="btn btn-primary color-dark" onclick='postAskCEO()' >Αποστολή</button>

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
     <script src="src/jquery/jquery351.js"></script>
     <script src="src/bootstrap/b462.js"></script>
     <!--<script src="https://code.jquery.com/jquery-3.3.1.slim.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script> --> 
     <script src="src/calendar/mini-event-calendar.js?v=1"></script>


<script> 
function postAskCEO()
{
var comment = $("#askCEOTextArea").val(); 
if (comment.trim() === '') { 
alert('Δεν μπορεί να σταλεί το μήνυμα γιατί είναι κενό. ');
}
else 
{
$.post("_layouts/_webServices/postNotes.asmx/postWeWantToHear2",
  {
    comments: comment,
  },
  function(data, status){
  if (!(data =='OK')) { alert ('Κάποιο πρόβλημα εντοπίστηκε κατά την αποστολή, παρακαλούμε δοκιμάστε εκ νέου αφού ανανεώσετε (F9) τη σελίδα'); }
  else { 
    alert("Ευχαριστούμε για την Επικοινωνία!\nStatus: " + status);
    console.log(data); 
    }
    }
  )
  .fail(function() { alert('Φαίνεται ότι δεν είναι δυνατή η επικοινωνία για τεχνικούς λόγους, παρακαλούμε δοκιμάστε αργότερα.')});
}
}
</script>

     <script>
         var sameDaylastWeek = new Date().setDate(new Date().getDate() - 7);
         var someDaynextMonth = new Date().setDate(new Date().getDate() + 31);
         var t3 = new Date().setDate(new Date(2024,02,21)); 
         var t4 = new Date(2024,1,21); 
       //  alert (sameDaylastWeek); 
         alert(t4); 

         // All dates should be provided in timestamps
         var sampleEvents = 
        <asp:PlaceHolder runat="server" __designer:Preview="&lt;%= FirstPage.CalendarEvents.getEvents() %&gt;" __designer:Values="&lt;P N=&#39;ID&#39; ID=&#39;1&#39; T=&#39;ctl05&#39; /&gt;&lt;P N=&#39;Page&#39; ID=&#39;2&#39; /&gt;&lt;P N=&#39;TemplateControl&#39; R=&#39;2&#39; /&gt;&lt;P N=&#39;AppRelativeTemplateSourceDirectory&#39; R=&#39;-1&#39; /&gt;"><%= FirstPage.CalendarEvents.getEvents() %> </asp:PlaceHolder>;
         

         $(document).ready(function () {
             $("#calendar").MEC({
                 events: sampleEvents
             });


         });
     </script>

</asp:Content>

