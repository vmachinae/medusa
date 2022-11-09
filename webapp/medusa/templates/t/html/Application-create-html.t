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
%#   File: Application-create-html.t
%#
%# Author: $author$
%#   Date: 10/23/2021
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
%is_do,%(%else-then(%is_do%,%(%is_Do%)%)%)%,%
%do,%(%else-then(%if-no(%is_do%,,%(%do%)%)%,%(%if-no(%is_do%,,%(Create)%)%)%)%)%,%
%Do,%(%else-then(%if-no(%is_do%,,%(%Do%)%)%,%(%if-no(%is_do%,,%(%do%)%)%)%)%)%,%
%DO,%(%else-then(%DO%,%(%toupper(%Do%)%)%)%)%,%
%do,%(%else-then(%_do%,%(%tolower(%Do%)%)%)%)%,%
%is_what,%(%else-then(%is_what%,%(%is_What%)%)%)%,%
%what,%(%else-then(%if-no(%is_what%,,%(%what%)%)%,%(%if-no(%is_what%,,%(.t)%)%)%)%)%,%
%What,%(%else-then(%if-no(%is_what%,,%(%What%)%)%,%(%if-no(%is_what%,,%(%what%)%)%)%)%)%,%
%WHAT,%(%else-then(%WHAT%,%(%toupper(%What%)%)%)%)%,%
%what,%(%else-then(%_what%,%(%tolower(%What%)%)%)%)%,%
%is_what_extension,%(%else-then(%is_what_extension%,%(%is_What_extension%)%)%)%,%
%what_extension,%(%else-then(%if-no(%is_what_extension%,,%(%what_extension%)%)%,%(%if-no(%is_what_extension%,,%(%else-then(%right(%What%,.)%,%What%)%)%)%)%)%)%,%
%What_extension,%(%else-then(%if-no(%is_what_extension%,,%(%What_extension%)%)%,%(%if-no(%is_what_extension%,,%(%what_extension%)%)%)%)%)%,%
%WHAT_EXTENSION,%(%else-then(%WHAT_EXTENSION%,%(%toupper(%What_extension%)%)%)%)%,%
%what_extension,%(%else-then(%_what_extension%,%(%tolower(%What_extension%)%)%)%)%,%
%is_thing,%(%else-then(%is_thing%,%(%is_Thing%)%)%)%,%
%thing,%(%else-then(%if-no(%is_thing%,,%(%thing%)%)%,%(%if-no(%is_thing%,,%(file)%)%)%)%)%,%
%Thing,%(%else-then(%if-no(%is_thing%,,%(%Thing%)%)%,%(%if-no(%is_thing%,,%(%thing%)%)%)%)%)%,%
%THING,%(%else-then(%THING%,%(%toupper(%Thing%)%)%)%)%,%
%thing,%(%else-then(%_thing%,%(%tolower(%Thing%)%)%)%)%,%
%is_do_what,%(%else-then(%is_do_what%,%(%is_Do_what%)%)%)%,%
%do_what,%(%else-then(%if-no(%is_do_what%,,%(%do_what%)%)%,%(%if-no(%is_do_what%,,%(%Do%%then-if(%What_extension%,%if(%Do%,-)%)%)%)%)%)%)%,%
%Do_what,%(%else-then(%if-no(%is_do_what%,,%(%Do_what%)%)%,%(%if-no(%is_do_what%,,%(%do_what%)%)%)%)%)%,%
%DO_WHAT,%(%else-then(%DO_WHAT%,%(%toupper(%Do_what%)%)%)%)%,%
%do_what,%(%else-then(%_do_what%,%(%tolower(%Do_what%)%)%)%)%,%
%is_do_what_thing,%(%else-then(%is_do_what_thing%,%(%is_Do_what_thing%)%)%)%,%
%do_what_thing,%(%else-then(%if-no(%is_do_what_thing%,,%(%do_what_thing%)%)%,%(%if-no(%is_do_what_thing%,,%(%Do%%then-if(%What%,%if(%Do%, )%)%%then-if(%Thing%, )%)%)%)%)%)%,%
%Do_what_thing,%(%else-then(%if-no(%is_do_what_thing%,,%(%Do_what_thing%)%)%,%(%if-no(%is_do_what_thing%,,%(%do_what_thing%)%)%)%)%)%,%
%DO_WHAT_THING,%(%else-then(%DO_WHAT_THING%,%(%toupper(%Do_what_thing%)%)%)%)%,%
%do_what_thing,%(%else-then(%_do_what_thing%,%(%tolower(%Do_what_thing%)%)%)%)%,%
%is_application_do_what,%(%else-then(%is_application_do_what%,%(%is_Application_do_what%)%)%)%,%
%application_do_what,%(%else-then(%if-no(%is_application_do_what%,,%(%application_do_what%)%)%,%(%if-no(%is_application_do_what%,,%(%Application%%then-if(%do_what%,-)%)%)%)%)%)%,%
%Application_do_what,%(%else-then(%if-no(%is_application_do_what%,,%(%Application_do_what%)%)%,%(%if-no(%is_application_do_what%,,%(%application_do_what%)%)%)%)%)%,%
%APPLICATION_DO_WHAT,%(%else-then(%APPLICATION_DO_WHAT%,%(%toupper(%Application_do_what%)%)%)%)%,%
%application_do_what,%(%else-then(%_application_do_what%,%(%tolower(%Application_do_what%)%)%)%)%,%
%is_base,%(%else-then(%is_base%,%(%is_Base%)%)%)%,%
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(%Application_do_what%)%)%)%)%)%,%
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
%is_template_path,%(%else-then(%is_template_path%,%(%is_Template_path%)%)%)%,%
%template_path,%(%else-then(%if-no(%is_template_path%,,%(%template_path%)%)%,%(%if-no(%is_template_path%,,%(../templates)%)%)%)%)%,%
%Template_path,%(%else-then(%if-no(%is_template_path%,,%(%Template_path%)%)%,%(%if-no(%is_template_path%,,%(%template_path%)%)%)%)%)%,%
%TEMPLATE_PATH,%(%else-then(%TEMPLATE_PATH%,%(%toupper(%Template_path%)%)%)%)%,%
%template_path,%(%else-then(%_template_path%,%(%tolower(%Template_path%)%)%)%)%,%
%is_template_extension,%(%else-then(%is_template_extension%,%(%is_Template_extension%)%)%)%,%
%template_extension,%(%else-then(%if-no(%is_template_extension%,,%(%template_extension%)%)%,%(%if-no(%is_template_extension%,,%(%what_extension%)%)%)%)%)%,%
%Template_extension,%(%else-then(%if-no(%is_template_extension%,,%(%Template_extension%)%)%,%(%if-no(%is_template_extension%,,%(%template_extension%)%)%)%)%)%,%
%TEMPLATE_EXTENSION,%(%else-then(%TEMPLATE_EXTENSION%,%(%toupper(%Template_extension%)%)%)%)%,%
%template_extension,%(%else-then(%_template_extension%,%(%tolower(%Template_extension%)%)%)%)%,%
%is_template_base,%(%else-then(%is_template_base%,%(%is_Template_base%)%)%)%,%
%template_base,%(%else-then(%if-no(%is_template_base%,,%(%template_base%)%)%,%(%if-no(%is_template_base%,,%(%Template_extension%)%)%)%)%)%,%
%Template_base,%(%else-then(%if-no(%is_template_base%,,%(%Template_base%)%)%,%(%if-no(%is_template_base%,,%(%template_base%)%)%)%)%)%,%
%TEMPLATE_BASE,%(%else-then(%TEMPLATE_BASE%,%(%toupper(%Template_base%)%)%)%)%,%
%template_base,%(%else-then(%_template_base%,%(%tolower(%Template_base%)%)%)%)%,%
%is_template_base_extension,%(%else-then(%is_template_base_extension%,%(%is_Template_base_extension%)%)%)%,%
%template_base_extension,%(%else-then(%if-no(%is_template_base_extension%,,%(%template_base_extension%)%)%,%(%if-no(%is_template_base_extension%,,%(%Template_base%.%Template_extension%)%)%)%)%)%,%
%Template_base_extension,%(%else-then(%if-no(%is_template_base_extension%,,%(%Template_base_extension%)%)%,%(%if-no(%is_template_base_extension%,,%(%template_base_extension%)%)%)%)%)%,%
%TEMPLATE_BASE_EXTENSION,%(%else-then(%TEMPLATE_BASE_EXTENSION%,%(%toupper(%Template_base_extension%)%)%)%)%,%
%template_base_extension,%(%else-then(%_template_base_extension%,%(%tolower(%Template_base_extension%)%)%)%)%,%
%is_form_action,%(%else-then(%is_form_action%,%(%is_Form_action%)%)%)%,%
%form_action,%(%else-then(%if-no(%is_form_action%,,%(%form_action%)%)%,%(%if-no(%is_form_action%,,%(%Template_path%/t/%Template_extension%/%Template_base_extension%)%)%)%)%)%,%
%Form_action,%(%else-then(%if-no(%is_form_action%,,%(%Form_action%)%)%,%(%if-no(%is_form_action%,,%(%form_action%)%)%)%)%)%,%
%FORM_ACTION,%(%else-then(%FORM_ACTION%,%(%toupper(%Form_action%)%)%)%)%,%
%form_action,%(%else-then(%_form_action%,%(%tolower(%Form_action%)%)%)%)%,%
%is_form_do,%(%else-then(%is_form_do%,%(%is_Form_do%)%)%)%,%
%form_do,%(%else-then(%if-no(%is_form_do%,,%(%form_do%)%)%,%(%if-no(%is_form_do%,,%(%Do_what_thing% (%Form_action%))%)%)%)%)%,%
%Form_do,%(%else-then(%if-no(%is_form_do%,,%(%Form_do%)%)%,%(%if-no(%is_form_do%,,%(%form_do%)%)%)%)%)%,%
%FORM_DO,%(%else-then(%FORM_DO%,%(%toupper(%Form_do%)%)%)%)%,%
%form_do,%(%else-then(%_form_do%,%(%tolower(%Form_do%)%)%)%)%,%
%is_template_parameters,%(%else-then(%is_template_parameters%,%(%is_Template_parameters%)%)%)%,%
%template_parameters,%(%else-then(%if-no(%is_template_parameters%,,%(%template_parameters%)%)%,%(%if-no(%is_template_parameters%,,%(%Template_path%/t/t/parameters.t)%)%)%)%)%,%
%Template_parameters,%(%else-then(%if-no(%is_template_parameters%,,%(%Template_parameters%)%)%,%(%if-no(%is_template_parameters%,,%(%template_parameters%)%)%)%)%)%,%
%TEMPLATE_PARAMETERS,%(%else-then(%TEMPLATE_PARAMETERS%,%(%toupper(%Template_parameters%)%)%)%)%,%
%template_parameters,%(%else-then(%_template_parameters%,%(%tolower(%Template_parameters%)%)%)%)%,%
%is_template_functions,%(%else-then(%is_template_functions%,%(%is_Template_functions%)%)%)%,%
%template_functions,%(%else-then(%if-no(%is_template_functions%,,%(%template_functions%)%)%,%(%if-no(%is_template_functions%,,%(%Template_path%/t/t/functions.t)%)%)%)%)%,%
%Template_functions,%(%else-then(%if-no(%is_template_functions%,,%(%Template_functions%)%)%,%(%if-no(%is_template_functions%,,%(%template_functions%)%)%)%)%)%,%
%TEMPLATE_FUNCTIONS,%(%else-then(%TEMPLATE_FUNCTIONS%,%(%toupper(%Template_functions%)%)%)%)%,%
%template_functions,%(%else-then(%_template_functions%,%(%tolower(%Template_functions%)%)%)%)%,%
%is_application_cgi_path,%(%else-then(%is_application_cgi_path%,%(%is_Application_cgi_path%)%)%)%,%
%application_cgi_path,%(%else-then(%if-no(%is_application_cgi_path%,,%(%application_cgi_path%)%)%,%(%if-no(%is_application_cgi_path%,,%(/%Application%-cgi)%)%)%)%)%,%
%Application_cgi_path,%(%else-then(%if-no(%is_application_cgi_path%,,%(%Application_cgi_path%)%)%,%(%if-no(%is_application_cgi_path%,,%(%application_cgi_path%)%)%)%)%)%,%
%APPLICATION_CGI_PATH,%(%else-then(%APPLICATION_CGI_PATH%,%(%toupper(%Application_cgi_path%)%)%)%)%,%
%application_cgi_path,%(%else-then(%_application_cgi_path%,%(%tolower(%Application_cgi_path%)%)%)%)%,%
%is_application_cgi,%(%else-then(%is_application_cgi%,%(%is_Application_cgi%)%)%)%,%
%application_cgi,%(%else-then(%if-no(%is_application_cgi%,,%(%application_cgi%)%)%,%(%if-no(%is_application_cgi%,,%(cgi)%)%)%)%)%,%
%Application_cgi,%(%else-then(%if-no(%is_application_cgi%,,%(%Application_cgi%)%)%,%(%if-no(%is_application_cgi%,,%(%application_cgi%)%)%)%)%)%,%
%APPLICATION_CGI,%(%else-then(%APPLICATION_CGI%,%(%toupper(%Application_cgi%)%)%)%)%,%
%application_cgi,%(%else-then(%_application_cgi%,%(%tolower(%Application_cgi%)%)%)%)%,%
%is_application_cgicatch,%(%else-then(%is_application_cgicatch%,%(%is_Application_cgicatch%)%)%)%,%
%application_cgicatch,%(%else-then(%if-no(%is_application_cgicatch%,,%(%application_cgicatch%)%)%,%(%if-no(%is_application_cgicatch%,,%(cgicatch)%)%)%)%)%,%
%Application_cgicatch,%(%else-then(%if-no(%is_application_cgicatch%,,%(%Application_cgicatch%)%)%,%(%if-no(%is_application_cgicatch%,,%(%application_cgicatch%)%)%)%)%)%,%
%APPLICATION_CGICATCH,%(%else-then(%APPLICATION_CGICATCH%,%(%toupper(%Application_cgicatch%)%)%)%)%,%
%application_cgicatch,%(%else-then(%_application_cgicatch%,%(%tolower(%Application_cgicatch%)%)%)%)%,%
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
        <title>%Application% - %Do_what_thing%</title>

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
        <!--
        =====================================================================
        === menubar
        =====================================================================
        -->
        <div id="includeMenubar" include="%Application_do_what%-menubar.html">
            <script>includeHTML('includeMenubar');</script>
        </div>

        <!--
        =====================================================================
        === form
        =====================================================================
        -->
        <form name="Form" method="POST" action="%Form_action%"
         onSubmit="return setFormSubmit(getFormValue2('FormTemplate','FormAction','Form'),getFormValue('FormMethod','Form'),'Form')">
            <div class="form">

            <br/>
            Content-Type: <select name="content_type">
            <option value="text/plain">text</option>
            <option value="text/html">html</option>
            <option value="text/xml">xml</option>
            <option value="application/json">json</option>
            <option value="application/javascript">javascript</option>
            <option value=""></option>
            </select><br/>

            Action: <select name="FormAction">
            <option value="%Form_action%">%Form_do%</option>
            <option value=""></option>
            <option value="%Template_parameters%">t parameters &nbsp;&nbsp; (%Template_parameters%)</option>
            <option value="%Template_functions%">t functions &nbsp;&nbsp; (%Template_functions%)</option>
            <option value=""></option>
            <option value="%Application_cgi_path%/%Application_cgi%">cgi parameters &nbsp;&nbsp; (%Application_cgi_path%/%Application_cgi%)</option>
            <option value="%Application_cgi_path%/%Application_cgicatch%">catch cgi parameters &nbsp;&nbsp; (%Application_cgi_path%/%Application_cgicatch%)</option>
            <option value=""/>
            </select><br/>

            Method: <select name="FormMethod">
            <option value="POST">POST</option>
            <option value="GET">GET</option>
            <option value=""></option>
            </select><br/>

            <br/>
            <input type="submit" name="submit" value="submit"/><br/>

            </div>
        </form>
    </body>
</html>
%
%)%)%