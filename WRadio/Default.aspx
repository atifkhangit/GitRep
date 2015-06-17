<!--
    Author:     Atif Khan    
    Email:      atifkhan@ccs.neu.edu
    File Name:  Default.aspx
    About code: This code displays a set of random stations on the home screen. Whenever the home page is loaded, a set of random stations are
                displayed on the screen. The randomization button replace the existing set of station with a new set of random stations. 
-->
<!DOCTYPE html>
<html
    xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Home Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
        <script type="text/javascript" src="js/randomstations.js"></script>
        <link rel="stylesheet" type="text/css" href="css/menu.css" />
        <link rel="stylesheet" type="text/css" href="css/player.css" />
        <style type="text/css">
           #sideBarHeader {
    background-color: HighlightText;
    color: red;
    float: left;
    font: bold 16px Arial, Helvetica, sans-serif;
    height: auto;
    left: 2px;
    outline: 2px solid;
    outline-color: brown;
    padding-left: 0px;
    padding-top: 10px;
    position: relative;
    text-align: center;
    top:20px;
}

.stationWrapper {
    float: left;
    display:block;
    box-sizing: border-box;
    text-align: center;
    float: left;
    left: 20px;
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
        border-top-left-radius:0px;
    border-top-right-radius:0px;
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
    margin-left:80px;
    margin-bottom:20px;
}
       </style>
    </head>
    <body>
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
        <div class="overlay"></div>
        <div id="parentWrapper">
            <div id="randomize">
                <button>CLICK ME TO GET RANDOM STATIONS!</button>
            </div>
            <div class="stationWrapper" id="stationWrap">
                <div class="allStations">
                    <ul class="stationList" id="staionData"></ul>
                </div>
            </div>
        </div>
        <div id="error">
            <div id="linkError"></div>
        </div>
        <footer>
            <p>&copy; Atif Khan, Northeastern University 2015, All rights reserved</p>
        </footer>
    </body>
</html>