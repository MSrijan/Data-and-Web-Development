<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="milestone.aspx.cs" Inherits="Coursework.milestone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Milestone</title>
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
                <h2><i class="fas fa-users"></i> Milestone Management</h2>
            </div>
            <div class="form-container">
                <h4 class="mb-3">Add New Milestone</h4>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="MILESTONEID" DataSourceID="SqlDataSource1" CssClass="w-100">
                    <InsertItemTemplate>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="MILESTONEIDTextBox" class="form-label">MILESTONEID:</label>
                                <asp:TextBox ID="MILESTONEIDTextBox" runat="server" Text='<%# Bind("MILESTONEID") %>' class="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label for="MILESTONENAMETextBox" class="form-label">MILESTONENAME:</label>
                                <asp:TextBox ID="MILESTONENAMETextBox" runat="server" Text='<%# Bind("MILESTONENAME") %>' class="form-control" />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="MILESTONEDUEDATETextBox" class="form-label">MILESTONEDUEDATE:</label>
                                <asp:TextBox ID="MILESTONEDUEDATETextBox" runat="server" Text='<%# Bind("MILESTONEDUEDATE") %>' class="form-control" />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="DropDownList2" class="form-label">PROJECTS_PROJECTID:</label>
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="PROJECTNAME" DataValueField="PROJECTID" class="form-select" SelectedValue='<%# Bind("PROJECTS_PROJECTID") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECTNAME&quot;, &quot;PROJECTID&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
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
              <h4 class="mb-3">Milestone List</h4>
              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MILESTONEID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" CssClass="gridview-custom table table-striped table-hover"  BorderWidth="0px" GridLines="None">
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
                    <asp:BoundField DataField="MILESTONEID" HeaderText="MILESTONEID" ReadOnly="True" SortExpression="MILESTONEID" />
                    <asp:BoundField DataField="MILESTONENAME" HeaderText="MILESTONENAME" SortExpression="MILESTONENAME" />
                    <asp:BoundField DataField="MILESTONEDUEDATE" HeaderText="MILESTONEDUEDATE" SortExpression="MILESTONEDUEDATE" />
                    <asp:BoundField DataField="PROJECTS_PROJECTID" HeaderText="PROJECTS_PROJECTID" SortExpression="PROJECTS_PROJECTID" />
                    <asp:TemplateField HeaderText="Project Name">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="PROJECTNAME" DataValueField="PROJECTID" SelectedValue='<%# Bind("PROJECTS_PROJECTID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECTID&quot;, &quot;PROJECTNAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;MILESTONES&quot; WHERE &quot;MILESTONEID&quot; = :MILESTONEID" InsertCommand="INSERT INTO &quot;MILESTONES&quot; (&quot;MILESTONEID&quot;, &quot;MILESTONENAME&quot;, &quot;MILESTONEDUEDATE&quot;, &quot;PROJECTS_PROJECTID&quot;) VALUES (:MILESTONEID, :MILESTONENAME, :MILESTONEDUEDATE, :PROJECTS_PROJECTID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;MILESTONEID&quot;, &quot;MILESTONENAME&quot;, &quot;MILESTONEDUEDATE&quot;, &quot;PROJECTS_PROJECTID&quot; FROM &quot;MILESTONES&quot;" UpdateCommand="UPDATE &quot;MILESTONES&quot; SET &quot;MILESTONENAME&quot; = :MILESTONENAME, &quot;MILESTONEDUEDATE&quot; = :MILESTONEDUEDATE, &quot;PROJECTS_PROJECTID&quot; = :PROJECTS_PROJECTID WHERE &quot;MILESTONEID&quot; = :MILESTONEID">
                <DeleteParameters>
                    <asp:Parameter Name="MILESTONEID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MILESTONEID" Type="Decimal" />
                    <asp:Parameter Name="MILESTONENAME" Type="String" />
                    <asp:Parameter Name="MILESTONEDUEDATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECTS_PROJECTID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MILESTONENAME" Type="String" />
                    <asp:Parameter Name="MILESTONEDUEDATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECTS_PROJECTID" Type="Decimal" />
                    <asp:Parameter Name="MILESTONEID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            </div>
        </div>
    </form>
</body>
</html>
