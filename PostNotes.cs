using System;
using System.IO;
using System.Collections.Generic;

using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using Microsoft.SharePoint;
using Microsoft.SharePoint.Utilities; 
using Newtonsoft.Json;
using System.Web.Script.Services;
using System.Globalization; 


namespace FirstPage
{
    [ScriptService]
    class PostNotes : WebService   
    {


        [WebMethod]
        public void Test1()
        {
            writeToContext (Context, "OK"); 
        }

        [WebMethod]
        public void Test2(string arg1)
        {
            writeToContext (Context, "the result is: " + arg1); 
        }


        [WebMethod]
        public void postWeWantToHear(string comments)
        {
            try
            {
                Guid siteID = SPContext.Current.Site.ID;
                string userName = SPContext.Current.Web.CurrentUser.Name + "(" + SPContext.Current.Web.CurrentUser.LoginName + ")";

                SPSecurity.RunWithElevatedPrivileges(delegate
                {
                    using (SPSite elSite = new SPSite(siteID))
                    {
                        Context.Items["FormDigestValidated"] = true;
                        SPUtility.ValidateFormDigest();
                        SPList lNotes = elSite.RootWeb.Lists["WeWantToHear"];
                        SPListItem itm = lNotes.Items.Add();
                        itm["userName"] = userName;
                        itm["comments"] = comments;
                        itm.Update();
                        //string rs = sendMail(itm);
                        writeToContext(Context, "OK"); 
                     //  writeToContext(Context, rs);
                    }
                });
            }

            catch (Exception e) { writeToContext(Context, "Error:" + e.Message); }
        }

        //public void setAskCEO(string url, string user, string comments)
        //{
        //    string err = "1a";

        //    try
        //    {
        //        Uri uri = new Uri(url);
        //        Guid siteID = SPContext.Current.Site.ID;
        //        string userName = SPContext.Current.Web.CurrentUser.Name + "(" + SPContext.Current.Web.CurrentUser.LoginName + ")";

        //        SPSecurity.RunWithElevatedPrivileges(delegate
        //        {
        //            using (SPSite elSite = new SPSite(siteID))
        //            {
        //                Context.Items["FormDigestValidated"] = true;
        //                SPUtility.ValidateFormDigest();
        //                SPList lNotes = elSite.RootWeb.Lists["NotesList"];
        //                SPListItem itm = lNotes.Items.Add();
        //                itm["Title"] = title;
        //                itm["sitePage"] = url;
        //                itm["userName"] = userName;
        //                itm["note"] = comments;
        //                itm["date"] = System.DateTime.Now;
        //                itm["isRead"] = false; // TO CHECK 
        //                itm["endIssue"] = false;  // TO CHECK 
        //                itm.Update();
        //                string rs = sendMail(itm);
        //                writeToContext(Context, rs);
        //            }
        //        });
        //    }

        //    catch (Exception e) { Common.WriteToContext(Context, "Error:" + e.Message); }
        //}


        public  void writeToContext(HttpContext context, string val, bool json = false, bool html = false)
        {
            context.Response.Clear();
            context.Response.ContentEncoding = Encoding.UTF8;
            //   context.Response.Headers.Add("Access-Control-Allow-Origin", "*");
            if (json)
            {
                context.Response.Headers.Add("Content-Type", "application/json");
            }
            // PipiF
            if (html)
            {
                context.Response.Headers.Add("Content-Type", "text/html");
            }


            context.Response.Write(val);
            //  context.Response.Flush();
        }

        private string sendMail(SPListItem itm)
        {
            string rs = "OK";
            string siteUrl = SPContext.Current.Site.Url;

            try
            {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.Append(" <html> ");
                stringBuilder.Append(" <p> --------------------script automated message--------------------</p> ");
                stringBuilder.Append(" <p>This is a message that has been send from user : <b>" + (itm["userName"] ?? "N/A").ToString() + "</b> </p>     ");
                stringBuilder.Append(" <p>This feedback message is reported for vodafone intranet page : <b>" + (itm["sitePage"] ?? "N/A").ToString() + "</b></p> ");
                stringBuilder.Append(" <p>Message post date : <b>" + System.DateTime.Today.ToString() + "</b><p>");
                stringBuilder.Append(" <p>If you want to end this issue click to this link " + siteUrl + "/Lists/NotesList/pending%20issues.aspx</p>  ");
                stringBuilder.Append(" <p> --------------------end of automated message --------------------</p> ");
                stringBuilder.Append(" </hr> ");
                stringBuilder.Append(" --------------------Message from the user -------------------- ");
                stringBuilder.Append(" <p> Title :  <b>" + itm.Title + "</b></p>  ");
                stringBuilder.Append(" <p>Body : " + (itm["note"] ?? "").ToString() + "</p> ");
                stringBuilder.Append(" --------------------end of message --------------------</p> ");
                stringBuilder.Append(" </html> ");
                string recipients = "ToChange"; 
                StringDictionary messageHeaders = new StringDictionary()
                {
                    {
                    "subject",
                    itm.Title
                    },
                    {
                    "to",
                    recipients
                    }
                };
                string messageBody = ((object)stringBuilder).ToString();
                if (SPUtility.SendEmail(SPContext.Current.Web, messageHeaders, messageBody, true))
                {
                    return "OK";

                }
                else { return "SPUtility.SendEmail returned false"; }

            }
            catch (Exception ex)
            {
                return "ΣΥΣΤΗΜΙΚΟ ΛΑΘΟΣ στην Send Mail:" + ex.Message;
            }
        }

        private class PacketStructure : IComparable
        {
            public int id;
            public string packet;
            public double bill;
            public string billPresentation; 
            public int CompareTo(object packetStructure)
            {
                return bill.CompareTo(((PacketStructure)packetStructure).bill);
            }
        }

        public class Result
        {
             
            public string Packet;
            public string VodafoneBill;
            public string DEHBill;
            public string YearBenefit;
            public string AllPackets; 
            public string ErrorMsg; 
            public string DebugInfo; 
        }

        [WebMethod]
        public void getFavouritePacket(string wellPaying, string gas, string phase, string night, string kwhDay, string kwhNight)
        {
            List<PacketStructure> packets = new List<PacketStructure>();
            string rs = "";
            double billDEH = 0;
            double billVodafone;
            double billBenefit = 0;
            string ErrorMsg = "";
            int debugInfo_itmDEH = 0;
            try
            {
              
                using (SPSite site = SPContext.Current.Site)
                {
                    using (SPWeb web = site.OpenWeb("CommonApplications"))
                    {
                        SPList l = web.Lists["EnergyCalculator"];
                        foreach (SPListItem itm in l.Items)
                        {
                            string packet = (itm["Program"] ?? "").ToString();
                            if (!String.IsNullOrWhiteSpace(packet))
                            {
                                if (matches(gas, phase, night, itm))
                                {
                                    double bill = calcBill(itm, night, kwhDay, kwhNight);
                                    // rs = itm["Phase"].ToString() + itm["Program"] + itm["Night"] + itm["Gas"];
                                    packets.Add(new PacketStructure() { id = itm.ID, packet = packet, bill = bill, billPresentation = myDoubleToCurrency(bill) }) ;
                                }
                            }
                        }
                        if (packets.Count.Equals(0))
                        {
                            Result info = new Result() { ErrorMsg = "ERROR( No program info found, please contact with admin to update the relative tables)" };
                        //    Common.WriteToContext(Context, JsonConvert.SerializeObject(info));
                        }
                        else
                        {
                            packets.Sort();  // from smaller to higher bill, first one is the cheapest
                            PacketStructure bestPacket = findBestPacket(wellPaying, packets); 
                            billVodafone = bestPacket.bill;
                            SPList lDEH = web.Lists["EnergyCalculator_DEH"];
                            foreach (SPListItem itm in lDEH.Items)
                            {
                                if (matchesDEH(wellPaying, phase, night, itm, kwhDay))
                                {
                                    billDEH = calcBill(itm, night, kwhDay, kwhNight);
                                    debugInfo_itmDEH = itm.ID; 
                                    break;
                                }
                            }
                            if (billDEH > 0) { billBenefit = Math.Round((billDEH - billVodafone) * 3,2); }  // year has 3 periods of 4months 

                            string allPackets = printOtherPackets(packets, bestPacket);
                            Result result = new Result() { Packet = bestPacket.packet, VodafoneBill = myDoubleToCurrency(billVodafone), DEHBill = myDoubleToCurrency(billDEH), YearBenefit = myDoubleToCurrency(billBenefit), AllPackets = allPackets , DebugInfo = JsonConvert.SerializeObject(packets) + "#DEH item:" + debugInfo_itmDEH , ErrorMsg = "" };
                            string resultJson = JsonConvert.SerializeObject(result);
                         //   Common.WriteToContext(Context, resultJson);
                        }
                    }
                }
            }
            catch (Exception e) {
                Result info = new Result() { ErrorMsg  = "ERROR(Please provide the following info to system admin): " + e.Message +  "->" + e.StackTrace,  DebugInfo = e.Message + " # packets:" + JsonConvert.SerializeObject(packets) + "#DEH item:" + debugInfo_itmDEH };
                //Common.WriteToContext(Context, JsonConvert.SerializeObject(info));  
            }
        }


        private PacketStructure findBestPacket(string wellPaying, List<PacketStructure> packets)
        {
            packets.Sort();
            // standard procedure is to return the cheapest
            // but ... we want to promote a specific packet if customer pays well 
            // and never suggest this , if not 
            string toPreferWellPaying = "Ρεύμα Οικιακό Maxi 50"; 
            if (wellPaying.Equals(("1")))
            {
                foreach (PacketStructure packet in packets) { if (packet.packet.Trim().Equals(toPreferWellPaying, StringComparison.InvariantCultureIgnoreCase)) return packet; }
                return packets[0];  // if for any case packet removed , return the cheapest 
            }
            else
            {    // not wellpaying. If an option do not return the specific packet 
                if (packets.Count >1  && packets[0].packet.Trim().Equals(toPreferWellPaying, StringComparison.InvariantCultureIgnoreCase))
                {
                    return packets[1]; 
                } 
                else {return  packets[0]; }
            }

        }

        private double calcBill (SPListItem itm, string night, string kwhDay, string kwhNight)
        {
            // double itmFixedCharged = (itm["FixedCharge"] ?? "").Equals("") ? 0 : (double)itm["FixedCharge"];
            double itmFixedCharged = myStringToDouble(itm["FixedCharge"]);
            //double itmKWhDay = (itm["KWhDay"] ?? "").Equals("") ? 0 : (double)itm["KWhDay"];
            double itmKWhDay = myStringToDouble(itm["KWhDay"]);
            //  double itmKWhNight = (itm["KWhNight"] ?? "").Equals("") ? 0 : (double)itm["KWhNight"];
            double itmKWhNight = myStringToDouble(itm["KWhNight"]);
            //  double reqKWhDay = String.IsNullOrWhiteSpace(kwhDay) ? 0 : Convert.ToDouble(kwhDay);
            double reqKWhDay = myStringToDouble(kwhDay);
            // double reqKWhNight = String.IsNullOrWhiteSpace(kwhNight) ? 0 : Convert.ToDouble(kwhNight);
            double reqKWhNight = myStringToDouble(kwhNight);
            if (night.Equals("1"))
            {
                return Math.Round( itmFixedCharged + (itmKWhDay * reqKWhDay) + (itmKWhNight * reqKWhNight), 2);
            }
            else
            {
                return Math.Round (itmFixedCharged + (itmKWhDay * reqKWhDay), 2); 
            }
        }


        private double myStringToDouble (object obj)
        {
            double rs = 0;
            string val = (obj ?? "").ToString(); 
            if (String.IsNullOrWhiteSpace(val)) return rs;
            val = val.Replace('.', ','); 
            if (double.TryParse(val, System.Globalization.NumberStyles.Any, CultureInfo.GetCultureInfo("el-GR"), out rs)) { return rs; } else return 0; 
        }

        private string myDoubleToCurrency(double val)
        {
            return val.ToString("N", new CultureInfo("el-GR")) + " \u20AC"; 
        }

      


        private bool matches(string gas, string phase, string night, SPListItem itm)
        {

            string key = night.Equals("1") ? "Yes" : "No";
            if (!(itm["Night"] ?? "").ToString().Trim().Contains(key)) return false;

            key = phase.Equals("1") ? "Μονοφασικό" : "Τριφασικό";
            if (!(itm["Phase"] ?? "").ToString().Trim().ToUpper().Contains(key.ToUpper())) return false;
            key = gas.Equals("1") ? "Yes" : "No";
            if (!(itm["Gas"] ?? "").ToString().Trim().Contains(key)) return false;
            return true;
        }

        private bool matchesDEH(string wellPaying, string phase, string night, SPListItem itm, string kwhDay)
        {
            double kwh = String.IsNullOrWhiteSpace(kwhDay) ? 0 : Convert.ToDouble(kwhDay); 
            string key = night.Equals("1") ? "Yes" : "No";
            if (!(itm["Night"] ?? "").ToString().Trim().Contains(key)) return false;
            key = phase.Equals("1") ? "Μονοφασικό" : "Τριφασικό";
            if (!(itm["Phase"] ?? "").ToString().Trim().ToUpper().Contains(key.ToUpper())) return false;
                key = wellPaying.Equals("1") ? "Yes" : "No";
                if (!(itm["WellPaying"] ?? "").ToString().Trim().Contains(key)) return false;

            if (!(itm["KWhFrom"] ?? "").ToString().Equals(""))
            {
                double kwhFrom = (double)itm["KWhFrom"] ;
               if (!(kwhFrom > kwh)) return false;
            }
            if (!(itm["KWhTo"] ?? "").ToString().Equals("")) {
                double kwhTo = (double)itm["KWhTo"];
                if (!(kwhTo <= kwh)) return false;
            }
            return true;
        }



        private string printOtherPackets(List<PacketStructure> packets, PacketStructure bestPacket)
        {
            string toExcludeWellPaying = "Ρεύμα Οικιακό Maxi 50";  // never show 'Maxi50' if not the best packet 
            string rs = "<table  class=\"searchTable\">"; 
            foreach (PacketStructure packet in packets)
            {
                if (!packet.packet.Equals(bestPacket.packet))     // never show 'Maxi50' if not the best packet 
                {
                    if (!packet.packet.Equals(toExcludeWellPaying))
                    {
                        rs += "<tr><td>" + packet.packet + "</td><td>" + packet.billPresentation + "</td></tr>";
                    }
                }
                }
            rs += "</table>";
            return rs; 
        }

        //[WebMethod] 
        //public  void getFavouritePacketTest ()
        //{
        //    Result result = new Result() { Packet = "Another Test Packet", VodafoneBill = 1000 , DEHBill = 1500, YearBenefit = 500};
        //    string resultJson = JsonConvert.SerializeObject(result);
        //    Common.WriteToContext(Context, resultJson);
        //}


       
    }
}
