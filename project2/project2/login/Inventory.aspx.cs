using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace project2
{

    public partial class Inventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            listViewByBorrower.Visible = false;
            listViewByDisk.Visible = false;
            DropDownTitle.Enabled = true;
            DropDownBorrower.Enabled = true;
            DropDownBorrower.CssClass = "btn btn-info dropdown-toggle";
            DropDownTitle.CssClass = "btn btn-info dropdown-toggle";

        }


        protected void DropDownBorrower_DataBound(object sender, EventArgs e)
        {
            DropDownBorrower.Items.Insert(0, new ListItem("--Select a Borrower--", "--Select a Borrower--"));
            DropDownBorrower.SelectedValue = "--Select a Borrower--";
        }

        protected void DropDownTitle_DataBound(object sender, EventArgs e)
        {
            DropDownTitle.Items.Insert(0, new ListItem("--Select a Title--", "--Select a Title--"));
            DropDownTitle.SelectedValue = "--Select a Title--";
        }

        protected void ddlClear_Click(object sender, EventArgs e)
        {
            DropDownBorrower.SelectedValue = "--Select a Borrower--";
            DropDownTitle.SelectedValue = "--Select a Title--";
            listViewByBorrower.Visible = false;
            listViewByDisk.Visible = false;



        }


        protected void DropDownBorrower_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownBorrower.SelectedValue != "--Select a Borrower--")
            {
                int selectedBorrowerID = Convert.ToInt32(DropDownBorrower.SelectedValue);
                SqlDataSource3.SelectCommand = $"SELECT [borrower_id], CONCAT ([lname], ', ', [fname]) as [fullname] FROM [borrower] where (borrower_id = {selectedBorrowerID})";
                listViewByBorrower.Visible = true;
                DropDownTitle.Enabled = false;
                DropDownTitle.CssClass = "btn dropdown-toggle btn-danger";



            }
            else
            {
                SqlDataSource3.SelectCommand = "";
                listViewByBorrower.Visible = false;
                DropDownTitle.Enabled = true;
                DropDownTitle.CssClass = "btn btn-info dropdown-toggle";

            }


        }

        protected void DropDownTitle_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownTitle.SelectedValue != "--Select a Title--")
            {
                int selectedDiskID = Convert.ToInt32(DropDownTitle.SelectedValue);
                SqlDataSource3.SelectCommand = $"select * from disk where (disk_id = {selectedDiskID} and status_id = 2)";
                listViewByDisk.Visible = true;
                DropDownBorrower.Enabled = false;
                DropDownBorrower.CssClass = "btn dropdown-toggle btn-danger";

            }
            else
            {
                SqlDataSource3.SelectCommand = "";
                listViewByDisk.Visible = false;
                DropDownBorrower.Enabled = true;
                DropDownBorrower.CssClass = "btn btn-info dropdown-toggle";
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            {
                string selectedDiskTitle = DropDownTitle.SelectedItem.ToString();
                string selectedDiskValue = DropDownTitle.SelectedItem.Value.ToString();
                SqlDataSource3.SelectCommand = $"select * from disk where (disk_id = {selectedDiskTitle} and status_id = 2)";
                selectedDiskLabel.Text = selectedDiskTitle;
                selectedDiskIDLabel.Text = selectedDiskValue;
  

                DropDownBorrower.SelectedValue = "--Select a Borrower--";
                DropDownTitle.SelectedValue = "--Select a Title--";
            }

        }
        
         protected void btnAddBorrower_Click(object sender, EventArgs e)
        {
            {
                string selectedBorrowerName = DropDownBorrower.SelectedItem.ToString();
                string selectedBorrowerID = DropDownBorrower.SelectedItem.Value.ToString();
                SqlDataSource3.SelectCommand = $"SELECT [borrower_id], CONCAT ([lname], ', ', [fname]) as [fullname] FROM [borrower] where (borrower_id = {selectedBorrowerID})";
                selectedBorrowerLabel.Text = selectedBorrowerName;
                selectedBorrowerIDLabel.Text = selectedBorrowerID;

                DropDownBorrower.SelectedValue = "--Select a Borrower--";
                DropDownTitle.SelectedValue = "--Select a Title--";
            }

        }

        protected void BtnSelectDate_Click(object sender, EventArgs e)
        {
            {
                string selectedDate = txtDate.Text;
                selectedDateLabel.Text = selectedDate;
                DropDownBorrower.SelectedValue = "--Select a Borrower--";
                DropDownTitle.SelectedValue = "--Select a Title--";
                if (selectedDate == "") {
                    selectedDateLabel.Text = "";
                }
                selectedDate = "";
            }

        }
        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            {

                if (String.IsNullOrEmpty(selectedBorrowerLabel.Text))
                {
                    Validator1.IsValid = false;

                }
                if (String.IsNullOrEmpty(selectedDiskLabel.Text))
                {
                    Validator2.IsValid = false;
                }
                if (String.IsNullOrEmpty(txtDate.Text))
                {
                    Validator3.IsValid = false;
                }
                else
                {
                    // Declare objects
                    SqlConnection conn;
                    SqlCommand comm;
                    // Initialize connection
                    string connectionString = ConfigurationManager.ConnectionStrings["disk_inventoryZAConnectionString2"].ConnectionString;
                    conn = new SqlConnection(connectionString);
                    // Create command
                    comm = new SqlCommand(
                       "EXECUTE spCheckout @disk_id, @borrower_id, @borrowed_date", conn);

                    string selectedBorrowerName = selectedBorrowerLabel.Text.ToString();
                    string selectedDiskTitle = selectedDiskLabel.Text.ToString();
                    string selectedDiskValue = selectedDiskIDLabel.Text.ToString();
                    string selectedBorrowerID = selectedBorrowerIDLabel.Text.ToString();
                    string selectedDate = txtDate.Text;


                    // Add parameter
                    comm.Parameters.Add("@disk_id", System.Data.SqlDbType.Int);
                    comm.Parameters["@disk_id"].Value = selectedDiskValue;
                    comm.Parameters.Add("@borrower_id", System.Data.SqlDbType.Int);
                    comm.Parameters["@borrower_id"].Value = selectedBorrowerID;
                    comm.Parameters.Add("@borrowed_date", System.Data.SqlDbType.Date);
                    comm.Parameters["@borrowed_date"].Value = selectedDate;


                    // Enclose database code in Try-Catch-Finally
                    try
                    {
                        // Open the connection
                        conn.Open();
                        // Execute the command
                        comm.ExecuteNonQuery();

                        checkOutComplete.Text = "<br />New checkout <br />Check Out Date: " + selectedDate + "<br /> Borrower: " + selectedBorrowerName
                                + "<br /> Disk Title: " + selectedDiskTitle;

                    }
                    catch (SqlException ex)
                    {
                        // Display error message
                        string str;
                        str = "Source:" + ex.Source;
                        str += "\n" + "Number:" + ex.Number.ToString();
                        str += "\n" + "Message:" + ex.Message;
                        str += "\n" + "Class:" + ex.Class.ToString();
                        str += "\n" + "Procedure:" + ex.Procedure.ToString();
                        str += "\n" + "Line Number:" + ex.LineNumber.ToString();
                        str += "\n" + "Server:" + ex.Server.ToString();
                        // Display error message
                        errorLabel.Text = str;

                    }
                    finally
                    {
                        // Close the connection
                        SqlDataSource2.SelectCommand = "select * from disk where (status_id = 2)";
                        DropDownTitle.DataBind();
                        conn.Close();
                        selectedBorrowerName = "";
                        selectedDiskTitle = "";
                        selectedDiskValue = "";
                        selectedBorrowerID = "";
                        selectedDate = "";
                    }
                }
            }
        }

        protected void btnEmptyCart_Click(object sender, EventArgs e)
        {
            selectedBorrowerLabel.Text = "";
            selectedDiskLabel.Text = "";
            selectedDiskIDLabel.Text = "";
            selectedBorrowerIDLabel.Text = "";
            txtDate.Text = "";
        }
    }

}
