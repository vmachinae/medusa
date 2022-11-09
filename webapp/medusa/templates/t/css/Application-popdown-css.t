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
%#   File: Application-popdown-css.t
%#
%# Author: $author$
%#   Date: 10/19/2021
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
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(%Application%-popdown)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%if-no(%is_base%,,%(%base%)%)%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_base%,%(%tolower(%Base%)%)%)%)%,%
%is_image_extension,%(%else-then(%is_image_extension%,%(%is_Image_extension%)%)%)%,%
%image_extension,%(%else-then(%if-no(%is_image_extension%,,%(%image_extension%)%)%,%(%if-no(%is_image_extension%,,%(jpeg)%)%)%)%)%,%
%Image_extension,%(%else-then(%if-no(%is_image_extension%,,%(%Image_extension%)%)%,%(%if-no(%is_image_extension%,,%(%image_extension%)%)%)%)%)%,%
%IMAGE_EXTENSION,%(%else-then(%IMAGE_EXTENSION%,%(%toupper(%Image_extension%)%)%)%)%,%
%image_extension,%(%else-then(%_image_extension%,%(%tolower(%Image_extension%)%)%)%)%,%
%is_image_path,%(%else-then(%is_image_path%,%(%is_Image_path%)%)%)%,%
%image_path,%(%else-then(%if-no(%is_image_path%,,%(%image_path%)%)%,%(%if-no(%is_image_path%,,%(../images/%Image_extension%)%)%)%)%)%,%
%Image_path,%(%else-then(%if-no(%is_image_path%,,%(%Image_path%)%)%,%(%if-no(%is_image_path%,,%(%image_path%)%)%)%)%)%,%
%IMAGE_PATH,%(%else-then(%IMAGE_PATH%,%(%toupper(%Image_path%)%)%)%)%,%
%image_path,%(%else-then(%_image_path%,%(%tolower(%Image_path%)%)%)%)%,%
%is_image_background,%(%else-then(%is_image_background%,%(%is_Image_background%)%)%)%,%
%image_background,%(%else-then(%if-no(%is_image_background%,,%(%image_background%)%)%,%(%if-no(%is_image_background%,,%(%Application%-background.%Image_extension%)%)%)%)%)%,%
%Image_background,%(%else-then(%if-no(%is_image_background%,,%(%Image_background%)%)%,%(%if-no(%is_image_background%,,%(%image_background%)%)%)%)%)%,%
%IMAGE_BACKGROUND,%(%else-then(%IMAGE_BACKGROUND%,%(%toupper(%Image_background%)%)%)%)%,%
%image_background,%(%else-then(%_image_background%,%(%tolower(%Image_background%)%)%)%)%,%
%is_image_logo,%(%else-then(%is_image_logo%,%(%is_Image_logo%)%)%)%,%
%image_logo,%(%else-then(%if-no(%is_image_logo%,,%(%image_logo%)%)%,%(%if-no(%is_image_logo%,,%(%Application%-logo.%Image_extension%)%)%)%)%)%,%
%Image_logo,%(%else-then(%if-no(%is_image_logo%,,%(%Image_logo%)%)%,%(%if-no(%is_image_logo%,,%(%image_logo%)%)%)%)%)%,%
%IMAGE_LOGO,%(%else-then(%IMAGE_LOGO%,%(%toupper(%Image_logo%)%)%)%)%,%
%image_logo,%(%else-then(%_image_logo%,%(%tolower(%Image_logo%)%)%)%)%,%
%is_body_fg,%(%else-then(%is_body_fg%,%(%is_Body_fg%)%)%)%,%
%body_fg,%(%else-then(%if-no(%is_body_fg%,,%(%body_fg%)%)%,%(%if-no(%is_body_fg%,,%(lightgrey)%)%)%)%)%,%
%Body_fg,%(%else-then(%if-no(%is_body_fg%,,%(%Body_fg%)%)%,%(%if-no(%is_body_fg%,,%(%body_fg%)%)%)%)%)%,%
%BODY_FG,%(%else-then(%BODY_FG%,%(%toupper(%Body_fg%)%)%)%)%,%
%body_fg,%(%else-then(%_body_fg%,%(%tolower(%Body_fg%)%)%)%)%,%
%is_body_bg,%(%else-then(%is_body_bg%,%(%is_Body_bg%)%)%)%,%
%body_bg,%(%else-then(%if-no(%is_body_bg%,,%(%body_bg%)%)%,%(%if-no(%is_body_bg%,,%(black)%)%)%)%)%,%
%Body_bg,%(%else-then(%if-no(%is_body_bg%,,%(%Body_bg%)%)%,%(%if-no(%is_body_bg%,,%(%body_bg%)%)%)%)%)%,%
%BODY_BG,%(%else-then(%BODY_BG%,%(%toupper(%Body_bg%)%)%)%)%,%
%body_bg,%(%else-then(%_body_bg%,%(%tolower(%Body_bg%)%)%)%)%,%
%is_body_bd,%(%else-then(%is_body_bd%,%(%is_Body_bd%)%)%)%,%
%body_bd,%(%else-then(%if-no(%is_body_bd%,,%(%body_bd%)%)%,%(%if-no(%is_body_bd%,,%(%Body_fg%)%)%)%)%)%,%
%Body_bd,%(%else-then(%if-no(%is_body_bd%,,%(%Body_bd%)%)%,%(%if-no(%is_body_bd%,,%(%body_bd%)%)%)%)%)%,%
%BODY_BD,%(%else-then(%BODY_BD%,%(%toupper(%Body_bd%)%)%)%)%,%
%body_bd,%(%else-then(%_body_bd%,%(%tolower(%Body_bd%)%)%)%)%,%
%is_body_hover,%(%else-then(%is_body_hover%,%(%is_Body_hover%)%)%)%,%
%body_hover,%(%else-then(%if-no(%is_body_hover%,,%(%body_hover%)%)%,%(%if-no(%is_body_hover%,,%(lightyello)%)%)%)%)%,%
%Body_hover,%(%else-then(%if-no(%is_body_hover%,,%(%Body_hover%)%)%,%(%if-no(%is_body_hover%,,%(%body_hover%)%)%)%)%)%,%
%BODY_HOVER,%(%else-then(%BODY_HOVER%,%(%toupper(%Body_hover%)%)%)%)%,%
%body_hover,%(%else-then(%_body_hover%,%(%tolower(%Body_hover%)%)%)%)%,%
%is_font_family,%(%else-then(%is_font_family%,%(%is_Font_family%)%)%)%,%
%font_family,%(%else-then(%if-no(%is_font_family%,,%(%font_family%)%)%,%(%if-no(%is_font_family%,,%(Arial)%)%)%)%)%,%
%Font_family,%(%else-then(%if-no(%is_font_family%,,%(%Font_family%)%)%,%(%if-no(%is_font_family%,,%(%font_family%)%)%)%)%)%,%
%FONT_FAMILY,%(%else-then(%FONT_FAMILY%,%(%toupper(%Font_family%)%)%)%)%,%
%font_family,%(%else-then(%_font_family%,%(%tolower(%Font_family%)%)%)%)%,%
%is_form_fg,%(%else-then(%is_form_fg%,%(%is_Form_fg%)%)%)%,%
%form_fg,%(%else-then(%if-no(%is_form_fg%,,%(%form_fg%)%)%,%(%if-no(%is_form_fg%,,%(%Body_bg%)%)%)%)%)%,%
%Form_fg,%(%else-then(%if-no(%is_form_fg%,,%(%Form_fg%)%)%,%(%if-no(%is_form_fg%,,%(%form_fg%)%)%)%)%)%,%
%FORM_FG,%(%else-then(%FORM_FG%,%(%toupper(%Form_fg%)%)%)%)%,%
%form_fg,%(%else-then(%_form_fg%,%(%tolower(%Form_fg%)%)%)%)%,%
%is_form_bg,%(%else-then(%is_form_bg%,%(%is_Form_bg%)%)%)%,%
%form_bg,%(%else-then(%if-no(%is_form_bg%,,%(%form_bg%)%)%,%(%if-no(%is_form_bg%,,%(%Body_fg%)%)%)%)%)%,%
%Form_bg,%(%else-then(%if-no(%is_form_bg%,,%(%Form_bg%)%)%,%(%if-no(%is_form_bg%,,%(%form_bg%)%)%)%)%)%,%
%FORM_BG,%(%else-then(%FORM_BG%,%(%toupper(%Form_bg%)%)%)%)%,%
%form_bg,%(%else-then(%_form_bg%,%(%tolower(%Form_bg%)%)%)%)%,%
%is_form_bd,%(%else-then(%is_form_bd%,%(%is_Form_bd%)%)%)%,%
%form_bd,%(%else-then(%if-no(%is_form_bd%,,%(%form_bd%)%)%,%(%if-no(%is_form_bd%,,%(%Form_fg%)%)%)%)%)%,%
%Form_bd,%(%else-then(%if-no(%is_form_bd%,,%(%Form_bd%)%)%,%(%if-no(%is_form_bd%,,%(%form_bd%)%)%)%)%)%,%
%FORM_BD,%(%else-then(%FORM_BD%,%(%toupper(%Form_bd%)%)%)%)%,%
%form_bd,%(%else-then(%_form_bd%,%(%tolower(%Form_bd%)%)%)%)%,%
%is_form_hover,%(%else-then(%is_form_hover%,%(%is_Form_hover%)%)%)%,%
%form_hover,%(%else-then(%if-no(%is_form_hover%,,%(%form_hover%)%)%,%(%if-no(%is_form_hover%,,%(%Form_fg%)%)%)%)%)%,%
%Form_hover,%(%else-then(%if-no(%is_form_hover%,,%(%Form_hover%)%)%,%(%if-no(%is_form_hover%,,%(%form_hover%)%)%)%)%)%,%
%FORM_HOVER,%(%else-then(%FORM_HOVER%,%(%toupper(%Form_hover%)%)%)%)%,%
%form_hover,%(%else-then(%_form_hover%,%(%tolower(%Form_hover%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-css.t)%%
%
/*
** popdown
** ...
*/
.popdown {
     width: 64px;
     height: 100%%;
     margin: auto;
     border: 0px;
     border-style: solid;
     border-color: gray;
     border-spacing: 0px 0px;
     text-align: center;
     float: right;
}
.popdown-button {
     margin: auto;
     border: 0px;
     border-style: solid;
     border-color: %Body_bd%;
     border-spacing: 0px 0px;
     background-color: transparent;
     cursor: pointer;
}
.popdown-button:hover, .popdown-button:focus {
     outline: none;
}
.popdown-button:hover .popdown-dot, .popdown-button:focus .popdown-dot {
     background-color: %Body_hover%
}
.popdown-dots {
    width: 100%%;
    height: 100%%;
    margin: auto;
    border: 0px;
    border-style: solid;
    border-color: %Body_bd%;
    border-spacing: 4px 4px;
}
.popdown-dot {
     width: 7px;
     height: 7px;
     padding: 0px;
     border-radius: 4px;
     background-color: %Body_fg%;
}
.popdown-content {
     padding: 0px;
     border-spacing: 0px 0px;
     border-style: solid;
     border-color: %Form_bd%;
     border-width: 1px 3px 3px 1px;
     border-radius: 5px 5px 5px 5px;
     background-color: %Form_bg%;
     position: absolute;
     min-width: 160px;
     right: 0;
     z-index: 2;
     display: none;
 }
.popdown-content a {
     color: black;
     padding: 12px 16px;
     border-spacing: 0px 0px;
     text-decoration: none;
     font-size: 18;  
     display: block;
}
.popdown-content a:hover {
     color: %Form_fg%;
     text-decoration: underline;
}
/*
** ...
** popdown
*/
%
%)%)%