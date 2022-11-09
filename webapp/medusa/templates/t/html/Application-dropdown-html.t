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
%#   File: Application-dropdown-html.t
%#
%# Author: $author$
%#   Date: 10/22/2021
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
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(%Application%-dropdown)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%if-no(%is_base%,,%(%base%)%)%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_base%,%(%tolower(%Base%)%)%)%)%,%
%is_application_path,%(%else-then(%is_application_path%,%(%is_Application_path%)%)%)%,%
%application_path,%(%else-then(%if-no(%is_application_path%,,%(%application_path%)%)%,%(%if-no(%is_application_path%,,%(.)%)%)%)%)%,%
%Application_path,%(%else-then(%if-no(%is_application_path%,,%(%Application_path%)%)%,%(%if-no(%is_application_path%,,%(%application_path%)%)%)%)%)%,%
%APPLICATION_PATH,%(%else-then(%APPLICATION_PATH%,%(%toupper(%Application_path%)%)%)%)%,%
%application_path,%(%else-then(%_application_path%,%(%tolower(%Application_path%)%)%)%)%,%
%is_application_home,%(%else-then(%is_application_home%,%(%is_Application_home%)%)%)%,%
%application_home,%(%else-then(%if-no(%is_application_home%,,%(%application_home%)%)%,%(%if-no(%is_application_home%,,%(%Application%.html)%)%)%)%)%,%
%Application_home,%(%else-then(%if-no(%is_application_home%,,%(%Application_home%)%)%,%(%if-no(%is_application_home%,,%(%application_home%)%)%)%)%)%,%
%APPLICATION_HOME,%(%else-then(%APPLICATION_HOME%,%(%toupper(%Application_home%)%)%)%)%,%
%application_home,%(%else-then(%_application_home%,%(%tolower(%Application_home%)%)%)%)%,%
%is_dropdown_items,%(%else-then(%is_dropdown_items%,%(%is_Dropdown_items%)%)%)%,%
%dropdown_items,%(%else-then(%if-no(%is_dropdown_items%,,%(%dropdown_items%)%)%,%(%if-no(%is_dropdown_items%,,%(%Application%-dropdown-items.t)%)%)%)%)%,%
%Dropdown_items,%(%else-then(%if-no(%is_dropdown_items%,,%(%Dropdown_items%)%)%,%(%if-no(%is_dropdown_items%,,%(%dropdown_items%)%)%)%)%)%,%
%DROPDOWN_ITEMS,%(%else-then(%DROPDOWN_ITEMS%,%(%toupper(%Dropdown_items%)%)%)%)%,%
%dropdown_items,%(%else-then(%_dropdown_items%,%(%tolower(%Dropdown_items%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-html.t)%%
%
<!--
=====================================================================
=== dropdown
=====================================================================
-->
<div id="myDropdown" class="dropdown-content">%parse(%include(%Include_path%/%Dropdown_items%)%,%(
)%,,,,%(%with(%
%Item_location,%(%else-then(%if-no(%is_Item_location%,,%(%Item_location%)%)%,%(%if-no(%is_Item_location%,,%(%else-then(%left(%Dropdown_item%,=)%,%Dropdown_item%)%)%)%)%)%)%,%
%Item_text,%(%else-then(%if-no(%is_Item_text%,,%(%Item_text%)%)%,%(%if-no(%is_Item_text%,,%(%else-then(%right-of-left(%Dropdown_item%,=)%,%Dropdown_item%)%)%)%)%)%)%,%
%%(
    <a class="dropdown-item" href="%Item_location%">%Item_text%</a>)%)%)%,Dropdown_item)%
    <a class="dropdown-item" href="%Application_home%">Home</a>
</div>
%
%)%)%