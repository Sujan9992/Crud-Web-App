<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="coursework._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-color: transparent; background-image: url(2.jpg); background-repeat: no-repeat; width:100%;">
    <style>
        .home{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .flex-container{
            display: flex;
            flex-direction: row-reverse;
            flex-wrap: wrap;
            justify-content: space-around;

        }
        .card{
            padding-top: 40px;
            width: 250px;
            height: 250px;
            margin-right: 40px;
        }
        .thumb{
            width: 100%;
            height: 300px;
            object-fit: cover;
        }
        .card{
            border-radius:2px;
            width: 300px;
            height:250px;
            margin: 10px;
        }
        .desc {
            color: purple;
            font-size: 20px;
            
        }
        .brand{
            color: blue;
        }
        .info a{
    border: 1px solid #fff;
    text-align: center;
    padding: 10px 20px;
    width: 200px;
    cursor: pointer;
    display: block;
    position: all;
    transition: all 0.5s ease-in-out;
    text-decoration: none;
    color: red;
    overflow: hidden;
    border: 2px solid rgb(25 0 0);
}
        .info:hover a{
    box-shadow: 0px 0px 10px rgb(0 0 0), 0px 0px 10px rgb(255, 30, 50,1);
    background-color: rgb(46, 44, 47);
    color: white;
    margin-top: -10px;
    text-decoration: none;
}
    </style>
<section class="home">
    <div class="container">
        <div class="flex-container">
                <div class="card">
                     <div class="info">
                          <h2 class="brand">Student</h2>
                          <p class="desc">View student details</p>
                          <a runat="server" href="~/Student_details">Student</a>
                     </div>
                   
                </div>
                <div class="card">
                     <div class="info">
                          <h2 class="brand">Module</h2>
                          <p class="desc">View module details</p>
                         <a runat="server" href="~/Module_details">Module</a>
                     </div>
                </div>
                <div class="card">
                     <div class="info">
                          <h2 class="brand">Address</h2>
                          <p class="desc">View address details</p>
                          <a runat="server" href="~/Address_details">Address</a>
                     </div>
                </div>
                <div class="card">
                     <div class="info">
                          <h2 class="brand">Grade</h2>
                          <p class="desc">View grade of students</p>
                          <a runat="server" href="~/Student_assignment_details">Student Assingment</a> 
                     </div>
                </div>
             <div class="card">
                     <div class="info">
                          <h2 class="brand">Fees</h2>
                          <p class="desc">View fee details of student</p>
                         <a runat="server" href="~/Student_fee">Fees Payment</a> 
                     </div>
                </div>
                 <div class="card">
                     <div class="info">
                          <h2 class="brand">Teacher</h2>
                          <p class="desc">View teacher details</p>
                          <a runat="server" href="~/Teacher_details">Teacher</a> 
                     </div>
                </div>
                 <div class="card">
                     <div class="info">
                          <h2 class="brand">Department</h2>
                          <p class="desc">View department details</p>
                         <a runat="server" href="~/Department_details">Department</a> 
                     </div>
                </div>
                 <div class="card">
                     <div class="info">
                          <h2 class="brand">Teacher-Module</h2>
                          <p class="desc">View the teacher-module details</p>
                            <a runat="server" href="~/Teacher_module">Teacher Module</a> 
                     </div>
                </div>
         </div>
    </div>
</section>
    </div>
</asp:Content>
