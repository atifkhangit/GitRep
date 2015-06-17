/*
    Author:     Atif Khan    
    Email:      atifkhan@ccs.neu.edu
    File Name:  randomstations.js
    About code: This code displays a set of random stations on the home screen. Whenever the home page is loaded, a set of random stations are
                displayed on the screen. The randomization button replace the existing set of station with a new set of random stations.
    Credits:    1] Dirble API: The API used in this code is provided by Dirble (https://dirble.com/developer/api).
                2] Flag Images: The high quality flag images used in this code are from (http://www.geonames.org/).
*/
// Base URL and URL end will be same in all the API calls.
var baseUrl = "simpleproxy.aspx?url=|http://api.dirble.com/v2/";
var urlEnd = "|";
var token = "?token=cc2424e082b0e15928e4378d0c";
var flagUrl = "http://www.geonames.org/flags/x/";
var countryList = [];
var genreId = [];
var genreDataList = [];
var apikey = "";

//Function to get the countries data containing the country ISO code and Country Name.
function loadCountries() {
    var countries = "countries.txt";
    $.ajax({
        url: countries,
        type: 'GET',
        dataType: 'text',
        async: false,
        success: function (data) {
            countryList = data;
        },
        cache: false,
        error: apiLoadError,
    });
}

//Function to fetch random station based on page number. 
//This function generates a random number out of 5 and then generate a URL for API call. 
//The API supports maximum 30 results per page hence per_page value is constant. 
function randomStations() {
    var urlRandomStations;
    var randomPage = [];

    randomPage.push(Math.floor((Math.random() * 5)));
    urlRandomStations = baseUrl + "category/11/stations" + token + "&page=" + randomPage + "&per_page=30" + urlEnd;
    getRandomStationAPICall(urlRandomStations);


}

//Function to handle the response of randomize button.
function randomizeClickHandler() {

    $('#randomize').click(function () {

        $('#staionData').children().remove();
        $('#linkError').children().remove();
        randomStations();
        getSingleStation();
    });
}

//Function that performs the random station API call and append the result on screen.
function getRandomStationAPICall(urlRandomStations) {
    var countryName = "";
    var stationOutput = "";
    var jsonData = [];
    var countryCode = "";

    $.ajax({
        url: urlRandomStations,
        type: 'GET',
        dataType: "json",
        async: false,
        cache: false,
        success: function (data) {

            $.each(data, function (i, sdata) {
                if (sdata.country.length == 0) {
                    countryName = "NA";
                } else {
                    countryName = getCountryName(sdata.country);
                }

                stationOutput = stationOutput +
                    "<li data-index=\"" +
                    sdata.id + "\">" +
                    "<div class=\"stationPhoto\">" +
                    "<img src=\"" + flagUrl + (sdata.country).toLowerCase() +
                    ".gif\" height=\"60\" width=\"90\"/></div>" +
                    "<h2><a href=\"#\">" + sdata.name + "</a></h2>" +
                    "<ul class=\"stationDescription\"><li><span>Country:</span>" + countryName + "</li>" +
                    "</ul>" +
                    "<button class=\"playBtn\">Play!</button>" +
                    "</li>"

            });

        },
        error: apiLoadError,
    });

    $('#stationData').css("clear", "both");

    $('#staionData').append(stationOutput);

}

//Function to get the country for the Country Code supplied.
function getCountryName(countryCode) {
    var countryName;
    var splitData = [];
    var isoCode;
    splitData = countryList.split('\n');

    $.each(splitData, function (i, val1) {
        isoCode = val1.substring(val1.indexOf(';') + 1, val1.indexOf(','));
        if ($.trim(isoCode) == $.trim(countryCode)) {
            countryName = val1.substring(val1.indexOf(',') + 1, val1.length - 1);
        }
    });
    return countryName;
}

//Function to display single station similar to lightbox effect but implemented using overlay of Div tag.
//This function handle the click of Play button for station.
function getSingleStation() {
    $('.playBtn').click(function (event) {
        event.preventDefault();
        var stationId = "";
        var countryRaw = "";
        var countryName = "";
        var stationName = "";
        var description = "";
        var website = "";
        var imageUrl = "";
        var streamUrl = "";
        var bitRate = "";
        var Category = "";
        var output = "";
        var singleStationUrl = "";
        var status = "";
        stationId = $(this).parent().data('index');
        stationName = $(this).siblings('h2').find('a').text();
        countryRaw = $(this).siblings('.stationDescription').find('li').text();
        countryName = countryRaw.substring(countryRaw.indexOf(':') + 1, countryRaw.length);
        singleStationUrl = baseUrl + "station/" + stationId + token + urlEnd;

        $.ajax({
            url: singleStationUrl,
            type: 'GET',
            dataType: "json",
            async: false,
            cache: false,
            success: function (data) {
                if (data.description.length < 1) {
                    description = "No description available";
                } else {
                    description = data.description;
                }

                $.each(data.streams, function (i, val) {
                    if (val.stream.length < 1) {
                        streamUrl = "";
                    } else {
                        streamUrl = val.stream;
                    }

                    if (val.bitrate.length < 1) {
                        bitRate = "No info Available";
                    } else {
                        bitRate = val.bitrate;
                    }
                    status = val.status;
                });

                if (data.image.image.url == null) {
                    imageUrl = "../project/images/noimage.jpg";
                } else {
                    imageUrl = data.image.image.url;
                }

                if (data.website.length < 1) {
                    website = "#";
                } else {
                    website = data.website;
                }

                $.each(data.categories, function (j, cat) {
                    if (cat.title.length < 1) {
                        category = "Not Available";
                    } else {
                        category = cat.title;
                    }

                    if (cat.description.length < 1) {
                        description = "No description available";
                    } else {
                        description = cat.description;
                    }
                });

                output = "<div id=\"singleStationWrapper\"><div id=\"overlay\"><div id=\"singleStation\">" +
                    "<img id=\"singleStationPhoto\" src=\"" + imageUrl + "\" height=\"200\" width=\"200\"/>" +
                    "<h2>" + stationName + "</h2>" +
                    "<ul class=\"singleStationDescription\"><li><span>Country:</span>" + countryName + "</li>" +
                    "<li><span>StreamUrl:</span><a href=\"" + streamUrl + "\" target=\"_blank\">Link" + "</a></li>" +
                    "<li><span>Bit-Rate:</span>" + bitRate + "</li>" +
                    "<li><span>Category:</span>" + category + "</li>" +
                    "<li><span>Descripition:</span>" + description + "</li>" +
                    "</ul>" +
                    "<div id=\"player\"><audio controls autoplay preload=\"none\" width=20>" +
                    "<source src=\"" + streamUrl + "\" type=\"audio/mpeg\" />" + "</audio>" +
                    "</div><div id=\"close\">X</div></div></div></div>";

            },
            error: apiLoadError,
        });

        if (bitRate == "0" || streamUrl.length < 1 || status == "0") {
            alert('Oops! The station is down. Please try another Station');
        } else {
            $('body').append(output);
        }

        $('#close').click(function (event) {
            event.preventDefault();

            $('#overlay').fadeOut('1000', function () {
                $('#overlay').remove();
            });
        });
    });
}

//Function to handle the failure of Dirble API load error
function apiLoadError() {

    var errorMsg = "AJAX: Dirble API Load Error. Please reload the page";
    $('#linkError').replaceWith(errorMsg);
}

var qString = "";

//Function to handle the search bar. 
// It handles the search button and enter key pressed event.
function searchCall() {
    $('#searchButton').click(function () {
        var qString = $('#searchInput').val();
        bindSearchUrl(qString);
    });

    $('#searchInput').keypress(keypressHandler);
}

//Function to handle the enter key pressed on search input field.
function keypressHandler(event) {

    if ((event.keyCode == '13') || (event.keyCode == '10')) {
        var qString = $('#searchInput').val();
        bindSearchUrl(qString)
    }
}

//Function to bind the query parameter to search page.
function bindSearchUrl(qString) {
    if (qString == "" || qString == null) {
        qString = "US";
    }
    var searchUrl = "SearchPage.aspx" + "?q=" + encodeURI(qString);
    window.location.href = searchUrl;
}

function initialize() {
    loadCountries();
    randomStations();
    randomizeClickHandler();
    getSingleStation();
    searchCall();
}

$(initialize);