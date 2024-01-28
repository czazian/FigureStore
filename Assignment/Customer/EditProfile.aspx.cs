using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment.Customer
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            profileimg.ImageUrl = "~/Image/Profile/default.png";

            //Update to db here
        }

        protected void hideButton_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    //Saving file to destination
                    string filename = FileUpload1.FileName;
                    string path = @"C:\Users\koyas\OneDrive\Documents\GitHub\WebApplicationDevelopment\Assignment\Image\Profile\";
                    path += filename;
                    FileUpload1.SaveAs(path);

                    //Change Image in Client
                    profileimg.ImageUrl = "~/Image/Profile/" + filename;
                }
                catch {
                    System.Diagnostics.Debug.WriteLine("error");
                }
            }
        }
    }
}