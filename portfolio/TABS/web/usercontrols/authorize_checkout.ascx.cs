using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net;
using System.IO;

namespace TABS_UserControls.usercontrols
{
    public partial class authorize_checkout : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // By default, this sample code is designed to post to our test server for
            // developer accounts: https://test.authorize.net/gateway/transact.dll
            // for real accounts (even in test mode), please make sure that you are
            // posting to: https://secure.authorize.net/gateway/transact.dll
            //String post_url = "https://test.authorize.net/gateway/transact.dll";
            String post_url = "https://secure.authorize.net/gateway/transact.dll";
            string login = "5P8wxfF24N2";
            string transaction = "6G8zv7J8y49948Yt";

            Hashtable post_values = new Hashtable();

            // display
            literalLogin.Text = login;
            literalTransaction.Text = transaction;

            //the API Login ID and Transaction Key must be replaced with valid values
            post_values.Add("x_login", login);
            post_values.Add("x_tran_key", transaction);

            post_values.Add("x_delim_data", "TRUE");
            post_values.Add("x_delim_char", '|');
            post_values.Add("x_relay_response", "FALSE");

            post_values.Add("x_type", "AUTH_CAPTURE");
            post_values.Add("x_method", "CC");
            post_values.Add("x_card_num", "4111111111111111");
            post_values.Add("x_exp_date", "0115");

            post_values.Add("x_amount", "19.99");
            post_values.Add("x_description", "Sample Transaction");

            post_values.Add("x_first_name", "John");
            post_values.Add("x_last_name", "Doe");
            post_values.Add("x_address", "1234 Street");
            post_values.Add("x_state", "WA");
            post_values.Add("x_zip", "98004");
            // Additional fields can be added here as outlined in the AIM integration
            // guide at: http://developer.authorize.net

            // This section takes the input fields and converts them to the proper format
            // for an http post.  For example: "x_login=username&x_tran_key=a1B2c3D4"
            String post_string = "";
            foreach (DictionaryEntry field in post_values)
            {
                post_string += field.Key + "=" + field.Value + "&";
            }
            post_string = post_string.TrimEnd('&');

            // create an HttpWebRequest object to communicate with Authorize.net
            HttpWebRequest objRequest = (HttpWebRequest)WebRequest.Create(post_url);
            objRequest.Method = "POST";
            objRequest.ContentLength = post_string.Length;
            objRequest.ContentType = "application/x-www-form-urlencoded";

            // post data is sent as a stream
            StreamWriter myWriter = null;
            myWriter = new StreamWriter(objRequest.GetRequestStream());
            myWriter.Write(post_string);
            myWriter.Close();

            // returned values are returned as a stream, then read into a string
            String post_response;
            HttpWebResponse objResponse = (HttpWebResponse)objRequest.GetResponse();
            using (StreamReader responseStream = new StreamReader(objResponse.GetResponseStream()))
            {
                post_response = responseStream.ReadToEnd();
                responseStream.Close();
            }

            // the response string is broken into an array
            // The split character specified here must match the delimiting character specified above
            Array response_array = post_response.Split('|');

            // the results are output to the screen in the form of an html numbered list.
            resultSpan.InnerHtml += "<OL> \n";
            foreach (string value in response_array)
            {
                resultSpan.InnerHtml += "<LI>" + value + "&nbsp;</LI> \n";
            }
            resultSpan.InnerHtml += "</OL> \n";
            // individual elements of the array could be accessed to read certain response
            // fields.  For example, response_array[0] would return the Response Code,
            // response_array[2] would return the Response Reason Code.
            // for a list of response fields, please review the AIM Implementation Guide
        }
    }
}