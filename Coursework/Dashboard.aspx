<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Coursework.Dashboard" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #f8f9fa;
            min-height: 100vh;
        }
        .container form{
            min-height:100vh;
        }
        .card {
            transition: all 0.3s ease;
            border: none;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
        }
        .btn-dashboard {
            width: 100%;
            padding: 1rem;
            text-align: left;
            border: none;
            background-color: transparent;
            color: #495057;
            font-weight: 500;
        }
        .btn-dashboard:hover {
            background-color: rgba(13, 110, 253, 0.05);
        }
        .card-icon {
            font-size: 1.5rem;
            color: #0d6efd;
            margin-bottom: 0.5rem;
        }
        .navbar-brand {
            font-weight: 600;
        }
        .footer {
            background-color: #f1f3f5;
            padding: 1rem 0;
            margin-top: 2rem;
        }
        .charts-container {
            margin-top: 3rem;
        }
        .chart-card {
            background-color: white;
            border-radius: 0.5rem;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            padding: 1.5rem;
            margin-bottom: 2rem;
        }
        .chart-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 1rem;
            color: #343a40;
        }
        .chart-subtitle {
            font-size: 0.875rem;
            color: #6c757d;
            margin-bottom: 1.5rem;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
        <div class="container">
            <span class="navbar-brand mb-0 h1">
                <i class="bi bi-kanban me-2"></i>
                Project Management
            </span>
        </div>
    </nav>

    <div class="container py-5">
        <form id="form1" runat="server">
            <div class="row mb-4">
                <div class="col-12 text-center">
                    <h2 class="fw-bold mb-3">Dashboard</h2>
                    <p class="text-muted">Select a tool to manage your projects efficiently</p>
                </div>
            </div>

            <div class="row g-4">
                <div class="col-md-6 col-lg-3">
                    <div class="card h-100">
                        <div class="card-body">
                            <i class="bi bi-flag card-icon"></i>
                            <h5 class="card-title">Milestone</h5>
                            <p class="card-text text-muted small">Track and manage project milestones</p>
                            <asp:Button ID="btnForm1" runat="server" Text="Open" OnClick="btnForm1_Click" 
                                CssClass="btn btn-dashboard" />
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6 col-lg-3">
                    <div class="card h-100">
                        <div class="card-body">
                            <i class="bi bi-briefcase card-icon"></i>
                            <h5 class="card-title">Project</h5>
                            <p class="card-text text-muted small">Create and manage projects</p>
                            <asp:Button ID="btnForm2" runat="server" Text="Open" OnClick="btnForm2_Click" 
                                CssClass="btn btn-dashboard" />
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6 col-lg-3">
                    <div class="card h-100">
                        <div class="card-body">
                            <i class="bi bi-list-check card-icon"></i>
                            <h5 class="card-title">SubTask</h5>
                            <p class="card-text text-muted small">Manage subtasks within tasks</p>
                            <asp:Button ID="btnForm3" runat="server" Text="Open" OnClick="btnForm3_Click" 
                                CssClass="btn btn-dashboard" />
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6 col-lg-3">
                    <div class="card h-100">
                        <div class="card-body">
                            <i class="bi bi-check2-square card-icon"></i>
                            <h5 class="card-title">Task</h5>
                            <p class="card-text text-muted small">Create and assign tasks</p>
                            <asp:Button ID="btnForm4" runat="server" Text="Open" OnClick="btnForm4_Click" 
                                CssClass="btn btn-dashboard" />
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6 col-lg-3">
                    <div class="card h-100">
                        <div class="card-body">
                            <i class="bi bi-people card-icon"></i>
                            <h5 class="card-title">Users</h5>
                            <p class="card-text text-muted small">Manage team members</p>
                            <asp:Button ID="btnForm5" runat="server" Text="Open" OnClick="btnForm5_Click" 
                                CssClass="btn btn-dashboard" />
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6 col-lg-3">
                    <div class="card h-100">
                        <div class="card-body">
                            <i class="bi bi-diagram-3 card-icon"></i>
                            <h5 class="card-title">Project Milestone</h5>
                            <p class="card-text text-muted small">Link milestones to projects</p>
                            <asp:Button ID="btnForm6" runat="server" Text="Open" OnClick="btnForm6_Click" 
                                CssClass="btn btn-dashboard" />
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6 col-lg-3">
                    <div class="card h-100">
                        <div class="card-body">
                            <i class="bi bi-trophy card-icon"></i>
                            <h5 class="card-title">Top Performer</h5>
                            <p class="card-text text-muted small">View team performance metrics</p>
                            <asp:Button ID="btnForm7" runat="server" Text="Open" OnClick="btnForm7_Click" 
                                CssClass="btn btn-dashboard" />
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6 col-lg-3">
                    <div class="card h-100">
                        <div class="card-body">
                            <i class="bi bi-person-workspace card-icon"></i>
                            <h5 class="card-title">Users Project</h5>
                            <p class="card-text text-muted small">Assign users to projects</p>
                            <asp:Button ID="btnForm8" runat="server" Text="Open" OnClick="btnForm8_Click" 
                                CssClass="btn btn-dashboard" />
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Charts Section -->
            <div class="charts-container">
                <div class="row mb-4">
                    <div class="col-12 text-center">
                        <h3 class="fw-bold mb-3">Project Analytics</h3>
                        <p class="text-muted">Key metrics and insights for your projects</p>
                    </div>
                </div>
                
                <div class="row g-4">
                    <!-- Resource Type Chart -->
                    <div class="col-md-4">
                        <div class="chart-card">
                            <h4 class="chart-title">Resource Distribution</h4>
                            <p class="chart-subtitle">Resources with more than 3 assigned tasks</p>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                                SelectCommand="SELECT 
                                    r.resourcetype,
                                    COUNT(t.taskid) AS taskcount
                                FROM resources r
                                JOIN taskresource tr ON r.resourceid = tr.resources_resourceid  
                                JOIN task t ON tr.task_taskid = t.taskid
                                GROUP BY r.resourcetype
                                HAVING COUNT(t.taskid) &gt; 3  
                                ORDER BY taskcount DESC">
                            </asp:SqlDataSource>
                            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="400px" Height="300px" 
                                BackColor="Transparent" BorderlineColor="Transparent" AntiAliasing="All" TextAntiAliasingQuality="High">
                                <Series>
                                    <asp:Series ChartType="Pie" Name="Series1" XValueMember="RESOURCETYPE" YValueMembers="TASKCOUNT" 
                                        IsValueShownAsLabel="True" LabelFormat="{0}" Font="Arial, 10pt"
                                        Legend="Legend1" Palette="BrightPastel" 
                                        CustomProperties="PieLabelStyle=Outside">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1" BackColor="Transparent" BorderColor="Transparent">
                                        <Area3DStyle Enable3D="false" LightStyle="Realistic" />
                                    </asp:ChartArea>
                                </ChartAreas>
                                <Legends>
                                    <asp:Legend Name="Legend1" Docking="Bottom" Alignment="Center" LegendStyle="Row" 
                                        BackColor="Transparent" BorderColor="Transparent" Font="Arial, 10pt" IsTextAutoFit="True">
                                    </asp:Legend>
                                </Legends>
                                <Titles>
                                    <asp:Title Text="Resource Distribution" Font="Arial, 16pt" ForeColor="#343a40"/>
                                </Titles>
                            </asp:Chart>
                        </div>
                    </div>
                    
                    <!-- Task Status Chart -->
                    <div class="col-md-4">
                        <div class="chart-card">
                            <h4 class="chart-title">Task Status</h4>
                            <p class="chart-subtitle">Current status of all tasks</p>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                                SelectCommand="SELECT 
                                    t.taskstatus,
                                    COUNT(t.taskid) AS task_count
                                FROM task t
                                GROUP BY t.taskstatus
                                HAVING t.taskstatus IN ('Completed', 'Not Started', 'In Progress')
                                ORDER BY t.taskstatus">
                            </asp:SqlDataSource>
                            <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2" Width="400px" Height="300px" 
                                BackColor="Transparent" BorderlineColor="Transparent" AntiAliasing="All">
                                <Series>
                                    <asp:Series ChartType="Doughnut" Name="Series1" XValueMember="TASKSTATUS" YValueMembers="TASK_COUNT" 
                                        IsValueShownAsLabel="True" LabelFormat="{0}" Legend="Legend2" Font="Segoe UI, 9pt"
                                        CustomProperties="DoughnutRadius=70, PieLabelStyle=Outside" 
                                        Palette="Excel">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1" BackColor="Transparent" BorderColor="Transparent">
                                        <Area3DStyle Enable3D="false" LightStyle="Realistic" />
                                    </asp:ChartArea>
                                </ChartAreas>
                                <Legends>
                                    <asp:Legend Name="Legend2" Docking="Bottom" Alignment="Center" LegendStyle="Row" 
                                        BackColor="Transparent" BorderColor="Transparent" Font="Segoe UI, 10pt" IsTextAutoFit="True">
                                    </asp:Legend>
                                </Legends>
                                <Titles>
                                    <asp:Title Text="Task Status" Font="Segoe UI, 16pt" ForeColor="#343a40" />
                                </Titles>
                            </asp:Chart>
                        </div>
                    </div>
                    
                    <!-- User Roles Chart -->
                    <div class="col-md-4">
                        <div class="chart-card">
                            <h4 class="chart-title">Team Composition</h4>
                            <p class="chart-subtitle">Distribution of user roles</p>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                                SelectCommand="SELECT 
                                    u.userrole,
                                    COUNT(u.userid) AS user_count
                                FROM users u
                                GROUP BY u.userrole
                                ORDER BY u.userrole">
                            </asp:SqlDataSource>
                            <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource3" Width="400px" Height="300px" 
                                BackColor="Transparent" BorderlineColor="Transparent" AntiAliasing="All">
                                <Series>
                                    <asp:Series Name="Series1" XValueMember="USERROLE" YValueMembers="USER_COUNT" 
                                        ChartType="Column" IsValueShownAsLabel="True" LabelFormat="{0}" Font="Segoe UI, 9pt"
                                        Palette="Berry" BorderWidth="0" BorderColor="Transparent">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1" BackColor="Transparent" BorderColor="Transparent">
                                        <AxisX LineColor="#cccccc">
                                            <LabelStyle Font="Segoe UI, 8pt" ForeColor="#6c757d" />
                                            <MajorGrid Enabled="false" />
                                            <MajorTickMark Enabled="false" />
                                        </AxisX>
                                        <AxisY LineColor="#cccccc">
                                            <LabelStyle Font="Segoe UI, 8pt" ForeColor="#6c757d" />
                                            <MajorGrid LineColor="#eeeeee" />
                                            <MajorTickMark Enabled="false" />
                                        </AxisY>
                                    </asp:ChartArea>
                                </ChartAreas>
                                <Titles>
                                    <asp:Title Text="User Roles" Font="Segoe UI, 16pt" ForeColor="#343a40" />
                                </Titles>
                            </asp:Chart>
                        </div>
                    </div>
                </div>             
            </div>
        </form>
    </div>

    <footer class="footer mt-auto py-3">
        <div class="container text-center">
            <span class="text-muted small">© 2025 Project Management System</span>
        </div>
    </footer>
    
    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>