{config, pkgs, ...}:
{
  programs.waybar.enable = true;
   
  programs.waybar.settings = {
  mainBar = {
    layer = "top";
    position = "top";
    height = 26;
    output = [
      "eDP-1"
    ];

    modules-left = [ "custom/logo" "sway/workspaces" "sway/mode" ];
    modules-right = [ "custom/spotify" "sway/language" "cpu" "memory" "disk" "network" "battery" "clock"  ];
    
    "custom/logo" = {
      format = "";
      tooltip = false;
      on-click = ''bemenu-run --accept-single  -n -p "Launch" --hp 4 --hf "#ffffff" --sf "#ffffff" --tf "#ffffff" '';
    };

    "sway/workspaces" = {
      disable-scroll = true;
      all-outputs = true;
      persistent-workspaces = {
        "1" = []; 
        "2" = [];
	"3" = [];
	"4" = [];
      };
      disable-click = true;
    };

    "sway/mode" = {
      tooltip = false;
    };

    "custom/spotify" = {
          interval = 5;
          exec = ''
            ${pkgs.playerctl}/bin/playerctl -p spotify metadata --format "{{xesam:artist}} - {{xesam:title}}"'';
          format = "♫ {}";
          max-length = 70;
          on-click = "${pkgs.playerctl}/bin/playerctl -p spotify play-pause";
        };
    
    "sway/language" = {
      format = "{shortDescription}";
      tooltip = false;
      on-click = ''swaymsg input "1:1:AT_Translated_Set_2_keyboard" xkb_switch_layout next'';

    };

     "cpu" = {
        format = "{usage}% ";
        tooltip = false;
      };
      "memory" = {
  	    interval = 1;
  	    format = "{used:0.1f}G/{total:0.1f}G ";
      };
  
      "disk" = {
        interval = 600;
        format = "{percentage_used}% ";
        path = "/";
      };

       battery = {
              interval = 1;
              states = {
                warning = 30;
                critical = 15;
              };
              format = "{capacity}% <span font='11'>{icon}</span>";
              format-charging = "{capacity}% <span font='11'></span>";
              format-icons = [ "" "" "" "" "" ];
              max-length = 25;
            };

    "network" = {
  	    format = "{ifname}";
  	    format-wifi = "{essid} ({signalStrength}%) ";
  	    format-ethernet = "{ifname} ";
  	    format-disconnected = "";
        tooltip-format = "{ifname}: {ipaddr}/{cidr}";
        on-click = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
  	    max-length = 50;
      };

    "clock" = {
      interval = 60;
      format = "{:%a %d/%m %H:%M}";
    };
    
  };
  };

  programs.waybar.style = ''
  
  * {
    border: none;
    border-radius: 0;
    padding: 0;
    margin: 0;
    font-size: 11px;
  }

  window#waybar {
    background: #292828;
    color: #ffffff;
  }
  
  #custom-logo {
    font-size: 18px;
    margin: 0;
    margin-left: 7px;
    margin-right: 12px;
    padding: 0;
    font-family: NotoSans Nerd Font Mono;
  }

  #custom-spotify {
    font-size: 9px;
    margin: 0;
    margin-left: 7px;
    margin-right: 35px;
    padding: 0;
    font-family: NotoSans Nerd Font Mono;
  }
  
  #workspaces button {
    margin-right: 10px;
    color: #ffffff;
  }
  #workspaces button:hover, #workspaces button:active {
    background-color: #292828;
    color: #ffffff;
  }
  #workspaces button.focused {
    background-color: #383737;
  }

  #language {
    margin-right: 7px;		
  }

  #cpu {
    margin-left: 7px;
    margin-right: 12px;
  }

  #memory {
    margin-left: 7px;
    margin-right: 12px;
  }

  #disk {
    margin-left: 7px;
    margin-right: 12px;
  }

  #network {
    margin-left: 7px;
    margin-right: 7px;
  }

  #battery {
    margin-left: 7px;
    margin-right: 12px;
  }

  #clock {
    margin-right: 8px;
  }

  #battery.warning {
    color: #ff5d17;
    background-color: rgba(0,0,0,0);
  }
  #battery.critical {
    color: #ff200c;
    background-color: rgba(0,0,0,0);
  }
  #battery.charging {
    color: #9ece6a;
    background-color: rgba(0,0,0,0);
  }
  '';
}
