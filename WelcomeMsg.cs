using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SharePoint;
using System.Web;
using Microsoft.SharePoint.Utilities;

namespace FirstPage
{
    public static class WelcomeMsg
    {
        public static string getUserName()
        {
            SPWeb web = SPContext.Current.Web;
            return web.CurrentUser.Name; 

        }
    }
}