<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sidebar.ascx.cs" Inherits="Coursework.Sidebar" %>

<style>
.sidebar {
    width: 300px;
    height: 100%;
    background-color: slategray;
    color: #fff;
    position: fixed;
    top: 0;
    left: 0;
    padding-top: 20px;
    padding-left: 20px;
}

.sidebar h2 {
    color: white;
    text-align: center;
}

.sidebar ul {
    list-style-type: none;
    padding: 0;
}

.sidebar ul li {
    margin: 15px 0;
}

.sidebar ul li button {
    background-color: black;
    color: white;
    border: none;
    padding: 12px 20px;
    width: 250px;
    text-align: left;
    font-size: 16px;
    cursor: pointer;
    border-radius: 4px;
    transition: background-color 0.3s;
}

.sidebar ul li button:hover {
    background-color: #555;
}
</style>

<div class="sidebar">
    <h2>Dashboard</h2>
    <ul>
        <li><button runat="server" id="btnForm1" OnClick="btnForm1_Click">Milestone </button></li>
        <li><button runat="server" id="btnForm2" OnClick="btnForm2_Click">Project </button></li>
        <li><button runat="server" id="btnForm3" OnClick="btnForm3_Click">SubTask </button></li>
        <li><button runat="server" id="btnForm4" OnClick="btnForm4_Click">Task </button></li>
        <li><button runat="server" id="btnForm5" OnClick="btnForm5_Click">Users </button></li>
        <li><button runat="server" id="btnForm6" OnClick="btnForm6_Click">Project Milestone </button></li>
        <li><button runat="server" id="btnForm7" OnClick="btnForm7_Click">Top Performer </button></li>
        <li><button runat="server" id="btnForm8" OnClick="btnForm8_Click">Users Project </button></li>
    </ul>
</div>
