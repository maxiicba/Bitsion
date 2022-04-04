using System.Web;
using System.Web.Optimization;

namespace CapaPresentacionAdmin
{
    public class BundleConfig
    {
        // Para obtener más información sobre las uniones, visite https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new Bundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new Bundle("~/bundles/complementos").Include(
                       "~/Scripts/fontawesome/all.min.js",
                       "~/Scripts/DataTables/dataTables.responsive.js",
                       "~/Scripts/admin.min.js",
                       "~/Scripts/bootstrap.bundle.min.js",
                       "~/Scripts/jquery.easing.min.js"
                      // "~/Scripts/jquery.slim.min.js"
                       ));


            bundles.Add(new StyleBundle("~/Content/css").Include(
                "~/Content/site.css",
                "~/Content/bootstrap.min.css",
                "~/Content/fontawesome-free/css/all.min.css",
                "~/Content/DataTables/css/responsive.dataTables.css"              
                ));
        }
    }
}
