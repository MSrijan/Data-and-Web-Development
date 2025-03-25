<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="task.aspx.cs" Inherits="Coursework.task" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Task Management</title>
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
                <h2><i class="fas fa-tasks"></i> Task</h2>
            </div>
            <div class="form-container">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="TASKID" DataSourceID="SqlDataSource1" CssClass="w-100">
                    <InsertItemTemplate>
                        <div class="row mb-3">
                            <div class="col-md-6">
                            <label for="TASKIDTextBox" class="form-label">Task ID</label>
                            <asp:TextBox ID="TASKIDTextBox" runat="server" Text='<%# Bind("TASKID") %>' class="form-control" />
                        </div>
                        <div class="col-md-6">
                            <label for="TASKNAMETextBox" class="form-label">Task Name</label>
                            <asp:TextBox ID="TASKNAMETextBox" runat="server" Text='<%# Bind("TASKNAME") %>' class="form-control" />
                        </div>
                        </div>
                        <div class="row mb-3">
                                                    <div class="col-md-6">
                            <label for="TASKSTARTDATETextBox" class="form-label">Start Date</label>
                            <asp:TextBox ID="TASKSTARTDATETextBox" runat="server" Text='<%# Bind("TASKSTARTDATE") %>' class="form-control" />
                        </div>
                        <div class="col-md-6">
                            <label for="TASKSTATUSTextBox" class="form-label">Task Status</label>
                            <asp:TextBox ID="TASKSTATUSTextBox" runat="server" Text='<%# Bind("TASKSTATUS") %>' class="form-control" />
                        </div>
                        </div>
                        <div class="col-md-6">
                            <label for="DropDownList3" class="form-label">Select Project</label>
                            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="PROJECTNAME" DataValueField="PROJECTID" SelectedValue='<%# Bind("PROJECTS_PROJECTID") %>' class="form-select">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT PROJECTID, PROJECTNAME FROM PROJECTS">
                            </asp:SqlDataSource>
                        </div>

                        <div class="mb-3">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" class="btn btn-primary" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" class="btn btn-secondary" />
                        </div>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" class="btn btn-primary" />
                    </ItemTemplate>
                </asp:FormView>
            </div>
            <div class="data-container">
               <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TASKID" DataSourceID="SqlDataSource1"  CssClass="gridview-custom table table-striped table-hover"  BorderWidth="0px" GridLines="None" AllowPaging="True">
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
                    <asp:BoundField DataField="TASKID" HeaderText="TASKID" ReadOnly="True" SortExpression="TASKID" />
                    <asp:BoundField DataField="TASKNAME" HeaderText="TASKNAME" SortExpression="TASKNAME" />
                    <asp:BoundField DataField="TASKSTARTDATE" HeaderText="TASKSTARTDATE" SortExpression="TASKSTARTDATE" />
                    <asp:BoundField DataField="TASKSTATUS" HeaderText="TASKSTATUS" SortExpression="TASKSTATUS" />
                    <asp:BoundField DataField="PROJECTS_PROJECTID" HeaderText="PROJECTS_PROJECTID" SortExpression="PROJECTS_PROJECTID" />
                    <asp:TemplateField HeaderText="Project Name">
                        <ItemTemplate>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECTNAME&quot;, &quot;PROJECTID&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="PROJECTNAME" DataValueField="PROJECTID" SelectedValue='<%# Bind("PROJECTS_PROJECTID") %>'>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;TASK&quot; WHERE &quot;TASKID&quot; = :TASKID" InsertCommand="INSERT INTO &quot;TASK&quot; (&quot;TASKID&quot;, &quot;TASKNAME&quot;, &quot;TASKSTARTDATE&quot;, &quot;TASKSTATUS&quot;, &quot;PROJECTS_PROJECTID&quot;) VALUES (:TASKID, :TASKNAME, :TASKSTARTDATE, :TASKSTATUS, :PROJECTS_PROJECTID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASKID&quot;, &quot;TASKNAME&quot;, &quot;TASKSTARTDATE&quot;, &quot;TASKSTATUS&quot;, &quot;PROJECTS_PROJECTID&quot; FROM &quot;TASK&quot;" UpdateCommand="UPDATE &quot;TASK&quot; SET &quot;TASKNAME&quot; = :TASKNAME, &quot;TASKSTARTDATE&quot; = :TASKSTARTDATE, &quot;TASKSTATUS&quot; = :TASKSTATUS, &quot;PROJECTS_PROJECTID&quot; = :PROJECTS_PROJECTID WHERE &quot;TASKID&quot; = :TASKID">
                <DeleteParameters>
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                    <asp:Parameter Name="TASKNAME" Type="String" />
                    <asp:Parameter Name="TASKSTARTDATE" Type="DateTime" />
                    <asp:Parameter Name="TASKSTATUS" Type="String" />
                    <asp:Parameter Name="PROJECTS_PROJECTID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TASKNAME" Type="String" />
                    <asp:Parameter Name="TASKSTARTDATE" Type="DateTime" />
                    <asp:Parameter Name="TASKSTATUS" Type="String" />
                    <asp:Parameter Name="PROJECTS_PROJECTID" Type="Decimal" />
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            </div>

        </div>
    </form>
</body>
</html>
