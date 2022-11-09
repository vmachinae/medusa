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
%#   File: Application-form-fields-html.t
%#
%# Author: $author$
%#   Date: 11/22/2021
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_inputs_label,%(%else-then(%is_inputs_label%,%(%is_Inputs_label%)%)%)%,%
%inputs_label,%(%else-then(%if-no(%is_inputs_label%,,%(%inputs_label%)%)%,%(%if-no(%is_inputs_label%,,%()%)%)%)%)%,%
%Inputs_label,%(%else-then(%if-no(%is_inputs_label%,,%(%Inputs_label%)%)%,%(%if-no(%is_inputs_label%,,%(%inputs_label%)%)%)%)%)%,%
%INPUTS_LABEL,%(%else-then(%INPUTS_LABEL%,%(%toupper(%Inputs_label%)%)%)%)%,%
%inputs_label,%(%else-then(%_inputs_label%,%(%tolower(%Inputs_label%)%)%)%)%,%
%is_inputs,%(%else-then(%is_inputs%,%(%is_Inputs%)%)%)%,%
%inputs,%(%else-then(%if-no(%is_inputs%,,%(%inputs%)%)%,%(%if-no(%is_inputs%,,%(Input)%)%)%)%)%,%
%Inputs,%(%else-then(%if-no(%is_inputs%,,%(%Inputs%)%)%,%(%if-no(%is_inputs%,,%(%inputs%)%)%)%)%)%,%
%INPUTS,%(%else-then(%INPUTS%,%(%toupper(%Inputs%)%)%)%)%,%
%inputs,%(%else-then(%_inputs%,%(%tolower(%Inputs%)%)%)%)%,%
%is_radio,%(%else-then(%is_radio%,%(%is_Radio%)%)%)%,%
%radio,%(%else-then(%if-no(%is_radio%,,%(%radio%)%)%,%(%if-no(%is_radio%,,%(Radio)%)%)%)%)%,%
%Radio,%(%else-then(%if-no(%is_radio%,,%(%Radio%)%)%,%(%if-no(%is_radio%,,%(%radio%)%)%)%)%)%,%
%RADIO,%(%else-then(%RADIO%,%(%toupper(%Radio%)%)%)%)%,%
%radio,%(%else-then(%_radio%,%(%tolower(%Radio%)%)%)%)%,%
%is_checkbox,%(%else-then(%is_checkbox%,%(%is_Checkbox%)%)%)%,%
%checkbox,%(%else-then(%if-no(%is_checkbox%,,%(%checkbox%)%)%,%(%if-no(%is_checkbox%,,%(Checkbox)%)%)%)%)%,%
%Checkbox,%(%else-then(%if-no(%is_checkbox%,,%(%Checkbox%)%)%,%(%if-no(%is_checkbox%,,%(%checkbox%)%)%)%)%)%,%
%CHECKBOX,%(%else-then(%CHECKBOX%,%(%toupper(%Checkbox%)%)%)%)%,%
%checkbox,%(%else-then(%_checkbox%,%(%tolower(%Checkbox%)%)%)%)%,%
%is_select,%(%else-then(%is_select%,%(%is_Select%)%)%)%,%
%select,%(%else-then(%if-no(%is_select%,,%(%select%)%)%,%(%if-no(%is_select%,,%(Select)%)%)%)%)%,%
%Select,%(%else-then(%if-no(%is_select%,,%(%Select%)%)%,%(%if-no(%is_select%,,%(%select%)%)%)%)%)%,%
%SELECT,%(%else-then(%SELECT%,%(%toupper(%Select%)%)%)%)%,%
%select,%(%else-then(%_select%,%(%tolower(%Select%)%)%)%)%,%
%is_hidden,%(%else-then(%is_hidden%,%(%is_Hidden%)%)%)%,%
%hidden,%(%else-then(%if-no(%is_hidden%,,%(%hidden%)%)%,%(%if-no(%is_hidden%,,%(Hidden)%)%)%)%)%,%
%Hidden,%(%else-then(%if-no(%is_hidden%,,%(%Hidden%)%)%,%(%if-no(%is_hidden%,,%(%hidden%)%)%)%)%)%,%
%HIDDEN,%(%else-then(%HIDDEN%,%(%toupper(%Hidden%)%)%)%)%,%
%hidden,%(%else-then(%_hidden%,%(%tolower(%Hidden%)%)%)%)%,%
%%(%
%%parse(%Inputs%,;,,,,%(%
%%with(%
%is_label,%(%else-then(%is_label%,%(%is_Label%)%)%)%,%
%label,%(%else-then(%if-no(%is_label%,,%(%label%)%)%,%(%if-no(%is_label%,,%(%Inputs_label%)%)%)%)%)%,%
%Label,%(%else-then(%if-no(%is_label%,,%(%Label%)%)%,%(%if-no(%is_label%,,%(%label%)%)%)%)%)%,%
%LABEL,%(%else-then(%LABEL%,%(%toupper(%Label%)%)%)%)%,%
%label,%(%else-then(%_label%,%(%tolower(%Label%)%)%)%)%,%
%%(%
%%include(%Include_path%/Application-form-fields-input-html.t)%%
%)%)%%
%)%,Field)%%
%%parse(%Radio%,;,,,,%(%
%%include(%Include_path%/Application-form-fields-radio-html.t)%%
%)%,Field)%%
%%parse(%Checkbox%,;,,,,%(%
%%include(%Include_path%/Application-form-fields-checkbox-html.t)%%
%)%,Field)%%
%%parse(%Select%,;,,,,%(%
%%include(%Include_path%/Application-form-fields-select-html.t)%%
%)%,Field)%%
%%parse(%Hidden%,;,,,,%(%
%%include(%Include_path%/Application-form-fields-hidden-html.t)%%
%)%,Field)%%
%)%)%