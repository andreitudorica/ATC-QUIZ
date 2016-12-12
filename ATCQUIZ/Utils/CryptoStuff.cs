using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;

namespace ATCQUIZ
{
    public class CryptoStuff
    {
        static string pwd = "cuew6RUw";
        /// <summary>
        /// Encrypt a byte array into a byte array using a key and an IV 
        /// 
        /// </summary>
        /// <param name="clearData"></param>
        /// <param name="Key"></param>
        /// <param name="IV"></param>
        /// <returns></returns>
        public static byte[] Encrypt(byte[] clearData, byte[] Key, byte[] IV)
        {
            MemoryStream ms = new MemoryStream();

            Rijndael alg = Rijndael.Create();
            alg.Key = Key;
            alg.IV = IV;

            CryptoStream cs = new CryptoStream(ms, alg.CreateEncryptor(), CryptoStreamMode.Write);
            cs.Write(clearData, 0, clearData.Length);
            cs.Close();

            byte[] encryptedData = ms.ToArray();

            return encryptedData;
        }
        /// <summary>
        /// Overload for simplicity
        /// </summary>
        /// <param name="clearText"></param>
        /// <returns></returns>
        public static string Encrypt(string clearText)
        {
            return Encrypt(clearText, pwd);
        }
        /// <summary>
        /// Encrypt a string into a string using a password Uses Encrypt(byte[], byte[], byte[]) 
        /// </summary>
        /// <param name="clearText"></param>
        /// <param name="Password"></param>
        /// <returns></returns>
        public static string Encrypt(string clearText, string Password)
        {
            byte[] clearBytes = System.Text.Encoding.Unicode.GetBytes(clearText);

            PasswordDeriveBytes pdb = new PasswordDeriveBytes(Password, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });

            byte[] encryptedData = Encrypt(clearBytes, pdb.GetBytes(32), pdb.GetBytes(16));

            return Convert.ToBase64String(encryptedData);
        }
        /// <summary>
        /// Encrypt bytes into bytes using a password Uses Encrypt(byte[], byte[], byte[]) 
        /// </summary>
        /// <param name="clearData"></param>
        /// <returns></returns>
        public static byte[] Encrypt(byte[] clearData)
        {
            PasswordDeriveBytes pdb = new PasswordDeriveBytes(pwd, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });

            return Encrypt(clearData, pdb.GetBytes(32), pdb.GetBytes(16));
        }
        /// <summary>
        /// Encrypt bytes into bytes using a password Uses Encrypt(byte[], byte[], byte[]) 
        /// </summary>
        /// <param name="clearData"></param>
        /// <param name="Password"></param>
        /// <returns></returns>
        public static byte[] Encrypt(byte[] clearData, string Password)
        {
            PasswordDeriveBytes pdb = new PasswordDeriveBytes(Password, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });

            return Encrypt(clearData, pdb.GetBytes(32), pdb.GetBytes(16));
        }

        /// <summary>
        /// Decrypt a byte array into a byte array using a key and an IV 
        /// </summary>
        /// <param name="cipherData"></param>
        /// <param name="Key"></param>
        /// <param name="IV"></param>
        /// <returns></returns>
        public static byte[] Decrypt(byte[] cipherData, byte[] Key, byte[] IV)
        {
            MemoryStream ms = new MemoryStream();

            Rijndael alg = Rijndael.Create();
            alg.Key = Key;
            alg.IV = IV;

            CryptoStream cs = new CryptoStream(ms, alg.CreateDecryptor(), CryptoStreamMode.Write);
            cs.Write(cipherData, 0, cipherData.Length);
            cs.Close();

            byte[] decryptedData = ms.ToArray();

            return decryptedData;
        }
        /// <summary>
        /// Overload for simplicity
        /// </summary>
        /// <param name="cipherText"></param>
        /// <returns></returns>
        public static string Decrypt(string cipherText)
        {
            return Decrypt(cipherText, pwd);
        }
        /// <summary>
        /// Decrypt a string into a string using a password Uses Decrypt(byte[], byte[], byte[]) 
        /// </summary>
        /// <param name="cipherText"></param>
        /// <param name="Password"></param>
        /// <returns></returns>
        public static string Decrypt(string cipherText, string Password)
        {
            cipherText = cipherText.Replace("%3d", "=");
            cipherText = cipherText.Replace("%2f", "/");
            byte[] cipherBytes = Convert.FromBase64String(cipherText);

            PasswordDeriveBytes pdb = new PasswordDeriveBytes(Password, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });

            byte[] decryptedData = Decrypt(cipherBytes, pdb.GetBytes(32), pdb.GetBytes(16));

            return System.Text.Encoding.Unicode.GetString(decryptedData);
        }
        /// <summary>
        /// Decrypt bytes into bytes using a password Uses Decrypt(byte[], byte[], byte[]) 
        /// </summary>
        /// <param name="cipherData"></param>
        /// <returns></returns>
        public static byte[] Decrypt(byte[] cipherData)
        {
            PasswordDeriveBytes pdb = new PasswordDeriveBytes(pwd, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });

            return Decrypt(cipherData, pdb.GetBytes(32), pdb.GetBytes(16));
        }
        /// <summary>
        /// Decrypt bytes into bytes using a password Uses Decrypt(byte[], byte[], byte[]) 
        /// </summary>
        /// <param name="cipherData"></param>
        /// <param name="Password"></param>
        /// <returns></returns>
        public static byte[] Decrypt(byte[] cipherData, string Password)
        {
            PasswordDeriveBytes pdb = new PasswordDeriveBytes(Password, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });

            return Decrypt(cipherData, pdb.GetBytes(32), pdb.GetBytes(16));
        }
    }
}