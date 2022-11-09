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
%#   File: apache-conf.t
%#
%# Author: $author$
%#   Date: 10/24/2021
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_users,%(%else-then(%is_users%,%(%is_Users%)%)%)%,%
%users,%(%else-then(%if-no(%is_users%,,%(%users%)%)%,%(%if-no(%is_users%,,%(/users)%)%)%)%)%,%
%Users,%(%else-then(%if-no(%is_users%,,%(%Users%)%)%,%(%if-no(%is_users%,,%(%users%)%)%)%)%)%,%
%USERS,%(%else-then(%USERS%,%(%toupper(%Users%)%)%)%)%,%
%users,%(%else-then(%_users%,%(%tolower(%Users%)%)%)%)%,%
%is_user,%(%else-then(%is_user%,%(%is_User%)%)%)%,%
%user,%(%else-then(%if-no(%is_user%,,%(%user%)%)%,%(%if-no(%is_user%,,%(user)%)%)%)%)%,%
%User,%(%else-then(%if-no(%is_user%,,%(%User%)%)%,%(%if-no(%is_user%,,%(%user%)%)%)%)%)%,%
%USER,%(%else-then(%USER%,%(%toupper(%User%)%)%)%)%,%
%user,%(%else-then(%_user%,%(%tolower(%User%)%)%)%)%,%
%is_group,%(%else-then(%is_group%,%(%is_Group%)%)%)%,%
%group,%(%else-then(%if-no(%is_group%,,%(%group%)%)%,%(%if-no(%is_group%,,%(users)%)%)%)%)%,%
%Group,%(%else-then(%if-no(%is_group%,,%(%Group%)%)%,%(%if-no(%is_group%,,%(%group%)%)%)%)%)%,%
%GROUP,%(%else-then(%GROUP%,%(%toupper(%Group%)%)%)%)%,%
%group,%(%else-then(%_group%,%(%tolower(%Group%)%)%)%)%,%
%is_home,%(%else-then(%is_home%,%(%is_Home%)%)%)%,%
%home,%(%else-then(%if-no(%is_home%,,%(%home%)%)%,%(%if-no(%is_home%,,%(%Users%/%User%)%)%)%)%)%,%
%Home,%(%else-then(%if-no(%is_home%,,%(%Home%)%)%,%(%if-no(%is_home%,,%(%home%)%)%)%)%)%,%
%HOME,%(%else-then(%HOME%,%(%toupper(%Home%)%)%)%)%,%
%home,%(%else-then(%_home%,%(%tolower(%Home%)%)%)%)%,%
%is_source,%(%else-then(%is_source%,%(%is_Source%)%)%)%,%
%source,%(%else-then(%if-no(%is_source%,,%(%source%)%)%,%(%if-no(%is_source%,,%(%Home%/source)%)%)%)%)%,%
%Source,%(%else-then(%if-no(%is_source%,,%(%Source%)%)%,%(%if-no(%is_source%,,%(%source%)%)%)%)%)%,%
%SOURCE,%(%else-then(%SOURCE%,%(%toupper(%Source%)%)%)%)%,%
%source,%(%else-then(%_source%,%(%tolower(%Source%)%)%)%)%,%
%is_host,%(%else-then(%is_host%,%(%is_Host%)%)%)%,%
%host,%(%else-then(%if-no(%is_host%,,%(%host%)%)%,%(%if-no(%is_host%,,%(local.local.local)%)%)%)%)%,%
%Host,%(%else-then(%if-no(%is_host%,,%(%Host%)%)%,%(%if-no(%is_host%,,%(%host%)%)%)%)%)%,%
%HOST,%(%else-then(%HOST%,%(%toupper(%Host%)%)%)%)%,%
%host,%(%else-then(%_host%,%(%tolower(%Host%)%)%)%)%,%
%is_port,%(%else-then(%is_port%,%(%is_Port%)%)%)%,%
%port,%(%else-then(%if-no(%is_port%,,%(%port%)%)%,%(%if-no(%is_port%,,%(80)%)%)%)%)%,%
%Port,%(%else-then(%if-no(%is_port%,,%(%Port%)%)%,%(%if-no(%is_port%,,%(%port%)%)%)%)%)%,%
%PORT,%(%else-then(%PORT%,%(%toupper(%Port%)%)%)%)%,%
%port,%(%else-then(%_port%,%(%tolower(%Port%)%)%)%)%,%
%is_admin,%(%else-then(%is_admin%,%(%is_Admin%)%)%)%,%
%admin,%(%else-then(%if-no(%is_admin%,,%(%admin%)%)%,%(%if-no(%is_admin%,,%(admin)%)%)%)%)%,%
%Admin,%(%else-then(%if-no(%is_admin%,,%(%Admin%)%)%,%(%if-no(%is_admin%,,%(%admin%)%)%)%)%)%,%
%ADMIN,%(%else-then(%ADMIN%,%(%toupper(%Admin%)%)%)%)%,%
%admin,%(%else-then(%_admin%,%(%tolower(%Admin%)%)%)%)%,%
%is_server_name,%(%else-then(%is_server_name%,%(%is_Server_name%)%)%)%,%
%server_name,%(%else-then(%if-no(%is_server_name%,,%(%server_name%)%)%,%(%if-no(%is_server_name%,,%(%Host%:%Port%)%)%)%)%)%,%
%Server_name,%(%else-then(%if-no(%is_server_name%,,%(%Server_name%)%)%,%(%if-no(%is_server_name%,,%(%server_name%)%)%)%)%)%,%
%SERVER_NAME,%(%else-then(%SERVER_NAME%,%(%toupper(%Server_name%)%)%)%)%,%
%server_name,%(%else-then(%_server_name%,%(%tolower(%Server_name%)%)%)%)%,%
%is_server_admin,%(%else-then(%is_server_admin%,%(%is_Server_admin%)%)%)%,%
%server_admin,%(%else-then(%if-no(%is_server_admin%,,%(%server_admin%)%)%,%(%if-no(%is_server_admin%,,%(%Admin%@%Host%)%)%)%)%)%,%
%Server_admin,%(%else-then(%if-no(%is_server_admin%,,%(%Server_admin%)%)%,%(%if-no(%is_server_admin%,,%(%server_admin%)%)%)%)%)%,%
%SERVER_ADMIN,%(%else-then(%SERVER_ADMIN%,%(%toupper(%Server_admin%)%)%)%)%,%
%server_admin,%(%else-then(%_server_admin%,%(%tolower(%Server_admin%)%)%)%)%,%
%is_servername,%(%else-then(%is_servername%,%(%is_ServerName%)%)%)%,%
%servername,%(%else-then(%if-no(%is_servername%,%(%servername%)%,%(%servername%)%)%,%(%if-no(%is_servername%,%(%Server_name%)%,%(%Server_name%)%)%)%)%)%,%
%ServerName,%(%else-then(%if-no(%is_servername%,%(%ServerName%)%,%(%ServerName%)%)%,%(%if-no(%is_servername%,%(%servername%)%,%(%servername%)%)%)%)%)%,%
%SERVERNAME,%(%else-then(%SERVERNAME%,%(%toupper(%ServerName%)%)%)%)%,%
%servername,%(%else-then(%_servername%,%(%tolower(%ServerName%)%)%)%)%,%
%is_serveradmin,%(%else-then(%is_serveradmin%,%(%is_ServerAdmin%)%)%)%,%
%serveradmin,%(%else-then(%if-no(%is_serveradmin%,%(%serveradmin%)%,%(%serveradmin%)%)%,%(%if-no(%is_serveradmin%,%(%Server_admin%)%,%(%Server_admin%)%)%)%)%)%,%
%ServerAdmin,%(%else-then(%if-no(%is_serveradmin%,%(%ServerAdmin%)%,%(%ServerAdmin%)%)%,%(%if-no(%is_serveradmin%,%(%serveradmin%)%,%(%serveradmin%)%)%)%)%)%,%
%SERVERADMIN,%(%else-then(%SERVERADMIN%,%(%toupper(%ServerAdmin%)%)%)%)%,%
%serveradmin,%(%else-then(%_serveradmin%,%(%tolower(%ServerAdmin%)%)%)%)%,%
%is_home_alias,%(%else-then(%is_home_alias%,%(%is_Home_alias%)%)%)%,%
%home_alias,%(%else-then(%if-no(%is_home_alias%,,%(%home_alias%)%)%,%(%if-no(%is_home_alias%,,%(%Home%)%)%)%)%)%,%
%Home_alias,%(%else-then(%if-no(%is_home_alias%,,%(%Home_alias%)%)%,%(%if-no(%is_home_alias%,,%(%home_alias%)%)%)%)%)%,%
%HOME_ALIAS,%(%else-then(%HOME_ALIAS%,%(%toupper(%Home_alias%)%)%)%)%,%
%home_alias,%(%else-then(%_home_alias%,%(%tolower(%Home_alias%)%)%)%)%,%
%is_bin_alias,%(%else-then(%is_bin_alias%,%(%is_Bin_alias%)%)%)%,%
%bin_alias,%(%else-then(%if-no(%is_bin_alias%,,%(%bin_alias%)%)%,%(%if-no(%is_bin_alias%,,%(%Home%/bin)%)%)%)%)%,%
%Bin_alias,%(%else-then(%if-no(%is_bin_alias%,,%(%Bin_alias%)%)%,%(%if-no(%is_bin_alias%,,%(%bin_alias%)%)%)%)%)%,%
%BIN_ALIAS,%(%else-then(%BIN_ALIAS%,%(%toupper(%Bin_alias%)%)%)%)%,%
%bin_alias,%(%else-then(%_bin_alias%,%(%tolower(%Bin_alias%)%)%)%)%,%
%is_source_alias,%(%else-then(%is_source_alias%,%(%is_Source_alias%)%)%)%,%
%source_alias,%(%else-then(%if-no(%is_source_alias%,,%(%source_alias%)%)%,%(%if-no(%is_source_alias%,,%(%Source%)%)%)%)%)%,%
%Source_alias,%(%else-then(%if-no(%is_source_alias%,,%(%Source_alias%)%)%,%(%if-no(%is_source_alias%,,%(%source_alias%)%)%)%)%)%,%
%SOURCE_ALIAS,%(%else-then(%SOURCE_ALIAS%,%(%toupper(%Source_alias%)%)%)%)%,%
%source_alias,%(%else-then(%_source_alias%,%(%tolower(%Source_alias%)%)%)%)%,%
%is_build_alias,%(%else-then(%is_build_alias%,%(%is_Build_alias%)%)%)%,%
%build_alias,%(%else-then(%if-no(%is_build_alias%,,%(%build_alias%)%)%,%(%if-no(%is_build_alias%,,%(%Source%/build)%)%)%)%)%,%
%Build_alias,%(%else-then(%if-no(%is_build_alias%,,%(%Build_alias%)%)%,%(%if-no(%is_build_alias%,,%(%build_alias%)%)%)%)%)%,%
%BUILD_ALIAS,%(%else-then(%BUILD_ALIAS%,%(%toupper(%Build_alias%)%)%)%)%,%
%build_alias,%(%else-then(%_build_alias%,%(%tolower(%Build_alias%)%)%)%)%,%
%is_source_aliases,%(%else-then(%is_source_aliases%,%(%is_Source_aliases%)%)%)%,%
%source_aliases,%(%else-then(%if-no(%is_source_aliases%,,%(%source_aliases%)%)%,%(%if-no(%is_source_aliases%,,%(zthenode:%Source%/zthenode/nube/webapp/zthenode)%)%)%)%)%,%
%Source_aliases,%(%else-then(%if-no(%is_source_aliases%,,%(%Source_aliases%)%)%,%(%if-no(%is_source_aliases%,,%(%source_aliases%)%)%)%)%)%,%
%SOURCE_ALIASES,%(%else-then(%SOURCE_ALIASES%,%(%toupper(%Source_aliases%)%)%)%)%,%
%source_aliases,%(%else-then(%_source_aliases%,%(%tolower(%Source_aliases%)%)%)%)%,%
%is_build_aliases,%(%else-then(%is_build_aliases%,%(%is_Build_aliases%)%)%)%,%
%build_aliases,%(%else-then(%if-no(%is_build_aliases%,,%(%build_aliases%)%)%,%(%if-no(%is_build_aliases%,,%(zthenode-cgi:%Source%/zthenode/build)%)%)%)%)%,%
%Build_aliases,%(%else-then(%if-no(%is_build_aliases%,,%(%Build_aliases%)%)%,%(%if-no(%is_build_aliases%,,%(%build_aliases%)%)%)%)%)%,%
%BUILD_ALIASES,%(%else-then(%BUILD_ALIASES%,%(%toupper(%Build_aliases%)%)%)%)%,%
%build_aliases,%(%else-then(%_build_aliases%,%(%tolower(%Build_aliases%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-apache-conf.t)%%
%
# Note this file is to be included at the end of the httpd.conf file
# generated by apache during installation by Include directives
#
# Include conf/extra/httpd-autoindex.conf
# Include %Source%/build/httpd/conf/httpd-local.conf

#
#
# If you wish httpd to run as a different user or group, you must run
# httpd as root initially and it will switch.
#
# User/Group: The name (or #number) of the user/group to run httpd as.
# It is usually good practice to create a dedicated user and group for
# running httpd, as with most system services.
#
%if-no(%is_UserName%,%(#)%)%User %User%
%if-no(%is_GroupName%,%(#)%)%Group %Group%

#
# ServerName gives the name and port that the server uses to identify itself.
# This can often be determined automatically, but we recommend you specify
# it explicitly to prevent problems during startup.
#
# If your host doesn't have a registered DNS name, enter its IP address here.
#
%if-no(%is_ServerName%,%(#)%)%ServerName %ServerName%

#
# ServerAdmin: Your address, where problems with the server should be
# e-mailed.  This address appears on some server-generated pages, such
# as error documents.  e.g. admin@your-domain.com
#
%if-no(%is_ServerAdmin%,%(#)%)%ServerAdmin %ServerAdmin%

#########################################################################
# Aliases
# ...
#########################################################################
<IfModule mod_alias.c>

#########################################################################
# /home/
# ...
Alias /home/ "%Home_alias%/"
<Directory "%Home_alias%/">
    Options Indexes MultiViews FollowSymLinks
    AllowOverride AuthConfig
    Order allow,deny
    Allow from all
</Directory>
# ...
# /home/
#########################################################################

#########################################################################
# /bin/
# ...
ScriptAlias /bin/ "%Bin_alias%/"
<Directory "%Bin_alias%/">
    Options Indexes MultiViews FollowSymLinks
    AllowOverride AuthConfig
    Order allow,deny
    Allow from all
</Directory>
# ...
# /bin/
#########################################################################

#########################################################################
# /source/
# ...
Alias /source/ "%Source_alias%/"
<Directory "%Source_alias%/">
    Options Indexes MultiViews FollowSymLinks
    AllowOverride AuthConfig
    Order allow,deny
    Allow from all
</Directory>
# ...
# /source/
#########################################################################

#########################################################################
# /build/
# ...
ScriptAlias /build/ "%Build_alias%/"
<Directory "%Build_alias%/">
    Options Indexes MultiViews FollowSymLinks
    AllowOverride AuthConfig
    Order allow,deny
    Allow from all
</Directory>
# ...
# /build/
#########################################################################

%
%%parse(%Source_aliases%,;,,,,%(%with(%
%is_alias_name,%(%else-then(%is_alias_name%,%(%is_Alias_name%)%)%)%,%
%alias_name,%(%else-then(%if-no(%is_alias_name%,,%(%alias_name%)%)%,%(%if-no(%is_alias_name%,,%(%else-then(%left(%Alias%,:)%,%Alias%)%)%)%)%)%)%,%
%Alias_name,%(%else-then(%if-no(%is_alias_name%,,%(%Alias_name%)%)%,%(%if-no(%is_alias_name%,,%(%alias_name%)%)%)%)%)%,%
%ALIAS_NAME,%(%else-then(%ALIAS_NAME%,%(%toupper(%Alias_name%)%)%)%)%,%
%alias_name,%(%else-then(%_alias_name%,%(%tolower(%Alias_name%)%)%)%)%,%
%is_alias_path,%(%else-then(%is_alias_path%,%(%is_Alias_path%)%)%)%,%
%alias_path,%(%else-then(%if-no(%is_alias_path%,,%(%alias_path%)%)%,%(%if-no(%is_alias_path%,,%(%else-then(%right-of-left(%Alias%,:)%,%Alias%)%)%)%)%)%)%,%
%Alias_path,%(%else-then(%if-no(%is_alias_path%,,%(%Alias_path%)%)%,%(%if-no(%is_alias_path%,,%(%alias_path%)%)%)%)%)%,%
%ALIAS_PATH,%(%else-then(%ALIAS_PATH%,%(%toupper(%Alias_path%)%)%)%)%,%
%alias_path,%(%else-then(%_alias_path%,%(%tolower(%Alias_path%)%)%)%)%,%
%%(#########################################################################
# /%Alias_name%/
# ...
Alias /%Alias_name%/ "%Alias_path%/"
<Directory "%Alias_path%/">
    Options Indexes MultiViews FollowSymLinks
    AllowOverride AuthConfig
    Order allow,deny
    Allow from all
</Directory>
# ...
# /%Alias_name%/
#########################################################################

)%)%)%,Alias)%%
%%parse(%Build_aliases%,;,,,,%(%with(%
%is_alias_name,%(%else-then(%is_alias_name%,%(%is_Alias_name%)%)%)%,%
%alias_name,%(%else-then(%if-no(%is_alias_name%,,%(%alias_name%)%)%,%(%if-no(%is_alias_name%,,%(%else-then(%left(%Alias%,:)%,%Alias%)%)%)%)%)%)%,%
%Alias_name,%(%else-then(%if-no(%is_alias_name%,,%(%Alias_name%)%)%,%(%if-no(%is_alias_name%,,%(%alias_name%)%)%)%)%)%,%
%ALIAS_NAME,%(%else-then(%ALIAS_NAME%,%(%toupper(%Alias_name%)%)%)%)%,%
%alias_name,%(%else-then(%_alias_name%,%(%tolower(%Alias_name%)%)%)%)%,%
%is_alias_path,%(%else-then(%is_alias_path%,%(%is_Alias_path%)%)%)%,%
%alias_path,%(%else-then(%if-no(%is_alias_path%,,%(%alias_path%)%)%,%(%if-no(%is_alias_path%,,%(%else-then(%right-of-left(%Alias%,:)%,%Alias%)%)%)%)%)%)%,%
%Alias_path,%(%else-then(%if-no(%is_alias_path%,,%(%Alias_path%)%)%,%(%if-no(%is_alias_path%,,%(%alias_path%)%)%)%)%)%,%
%ALIAS_PATH,%(%else-then(%ALIAS_PATH%,%(%toupper(%Alias_path%)%)%)%)%,%
%alias_path,%(%else-then(%_alias_path%,%(%tolower(%Alias_path%)%)%)%)%,%
%%(#########################################################################
# /%Alias_name%/
# ...
ScriptAlias /%Alias_name%/ "%Alias_path%/"
<Directory "%Alias_path%/">
    Options Indexes MultiViews FollowSymLinks
    AllowOverride AuthConfig
    Order allow,deny
    Allow from all
</Directory>
# ...
# /%Alias_name%/
#########################################################################

)%)%)%,Alias)%%
%</IfModule>
#########################################################################
# ...
# Aliases
#########################################################################

#########################################################################
# Autoindex
# ...
#########################################################################
<IfModule mod_autoindex.c>
IndexOptions FancyIndexing FoldersFirst NameWidth=*
</IfModule>
#########################################################################
# ...
# Autoindex
#########################################################################
%
%)%)%