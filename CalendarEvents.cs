using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SharePoint;
using System.Web;
using Microsoft.SharePoint.Utilities;
using System.Runtime.InteropServices.ComTypes;
using Newtonsoft.Json; 
using Microsoft.SharePoint.JsonUtilities;
using Newtonsoft.Json.Linq;



namespace FirstPage
{
    public static class CalendarEvents
    {
        public static string getEvents()
        {
            try
            {
                using (SPWeb web = SPContext.Current.Web)
                {
                    SPList l = web.Lists["CalendarFirstPage"];
                    SPListItemCollection col = selectItems(l);
                    return printItems(col);
                }
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }


        private static SPListItemCollection selectItems(SPList l)
        {
            
            DateTime startDate = DateTime.Today.AddDays(-91); 
            SPQuery qry = new SPQuery();
            string sqry = "<Geq><FieldRef Name='EventDate' /><Value IncludeTimeValue='FALSE' Type='DateTime'>" + SPUtility.CreateISO8601DateTimeFromSystemDateTime(startDate) + "</Value></Geq>";
            sqry = sqry + "<OrderBy><FieldRef Name='EventDate' /></OrderBy>"; 
            sqry = "<Where>" + sqry + "</Where>";
            qry.Query = sqry;
            SPListItemCollection allItems = l.GetItems(qry);
            qry.ViewFields = "<FieldRef Name='Title'/>";
            qry.ViewFields += "<FieldRef Name='EventDate'/>";
            return allItems;  
        }

        class CalendarEntry
        {
            public string title { get; set; }
            public JRaw date { get; set; }
        }

        private static string printItems(SPListItemCollection col)
        {
            List<CalendarEntry> calendarEntries = new List<CalendarEntry>();
            foreach (SPListItem itm in col)
            {
                try {
                    if (((DateTime?)itm["EventDate"]) != null)
                    {
                        DateTime eventDate = (DateTime)itm["EventDate"];
                        CalendarEntry entry = new CalendarEntry();
                        entry.title = itm.Title;
                        entry.date = new JRaw("new Date( " + eventDate.Year.ToString() + "," + (eventDate.Month - 1).ToString() + "," + eventDate.Day + ")");
                        calendarEntries.Add(entry);
                    }
                }
                catch (Exception ex) { }; 
                }

            return JsonConvert.SerializeObject(calendarEntries); 
        }
        
    }
}