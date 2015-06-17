/*
    Author:     Atif Khan    
    Email:      atifkhan@ccs.neu.edu
    File Name:  genredata.js
    About code: This code handles the display of stations based on the Genre. By default the page display stations for "Classic" genre.
                The code makes API call to dirble API and for the particular genre clicked from genre list and renders on the screen.
    Credits:    1] Prof. Richard Rasala: Hash change handling in this code has been inspired from the Alice in Wonder Land single page App.
                   The original code is at : http://net4.ccs.neu.edu/home/rasala/.
                2] Dirble API: The API used in this code is provided by Dirble (https://dirble.com/developer/api).
                3] Flag Images: The high quality flag images used in this code are from (http://www.geonames.org/).
*/
// Base URL and URL end will be same in all the API calls.
var baseUrl = "simpleproxy.aspx?url=|http://api.dirble.com/v2/";
var urlEnd = "|";
var token = "?token=cc2424e082b0e15928e4378d0c";
var countryid;
var apikey;
var genreDataList = [];
var countryList = [];
var countryDataList = [];
var cont;
var error = "";
var pageNo = "";
var curHash = "";
$(document).ready(function () {

    var queryString = new Array();

    //Function to check and handle the parameter received.
    function stationContentLoad() {
        loadCountries();

        if (window.location.search.split('?').length > 1) {
            if (queryString.length == 0) {
                if (window.location.search.split('?').length > 1) {
                    var params = window.location.search.split('?')[1].split('&');
                    for (var i = 0; i < params.length; i++) {
                        var key = params[i].split('=')[0];
                        var value = decodeURIComponent(params[i].split('=')[1]);
                        queryString[key] = value;
                    }
                }
            }
            if (queryString["catId"] != null) {
                getGenreDataApiCall();
                getCategoryStations(queryString, pageNo);
            }
        } else {
            error = "Please provide category id parameter"
            $('.navigationHandler').hide();
            $('#linkError').append(error);
        }
    }

    //Function to get the station for particular category based on the Category Id of the clicked Genre.
    function getCategoryStations(queryString, pageNo) {
        var categoryId = queryString["catId"];
        var catStationUrl = baseUrl + "category/" + categoryId + "/stations" + token + "&page=" + pageNo + "&per_page=30" + urlEnd;
        //console.log(catStationUrl);
        getStationAPICall(catStationUrl);
    }


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

    //Function to get the station data and append on the screen.
    function getStationAPICall(urlRandomStations) {
        var countryName = "";
        var stationOutput = "";
        var jsonData = [];
        var countryCode = "";
        var categoryType = [];
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
                        "<img src=\"http://www.geonames.org/flags/x/" + (sdata.country).toLowerCase() +
                        ".gif\" height=\"60\" width=\"60\"/></div>" +
                        "<h2><a href=\"#\">" + sdata.name + "</a></h2>" +
                        "<ul class=\"stationDescription\"><li><span>Country:</span>" + countryName + "</li>" +
                        "</ul>" +
                        "<button class=\"playBtn\">Play!</button>" +
                        "</li>"

                });

            },

        });
        $('#staionData').children().remove();
        $('#stationData').css("clear", "both");

        $('#linkError').children().empty();
        if (stationOutput == "") {
            $('#error').append('Sorry no more stations for you! :(');
        } else {
            $('footer').show();
            $('#staionData').append(stationOutput);
        }
        getSingleStation();
    }

    //Function to get the country name based on particular country ISO code provided.
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

    //API call to get the GENRE data.
    function getGenreDataApiCall() {
        url1 = "categories/primary" + token + "|";
        urlGenre = baseUrl + url1;
        $.ajax({
            url: urlGenre,
            datatype: "json",
            async: false,
            cache: false,
            success: function (data) {
                genreDataList = JSON.parse(data);
                url1 = "categories/primary" + token + "|";
                urlGenre = baseUrl + url1;
                $.ajax({
                    url: urlGenre,
                    datatype: "json",
                    async: false,
                    cache: false,
                    success: function (data) {
                        genreDataList = JSON.parse(data);
                        $('#sideBarHeaderText').empty();
                        var output = "";
                        $('#sideBarHeaderText').text('GENRE LIST');
                        $('#sideBarHeader').css("width", "150");
                        $('#leftbar').css("width", "150");
                        $('#leftbar').css("height", "auto");
                        $('#leftbar').css("top", "70px");
                        output = "<ul id=\"genreList\">";
                        $.each(genreDataList, function (i, val) {

                            output = output + "<a href=\"Genre.aspx?catId=" + val.id + "\" target=\"_self\" \">" + "<li class=\"genreClass\" id='" + val.id + "'>" +
                                val.title +
                                "</li></a>";

                        });
                        output = output + "</ul>";

                        $('#leftbar').append(output);
                        $('#genreList').children().css("width", $('#sidebarHeader').width());
                        $('#leftbar').css("top", "120px");
                        $('#sideHeaderBar').css("top", "120px");
                    },
                    error: apiLoadError,
                });

            },
        });
    };


    //Function that append the genre id to genre's present in genre list.
    function createGenreLink() {
        $('#genreList li').click(function (event) {
            var categoryId = $(this).attr('id');
            var categoryName = $(this).text();
            var catStationUrl = "Genre.aspx?catId=" + encodeURIComponent(categoryId);
        });

    }

    //Function to handle previous button
    $('#prev').click(function () {
        var prevPageNo = 0;
        var curHash = location.hash;

        prevPageNo = curHash.substring(1, curHash.length);
        prevPageNo = prevPageNo.substring(1);
        prevPageNo = prevPageNo - 1;
        if (prevPageNo < 1) {
            prevPageNo = 1;
        }
        SetHashParam(prevPageNo);
        return false;

    });

    //Function to handle next button
    $('#nxt').click(function () {
        var curPage = 0;
        var nextPage = 0;
        var curHash = location.hash;

        curPage = curHash.substring(1, curHash.length);
        curPage = curPage.substring(1);
        nextPage = parseInt(curPage) + 1;
        if (nextPage > 10) {
            nextPage = 10;
        }
        SetHashParam(nextPage);
        return false;

    });

    //Function to handle the navigation of pages.
    function pageNavigationHandler() {
        AttachLinkBehavior();

        $(window).bind('hashchange', CheckHashParam)
            .trigger('hashchange');
    }


    //Function to handle the behaviour of page linked.
    function AttachLinkBehavior() {
        var clickedPageHash = "";
        var clickedPageNo = "";
        $('#navigationList li').click(function (event) {
            {

                clickedPageHash = $(this).children().attr('href');
                clickedPageNo = clickedPageHash.substring(1, clickedPageHash.length);
                SetHashParam(clickedPageNo);
                return false;

            }
        });
    }

    //Function to check hash value
    function CheckHashParam() {
        var s = location.hash;
        if (s) {
            // Remove #
            s = s.substring(1);
            if (s[0] == "!") {
                s = s.substring(1);
            }
        }

        if (!s) {
            SetHashParam("1");
            return;
        }

        var pageNo = parseInt(s);

        if (isNaN(pageNo)) {
            SetHashParam("1");
            return;
        }
        getCategoryStations(queryString, pageNo);
    }

    function SetHashParam(s) {
        location.hash = "#!" + s;
    }

    var qString = "";

    //Function to handle the search bar.
    function searchCall() {
        $('#searchButton').click(function () {
            var qString = $('#searchInput').val();
            bindSearchUrl(qString);
        });

        $('#searchInput').keypress(keypressHandler);
    }

    //Function to handle the key press in the search bar input.
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

    //Function to handle the failure of Dirble API load error
    function apiLoadError() {
        var errorMsg = "AJAX: API Load Error. Please reload the page";
        $('#linkError').append(errorMsg);
    }

    function initialize() {
        stationContentLoad();
        pageNavigationHandler();
        searchCall();
    }
    $(initialize);

});