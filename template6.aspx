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

<head>
<meta name="WebPartPageExpansion" content="full" />
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>


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
	
 <link rel="stylesheet" href="/SiteAssets/src/bootstrap/b462.css">
    <link rel="stylesheet" href="/SiteAssets/src/css/master_custom.css" />
    <link rel="stylesheet" href="/SiteAssets/src/calendar/mini-event-calendar2.css">
    <link rel="stylesheet" href="/SiteAssets/src/css/firstPage_custom.css" />
    <link rel="stylesheet" href="/SiteAssets/src/css/customCalendar.css" />

     <main role="main">


         <div class="container width-full   bootstrap-box-sizing">
             <!-- Example row of columns -->
            
             <div class="row color-light">
                 <div class="col-md-2">
                     <div class="row menuLeft">
                         <div class="col-12 align-self-center">
                             <a href="https://www.google.gr">   <img src="/SiteAssets/src/imgs/Intranet_side_banner_dieuthinseis.png" /> </a>
                         </div>
                     </div>
                     <div class="row menuLeft">
                         <div class="col-12 align-self-center">
                             <img src="/SiteAssets/src/imgs/Intranet_side_banner_aitiseis.png" />
                         </div>
                     </div>
                     <div class="row menuLeft">
                         <div class="col-12 align-self-center">
                             <img src="/SiteAssets/src/imgs/Intranet_side_banner_systimata.png" />
                         </div>
                     </div>
                     <div class="row menuLeft">
                         <div class="col-12 align-self-center">
                             <img src="/SiteAssets/src/imgs/Intranet_side_banner_links.png" />
                         </div>
                     </div>
                     <div class="row menuLeft">
                         <div class="col-12 align-self-center">
                             <img src="/SiteAssets/src/imgs/Intranet_side_banner_arxeio.png" />
                         </div>
                     </div>
                 </div>

                 <div class="col-md-7">
     <!--              <img src="src/imgs/la.jpg" alt="Los Angeles" width="770" height="350">  --> 
<!--     <img class="img-fluid w-100" src="src/imgs/Welcome.jpg" alt="Welcome" >  --> 
                     <!--<div class="mt-4 p-5 bg-primary text-white rounded">-->
                 <div class="welcome-parent">
   <img class="img-fluid w-100" src="/SiteAssets/src/imgs/Welcome.png" alt="">


   <div class="welcome-bottom-left">Καλως ήρθες  <asp:PlaceHolder runat="server"><%= FirstPage.WelcomeMsg.getUserName() %> στο  <b>Intranet της Attica Bank</b> </asp:PlaceHolder></div>
					 
</div>


   <div class="mt-4 p-25 color-middle text-white newsDiv   rounded">
                         <div class="row newsDivInner" style="text-align:center">
<!--                             <h3 class="attica-fonts">NEA/ΑΝΑΚΟΙΝΩΣΕΙΣ</h3> --> 
<h3> ΝΕΑ/ΑΝΑΚΟΙΝΩΣΕΙΣ    </h3>

                             <div class="col-md-12">
                             </div>
                         </div>
                         <div class="row">
                             <div class="col-md-4">
<a href="javascript:alert('Here we must have a link')"><img class="newsButton" src="/SiteAssets/src/imgs/intranet_button_ta-nea.png" alt="Τα Νέα μας"/></a>
                             </div>
                             <div class="col-md-4">
<a href="/Pages/Main.aspx"><img class="newsButton" src="/SiteAssets/src/imgs/intranet_button_theseis-ergasias.png" alt="Θέσεις Εργασίας"/></a>
                             </div>
                             <div class="col-md-4">
<a href="/Pages/Main.aspx"><img class="newsButton" src="/SiteAssets/src/imgs/intranet_button_politikes.png" alt="Πολιτικές που πρέπει να διαβάσω"/></a>
                             </div>
                         </div>

                     </div>
                     
                     
                      <div class="mt-4 p-25 color-middle text-white newsDiv  rounded">



<div class="row">
<div class="col-md-6 weWantToHear">
<!--                     <div class="jumbotron color-middle mt-4 p-4 text-black rounded" id="WeWantToHearContainer"> --> 
                         <p class="lead small-header">Θέλουμε να ακούσουμε από εσένα</p>


                         <p>Στείλε τις σκέψεις σου</p>

                         <textarea id="weWantToHearTextArea" class="form-control margin" style="width:95%" rows="5" placeholder="Γράψε την ερώτησή σου και επέλεξε 'Αποστολή'"></textarea>

                         <button type="button" class="btn btn-primary color-dark" onclick='postWeWantToHear()' >Αποστολή</button>
</div>
<!--                     </div> -->
                     <div class="col-md-6 askCEO">
					<!--	<button class="askCEOButton" text="XXXXX">Ρωτήστε τον CEO</button> <br/> --> 
						<button type="button" id="buttonAskCEO" class="askCEO color-middle" onclick='askCEO()'><img class="askCEO" src="/SiteAssets/src/imgs/intranet_button_ask-the-ceo.png" alt="Deltia Typou"/> </button>
                     </div>
                     </div>    
                     </div>
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

 <div class="modal fade in" id="alertMessageModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
     <div class="custom-dialogForm modal-dialog" role="document">
         <div class="modal-content custom-dialogForm-header">
             <div class="modal-header">
                 <h5 class="modal-title">Ask CEO</h5>

                     <span aria-hidden="true">×</span>

             </div>
             <div class="alert">



                         <p>Κάνε την ερώτησή σου στο CEO</p>

                         <textarea id="askCEOTextArea" class="form-control margin" style="width:95%" rows="5" placeholder="Γράψε την ερώτησή σου και επέλεξε 'Αποστολή'"></textarea>

                         <button type="button" class="btn btn-primary color-dark" onclick='postAskCEO()' >Αποστολή</button>
                         
                 
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"/>
             </div>
             <div class="modal-footer">
                 <button type="button" class="btn btn-secondary" data-dismiss="modal">Κλείσιμο (χωρίς Αποστολή)</button>

             </div>
         </div>
     </div>
 </div>


         </div> <!-- /container -->

     </main>

   
     <!-- Bootstrap core JavaScript
    ================================================== -->
     <!-- Placed at the end of the document so the pages load faster -->
     <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
     <!-- <script>window.jQuery || document.write('<script src="https://getbootstrap.com/docs/4.0/assets/js/vendor/jquery-slim.min.js"><\/script>')</script> -->
     <!-- <script src="https://getbootstrap.com/docs/4.0/assets/js/vendor/popper.min.js"></script> -->
     <!-- <script src="https://getbootstrap.com/docs/4.0/dist/js/bootstrap.min.js"></script> -->
     <script src="/SiteAssets/src/jquery/jquery351.js"></script>
     <script src="/SiteAssets/src/bootstrap/b462.js"></script>
     <!--<script src="https://code.jquery.com/jquery-3.3.1.slim.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script> --> 
     <script src="/SiteAssets/src/calendar/mini-event-calendar.js?v=1"></script>


<script> 

    function askCEO() {

        $('#alertMessageModal').modal('show');
        return false;
    }


    function postAskCEO() {
        var comment = $("#askCEOTextArea").val();
        if (comment.trim() === '') {
            alert('Δεν μπορεί να σταλεί το μήνυμα γιατί είναι κενό. ');
        }
        else {
            $.post("/_layouts/_webServices/postNotes.asmx/postAskCEO",
                {
                    comments: comment,
                },
                function (data, status) {
                    if (!(data == 'OK')) { alert('Κάποιο πρόβλημα εντοπίστηκε κατά την αποστολή, παρακαλούμε δοκιμάστε εκ νέου αφού ανανεώσετε (F9) τη σελίδα'); }
                    else {
                        alert("Ευχαριστούμε για την Επικοινωνία!");
                        console.log(data);
                        $("#askCEOTextArea").val("");
                        $('#alertMessageModal').modal('hide');
                    }
                }
            )
                .fail(function () { alert('Φαίνεται ότι δεν είναι δυνατή η επικοινωνία για τεχνικούς λόγους, παρακαλούμε δοκιμάστε αργότερα.') });
        }
    }




    function postWeWantToHear() {
        var comment = $("#weWantToHearTextArea").val();
        if (comment.trim() === '') {
            alert('Δεν μπορεί να σταλεί το μήνυμα γιατί είναι κενό. ');
        }
        else {
            $.post("/_layouts/_webServices/postNotes.asmx/postWeWantToHear",
                {
                    comments: comment,
                },
                function (data, status) {
                    if (!(data == 'OK')) { alert('Κάποιο πρόβλημα εντοπίστηκε κατά την αποστολή, παρακαλούμε δοκιμάστε εκ νέου αφού ανανεώσετε (F9) τη σελίδα'); }
                    else {
                        alert("Ευχαριστούμε για την Επικοινωνία!");
                        console.log(data);
                        $("#weWantToHearTextArea").val("");
                    }
                }
            )
                .fail(function () { alert('Φαίνεται ότι δεν είναι δυνατή η επικοινωνία για τεχνικούς λόγους, παρακαλούμε δοκιμάστε αργότερα.') });
        }
    }
</script>

     <script>

         // All dates should be provided in timestamps
         var sharepointEvents =
             <asp: PlaceHolder runat="server" __designer: Preview="&lt;%= FirstPage.CalendarEvents.getEvents() %&gt;" __designer: Values="&lt;P N=&#39;ID&#39; ID=&#39;1&#39; T=&#39;ctl05&#39; /&gt;&lt;P N=&#39;Page&#39; ID=&#39;2&#39; /&gt;&lt;P N=&#39;TemplateControl&#39; R=&#39;2&#39; /&gt;&lt;P N=&#39;AppRelativeTemplateSourceDirectory&#39; R=&#39;-1&#39; /&gt;"><%= FirstPage.CalendarEvents.getEvents() %> </asp: PlaceHolder>;


         $(document).ready(function () {
             $("#calendar").MEC({
                 events: sharepointEvents
             });


         });
     </script>

</asp:Content>

