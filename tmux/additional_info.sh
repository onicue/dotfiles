#must be 4 elements or change logic in get_battery_index_by_capacity

battery_icons=("󰋑" "󰋔" "󰛞" "󰋕")
battery_icon_colors=("color196" "color198" "color204" "color202")
battery_charging_icon="󰻹"

function ip_address() {
  # Loop through the interfaces and check for the one that is up.
    for iface in /sys/class/net/*/operstate; do
    if [ "$(echo $iface | awk -F'/' '{print $5}')" != "lo" ]; then
      if [ "$(cat $iface)" == "up" ] ; then
        interface=$(echo $iface | awk -F'/' '{print $5}')
        printf "%s " "$(ip addr show $interface | awk '/inet /{print $2}')"
      fi
    fi
  done
}

get_battery_index_by_capacity(){
  local capacity="$1"
  if [ "$capacity" -ge 74 ]; then
    echo "0"
  elif [ "$capacity" -ge 50 ]; then
    echo "1"
  elif [ "$capacity" -ge 25 ]; then
    echo "2"
  else
    echo "3"
  fi
}

get_battery_icon_by_index(){
  local status=$(<"/sys/class/power_supply/BAT0/status")
  if [ "$status" == "Charging" ]; then
    echo $battery_charging_icon
  else
    echo ${battery_icons[$1]}
  fi
}

function battery_meter() {
  local battery_path="/sys/class/power_supply/BAT0"
  if [ -d "$battery_path" ] ; then
    local capacity=$(<"$battery_path/capacity")
    local index=$(get_battery_index_by_capacity $capacity)
    local color=${battery_icon_colors[index]}
    local icon=$(get_battery_icon_by_index $index)
    printf "#[fg=$color]$icon $capacity%%#[default] "
  fi
}


function main(){
  battery_meter
  ip_address
}

main
