<!--
    Author:     Atif Khan    
    Email:      atifkhan@ccs.neu.edu
    File Name:  SearchPage.aspx
    About code: This code displays output of search result.
-->
<!DOCTYPE html>
<html
    xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Search</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
        <script type="text/javascript" src="js/searchpage.js"></script>
        <link rel="stylesheet" type="text/css" href="css/menu.css" />
        <link rel="stylesheet" type="text/css" href="css/player.css" />
        <style type="text/css">      
.stationWrapper {
    display:block;
    box-sizing: border-box;
    text-align: center;
    float: left;
    margin-left:5%;
    margin-right:5%;
    max-width:100%;
}

.stationList {
    float: left;
    display:block;  
    font-size: 0;
    list-style: none;
    max-width: 100%;
    padding: 0;
    padding-top: 20px;
    text-align: center;
    opacity: 1;
    pointer-events: all;
    transition: 1s;
    background-color: #eaf8fc;
    background-image: linear-gradient(#fff, #d4e8ec);
    border-radius: 35px;
    border-width: 1px;
    border-style: solid;
    border-color: #c4d9df #a4c3ca #83afb7;
  
}
.stationList > li {
    background-color: #ffffff;
    border: 1px solid #dbe3e7;
    border-radius: 3px;
    box-shadow: 1px 3px 1px rgba(0, 0, 0, 0.08);
    box-sizing: border-box;
    cursor: pointer;
    float:left;
    font: normal 12px sans-serif;
    max-width: 100%;
    width: 210px;
    padding: 25px;
    position: relative;
    text-align: left;
    transition: 0.2s;
    margin-left:11%;
    margin-bottom:20px;
      margin-right:20px;
}
       </style>
    </head>
    <body>
        <div id="totalWrapper">
            <div id="top-bar">
                <div id="logo">
                    <img src="images/logo.jpg" alt="logoimage" width="100" height="50" />
                </div>
                <nav>
                    <ul class="menu">
                        <li>
                            <a href="Default.aspx">Home</a>
                        </li>
                        <li>
                            <a href="Genre.aspx?catId=11" id="genre">Genre</a>
                        </li>
                        <li>
                            <a href="About.html">About WRadio</a>
                        </li>
                        <li>
                            <a href="Documentation.html">Documentation</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="searchBar">
                <input id="searchInput" type="search" placeholder="Enter Genre, Station or Country" />
                <button id="searchButton">Search</button>
            </div>
            <div class="navigationHandler">
                <button id="prev">Prev</button>
                <ul id="navigationList">
                    <li>
                        <a href="#1">1</a>
                    </li>
                    <li>
                        <a href="#2">2</a>
                    </li>
                    <li>
                        <a href="#3">3</a>
                    </li>
                    <li>
                        <a href="#4">4</a>
                    </li>
                    <li>
                        <a href="#5">5</a>
                    </li>
                    <li>
                        <a href="#6">6</a>
                    </li>
                    <li>
                        <a href="#7">7</a>
                    </li>
                    <li>
                        <a href="#8">8</a>
                    </li>
                    <li>
                        <a href="#9">9</a>
                    </li>
                    <li>
                        <a href="#10">10</a>
                    </li>
                </ul>
                <button id="nxt"> Next</button>
            </div>
            <div class="overlay"></div>
            <div class="stationWrapper" id="stationWrap">
                <ul class="stationList" id="staionData"></ul>
            </div>
            <div id="linkError">
                <div id="error"></div>
            </div>
        </div>
        <footer>
            <p>&copy; WRadio, All rights reserved 
            
            </footer>
        </body>
    </html>