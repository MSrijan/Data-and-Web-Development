<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="projectmilestone.aspx.cs" Inherits="Coursework.projectmilestone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Milestone</title>
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
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="page-header">
                <h2><i class="fas fa-users"></i> Project Milestone</h2>
            </div>
            <div class="row mb-4 justify-content-center">
                <div class="col-md-6 text-center ">
                    <label for="DropDownList1" class="form-label fw-bold">Select Project</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="PROJECTNAME" DataValueField="PROJECTID" CssClass="form-select">
                    </asp:DropDownList>
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT 
    P.PROJECTID,
    P.PROJECTNAME,
    P.PROJECTSTARTDATE,
    P.PROJECTENDDATE,
    P.PROJECTSTATUS,
    M.MILESTONEID,
    M.MILESTONENAME,
    M.MILESTONEDUEDATE
FROM 
    PROJECTS P
JOIN 
    MILESTONES M ON P.PROJECTID = M.PROJECTS_PROJECTID
WHERE 
    P.PROJECTID = :PROJECT_ID
ORDER BY 
    M.MILESTONEDUEDATE">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="PROJECT_ID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
             <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PROJECTID,MILESTONEID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered">
                <Columns>
                    <asp:BoundField DataField="PROJECTID" HeaderText="PROJECTID" ReadOnly="True" SortExpression="PROJECTID" />
                    <asp:BoundField DataField="PROJECTNAME" HeaderText="PROJECTNAME" SortExpression="PROJECTNAME" />
                    <asp:BoundField DataField="PROJECTSTARTDATE" HeaderText="PROJECTSTARTDATE" SortExpression="PROJECTSTARTDATE" />
                    <asp:BoundField DataField="PROJECTENDDATE" HeaderText="PROJECTENDDATE" SortExpression="PROJECTENDDATE" />
                    <asp:BoundField DataField="PROJECTSTATUS" HeaderText="PROJECTSTATUS" SortExpression="PROJECTSTATUS" />
                    <asp:BoundField DataField="MILESTONEID" HeaderText="MILESTONEID" ReadOnly="True" SortExpression="MILESTONEID" />
                    <asp:BoundField DataField="MILESTONENAME" HeaderText="MILESTONENAME" SortExpression="MILESTONENAME" />
                    <asp:BoundField DataField="MILESTONEDUEDATE" HeaderText="MILESTONEDUEDATE" SortExpression="MILESTONEDUEDATE" />
                </Columns>
            </asp:GridView>
        </div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECTID&quot;, &quot;PROJECTNAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
