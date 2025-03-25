<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="project.aspx.cs" Inherits="Coursework.project" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
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
                <h2><i class="fas fa-users"></i> Project Management</h2>
            </div>
            <div class="form-container">
                <h4 class="mb-3">Add New Project</h4>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="PROJECTID" DataSourceID="SqlDataSource1" Height="18px" CssClass="w-100">
                    <InsertItemTemplate>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="PROJECTIDTextBox" class="form-label">PROJECTID:</label>
                                <asp:TextBox ID="PROJECTIDTextBox" runat="server" Text='<%# Bind("PROJECTID") %>' class="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label for="PROJECTNAMETextBox" class="form-label">PROJECTNAME:</label>
                                <asp:TextBox ID="PROJECTNAMETextBox" runat="server" Text='<%# Bind("PROJECTNAME") %>' class="form-control" />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="PROJECTSTARTDATETextBox" class="form-label">PROJECTSTARTDATE:</label>
                                <asp:TextBox ID="PROJECTSTARTDATETextBox" runat="server" Text='<%# Bind("PROJECTSTARTDATE") %>' class="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label for="PROJECTENDDATETextBox" class="form-label">PROJECTENDDATE:</label>
                                <asp:TextBox ID="PROJECTENDDATETextBox" runat="server" Text='<%# Bind("PROJECTENDDATE") %>' class="form-control" />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="PROJECTSTATUSTextBox" class="form-label">PROJECTSTATUS:</label>
                                <asp:TextBox ID="PROJECTSTATUSTextBox" runat="server" Text='<%# Bind("PROJECTSTATUS") %>' class="form-control" />
                            </div>
                        </div>

                        <div class="d-flex gap-4">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                        </div>
                    </InsertItemTemplate>

                    <ItemTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" CssClass="btn btn-primary" />
                    </ItemTemplate>
                </asp:FormView>
            </div>
            <div class="data-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PROJECTID" DataSourceID="SqlDataSource1" AllowPaging="True" CssClass="gridview-custom table table-striped table-hover"  BorderWidth="0px" GridLines="None">
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
                        <asp:BoundField DataField="PROJECTID" HeaderText="PROJECTID" ReadOnly="True" SortExpression="PROJECTID" />
                        <asp:BoundField DataField="PROJECTNAME" HeaderText="PROJECTNAME" SortExpression="PROJECTNAME" />
                        <asp:BoundField DataField="PROJECTSTARTDATE" HeaderText="PROJECTSTARTDATE" SortExpression="PROJECTSTARTDATE" />
                        <asp:BoundField DataField="PROJECTENDDATE" HeaderText="PROJECTENDDATE" SortExpression="PROJECTENDDATE" />
                        <asp:BoundField DataField="PROJECTSTATUS" HeaderText="PROJECTSTATUS" SortExpression="PROJECTSTATUS" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PROJECTS&quot; WHERE &quot;PROJECTID&quot; = :PROJECTID" InsertCommand="INSERT INTO &quot;PROJECTS&quot; (&quot;PROJECTID&quot;, &quot;PROJECTNAME&quot;, &quot;PROJECTSTARTDATE&quot;, &quot;PROJECTENDDATE&quot;, &quot;PROJECTSTATUS&quot;) VALUES (:PROJECTID, :PROJECTNAME, :PROJECTSTARTDATE, :PROJECTENDDATE, :PROJECTSTATUS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECTID&quot;, &quot;PROJECTNAME&quot;, &quot;PROJECTSTARTDATE&quot;, &quot;PROJECTENDDATE&quot;, &quot;PROJECTSTATUS&quot; FROM &quot;PROJECTS&quot;" UpdateCommand="UPDATE &quot;PROJECTS&quot; SET &quot;PROJECTNAME&quot; = :PROJECTNAME, &quot;PROJECTSTARTDATE&quot; = :PROJECTSTARTDATE, &quot;PROJECTENDDATE&quot; = :PROJECTENDDATE, &quot;PROJECTSTATUS&quot; = :PROJECTSTATUS WHERE &quot;PROJECTID&quot; = :PROJECTID">
                    <DeleteParameters>
                        <asp:Parameter Name="PROJECTID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="PROJECTID" Type="Decimal" />
                        <asp:Parameter Name="PROJECTNAME" Type="String" />
                        <asp:Parameter Name="PROJECTSTARTDATE" Type="DateTime" />
                        <asp:Parameter Name="PROJECTENDDATE" Type="DateTime" />
                        <asp:Parameter Name="PROJECTSTATUS" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="PROJECTNAME" Type="String" />
                        <asp:Parameter Name="PROJECTSTARTDATE" Type="DateTime" />
                        <asp:Parameter Name="PROJECTENDDATE" Type="DateTime" />
                        <asp:Parameter Name="PROJECTSTATUS" Type="String" />
                        <asp:Parameter Name="PROJECTID" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </form>
</body>
</html>
