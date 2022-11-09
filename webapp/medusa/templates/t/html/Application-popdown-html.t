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
%#   File: Application-popdown-html.t
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
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(%Application%-popdown)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%if-no(%is_base%,,%(%base%)%)%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_base%,%(%tolower(%Base%)%)%)%)%,%
%is_popdown_items,%(%else-then(%is_popdown_items%,%(%is_Popdown_items%)%)%)%,%
%popdown_items,%(%else-then(%if-no(%is_popdown_items%,,%(%popdown_items%)%)%,%(%if-no(%is_popdown_items%,,%(%Application%-popdown-items.t)%)%)%)%)%,%
%Popdown_items,%(%else-then(%if-no(%is_popdown_items%,,%(%Popdown_items%)%)%,%(%if-no(%is_popdown_items%,,%(%popdown_items%)%)%)%)%)%,%
%POPDOWN_ITEMS,%(%else-then(%POPDOWN_ITEMS%,%(%toupper(%Popdown_items%)%)%)%)%,%
%popdown_items,%(%else-then(%_popdown_items%,%(%tolower(%Popdown_items%)%)%)%)%,%
%is_popdown_rows,%(%else-then(%is_popdown_rows%,%(%is_Popdown_rows%)%)%)%,%
%popdown_rows,%(%else-then(%if-no(%is_popdown_rows%,,%(%popdown_rows%)%)%,%(%if-no(%is_popdown_rows%,,%(%include(%Include_path%/%Popdown_items%)%)%)%)%)%)%,%
%Popdown_rows,%(%else-then(%if-no(%is_popdown_rows%,,%(%Popdown_rows%)%)%,%(%if-no(%is_popdown_rows%,,%(%popdown_rows%)%)%)%)%)%,%
%POPDOWN_ROWS,%(%else-then(%POPDOWN_ROWS%,%(%toupper(%Popdown_rows%)%)%)%)%,%
%popdown_rows,%(%else-then(%_popdown_rows%,%(%tolower(%Popdown_rows%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-html.t)%%
%
<!--
=====================================================================
=== popdown
=====================================================================
-->
<div id="myPopdown" class="popdown-content">
<table class="popover" border="0">%parse(%Popdown_rows%,%(;
)%,,,,%(
    <tr>%parse(%Popdown_row%,%(\
)%,,,,%(%with(%
%Popdown_href,%(%else-then(%if-no(%is_Popdown_href%,,%(%Popdown_href%)%)%,%(%if-no(%is_Popdown_href%,,%(%left(%Popdown_col%,:)%)%)%)%)%)%,%
%Popdown_image,%(%else-then(%if-no(%is_Popdown_image%,,%(%Popdown_image%)%)%,%(%if-no(%is_Popdown_image%,,%(%right(%left(%Popdown_col%,=)%,:)%)%)%)%)%)%,%
%Popdown_text,%(%else-then(%if-no(%is_Popdown_text%,,%(%Popdown_text%)%)%,%(%if-no(%is_Popdown_text%,,%(%right-of-left(%Popdown_col%,=)%)%)%)%)%)%,%
%%(
    <!--
    =====================================================================
    === %Popdown_href%
    =====================================================================
    -->
    <td name="myPopover" class="popover-buttons"><a href="%Popdown_href%">
    <table class="footer-logo" border="0"><tr><td>
        <table class="footer-logo-icon">
            <tr><td class="footer-logo-icon-image" style="background-image:url('%Popdown_image%')">
                <table class="footer-logo-label">
                    <tr><td class="footer-logo-label-text">%Popdown_text%</td></tr>
                </table>
            </td></tr>
        </table>
    </td></tr></table></a></td>
    )%)%)%,Popdown_col)%</tr>)%,Popdown_row)%
</table>
</div>
%
%)%)%