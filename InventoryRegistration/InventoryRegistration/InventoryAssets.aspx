<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InventoryAssets.aspx.cs" Inherits="InventoryRegistration.InventoryAssets" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="hfAssetID" runat="server" />
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblAssetCode" runat="server" Text="Asset Code"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtAssetCode" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblAssetCategoryID" runat="server" Text="Asset Category ID"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="dropdownAssetCategoryID" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblPurchasedOn" runat="server" Text="Purchased On"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtPurchasedOn" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCurrentConditionID" runat="server" Text="Current Condition"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="dropdownCurrentConditionID" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblPurchasePrice" runat="server" Text="Purchase Price"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtPurchasePrice" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCurrentValue" runat="server" Text="Current Value"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtCurrentValue" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="grvInventoryAssets" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="AssetCode" HeaderText="Asset Code" />
                    <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />
                    <asp:BoundField DataField="PurchasedOn" HeaderText="Purchased On" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="PurchasePrice" HeaderText="Purchase Price" DataFormatString="{0:0.00}€" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="CurrentValue" HeaderText="Current Value" DataFormatString="{0:0.00}€" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkViewShow" runat="server" CommandArgument='<%# Eval("AssetID") %>' OnClick="linkViewShow_Click">Show</asp:LinkButton>
                            <asp:LinkButton ID="linkViewDelete" runat="server" CommandArgument='<%# Eval("AssetID") %>' OnClick="linkViewDelete_Click">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <br />
            <table>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Floor"></asp:Label>
                        <asp:TextBox ID="txtFilterFloor" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label runat="server" Text="Office"></asp:Label>
                        <asp:TextBox ID="txtFilterOffice" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label runat="server" Text="Category"></asp:Label>
                        <asp:DropDownList ID="dropdownFilterCategory" runat="server"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label runat="server" Text="Status"></asp:Label>
                        <asp:DropDownList ID="dropdownFilterStatus" runat="server"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                        <asp:Button ID="btnResetSearch" runat="server" Text="Clear filter" OnClick="btnResetSearch_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
