using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
 using Microsoft.SharePoint;
using System.Web;
using Microsoft.SharePoint.Utilities;

namespace AtticaServices
{
    public static class CalendarEntries
    {

        private static SPListItemCollection getCalendarListItems()
        {
            SPSite site = SPContext.Current.Site;
            using (SPWeb web = site.OpenWeb())
            {
                DateTime startDate = DateTime.Today.AddDays(-91);
                SPList l = web.Lists["MainPageCalendar"];
                SPQuery qry = new SPQuery();
                string sqry = "<Geq><FieldRef Name='EventDate' /><Value IncludeTimeValue='FALSE' Type='DateTime'>" + SPUtility.CreateISO8601DateTimeFromSystemDateTime(startDate) + "</Value></Geq>";
                sqry = "<Where>" + sqry + "</Where>";
                qry.Query = sqry; 
                SPListItemCollection allItem = l.GetItems(qry);
                qry.ViewFields = "<FieldRef Name='Title'/>";
                qry.ViewFields += "<FieldRef Name='EventDate'/>";
                qry.ViewFields += "<FieldRef Name='EventTitle'/>";
                SPListItemCollection col = l.GetItems(qry);
                return col;  
            }
        }

     //public static string getEtairikaNea()
     //   {
     //       try
     //       {
     //           SPSite site = SPContext.Current.Site;
     //           using (SPWeb web = site.OpenWeb("nea"))
     //           { return getEtairikaNeaInner(web); }
     //       }
     //       catch (Exception e) { return "Προβλημα στη δημουργία της λίστας Εταιρικά Νέα-> " + e.Message; }
     //   }

     //   public static string getEnergiakaNea()
     //   {
     //       try
     //       {
     //           SPSite site = SPContext.Current.Site;
     //           using (SPWeb web = site.OpenWeb("nea"))
     //           { return getEnergiakaInner(web); }
     //       }
     //       catch (Exception e) { return "Προβλημα στη δημουργία της λίστας Ενεργειακά Νέα-> " + e.Message; }
     //   }

     //   private static string getEtairikaNeaInner(SPWeb web)
     //   {
     //       int colCount = 0;
     //       string sqry = "";
     //       DateTime cNow = DateTime.Now;
     //       try
     //       {
     //           SPList l = web.Lists["announce2"];
     //           SPQuery qry = new SPQuery();

     //           sqry = "<Eq><FieldRef Name='Headline'/> <Value Type='Text'>-</Value></Eq>";
     //           sqry = "<Where>" + sqry + "</Where>";
     //           sqry += "<OrderBy> <FieldRef Name='Announcement_Date' Ascending='FALSE'/></OrderBy>";
     //           qry.ViewFields = "<FieldRef Name='Title'/>";
     //           qry.ViewFields += "<FieldRef Name='Headline'/>";
     //           qry.ViewFields += "<FieldRef Name='Expires'/>";
     //           qry.ViewFields += "<FieldRef Name='Announcement_Date'/>";
     //           qry.ViewFields += "<FieldRef Name='TargetLink'/>";
     //           qry.RowLimit = 5;
     //           qry.Query = sqry;

     //           string rs = "";
     //           SPListItemCollection col = l.GetItems(qry);
     //           colCount = col.Count;
     //           foreach (SPListItem itm in col)
     //           {
     //               //    if (itm["Expires"] != null && ((DateTime) itm["Expires"]) < cNow  ) { continue; } // expired is not implemented 

     //               string url = "/SitePages/EtairikaNewsInternal.aspx?itemId=" + itm.ID;

     //               string targetWindow = "";
     //               string targetLink = Utils.getUrlFromImgUrlField(itm, "TargetLink");

     //               if (!targetLink.Trim().Equals(""))
     //               {
     //                   url = targetLink;
     //                   targetWindow = "target=\"_blank\"";
     //               };



     //               //rs += "<a href =\"" + url +  "\" class=\"news-link\">" + Environment.NewLine;
     //               rs += "<a " + targetWindow + " href =\"" + url + "\" class=\"news-link\">" + Environment.NewLine;
     //               rs += "<div class=\"new px-3 d-flex align-items-center py-4\">" + Environment.NewLine;
     //               rs += "<time class=\"title text-sm color-white\" datetime=\"" + Utils.getDateDisp(itm, "Announcement_Date", Utils.DateDiplayMode.Normalized) + "\">" + Utils.getDateDisp(itm, "Announcement_Date", Utils.DateDiplayMode.Display) + "</time>" + Environment.NewLine;
     //               rs += "<span class=\"new-text text text-sm color-white ps-4\">" + Environment.NewLine;
     //               string title = Utils.escapedText((itm.Title ?? "").ToString());
     //               if (title.Length > 74) { title = title.Substring(0, 74) + "..."; }
     //               rs += title + Environment.NewLine;
     //               rs += "</span>" + Environment.NewLine;
     //               rs += "</div>" + Environment.NewLine;
     //               rs += "</a>" + Environment.NewLine;
     //           }
     //           return rs;
     //       }
     //       catch (Exception e) { return colCount + sqry + "Προβλημα στα Εταιρικά Νέα -> " + e.Message; }
     //   }


     //   private static string getEnergiakaInner(SPWeb web)
     //   {
     //       try
     //       {
     //           SPList l = web.Lists["Ενεργειακά Νέα"];

     //           SPQuery qry = new SPQuery();
     //           //string sqry = "<Neq><FieldRef Name='ID'/> <Value Type='Number'>1</Value></Neq>";
     //           //sqry = "<Where>" + sqry + "</Where>";
     //           string sqry = "<OrderBy> <FieldRef Name='PublishingDate' Ascending='FALSE'/></OrderBy>";
     //           qry.ViewFields = "<FieldRef Name='Title'/>";

     //           qry.ViewFields += "<FieldRef Name='FileRef'/>";
     //           qry.ViewFields += "<FieldRef Name='FileLeafRef'/>";
     //           qry.ViewFields += "<FieldRef Name='PublishingDate'/>";

     //           qry.RowLimit = 5;
     //           //qry.ViewAttributes = "Scope='Recursive'";
     //           qry.Query = sqry;
     //           string rs = "";
     //           SPListItemCollection col = l.GetItems(qry);


     //           foreach (SPListItem itm in col)
     //           {
     //               //    if (itm["Expires"] != null && ((DateTime) itm["Expires"]) < cNow  ) { continue; } // expired is not implemented 


     //               //string url = "/nea/Documents/" + (itm["FileRef"] ?? "").ToString() + "_" + (itm["FileLeafRef"] ?? "").ToString();
     //               string url = (itm["FileRef"] ?? "").ToString();
     //               string title = (itm["FileLeafRef"] ?? "").ToString();
     //               if (title.Length > 74) { title = title.Substring(0, 74) + "..."; }

     //               rs += "<a target=\"_blankEnergiaka\" href =\"" + url + "\" class=\"news-link\">" + Environment.NewLine;
     //               rs += "<div class=\"new px-3 d-flex align-items-center py-4\">" + Environment.NewLine;
     //               rs += "<time class=\"title text-sm color-white\" datetime=\"" + Utils.getDateDisp(itm, "PublishingDate", Utils.DateDiplayMode.Normalized) + "\">" + Utils.getDateDisp(itm, "PublishingDate", Utils.DateDiplayMode.Display) + "</time>" + Environment.NewLine;
     //               rs += "<span class=\"new-text text text-sm color-white ps-4\">" + Environment.NewLine;
     //               rs += title + Environment.NewLine;
     //               rs += "</span>" + Environment.NewLine;
     //               rs += "</div>" + Environment.NewLine;
     //               rs += "</a>" + Environment.NewLine;
     //           }
     //           return rs;
     //       }
     //       catch (Exception e) { return "Προβλημα στα Ενεργειακά Νέα -> " + e.Message; }
     //   }


    }
}