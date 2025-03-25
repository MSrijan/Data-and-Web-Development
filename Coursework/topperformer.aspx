<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="topperformer.aspx.cs" Inherits="Coursework.topperformer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Top Performer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
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
        .dropdown-container {
            margin-bottom: 20px;
        }
        </style>
</head>
<body>
    <div class="container">
        <div class="page-header">
            <h2> Top Performers</h2>
        </div>
            <form id="form1" runat="server">
                <div class="dropdown-container text-center">
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select w-50 mx-auto" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="PROJECTNAME" DataValueField="PROJECTID"></asp:DropDownList>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT projectid, userid, username, email, userrole, usercontact, task_count
FROM (
    SELECT 
        t.projects_projectid AS projectid,
        u.userid,
        u.username,
        u.email,
        u.userrole,
        u.usercontact,
        COUNT(t.taskid) AS task_count
    FROM users u
    JOIN usertask ut ON u.userid = ut.users_userid
    JOIN task t ON ut.task_taskid = t.taskid
    WHERE t.taskstatus = 'Completed'
    AND t.projects_projectid = :projectid 
    GROUP BY u.userid, u.username, u.email, u.userrole, u.usercontact, t.projects_projectid
    ORDER BY task_count DESC
) 
WHERE ROWNUM &lt;= 3">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="projectid" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECTID&quot;, &quot;PROJECTNAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
        <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"  CssClass="table table-striped table-hover table-bordered">
            </asp:GridView>
        </div>
        <br />
    </form>
    </div>
</body>
</html>
