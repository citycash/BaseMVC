using BaseMVC.DataAccess.Class;
using BaseMVC.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BaseMVC.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult ListUser()
        {
            HomeDAL HDAL = new HomeDAL();
            HomeModel DataUser = HDAL.GetListUser();
            return PartialView("_ListUser", DataUser);
        }

        //Logic
        [HttpPost]
        public string InsertUser(UserModel Model)
        {
            HomeDAL HDAL = new HomeDAL();
            string Result = HDAL.InsertOrUpdateUser(Model);
            return Result;
        }

        [HttpPost]
        public string DeleteUser(UserModel Model)
        {
            HomeDAL HDAL = new HomeDAL();
            string Result = HDAL.DeleteUser(Model);
            return Result;
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}