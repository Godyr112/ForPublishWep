using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MySql.Data;
using MySql.Data.Entity;
using MySql.Data.MySqlClient;

namespace MyToDo.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

     public JsonResult GetTaskList()
       {

            var TodoList = new MyToDo.Models.todolist();
            
            return Json(TodoList, JsonRequestBehavior.AllowGet);
        }
    }
}