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
%#   File: Application-form-fields-input-html.t
%#
%# Author: $author$
%#   Date: 11/22/2021
%########################################################################
%with(%
%is_name,%(%else-then(%is_name%,%(%is_Name%)%)%)%,%
%name,%(%else-then(%if-no(%is_name%,,%(%name%)%)%,%(%if-no(%is_name%,,%(%else-then(%left(%Field%,=)%,%Field%)%)%)%)%)%)%,%
%Name,%(%else-then(%if-no(%is_name%,,%(%Name%)%)%,%(%if-no(%is_name%,,%(%name%)%)%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_name%,%(%tolower(%Name%)%)%)%)%,%
%is_value,%(%else-then(%is_value%,%(%is_Value%)%)%)%,%
%value,%(%else-then(%if-no(%is_value%,,%(%value%)%)%,%(%if-no(%is_value%,,%(%right(%Field%,=)%)%)%)%)%)%,%
%Value,%(%else-then(%if-no(%is_value%,,%(%Value%)%)%,%(%if-no(%is_value%,,%(%value%)%)%)%)%)%,%
%VALUE,%(%else-then(%VALUE%,%(%toupper(%Value%)%)%)%)%,%
%value,%(%else-then(%_value%,%(%tolower(%Value%)%)%)%)%,%
%is_label,%(%else-then(%is_label%,%(%is_Label%)%)%)%,%
%label,%(%else-then(%if-no(%is_label%,,%(%label%)%)%,%(%if-no(%is_label%,,%()%)%)%)%)%,%
%Label,%(%else-then(%if-no(%is_label%,,%(%Label%)%)%,%(%if-no(%is_label%,,%(%label%)%)%)%)%)%,%
%LABEL,%(%else-then(%LABEL%,%(%toupper(%Label%)%)%)%)%,%
%label,%(%else-then(%_label%,%(%tolower(%Label%)%)%)%)%,%
%is_is,%(%else-then(%is_is%,%(%is_Is%)%)%)%,%
%is,%(%else-then(%if-no(%is_is%,,%(%is%)%)%,%(%if-no(%is_is%,,%(Is)%)%)%)%)%,%
%Is,%(%else-then(%if-no(%is_is%,,%(%Is%)%)%,%(%if-no(%is_is%,,%(%is%)%)%)%)%)%,%
%IS,%(%else-then(%IS%,%(%toupper(%Is%)%)%)%)%,%
%is,%(%else-then(%_is%,%(%tolower(%Is%)%)%)%)%,%
%%(
            <b></b>%if-then(%Label%,:)%<input name="%Name%" value="%Value%"></input><b></b>
            <input type="checkbox" name="is_%Name%" value="no" unchecked="checked">no</input>
            <b></b><br/>
)%)%