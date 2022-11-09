%########################################################################
%# Copyright (c) 1988-2021 $organization$
%#
%# This software is provided by the author and contributors ``as is'' 
%# and any express or implied warranties, including, but not limited to, 
%# the implied warranties of merchantability and fitness for a particular 
%# purpose are disclaimed. In no event shall the author or contributors 
%# be liable for any direct, indirect, incidental, special, exemplary, 
%# or consequential damages (including, but not limited to, procurement 
%# of substitute goods or services; loss of use, data, or profits; or 
%# business interruption) however caused and on any theory of liability, 
%# whether in contract, strict liability, or tort (including negligence 
%# or otherwise) arising in any way out of the use of this software, 
%# even if advised of the possibility of such damage.
%#
%#   File: Application-html.t
%#
%# Author: $author$
%#   Date: 10/21/2021
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_application,%(%else-then(%is_application%,%(%is_Application%)%)%)%,%
%application,%(%else-then(%if-no(%is_application%,,%(%application%)%)%,%(%if-no(%is_application%,,%(Application)%)%)%)%)%,%
%Application,%(%else-then(%if-no(%is_application%,,%(%Application%)%)%,%(%if-no(%is_application%,,%(%application%)%)%)%)%)%,%
%APPLICATION,%(%else-then(%APPLICATION%,%(%toupper(%Application%)%)%)%)%,%
%application,%(%else-then(%_application%,%(%tolower(%Application%)%)%)%)%,%
%is_base,%(%else-then(%is_base%,%(%is_Base%)%)%)%,%
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(%Application%)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%if-no(%is_base%,,%(%base%)%)%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_base%,%(%tolower(%Base%)%)%)%)%,%
%is_css_path,%(%else-then(%is_css_path%,%(%is_Css_path%)%)%)%,%
%css_path,%(%else-then(%if-no(%is_css_path%,,%(%css_path%)%)%,%(%if-no(%is_css_path%,,%(../css)%)%)%)%)%,%
%Css_path,%(%else-then(%if-no(%is_css_path%,,%(%Css_path%)%)%,%(%if-no(%is_css_path%,,%(%css_path%)%)%)%)%)%,%
%CSS_PATH,%(%else-then(%CSS_PATH%,%(%toupper(%Css_path%)%)%)%)%,%
%css_path,%(%else-then(%_css_path%,%(%tolower(%Css_path%)%)%)%)%,%
%is_js_path,%(%else-then(%is_js_path%,%(%is_Js_path%)%)%)%,%
%js_path,%(%else-then(%if-no(%is_js_path%,,%(%js_path%)%)%,%(%if-no(%is_js_path%,,%(../js)%)%)%)%)%,%
%Js_path,%(%else-then(%if-no(%is_js_path%,,%(%Js_path%)%)%,%(%if-no(%is_js_path%,,%(%js_path%)%)%)%)%)%,%
%JS_PATH,%(%else-then(%JS_PATH%,%(%toupper(%Js_path%)%)%)%)%,%
%js_path,%(%else-then(%_js_path%,%(%tolower(%Js_path%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-html.t)%%
%
<!--
=====================================================================
=== html
=====================================================================
-->
<html>
    <!--
    =====================================================================
    === head
    =====================================================================
    -->
    <head>
        <title>%Application% - Home</title>

        <!--
        =====================================================================
        === style
        =====================================================================
        -->
        <link rel="stylesheet" type="text/css" href="%Css_path%/%Application%.css"></link>
        <link rel="stylesheet" type="text/css" href="%Css_path%/%Application%-header.css"></link>
        <link rel="stylesheet" type="text/css" href="%Css_path%/%Application%-footer.css"></link>
        <link rel="stylesheet" type="text/css" href="%Css_path%/%Application%-dropdown.css"></link>
        <link rel="stylesheet" type="text/css" href="%Css_path%/%Application%-popdown.css"></link>
        <link rel="stylesheet" type="text/css" href="%Css_path%/%Application%-menubar.css"></link>
        <link rel="stylesheet" type="text/css" href="%Css_path%/%Application%-logo.css"></link>
        <style type="text/css">
        </style>
    
        <!--
        =====================================================================
        === script
        =====================================================================
        -->
        <script type="text/javascript" src="%Js_path%/%Application%.js"></script>
        <script type="text/javascript">
            onLocationInit('%Application%.html', '%Application%.html');
        </script>
    </head>
    <!--
    =====================================================================
    === body
    =====================================================================
    -->
    <body class="body">

        <!--
        =====================================================================
        === logo
        =====================================================================
        -->
        <div id="includeLogo" include="%Application%-logo.html">
            <script>includeHTML('includeLogo');</script>
        </div>
        <!--
        =====================================================================
        === header
        =====================================================================
        -->
        <div id="includeHeader" include="%Application%-header.html">
            <script>includeHTML('includeHeader');</script>
        </div>
        <!--
        =====================================================================
        === popdown
        =====================================================================
        -->
        <div id="includePopdown" include="%Application%-popdown.html">
            <script>includeHTML('includePopdown');</script>
        </div>
        <!--
        =====================================================================
        === dropdown
        =====================================================================
        -->
        <div id="includeDropdown" include="%Application%-dropdown.html">
            <script>includeHTML('includeDropdown');</script>
        </div>
    </body>
</html>
%
%)%)%