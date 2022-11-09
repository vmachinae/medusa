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
%#   File: Application-menubar-html.t
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
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(%Application_do_what%-menubar)%)%)%)%)%,%
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
%is_application_tools,%(%else-then(%is_application_tools%,%(%is_Application_tools%)%)%)%,%
%application_tools,%(%else-then(%if-no(%is_application_tools%,,%(%application_tools%)%)%,%(%if-no(%is_application_tools%,,%(%Application%-tools.html)%)%)%)%)%,%
%Application_tools,%(%else-then(%if-no(%is_application_tools%,,%(%Application_tools%)%)%,%(%if-no(%is_application_tools%,,%(%application_tools%)%)%)%)%)%,%
%APPLICATION_TOOLS,%(%else-then(%APPLICATION_TOOLS%,%(%toupper(%Application_tools%)%)%)%)%,%
%application_tools,%(%else-then(%_application_tools%,%(%tolower(%Application_tools%)%)%)%)%,%
%is_application_menubar_items,%(%else-then(%is_application_menubar_items%,%(%is_Application_menubar_items%)%)%)%,%
%application_menubar_items,%(%else-then(%if-no(%is_application_menubar_items%,,%(%application_menubar_items%)%)%,%(%if-no(%is_application_menubar_items%,,%(%Base%-items.t)%)%)%)%)%,%
%Application_menubar_items,%(%else-then(%if-no(%is_application_menubar_items%,,%(%Application_menubar_items%)%)%,%(%if-no(%is_application_menubar_items%,,%(%application_menubar_items%)%)%)%)%)%,%
%APPLICATION_MENUBAR_ITEMS,%(%else-then(%APPLICATION_MENUBAR_ITEMS%,%(%toupper(%Application_menubar_items%)%)%)%)%,%
%application_menubar_items,%(%else-then(%_application_menubar_items%,%(%tolower(%Application_menubar_items%)%)%)%)%,%
%is_tools,%(%else-then(%is_tools%,%(%is_Tools%)%)%)%,%
%tools,%(%else-then(%if-no(%is_tools%,,%(%tools%)%)%,%(%if-no(%is_tools%,,%(Tools)%)%)%)%)%,%
%Tools,%(%else-then(%if-no(%is_tools%,,%(%Tools%)%)%,%(%if-no(%is_tools%,,%(%tools%)%)%)%)%)%,%
%TOOLS,%(%else-then(%TOOLS%,%(%toupper(%Tools%)%)%)%)%,%
%tools,%(%else-then(%_tools%,%(%tolower(%Tools%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-html.t)%%
%
<!--
=====================================================================
=== menubar
=====================================================================
-->
<ul class="menubar">%parse(%include(%Include_path%/%Application_menubar_items%)%,%(
)%,,,,%(%with(%
%Menubar_item_location,%(%else-then(%if-no(%is_Menubar_item_location%,,%(%Menubar_item_location%)%)%,%(%if-no(%is_Menubar_item_location%,,%(%else-then(%left(%Menubar_item%,=)%,%Menubar_item%)%)%)%)%)%)%,%
%Menubar_item_text,%(%else-then(%if-no(%is_Menubar_item_text%,,%(%Menubar_item_text%)%)%,%(%if-no(%is_Menubar_item_text%,,%(%else-then(%right-of-left(%Menubar_item%,=)%,%Menubar_item%)%)%)%)%)%)%,%
%%(
    <li><a href="%Menubar_item_location%">%Menubar_item_text%</a></li>)%)%)%,Menubar_item)%
    <li class="home"><div><a href="%Application_home%">Home</a></div></li>%if-no(%is_tools%,,%(
    <li class="home"><div><a href="%Application_tools%">Tools</a></div></li>)%)%
</ul>
%
%)%)%