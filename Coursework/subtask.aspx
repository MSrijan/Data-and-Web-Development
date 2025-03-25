<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="subtask.aspx.cs" Inherits="Coursework.subtask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Subtask Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <style>
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
        .content-container {
            background-color: white;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
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
        .dropdown-custom {
            width: 100%;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="page-header">
                <h2><i class="fas fa-tasks"></i> Subtask</h2>
            </div>
            <div class="content-container">
                <h4 class="mb-3">Add New Subtask</h4>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="SUBTASKID" DataSourceID="SqlDataSource1" CssClass="w-100">
                    <InsertItemTemplate>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="SUBTASKIDTextBox" class="form-label">SUBTASKID:</label>
                                <asp:TextBox ID="SUBTASKIDTextBox" runat="server" Text='<%# Bind("SUBTASKID") %>' class="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label for="SUBTASKNAMETextBox" class="form-label">SUBTASKNAME:</label>
                                <asp:TextBox ID="SUBTASKNAMETextBox" runat="server" Text='<%# Bind("SUBTASKNAME") %>' class="form-control" />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="SUBTASKSTATUSTextBox" class="form-label">SUBTASKSTATUS:</label>
                                <asp:TextBox ID="SUBTASKSTATUSTextBox" runat="server" Text='<%# Bind("SUBTASKSTATUS") %>' class="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label for="DropDownList3" class="form-label">TASK_TASKID:</label>
                                <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="TASKNAME" DataValueField="TASKID" SelectedValue='<%# Bind("TASK_TASKID") %>' class="form-select">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASKID&quot;, &quot;TASKNAME&quot; FROM &quot;TASK&quot;"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="DropDownList4" class="form-label">USERS_USERID:<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USERID&quot;, &quot;USERNAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
                                <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="USERNAME" DataValueField="USERID" SelectedValue='<%# Bind("USERS_USERID") %>' class="form-select">
                                </asp:DropDownList>
                                </label>
                                &nbsp;</div>
                        </div>
                        <div class="d-flex gap-4">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                        </div>
                    </InsertItemTemplate>

                    <ItemTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn btn-primary" />
                    </ItemTemplate>
                </asp:FormView>
            </div>

     
            <div class="content-container">
                <h4 class="mb-3">Subtask List</h4>
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SUBTASKID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                        CssClass="gridview-custom table table-striped table-hover" BorderWidth="0px" GridLines="None" AllowPaging="True">
                        <Columns>
                                                        <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn btn-sm btn-primary btn-custom" Text="Edit" />
                                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn btn-sm btn-danger btn-custom" Text="Delete"
                                        OnClientClick="return confirm('Are you sure you want to delete this task?');" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" CssClass="btn btn-sm btn-success btn-custom" Text="Update" />
                                    <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" CssClass="btn btn-sm btn-secondary btn-custom" Text="Cancel" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="SUBTASKID" HeaderText="Subtask ID" ReadOnly="True" SortExpression="SUBTASKID" />
                            <asp:BoundField DataField="SUBTASKNAME" HeaderText="Subtask Name" SortExpression="SUBTASKNAME" />
                            <asp:BoundField DataField="SUBTASKSTATUS" HeaderText="Status" SortExpression="SUBTASKSTATUS" />
                            <asp:BoundField DataField="TASK_TASKID" HeaderText="Task ID" SortExpression="TASK_TASKID" />
                            <asp:BoundField DataField="USERS_USERID" HeaderText="User ID" SortExpression="USERS_USERID" />
                            <asp:TemplateField HeaderText="Task and User Name">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="TASKNAME" DataValueField="TASKID" SelectedValue='<%# Bind("TASK_TASKID") %>'
                                        CssClass="form-select form-select-sm dropdown-custom">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASKID&quot;, &quot;TASKNAME&quot; FROM &quot;TASK&quot;"></asp:SqlDataSource>
                                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="USERNAME" DataValueField="USERID" SelectedValue='<%# Bind("USERS_USERID") %>'
                                        CssClass="form-select form-select-sm dropdown-custom">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USERID&quot;, &quot;USERNAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;SUBTASK&quot; WHERE &quot;SUBTASKID&quot; = :SUBTASKID" InsertCommand="INSERT INTO &quot;SUBTASK&quot; (&quot;SUBTASKID&quot;, &quot;SUBTASKNAME&quot;, &quot;SUBTASKSTATUS&quot;, &quot;TASK_TASKID&quot;, &quot;USERS_USERID&quot;) VALUES (:SUBTASKID, :SUBTASKNAME, :SUBTASKSTATUS, :TASK_TASKID, :USERS_USERID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;SUBTASKID&quot;, &quot;SUBTASKNAME&quot;, &quot;SUBTASKSTATUS&quot;, &quot;TASK_TASKID&quot;, &quot;USERS_USERID&quot; FROM &quot;SUBTASK&quot;" UpdateCommand="UPDATE &quot;SUBTASK&quot; SET &quot;SUBTASKNAME&quot; = :SUBTASKNAME, &quot;SUBTASKSTATUS&quot; = :SUBTASKSTATUS, &quot;TASK_TASKID&quot; = :TASK_TASKID, &quot;USERS_USERID&quot; = :USERS_USERID WHERE &quot;SUBTASKID&quot; = :SUBTASKID">
                    <DeleteParameters>
                        <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                        <asp:Parameter Name="SUBTASKNAME" Type="String" />
                        <asp:Parameter Name="SUBTASKSTATUS" Type="String" />
                        <asp:Parameter Name="TASK_TASKID" Type="Decimal" />
                        <asp:Parameter Name="USERS_USERID" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SUBTASKNAME" Type="String" />
                        <asp:Parameter Name="SUBTASKSTATUS" Type="String" />
                        <asp:Parameter Name="TASK_TASKID" Type="Decimal" />
                        <asp:Parameter Name="USERS_USERID" Type="Decimal" />
                        <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>                      
        </div>
    </form>
    
    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>