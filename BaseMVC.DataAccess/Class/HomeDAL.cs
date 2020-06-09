using BaseMVC.DataAccess.Database;
using BaseMVC.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseMVC.DataAccess.Class
{
    public class HomeDAL
    {
        MyProfileEntities db = new MyProfileEntities(); //Connection to DB

        public HomeModel GetListUser()
        {
            try
            {
                var Data = db.TblM_User.Select(x => new UserModel
                {
                    ID = x.id,
                    Email = x.Email,
                    Nama = x.Nama,
                }).ToList();

                return new HomeModel { ListUser = Data };
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public string InsertOrUpdateUser(UserModel Model)
        {
            try
            {
                if (Model.Option == 1) //Insert
                {
                    TblM_User NewUser = new TblM_User()
                    {
                        Nama = Model.Nama,
                        Email = Model.Email,
                    };

                    db.TblM_User.Add(NewUser);
                    db.SaveChanges();
                }
                else if (Model.Option == 2) //Update
                {
                    var DataUser = db.TblM_User.Where(x => x.id == Model.ID).FirstOrDefault();
                    DataUser.Nama = Model.Nama;
                    DataUser.Email = Model.Email;
                    db.SaveChanges();
                }
                return "Sukses";
            }
            catch(Exception ex)
            {
                return ex.Message;
            }
        }

        public string DeleteUser(UserModel Model)
        {
            try
            {
                var DataUser = db.TblM_User.Where(x => x.id == Model.ID).FirstOrDefault();
                db.TblM_User.Remove(DataUser);
                db.SaveChanges();
                return "Sukses";
            }
            catch(Exception ex)
            {
                return ex.Message;
            }
        }
    }
}
