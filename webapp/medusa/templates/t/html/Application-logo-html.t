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
%#   File: Application-logo-html.t
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
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(%Application%-logo)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%if-no(%is_base%,,%(%base%)%)%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_base%,%(%tolower(%Base%)%)%)%)%,%
%is_dropdown,%(%else-then(%is_dropdown%,%(%is_Dropdown%)%)%)%,%
%dropdown,%(%else-then(%if-no(%is_dropdown%,,%(%dropdown%)%)%,%(%if-no(%is_dropdown%,,%(myDropdown)%)%)%)%)%,%
%Dropdown,%(%else-then(%if-no(%is_dropdown%,,%(%Dropdown%)%)%,%(%if-no(%is_dropdown%,,%(%dropdown%)%)%)%)%)%,%
%DROPDOWN,%(%else-then(%DROPDOWN%,%(%toupper(%Dropdown%)%)%)%)%,%
%dropdown,%(%else-then(%_dropdown%,%(%tolower(%Dropdown%)%)%)%)%,%
%is_onclick,%(%else-then(%is_onclick%,%(%is_OnClick%)%)%)%,%
%onclick,%(%else-then(%if-no(%is_onclick%,,%(%onclick%)%)%,%(%if-no(%is_onclick%,,%(onDropdownClick('%Dropdown%',event))%)%)%)%)%,%
%OnClick,%(%else-then(%if-no(%is_onclick%,,%(%OnClick%)%)%,%(%if-no(%is_onclick%,,%(%onclick%)%)%)%)%)%,%
%ONCLICK,%(%else-then(%ONCLICK%,%(%toupper(%OnClick%)%)%)%)%,%
%onclick,%(%else-then(%_onclick%,%(%tolower(%OnClick%)%)%)%)%,%
%is_image_extension,%(%else-then(%is_image_extension%,%(%is_Image_extension%)%)%)%,%
%image_extension,%(%else-then(%if-no(%is_image_extension%,,%(%image_extension%)%)%,%(%if-no(%is_image_extension%,,%(png)%)%)%)%)%,%
%Image_extension,%(%else-then(%if-no(%is_image_extension%,,%(%Image_extension%)%)%,%(%if-no(%is_image_extension%,,%(%image_extension%)%)%)%)%)%,%
%IMAGE_EXTENSION,%(%else-then(%IMAGE_EXTENSION%,%(%toupper(%Image_extension%)%)%)%)%,%
%image_extension,%(%else-then(%_image_extension%,%(%tolower(%Image_extension%)%)%)%)%,%
%is_image_path,%(%else-then(%is_image_path%,%(%is_Image_path%)%)%)%,%
%image_path,%(%else-then(%if-no(%is_image_path%,,%(%image_path%)%)%,%(%if-no(%is_image_path%,,%(../images/%Image_extension%)%)%)%)%)%,%
%Image_path,%(%else-then(%if-no(%is_image_path%,,%(%Image_path%)%)%,%(%if-no(%is_image_path%,,%(%image_path%)%)%)%)%)%,%
%IMAGE_PATH,%(%else-then(%IMAGE_PATH%,%(%toupper(%Image_path%)%)%)%)%,%
%image_path,%(%else-then(%_image_path%,%(%tolower(%Image_path%)%)%)%)%,%
%is_image_name,%(%else-then(%is_image_name%,%(%is_Image_name%)%)%)%,%
%image_name,%(%else-then(%if-no(%is_image_name%,,%(%image_name%)%)%,%(%if-no(%is_image_name%,,%(%Application%-logo)%)%)%)%)%,%
%Image_name,%(%else-then(%if-no(%is_image_name%,,%(%Image_name%)%)%,%(%if-no(%is_image_name%,,%(%image_name%)%)%)%)%)%,%
%IMAGE_NAME,%(%else-then(%IMAGE_NAME%,%(%toupper(%Image_name%)%)%)%)%,%
%image_name,%(%else-then(%_image_name%,%(%tolower(%Image_name%)%)%)%)%,%
%is_icon_image,%(%else-then(%is_icon_image%,%(%is_Icon_image%)%)%)%,%
%icon_image,%(%else-then(%if-no(%is_icon_image%,,%(%icon_image%)%)%,%(%if-no(%is_icon_image%,,%(%Image_path%/%Image_name%.%Image_extension%)%)%)%)%)%,%
%Icon_image,%(%else-then(%if-no(%is_icon_image%,,%(%Icon_image%)%)%,%(%if-no(%is_icon_image%,,%(%icon_image%)%)%)%)%)%,%
%ICON_IMAGE,%(%else-then(%ICON_IMAGE%,%(%toupper(%Icon_image%)%)%)%)%,%
%icon_image,%(%else-then(%_icon_image%,%(%tolower(%Icon_image%)%)%)%)%,%
%is_label_text,%(%else-then(%is_label_text%,%(%is_Label_text%)%)%)%,%
%label_text,%(%else-then(%if-no(%is_label_text%,,%(%label_text%)%)%,%(%if-no(%is_label_text%,,%(%APPLICATION%)%)%)%)%)%,%
%Label_text,%(%else-then(%if-no(%is_label_text%,,%(%Label_text%)%)%,%(%if-no(%is_label_text%,,%(%label_text%)%)%)%)%)%,%
%LABEL_TEXT,%(%else-then(%LABEL_TEXT%,%(%toupper(%Label_text%)%)%)%)%,%
%label_text,%(%else-then(%_label_text%,%(%tolower(%Label_text%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-html.t)%%
%
<!--
=====================================================================
=== logo
=====================================================================
-->
<table class="body-logo">
    <tr><td>
        <table class="body-logo-icon" onclick="%OnClick%">
            <tr><td class="body-logo-icon-image" style="background-image:url('%Icon_image%')">
                <table class="body-logo-label">
                    <tr><td class="body-logo-label-text">%Label_text%</td></tr>
                </table>
            </td></tr>
        </table>
    </td></tr>
</table>
%
%)%)%