using System;
using System.Web.UI;

namespace Coursework
{
    public partial class Sidebar : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any logic for loading the sidebar if needed
        }

        // Redirect to Milestone Form
        protected void btnForm1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/milestone.aspx");
        }

        // Redirect to Project Form
        protected void btnForm2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/project.aspx");
        }

        // Redirect to SubTask Form
        protected void btnForm3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/subtask.aspx");
        }

        // Redirect to Task Form
        protected void btnForm4_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/task.aspx");
        }

        // Redirect to Users Form
        protected void btnForm5_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/user.aspx");
        }

        // Redirect to Project Milestone Form
        protected void btnForm6_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/projectmilestone.aspx");
        }

        // Redirect to Top Performer Form
        protected void btnForm7_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/topperformer.aspx");
        }

        // Redirect to Users Project Form
        protected void btnForm8_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/userproject.aspx");
        }
    }
}
