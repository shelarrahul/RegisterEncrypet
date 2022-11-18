using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace registerEncrept
{
    public partial class Register : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["adbd"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string strpass = encrypt(Password1.Value);
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into ency values(@name, @mobile, @gmail, @password, @gender, @usertype, @image)", con);
            cmd.Parameters.AddWithValue("@name", TextBox1.Text);
            cmd.Parameters.AddWithValue("@mobile", TextBox3.Text);
            cmd.Parameters.AddWithValue("@gmail", TextBox4.Text);
            cmd.Parameters.AddWithValue("@password", strpass);
            cmd.Parameters.AddWithValue("@gender", RadioButtonList1.SelectedValue);
            cmd.Parameters.AddWithValue("@usertype","User");
            cmd.Parameters.AddWithValue("@image", "`/Images/forgot (1).png");
            int result = cmd.ExecuteNonQuery();
            con.Close();
            if(result == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Data Register Successfully')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Data not Register')",true);
            }
        }

        //}
        //public string encryptpass(string password)
        //{
        //    string msg = "";
        //    byte[] encode = new byte[password.Length];
        //    encode = Encoding.UTF8.GetBytes(password);
        //    msg = Convert.ToBase64String(encode);
        //    return msg;
        //}
        public string encrypt(string encryptString)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(encryptString);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {
            0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76
        });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    encryptString = Convert.ToBase64String(ms.ToArray());
                }
            }
            return encryptString;
        }


    }
}