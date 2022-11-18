using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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
    public partial class Login : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["adbd"].ConnectionString;
        //static String decryptedpwd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd1 = new SqlCommand("select * from ency where gmail=@gmail",con);
            cmd1.Parameters.AddWithValue("@gmail", TextBox1.Text);
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    Session["id"] = dr.GetValue(0).ToString();
                    Session["name"] = dr.GetValue(1).ToString();
                    Session["password"] = dr.GetValue(4).ToString();
                    Session["usertype"] = dr.GetValue(6).ToString();
                }
            }

            string decryptpass = decryptpwd(Session["password"].ToString()); 
            if(decryptpass == TextBox2.Text)
            {
                Response.Write("<script> alert('login sucessful')</script>");
            }          
        }

        private string decryptpwd(String cipherText)
        {
            //string decryptpwd = string.Empty;
            //UTF8Encoding encodepwd = new UTF8Encoding();
            //Decoder Decode = encodepwd.GetDecoder();
            //byte[] todecode_byte = Convert.FromBase64String(encrytpwd);
            //int charCount = Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
            //char[] decoded_char = new char[charCount];
            //Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
            //decryptpwd = new String(decoded_char);
            //decryptedpwd = decryptpwd;
            //return decryptedpwd;
            string EncryptionKey = "MAKV2SPBNI99212";           
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey,new byte[] { 0x49,0x76,0x61,0x6e,0x20,0x4d,0x65,0x64,0x76,0x65,0x64,0x65,0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                encryptor.Mode = CipherMode.CBC;
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms,encryptor.CreateDecryptor(),CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;

        }

    }
}