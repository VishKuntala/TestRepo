using System;
using System.Configuration;
using System.Data;
using Oracle.ManagedDataAccess.Client;

namespace ponder2018
{
    /// <summary>
    /// Summary desc for DatabaseHelper 
    /// </summary>
    public class DatabaseHelper
    {
        public static DataTable GetDataTable(string sql)
        {
            DataTable dataTable = new DataTable(); //define a new DataTable object "dt"

            using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
            {
                using (OracleCommand cmd = new OracleCommand(sql, connection)) //define a new OracleCommand "cmd" with your connection and query
                {
                    using (OracleDataAdapter da = new OracleDataAdapter(cmd)) //define a new OracleDataAdapter "da" with your OracleCommand
                    {
                        da.Fill(dataTable); //fill your DataTable "dt" with the data from your OracleDataAdapter "da"
                    }
                }
            } // end of getting data from server
            return dataTable;
        }

        public static void LogRequest(string userID, string url)
        {
            string insertQuery = string.Empty;
            OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString);
            OracleCommand cmd = new OracleCommand(); // Initiates your OracleCommand Command
            cmd.CommandTimeout = 90; //Sets a longer timeout value
            insertQuery = @"INSERT INTO PONDER.PONDER_LOG_REQUEST (USER_ID, URL_REQUESTED, CREATE_DATE) VALUES (:USER_ID, :URL_REQUESTED, :CREATE_DATE)";
            cmd.Parameters.Add("USER_ID", OracleDbType.Varchar2).Value = userID;
            cmd.Parameters.Add("URL_REQUESTED", OracleDbType.Varchar2).Value = url;
            cmd.Parameters.Add("CREATE_DATE", OracleDbType.TimeStamp).Value = DateTime.Now;
            try
            {
                con.Open(); // Opens your connection
                cmd.CommandText = insertQuery; // Sets the text of your OracleCommand to the string passed to the method
                cmd.Connection = con; // sets the connection value of  your OracleCommand 
                cmd.ExecuteNonQuery();
                cmd.Dispose(); // deletes your OracleCommand
            }
            catch // if an exception occurs in the "try", do nothing
            {
            }
            finally
            {
                con.Close(); // closes OracleConnection
                con.Dispose(); // deletes OracleConnection
            }
        }

        public static void LogAcknowledge(LogEventParameters myParamsObject)
        {
            string insertQuery = string.Empty;
            OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString);
            OracleCommand cmd = new OracleCommand(); // Initiates your OracleCommand Command
            cmd.CommandTimeout = 90; //Sets a longer timeout value
            insertQuery = @"INSERT INTO PONDER.PONDER_LOG_ACKNOWLEDGE (USER_ID, URL_ACKNOWLEDGED, CREATE_DATE, LOG_JSON_PAYLOAD) VALUES (:USER_ID, :URL_ACKNOWLEDGED, :CREATE_DATE, :LOG_JSON_PAYLOAD)";
            cmd.Parameters.Add("USER_ID", OracleDbType.Varchar2).Value = myParamsObject.userID;
            cmd.Parameters.Add("URL_ACKNOWLEDGED", OracleDbType.Varchar2).Value = myParamsObject.eventType;
            cmd.Parameters.Add("CREATE_DATE", OracleDbType.TimeStamp).Value = DateTime.Now;
            cmd.Parameters.Add("LOG_JSON_PAYLOAD", OracleDbType.Varchar2).Value = String.IsNullOrEmpty(myParamsObject.logJsonPayload) ? null : myParamsObject.logJsonPayload;
            try
            {
                con.Open(); // Opens your connection
                cmd.CommandText = insertQuery; // Sets the text of your OracleCommand to the string passed to the method
                cmd.Connection = con; // sets the connection value of  your OracleCommand 
                cmd.ExecuteNonQuery();
                cmd.Dispose(); // deletes your OracleCommand
            }
            catch (Exception ex) // if an exception occurs in the "try", give exception result
            {
                throw ex; // produces exception result error
            }
            finally
            {
                con.Close(); // closes OracleConnection
                con.Dispose(); // deletes OracleConnection
            }
        }
    }
}
