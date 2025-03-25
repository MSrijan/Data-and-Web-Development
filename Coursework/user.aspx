<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user.aspx.cs" Inherits="Coursework.users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <style>
        /* Internal CSS */
        body {
            background-color: #f8f9fa;
            padding: 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .page-header {
            background-color: #343a40;
            color: white;
            padding: 15px 20px;
            border-radius: 5px;
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .data-container {
            background-color: white;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        
        .form-container {
            background-color: white;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        .gridview-custom {
            width: 100%;
            border-collapse: collapse;
        }
        
        .gridview-custom th {
            background-color: #343a40;
            color: white;
            padding: 10px;
            text-align: left;
        }
        
        .gridview-custom td {
            padding: 8px;
            border-bottom: 1px solid #dee2e6;
        }
        
        .gridview-custom tr:hover {
            background-color: #f1f1f1;
        }
        
        .btn-custom {
            margin-right: 5px;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        .form-label {
            font-weight: 600;
            margin-bottom: 5px;
            display: block;
        }
        
        .form-control-custom {
            width: 100%;
            padding: 8px;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="page-header">
                <h2><i class="fas fa-users"></i> User</h2>
            </div>
            
            <div class="form-container">
                <h4 class="mb-3">Add New User</h4>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="USERID" DataSourceID="SqlDataSource2" 
                    Width="100%">
                    <InsertItemTemplate>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">User ID:</label>
                                    <asp:TextBox ID="USERIDTextBox" runat="server" Text='<%# Bind("USERID") %>' 
                                        CssClass="form-control form-control-custom" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Username:</label>
                                    <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' 
                                        CssClass="form-control form-control-custom" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Contact:</label>
                                    <asp:TextBox ID="USERCONTACTTextBox" runat="server" Text='<%# Bind("USERCONTACT") %>' 
                                        CssClass="form-control form-control-custom" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Role:</label>
                                    <asp:TextBox ID="USERROLETextBox" runat="server" Text='<%# Bind("USERROLE") %>' 
                                        CssClass="form-control form-control-custom" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Email:</label>
                                    <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' 
                                        CssClass="form-control form-control-custom" />
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                CommandName="Insert" Text="Insert" CssClass="btn btn-success" />
                            &nbsp;
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                        </div>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                            CommandName="New" Text="Add New User" CssClass="btn btn-primary" />
                    </ItemTemplate>
                </asp:FormView>
            </div>
            <div class="data-container">
                <h4 class="mb-3">User List</h4>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="USERID" DataSourceID="SqlDataSource2"
                    CssClass="gridview-custom table table-striped table-hover" 
                    BorderWidth="0px" GridLines="None" AllowPaging="True">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" 
                                    CssClass="btn btn-sm btn-primary btn-custom" Text="Edit" />
                                <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" 
                                    CssClass="btn btn-sm btn-danger btn-custom" Text="Delete"
                                    OnClientClick="return confirm('Are you sure you want to delete this user?');" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" 
                                    CssClass="btn btn-sm btn-success btn-custom" Text="Update" />
                                <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" 
                                    CssClass="btn btn-sm btn-secondary btn-custom" Text="Cancel" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="USERID" HeaderText="ID" ReadOnly="True" SortExpression="USERID" />
                        <asp:BoundField DataField="USERNAME" HeaderText="Name" SortExpression="USERNAME" />
                        <asp:BoundField DataField="USERCONTACT" HeaderText="Contact" SortExpression="USERCONTACT" />
                        <asp:BoundField DataField="USERROLE" HeaderText="Role" SortExpression="USERROLE" />
                        <asp:BoundField DataField="EMAIL" HeaderText="Email" SortExpression="EMAIL" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    DeleteCommand="DELETE FROM &quot;USERS&quot; WHERE &quot;USERID&quot; = :USERID" 
                    InsertCommand="INSERT INTO &quot;USERS&quot; (&quot;USERID&quot;, &quot;USERNAME&quot;, &quot;USERCONTACT&quot;, &quot;USERROLE&quot;, &quot;EMAIL&quot;) VALUES (:USERID, :USERNAME, :USERCONTACT, :USERROLE, :EMAIL)" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                    SelectCommand="SELECT &quot;USERID&quot;, &quot;USERNAME&quot;, &quot;USERCONTACT&quot;, &quot;USERROLE&quot;, &quot;EMAIL&quot; FROM &quot;USERS&quot;" 
                    UpdateCommand="UPDATE &quot;USERS&quot; SET &quot;USERNAME&quot; = :USERNAME, &quot;USERCONTACT&quot; = :USERCONTACT, &quot;USERROLE&quot; = :USERROLE, &quot;EMAIL&quot; = :EMAIL WHERE &quot;USERID&quot; = :USERID">
                    <DeleteParameters>
                        <asp:Parameter Name="USERID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="USERID" Type="Decimal" />
                        <asp:Parameter Name="USERNAME" Type="String" />
                        <asp:Parameter Name="USERCONTACT" Type="String" />
                        <asp:Parameter Name="USERROLE" Type="String" />
                        <asp:Parameter Name="EMAIL" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="USERNAME" Type="String" />
                        <asp:Parameter Name="USERCONTACT" Type="String" />
                        <asp:Parameter Name="USERROLE" Type="String" />
                        <asp:Parameter Name="EMAIL" Type="String" />
                        <asp:Parameter Name="USERID" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>                 
        </div>
    </form>
    
    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>