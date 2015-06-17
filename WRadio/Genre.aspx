<!--
    Author:     Atif Khan    
    Email:      atifkhan@ccs.neu.edu
    File Name:  Genre.aspx
    About code: This code displays a set of stations based on the genre selected. If no genre is selected the code displays "Classical" genre
                stations.
-->
<!DOCTYPE html>
<html
    xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Genre Data</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
        <script type="text/javascript" src="js/genredata.js"></script>
        <link rel="stylesheet" type="text/css" href="css/menu.css" />
        <link rel="stylesheet" type="text/css" href="css/player.css" />
        <style type="text/css">
            @media screen and (max-width:1024px) {
    .stationWrapper{
        max-width:80% !important;
        }
}

           #leftbar {
    height:auto;
    background-color: lightgray;
    border: 2px solid;
    border-color: brown;
    border-radius: 3px;
    box-shadow: 0px 3px 1px rgba(0, 0, 0, 0.08);
    display: block;
    float: left;
    height: 500px;
    overflow: auto;
    padding: 2%;
    text-align: left;
    clear: both;
    width:95.5%;
}
           .stationWrapper {
    box-sizing: border-box;
    text-align: center;
    float: left;
    display:block;
    margin-left:0.5%;
    max-width: 86%;
    margin-bottom:3%;
    margin-top:1%;
}
           #sideBarHeader {
               display:block;
    background-color: HighlightText;
    color:ghostwhite;
    float: left;
    font: bold 16px Arial, Helvetica, sans-serif;
    height: auto;
    outline: 2px solid;
    outline-color: brown;
    padding:2.5%;
    text-align: center;
    margin-left:0.5%;
    width:93%;
    
}
           .stationList {
    float: left;
    font-size: 0;
    list-style: none;
    margin-left: 0px;
    width: 100%;
    padding: 0;
    padding-top: 20px;
    text-align: center;
    opacity: 1;
    pointer-events: all;
    transition: 1s;
    background-color: #eaf8fc;
    background-image: linear-gradient(#fff, #d4e8ec);
    border-radius: 35px;
    border-top-left-radius:0px;
    border-top-right-radius:10px;
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
    margin: 0 10px 10px 0;
    max-width: 100%;
    width: 210px;
    padding: 25px;
    position: relative;
    text-align: left;
    transition: 0.2s;
    margin-left:5%;
    margin-right:0%;
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
                            <a href="Genre.aspx?catId=11" id="genre">Genres</a>
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
            <div id="leftBarWrapper">
                <div id="sideBarHeader">
                    <p id="sideBarHeaderText"></p>
                </div>
                <div id="leftbar">
                    <ul id="countryL"></ul>
                </div>
            </div>
            <div class="overlay"></div>
            <div class="stationWrapper" id="stationWrap">
                <ul class="stationList" id="staionData"></ul>
            </div>
            <div id="linkError">
                <div id="error"></div>
            </div>
            <footer>
                <p>&copy; WRadio, All rights reserved 
                
                </footer>
            </div>
        </body>
    </html>