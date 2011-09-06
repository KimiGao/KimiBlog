// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var pageSize = 20;
var screenWidth = window.screen.width;
var screenHeight = window.screen.height;

if (window.navigator.userAgent.indexOf("Firefox")>=1) {
    screenWidth = window.screen.width + window.screen.width/9 ;
    screenHeight = window.screen.height + window.screen.height/9;
}