<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userProject.aspx.cs" Inherits="Coursework.userProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Projects</title>
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
            <h2><i class="fas fa-tasks"></i> User Project</h2>
        </div>
        <form id="form1" runat="server">
            <div class="dropdown-container text-center">
                <label for="DropDownList1" class="form-label fw-bold">Select User:</label>
                <asp:DropDownList ID="DropDownList1" CssClass="form-select w-50 mx-auto" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="USERNAME" DataValueField="USERID"></asp:DropDownList>
            </div>

            <div class="table-responsive">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-hover table-bordered" AutoGenerateColumns="False" DataKeyNames="USERID,PROJECTID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="USERID" HeaderText="USERID" ReadOnly="True" SortExpression="USERID" />
                        <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                        <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                        <asp:BoundField DataField="USERROLE" HeaderText="USERROLE" SortExpression="USERROLE" />
                        <asp:BoundField DataField="USERCONTACT" HeaderText="USERCONTACT" SortExpression="USERCONTACT" />
                        <asp:BoundField DataField="PROJECTID" HeaderText="PROJECTID" ReadOnly="True" SortExpression="PROJECTID" />
                        <asp:BoundField DataField="PROJECTNAME" HeaderText="PROJECTNAME" SortExpression="PROJECTNAME" />
                        <asp:BoundField DataField="PROJECTSTARTDATE" HeaderText="START DATE" SortExpression="PROJECTSTARTDATE" />
                        <asp:BoundField DataField="PROJECTENDDATE" HeaderText="END DATE" SortExpression="PROJECTENDDATE" />
                        <asp:BoundField DataField="PROJECTSTATUS" HeaderText="STATUS" SortExpression="PROJECTSTATUS" />
                    </Columns>
                </asp:GridView>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT 
                    U.USERID,
                    U.USERNAME,
                    U.EMAIL,
                    U.USERROLE,
                    U.USERCONTACT,
                    P.PROJECTID,
                    P.PROJECTNAME,
                    P.PROJECTSTARTDATE,
                    P.PROJECTENDDATE,
                    P.PROJECTSTATUS
                FROM 
                    USERS U
                JOIN 
                    USERSPROJECTS UP ON U.USERID = UP.USERS_USERID
                JOIN 
                    PROJECTS P ON UP.PROJECTS_PROJECTID = P.PROJECTID
                WHERE 
                    U.USERID = :USER_ID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="USER_ID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT USERID, USERNAME FROM USERS"></asp:SqlDataSource>
        </form>
    </div>
</body>
</html>
