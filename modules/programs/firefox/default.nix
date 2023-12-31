#############
# VanillaOS #
#########################
# FireFox Configuration #
#########################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user}.programs = {
     firefox = {
       enable = true;

       arkenfox = {
         enable = true;
         version = "119.0";
       };
  
       profiles.default = {
         id = 0;
  
         search = { 
    	     force   = true;
    	     default = "DuckDuckGo";
         };
  
         extensions = with pkgs.nur.repos.rycee.firefox-addons; [
           bitwarden
    	     ublock-origin
         ];
  
         bookmarks = [
         {
     	    name = "ChatGPT";
     	    url  = "https://chat.openai.com";
     	   }
         {
     	    name = "Tutanota";
     	    url  = "https://app.tuta.com/login";
     	   }
       ];
  
       arkenfox = {
         enable = true;

         "0000".enable = true;

         "0100" = {
           enable = true;
           "0102"."browser.startup.page".value = 3;
         };

         "0200".enable = true;
         "0300".enable = true;
         "0400".enable = true;
         "0600".enable = true;
         "0700".enable = true;
         "0800".enable = true;

         "0900" = {
           enable = true;

           "0904"."signon.formlessCapture.enabled".value = true;
         };

         "1000" = { 
           enable = true;

           "1001"."browser.cache.disk.enable".value = true;
         };

         "1200".enable = true;
         "1600".enable = true;
         "1700".enable = true;
         "2000".enable = true;
         "2400".enable = true;
         "2600".enable = true;
         "2700".enable = true;

         "2800" = {
           enable = true;

           "2811" = {
             "privacy.clearOnShutdown.downloads".value    = true;
             "privacy.clearOnShutdown.cache".value        = false;
             "privacy.clearOnShutdown.history".value      = false;
             "privacy.clearOnShutdown.formdata".value     = false;
             "privacy.clearOnShutdown.sessions".value     = false;
             "privacy.clearOnShutdown.siteSettings".value = false;
           };

           "2812"."privacy.clearOnShutdown.openWindows".value = false;

           "2815" = {
             "privacy.clearOnShutdown.cookies".value     = false;
             "privacy.clearOnShutdown.offlineApps".value = false;
           };
         };

         "4500" = {
           enable = true;

           "4501" = {
             "privacy.resistFingerprinting".value        = false;
             "privacy.resistFingerprinting.pbmode".value = false;
           };

           "4504"."privacy.resistFingerprinting.letterboxing".value = false;
           "4520"."webgl.disabled".value                            = false;
         };

         "5000".enable = false;
         "5500".enable = false;

         "6000".enable = true;

         "7000".enable = false;
         "8000".enable = false;

         "9000".enable = true;
       };

       settings = {
         #######################################
      	 # Personal Preferences (Non-ArkenFox) #
         #######################################
         "general.autoScroll"                                          = true;
         "accessibility.typeaheadfind"                                 = true;
         "browser.urlbar.suggest.bookmark"                             = true;
         "media.hardwaremediakeys.enabled"                             = true;
         "browser.ctrlTab.recentlyUsedOrder"                           = true;
         "signon.management.page.breach-alerts.enabled"                = true;
         "media.videocontrols.picture-in-picture.enabled"              = true;
         "general.smoothScroll"                                        = false;
         "signon.rememberSignons"                                      = false;
         "browser.tabs.warnOnClose"                                    = false;
         "browser.newtabpage.enabled"                                  = false;
         "signon.generation.available"                                 = false;
         "accessibility.browsewithcaret"                               = false;
         "browser.tabs.loadInBackground"                               = false;
         "browser.urlbar.suggest.history"                              = false;
         "browser.urlbar.suggest.openpage"                             = false;
         "widget.wayland.overlay-scrollbars"                           = false;
         "browser.newtabpage.activity-stream.showSearch"               = false;
         "browser.newtabpage.activity-stream.feeds.snippets"           = false;
         "browser.newtabpage.activity-stream.feeds.topsites"           = false;
         "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
         "intl.locale.requested"                                       = "en-GB";
         #########
      	 # Theme #
         #########
      	 "font.name.monospace.x-western"     = "Liberation Mono";
      	 "font.name.sans-serif.x-western"    = "Liberation Sans";
      	 "font.default.x-western"            = "Liberation Serif";
      	 "font.name.serif.x-western"         = "Liberation Serif";
         "lightweightThemes.selectedThemeID" = "firefox-compact-dark@mozilla.org";
       };
     };
   };
 };
}
