using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace InventoryRegistration
{
    public partial class InventoryAssets : System.Web.UI.Page
    {
        // Connection
        private static readonly string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Inventari"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillDropdowns(dropdownAssetCategoryID, dropdownCurrentConditionID, false);
                FillDropdowns(dropdownFilterCategory, dropdownFilterStatus, true);
                FillGrid();
                btnUpdate.Enabled = !string.IsNullOrEmpty(hfAssetID.Value);
            }
           
            // krijimi i nje sql connection objektit
            SqlConnection sqlConn = new SqlConnection(ConnectionString);
            // komanda per me hap koneksionin me DB
            sqlConn.Open();
            // krijimi i nje sql query (si psh "select * from tabela" etj ose emrin e procedures ne DB)
            SqlCommand sqlComm = new SqlCommand("ShowAll", sqlConn);
            // percakton me cfar tipi te komandes kemi te bejme (Store Procedure)
            sqlComm.CommandType = CommandType.StoredProcedure;
            //sqlReader.Close();
            sqlConn.Close();
        }

        // Category & Condition fill
        private void FillDropdowns(DropDownList categories, DropDownList conditions, bool addEmpty)
        {
            SqlConnection sqlConn1 = new SqlConnection(ConnectionString);
            sqlConn1.Open();
            SqlCommand assetCmd = new SqlCommand("Select * From Category", sqlConn1);
            categories.DataValueField = "AssetCategoryID";
            categories.DataTextField = "CategoryName";
            categories.DataSource = assetCmd.ExecuteReader();
            categories.DataBind();
            sqlConn1.Close();

            if (addEmpty)
            {
                categories.Items.Insert(0, new ListItem("", ""));
            }

            SqlConnection sqlConn2 = new SqlConnection(ConnectionString);
            sqlConn2.Open();
            SqlCommand statusCmd = new SqlCommand("Select * From Condition", sqlConn2);
            conditions.DataValueField = "CurrentConditionID";
            conditions.DataTextField = "Status";
            conditions.DataSource = statusCmd.ExecuteReader();
            conditions.DataBind();
            sqlConn2.Close();

            if (addEmpty)
            {
                conditions.Items.Insert(0, new ListItem("", ""));
            }
        }

        // Grid
        private void FillGrid()
        {
            SqlConnection sqlConn = new SqlConnection(ConnectionString);
            sqlConn.Open();
            SqlCommand query = new SqlCommand(@"
                SELECT * FROM Asset 
                INNER JOIN Category ON Asset.AssetCategoryID=Category.AssetCategoryID
                INNER JOIN Condition ON Asset.CurrentConditionID=Condition.CurrentConditionID", sqlConn);
            grvInventoryAssets.DataSource = query.ExecuteReader();
            grvInventoryAssets.DataBind();
            sqlConn.Close();
        }

        // Register
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!TryParseCategory(txtAssetCode.Text, out _, out _))
            {
                lblErrorMessage.Text = "Invalid asset code.";
                return;
            }

            SqlConnection sqlConn = new SqlConnection(ConnectionString);
            SqlCommand sqlComm = new SqlCommand("Register", sqlConn);
            sqlComm.CommandType = CommandType.StoredProcedure;
            sqlComm.Parameters.AddWithValue("@AssetCode", txtAssetCode.Text);
            sqlComm.Parameters.AddWithValue("@PurchasedOn", DateTime.ParseExact(txtPurchasedOn.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture));
            sqlComm.Parameters.AddWithValue("@AssetCategoryID", int.Parse(dropdownAssetCategoryID.SelectedValue));
            sqlComm.Parameters.AddWithValue("@CurrentConditionID", int.Parse(dropdownCurrentConditionID.SelectedValue));
            sqlComm.Parameters.AddWithValue("@Description", txtDescription.Text);
            sqlComm.Parameters.AddWithValue("@PurchasePrice", txtPurchasePrice.Text);
            sqlComm.Parameters.AddWithValue("@CurrentValue", txtCurrentValue.Text);

            sqlConn.Open();
            sqlComm.ExecuteNonQuery();
            sqlConn.Close();
            Response.Redirect("InventoryAssets.aspx");
        }

        // Update
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!TryParseCategory(txtAssetCode.Text, out _, out _))
            {
                lblErrorMessage.Text = "Invalid asset code.";
                return;
            }

            SqlConnection sqlConn = new SqlConnection(ConnectionString);
            SqlCommand sqlComm = new SqlCommand("Update", sqlConn);    
            sqlComm.CommandType = CommandType.StoredProcedure;
            sqlComm.Parameters.AddWithValue("@AssetID", hfAssetID.Value);
            sqlComm.Parameters.AddWithValue("@AssetCode", txtAssetCode.Text);
            sqlComm.Parameters.AddWithValue("@PurchasedOn", DateTime.ParseExact(txtPurchasedOn.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture));
            sqlComm.Parameters.AddWithValue("@AssetCategoryID", int.Parse(dropdownAssetCategoryID.SelectedValue));
            sqlComm.Parameters.AddWithValue("@CurrentConditionID", int.Parse(dropdownCurrentConditionID.SelectedValue));
            sqlComm.Parameters.AddWithValue("@Description", txtDescription.Text);
            sqlComm.Parameters.AddWithValue("@PurchasePrice", txtPurchasePrice.Text);
            sqlComm.Parameters.AddWithValue("@CurrentValue", txtCurrentValue.Text);

            sqlConn.Open();
            sqlComm.ExecuteNonQuery();
            sqlConn.Close();
            Response.Redirect("InventoryAssets.aspx");
        }

        // Search - Generate
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string filterFloor = txtFilterFloor.Text;
            string filterOffice = txtFilterOffice.Text;
            string filterCategory = dropdownFilterCategory.SelectedValue;
            string filterStatus = dropdownFilterStatus.SelectedValue;

            SqlConnection sqlConn = new SqlConnection(ConnectionString);
            sqlConn.Open();

            string sql = @"
                SELECT * FROM Asset 
                INNER JOIN Category ON Asset.AssetCategoryID=Category.AssetCategoryID
                INNER JOIN Condition ON Asset.CurrentConditionID=Condition.CurrentConditionID";

            string condition = " WHERE";

            if (!string.IsNullOrEmpty(filterFloor))
            {
                if (!int.TryParse(filterFloor, out _))
                {
                    lblErrorMessage.Text = "Invalid floor number.";
                    return;
                }

                filterFloor = filterFloor.PadLeft(2, '0');
                sql += condition + " SUBSTRING(AssetCode, 1, 2)=@filterFloor";
                condition = " AND";
            }

            if (!string.IsNullOrEmpty(filterOffice))
            {
                if (!int.TryParse(filterOffice, out _))
                {
                    lblErrorMessage.Text = "Invalid office number.";
                    return;
                }

                filterOffice = filterOffice.PadLeft(2, '0');
                sql += condition + " SUBSTRING(AssetCode, 3, 2)=@filterOffice";
                condition = " AND";
            }

            if (!string.IsNullOrEmpty(filterCategory))
            {
                sql += condition + " Asset.AssetCategoryID=@filterCategory";
                condition = " AND";
            }

            if (!string.IsNullOrEmpty(filterStatus))
            {
                sql += condition + " Asset.CurrentConditionID=@filterStatus";
                condition = " AND";
            }

            SqlCommand query = new SqlCommand(sql, sqlConn);
            query.Parameters.AddWithValue("@filterFloor", filterFloor);
            query.Parameters.AddWithValue("@filterOffice", filterOffice);
            query.Parameters.AddWithValue("@filterCategory", filterCategory);
            query.Parameters.AddWithValue("@filterStatus", filterStatus);

            grvInventoryAssets.DataSource = query.ExecuteReader();
            grvInventoryAssets.DataBind();
            sqlConn.Close();

            lblErrorMessage.Text = "";
        }

        // Clear Search
        protected void btnResetSearch_Click(object sender, EventArgs e)
        {
            txtFilterFloor.Text = "";
            txtFilterOffice.Text = "";
            dropdownFilterCategory.SelectedIndex = 0;
            dropdownFilterStatus.SelectedIndex = 0;
            FillGrid();
            lblErrorMessage.Text = "";
        }

        // Show data
        protected void linkViewShow_Click(object sender, EventArgs e)
        {
            int AssetID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            SqlConnection sqlConn = new SqlConnection(ConnectionString);
            sqlConn.Open();

            SqlCommand sqlComm = new SqlCommand($@"
                SELECT AssetCode, AssetCategoryID, PurchasedOn, 
                       CurrentConditionID, PurchasePrice, CurrentValue,
                       Description 
                FROM Asset
                WHERE AssetID={AssetID}", sqlConn);

            SqlDataReader reader = sqlComm.ExecuteReader();
            reader.Read();
            string AssetCode = reader.GetString(0);
            int AssetCategoryID = reader.GetInt32(1);
            string PurchasedOn = reader.GetDateTime(2).ToString("dd/MM/yyyy");
            int CurrentConditionID = reader.GetInt32(3);
            double PurchasePrice = reader.GetSqlMoney(4).ToDouble();
            double CurrentValue = reader.GetSqlMoney(5).ToDouble();
            string Description = reader.GetString(6);

            hfAssetID.Value = AssetID.ToString();
            txtAssetCode.Text = AssetCode;
            txtPurchasedOn.Text = PurchasedOn;
            dropdownAssetCategoryID.SelectedValue = AssetCategoryID.ToString();
            dropdownCurrentConditionID.SelectedValue = CurrentConditionID.ToString();
            txtPurchasePrice.Text = PurchasePrice.ToString();
            txtCurrentValue.Text = CurrentValue.ToString();
            txtDescription.Text = Description;
            sqlConn.Close();

            btnUpdate.Enabled = true;
        }

        // Delete
        protected void linkViewDelete_Click(object sender, EventArgs e)
        {
            int AssetID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            SqlConnection sqlConn = new SqlConnection(ConnectionString);
            sqlConn.Open();

            SqlCommand sqlComm = new SqlCommand($@"
                DELETE
                FROM Asset
                WHERE AssetID={AssetID}", sqlConn);

            sqlComm.ExecuteNonQuery();
            sqlConn.Close();

            Response.Redirect("InventoryAssets.aspx");
        }

        private bool TryParseCategory(string code, out int floor, out int office)
        {
            floor = 0;
            office = 0;

            code = code.Trim();
            if (code.Length != 4)
            {
                return false;
            }

            string floorStr = code.Substring(0, 2);
            string officeStr = code.Substring(2, 2);

            if (!int.TryParse(floorStr, out floor))
            {
                return false;
            }

            if (!int.TryParse(officeStr, out office))
            {
                return false;
            }

            return true;
        }
    }
}