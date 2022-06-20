#!/bin/bash
#Script is for the automatic installation for autoswitch nicehash on HiveOS
#Script By CryptoLuigi (Michael Ruperto)
#Updated by @RuntimeRacer
#Date: 2019-03-20
#Updated: 2022-06-20

# Update Notes:
# - Order of algos matches order of autoswitch script for better overview

function applyproperties()
{
	echo "$FARM_ID" | sed -i -e"s/^FARM_ID=.*/FARM_ID=$FARM_ID/" /hive-config/autoswitch.conf
	echo "$TOKEN" | sed -i -e"s/^TOKEN=.*/TOKEN=\"$TOKEN\"/" /hive-config/autoswitch.conf
}
function applyhashrate()
{
	echo "$grin31" | sed -i -e"s/^\"Grin31\":.*/\"Grin31\":$grin31/" /hive-config/autoswitch.conf
	echo "$cryptonightr" | sed -i -e"s/^\"CryptoNightR\":.*/\"CryptoNightR\":$cryptonightr/" /hive-config/autoswitch.conf
	echo "$x16rv2" | sed -i -e"s/^\"X16Rv2\":.*/\"X16Rv2\":$x16rv2/" /hive-config/autoswitch.conf
	echo "$x16r" | sed -i -e"s/^\"X16R\":.*/\"X16Rv2\":$x16r/" /hive-config/autoswitch.conf
	echo "$randomx" | sed -i -e"s/^\"RandomX\":.*/\"RandomX\":$randomx/" /hive-config/autoswitch.conf
	echo "$eaglesong" | sed -i -e"s/^\"Eaglesong\":.*/\"Eaglesong\":$eaglesong/" /hive-config/autoswitch.conf
	echo "$cuckatoo32" | sed -i -e"s/^\"Cuckatoo32\":.*/\"Cuckatoo32\":$cuckatoo32/" /hive-config/autoswitch.conf
	echo "$kawpow" | sed -i -e"s/^\"KawPow\":.*/\"KawPow\":$kawpow/" /hive-config/autoswitch.conf
  echo "$beamv3" | sed -i -e"s/^\"BeamV3\":.*/\"BeamV3\":$beamv3/" /hive-config/autoswitch.conf
  echo "$octopus" | sed -i -e"s/^\"Octopus\":.*/\"Octopus\":$octopus/" /hive-config/autoswitch.conf
  echo "$autolykos" | sed -i -e"s/^\"Autolykos\":.*/\"Autolykos\":$autolykos/" /hive-config/autoswitch.conf
  echo "$zelhash" | sed -i -e"s/^\"Zelhash\":.*/\"Zelhash\":$zelhash/" /hive-config/autoswitch.conf
  echo "$keccak" | sed -i -e"s/^\"Keccak\":.*/\"Keccak\":$keccak/" /hive-config/autoswitch.conf
	echo "$neoscrypt" | sed -i -e"s/^\"NeoScrypt\":.*/\"NeoScrypt\":$neoscrypt/" /hive-config/autoswitch.conf
	echo "$lyra2rev2" | sed -i -e"s/^\"Lyra2REv2\":.*/\"Lyra2REv2\":$lyra2rev2/" /hive-config/autoswitch.conf
	echo "$ethash" | sed -i -e"s/^\"Ethash\":.*/\"Ethash\":$ethash/" /hive-config/autoswitch.conf
	echo "$lyra2z" | sed -i -e"s/^\"Lyra2Z\":.*/\"Lyra2Z\":$lyra2z/" /hive-config/autoswitch.conf
	echo "$zhash" | sed -i -e"s/^\"Zhash\":.*/\"Zhash\":$zhash/" /hive-config/autoswitch.conf

}


if [[ $# -eq 0 ]]; then
	echo "proir to installing Nicehash autoswitch, it is recommended you add all required flightsheets"
	echo "Further documentation can be found on HiveOs Forum"
	echo
	read -p "Do you want to install autoswitch for Nicehash?(y/n)" -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		curl https://raw.githubusercontent.com/RuntimeRacer/autoswitch/master/as-setup.sh | bash
	fi
	read -p "Do you want to configure it automatically now?(y/n)" -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		. /hive-config/rig.conf
		echo "$FARM_ID" | sed -i -e"s/^FARM_ID=.*/FARM_ID=$FARM_ID/" /hive-config/autoswitch.conf
		echo
		echo "Farm ID was automatically entered."
		read -p "Do you have your API Token?(y/n)" -n 1 -r
		if [[ $REPLY =~ ^[Yy]$ ]]; then
			echo
			read -p "Enter your API Token: " TOKEN
			echo "$TOKEN" | sed -i -e"s/^TOKEN=.*/TOKEN=\"$TOKEN\"/" /hive-config/autoswitch.conf
		fi
	fi
	read -p "Do you know the hashrates of the algos you want to mine?(y/n)" -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]; then
	  # @RuntimeRacer: Order of algos matches order of autoswitch script for better overview
		echo
		read -p "What is your Grin31 Hashrate Hs? (0 for disable):" grin31
		echo
		read -p "What is your CryptoNightR Hashrate KHs? (0 for disable):" cryptonightr
    echo
		read -p "What is your X16Rv2 Hashrate MHs? (0 for disable):" x16rv2
    echo
		read -p "What is your X16R Hashrate MHs? (0 for disable):" x16r
    echo
		read -p "What is your RandomX Hashrate KHs? (0 for disable):" randomx
    echo
		read -p "What is your Eaglesong Hashrate KHs? (0 for disable):" eaglesong
    echo
		read -p "What is your Cuckatoo32 Hashrate Hs? (0 for disable):" cuckatoo32
    echo
		read -p "What is your KawPow Hashrate Hs? (0 for disable):" kawpow
		echo
		read -p "What is your BeamV3 Hashrate Hs? (0 for disable):" beamv3
		echo
		read -p "What is your Octopus Hashrate MHs? (0 for disable):" octopus
		echo
		read -p "What is your Autolykos Hashrate MHs? (0 for disable):" autolykos
		echo
		read -p "What is your Zelhash Hashrate MHs? (0 for disable):" zelhash
		echo
		read -p "What is your Keccak Hashrate MHs? (0 for disable):" keccak
		echo
		read -p "What is your NeoScrypt Hashrate MHs? (0 for disable):" neoscrypt
		echo
		read -p "What is your Lyra2REv2 Hashrate MHs? (0 for disable):" lyra2rev2
		echo
		read -p "What is your DaggerHashimoto Hashrate MHs? (0 for disable):" ethash
		echo
		read -p "What is your Lyra2Z Hashrate MHs? (0 for disable):" lyra2z
		echo
		read -p "What is your Zhash Hashrate Hs? (0 for disable):" zhash

		applyhashrate
	fi

	echo
	read -p "Do you want to start Nicehash autoswitch?(y/n)" -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		autoswitch config
		autoswitch start
	fi
	echo
	echo "Installation of Nicehash Autoswitch is complete."
fi

if [[ $# -gt 0 ]]; then
	if [[ ${#1} -gt 1 ]]; then
		curl https://raw.githubusercontent.com/RuntimeRacer/autoswitch/master/as-setup.sh | bash
		TOKEN=$1
		shift
		. /hive-config/rig.conf
		applyproperties
	else
		echo "Argument 1 must be an APIkey"
		exit
	fi
	if [[ $1 =~ ^[0-9]+$ ]]; then
		grin31=$1
		shift
	else
		echo "Argument 2 must be an Grin31 Hashrate HS"
		exit
	fi
  if [[ $1 =~ ^[0-9]*(\.[0-9]+)?$ ]]; then
		cryptonightr=$1
		shift
	else
		echo "Argument 3 must be an CryptoNightR Hashrate KHS"
		exit
	fi
	if [[ $1 =~ ^[0-9]+$ ]]; then
		x16rv2=$1
		shift
	else
		echo "Argument 4 must be an X16Rv2 Hashrate MHS"
		exit
	fi
	if [[ $1 =~ ^[0-9]+$ ]]; then
		x16r=$1
		shift
	else
		echo "Argument 5 must be an X16R Hashrate MHS"
		exit
	fi
	if [[ $1 =~ ^[0-9]+$ ]]; then
		randomx=$1
		shift
	else
		echo "Argument 6 must be an RandomX Hashrate KHS"
		exit
	fi
	if [[ $1 =~ ^[0-9]*(\.[0-9]+)?$ ]]; then
		eaglesong=$1
		shift
	else
		echo "Argument 7 must be an Eaglesong Hashrate KHS"
		exit
	fi
	if [[ $1 =~ ^[0-9]+$ ]]; then
		cuckatoo32=$1
		shift
	else
		echo "Argument 8 must be an Cuckatoo32 Hashrate HS"
		exit
	fi
	if [[ $1 =~ ^[0-9]*(\.[0-9]+)?$ ]]; then
		kawpow=$1
		shift
	else
		echo "Argument 9 must be an KawPow Hashrate MS"
		exit
	fi
	if [[ $1 =~ ^[0-9]+$ ]]; then
		beamv3=$1
		shift
	else
		echo "Argument 10 must be an BeamV3 Hashrate HS"
		exit
	fi
	if [[ $1 =~ ^[0-9]*(\.[0-9]+)?$ ]]; then
		octopus=$1
		shift
	else
		echo "Argument 11 must be an Octopus Hashrate HS"
		exit
	fi
	if [[ $1 =~ ^[0-9]*(\.[0-9]+)?$ ]]; then
		autolykos=$1
		shift
	else
		echo "Argument 12 must be an Autolykos Hashrate HS"
		exit
	fi
	if [[ $1 =~ ^[0-9]*(\.[0-9]+)?$ ]]; then
		zelhash=$1
		shift
	else
		echo "Argument 13 must be an Zelhash Hashrate HS"
		exit
	fi
	if [[ $1 =~ ^[0-9]*(\.[0-9]+)?$ ]]; then
		keccak=$1
		shift
	else
		echo "Argument 14 must be an Keccak Hashrate MHs"
		exit
	fi
	if [[ $1 =~ ^[0-9]*(\.[0-9]+)?$ ]]; then
		neoscrypt=$1
		shift
	else
		echo "Argument 15 must be an NeoScrypt Hashrate MHs"
		exit
	fi
	if [[ $1 =~ ^[0-9]+$ ]]; then
		lyra2rev2=$1
		shift
	else
		echo "Argument 16 must be an Lyra2REv2 Hashrate MHs"
		exit
	fi
	if [[ $1 =~ ^[0-9]+$ ]]; then
		ethash=$1
		shift
	else
		echo "Argument 17 must be an Ethash Hashrate MHS"
		exit
	fi
	if [[ $1 =~ ^[0-9]+$ ]]; then
		lyra2z=$1
		shift
	else
		echo "Argument 18 must be an Lyra2Z Hashrate MHS"
		exit
	fi
	if [[ $1 =~ ^[0-9]+$ ]]; then
		zhash=$1
		shift
	else
		echo "Argument 19 must be an Zhash Hashrate HS"
		exit
	fi
	if [[ $1 =~ ^[Yy]$ ]]; then
		applyhashrate
		autoswitch config
		autoswitch start
	elif [[ $1 =~ ^[Nn]$ ]]; then
		applyhashrate
		autoswitch config
		echo "Autoswitch not started"
	else
	echo "For argument 20 please select y/n"
	exit
	fi
fi
