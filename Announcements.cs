using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.SharePoint;

namespace FirstPage
{
    public static class Announcements
    {
        public static string getTopAnnouncements()
        {
            using (SPWeb web = SPContext.Current.Web)
            {
                SPList l = web.Lists["ΑΝΑΚΟΙΝΩΣΕΙΣ"];

                SPView v = l.Views["FirstPageView"];
                SPListItemCollection col = l.GetItems(v);
                string rs = "";
                foreach (SPListItem itm in col)
                {
                    rs += "<div class=\"row topmargin\">\r\n";
                    rs += "<div class=\"col-md-10 color-font-blue\">";
                    rs += (itm["Title"] ?? "").ToString();
                    rs += "</div>";
                    rs += "<div class=\"col-md-2 color-font-blue\">";
                    rs += getDate(itm["Created"]);
                    rs += "</div>";
                    rs += "</div>";
                    rs += "<div class=\"row\">";
                    rs += "<div class=\"col-md-12\">";
                    rs += (itm["Summary"] ?? "").ToString();
                    rs += "      <a href=\"/Lists/Announcements/DispForm.aspx?ID=" + itm.ID + "\"> Περισσότερα... </a>";
                    rs += "</div>";
                    rs += "</div>";
                }
                return rs;
            }
        }

        private static string getDate(object obj)
        {
            try
            {
                DateTime dt = (DateTime)obj;
                string rs = dt.Day + "/" + dt.Month + "/" + dt.Year + "   " + dt.Hour + ":" + dt.Minute;
                return rs; 
            }
            catch { return "N/A";  }
        }
    }
}