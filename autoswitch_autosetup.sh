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
	echo "$beam" | sed -i -e"s/^\"Beam\":.*/\"Beam\":$beam/" /hive-config/autoswitch.conf
	echo "$grin29" | sed -i -e"s/^\"Grin29\":.*/\"Grin29\":$grin29/" /hive-config/autoswitch.conf
	echo "$grin31" | sed -i -e"s/^\"Grin31\":.*/\"Grin31\":$grin31/" /hive-config/autoswitch.conf
	echo "$lyra2rev3" | sed -i -e"s/^\"Lyra2rev3\":.*/\"Lyra2rev3\":$lyra2rev3/" /hive-config/autoswitch.conf
	echo "$mtp" | sed -i -e"s/^\"MTP\":.*/\"MTP\":$mtp/" /hive-config/autoswitch.conf
	echo "$cryptonightr" | sed -i -e"s/^\"CryptoNightR\":.*/\"CryptoNightR\":$cryptonightr/" /hive-config/autoswitch.conf
	echo "$cuckooae" | sed -i -e"s/^\"CuckooAE\":.*/\"CuckooAE\":$cuckooae/" /hive-config/autoswitch.conf
	echo "$grin29d" | sed -i -e"s/^\"Grin29d\":.*/\"Grin29d\":$grin29d/" /hive-config/autoswitch.conf
	echo "$beamv2" | sed -i -e"s/^\"BeamV2\":.*/\"BeamV2\":$beamv2/" /hive-config/autoswitch.conf
	echo "$x16rv2" | sed -i -e"s/^\"X16Rv2\":.*/\"X16Rv2\":$x16rv2/" /hive-config/autoswitch.conf
	echo "$randomx" | sed -i -e"s/^\"RandomX\":.*/\"RandomX\":$randomx/" /hive-config/autoswitch.conf
	echo "$eaglesong" | sed -i -e"s/^\"Eaglesong\":.*/\"Eaglesong\":$eaglesong/" /hive-config/autoswitch.conf
	echo "$cuckaroom" | sed -i -e"s/^\"Cuckaroom\":.*/\"Cuckaroom\":$cuckaroom/" /hive-config/autoswitch.conf
	echo "$cuckatoo32" | sed -i -e"s/^\"Cuckatoo32\":.*/\"Cuckatoo32\":$cuckatoo32/" /hive-config/autoswitch.conf
	echo "$kawpow" | sed -i -e"s/^\"KawPow\":.*/\"KawPow\":$kawpow/" /hive-config/autoswitch.conf
  echo "$cuckaroobfc" | sed -i -e"s/^\"CuckarooBFC\":.*/\"CuckarooBFC\":$cuckaroobfc/" /hive-config/autoswitch.conf
  echo "$beamv3" | sed -i -e"s/^\"BeamV3\":.*/\"BeamV3\":$beamv3/" /hive-config/autoswitch.conf
  echo "$cuckarooz29" | sed -i -e"s/^\"CuckaRooz29\":.*/\"CuckaRooz29\":$cuckarooz29/" /hive-config/autoswitch.conf
  echo "$octopus" | sed -i -e"s/^\"Octopus\":.*/\"Octopus\":$octopus/" /hive-config/autoswitch.conf
  echo "$autolykos" | sed -i -e"s/^\"Autolykos\":.*/\"Autolykos\":$autolykos/" /hive-config/autoswitch.conf
  echo "$zelhash" | sed -i -e"s/^\"Zelhash\":.*/\"Zelhash\":$zelhash/" /hive-config/autoswitch.conf
}


if [[ $# -eq 0 ]]; then
	echo "prior to installing Nicehash autoswitch, it is recommended you add all required flightsheets"
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
		read -p "What is your Beam Hashrate Hs? (0 for disable):" beam
		echo
		read -p "What is your Grin29 Hashrate Hs? (0 for disable):" grin29
		echo
		read -p "What is your Grin31 Hashrate Hs? (0 for disable):" grin31
		echo
		read -p "What is your Lyra2REv3 Hashrate MHs? (0 for disable):" lyra2rev3
		echo
		read -p "What is your MTP Hashrate MHs? (0 for disable):" mtp
		echo
		read -p "What is your CryptoNightR Hashrate KHs? (0 for disable):" cryptonightr
    echo
		read -p "What is your CuckooAE Hashrate Hs? (0 for disable):" cuckooae
		echo
		read -p "What is your Grin29d Hashrate Hs? (0 for disable):" grin29d
    echo
		read -p "What is your BeamV2 Hashrate Hs? (0 for disable):" beamv2
    echo
		read -p "What is your X16Rv2 Hashrate MHs? (0 for disable):" x16rv2
    echo
		read -p "What is your RandomX Hashrate KHs? (0 for disable):" randomx
    echo
		read -p "What is your Eaglesong Hashrate KHs? (0 for disable):" eaglesong
    echo
		read -p "What is your Cuckaroom Hashrate Hs? (0 for disable):" cuckaroom
    echo
		read -p "What is your Cuckatoo32 Hashrate Hs? (0 for disable):" cuckatoo32
    echo
		read -p "What is your KawPow Hashrate Hs? (0 for disable):" kawpow
    echo
		read -p "What is your CuckarooBFC Hashrate Hs? (0 for disable):" cuckaroobfc
		echo
		read -p "What is your BeamV3 Hashrate Hs? (0 for disable):" beamv3
		echo
		read -p "What is your CuckaRooz29 Hashrate Hs? (0 for disable):" cuckarooz29
		echo
		read -p "What is your Octopus Hashrate MHs? (0 for disable):" octopus
		echo
		read -p "What is your Autolykos Hashrate MHs? (0 for disable):" autolykos
		echo
		read -p "What is your Zelhash Hashrate MHs? (0 for disable):" zelhash
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
		beam=$1
		shift
	else
		echo "Argument 2 must be an Beam Hashrate HS"
		exit
	fi
	if [[ $1 =~ ^[0-9]+$ ]]; then
		grin29=$1
		shift
	else
		echo "Argument 3 must be an Grin29 Hashrate HS"
		exit
	fi
	if [[ $1 =~ ^[0-9]+$ ]]; then
		grin31=$1
		shift
	else
		echo "Argument 4 must be an Grin31 Hashrate HS"
		exit
	fi
	if [[ $1 =~ ^[0-9]+$ ]]; then
		lyra2rev3=$1
		shift
	else
		echo "Argument 5 must be an Lyra2REv3 Hashrate MHS"
		exit
	fi
  if [[ $1 =~ ^[0-9]+$ ]]; then
		mtp=$1
		shift
	else
		echo "Argument 6 must be an MTP Hashrate MHS"
		exit
	fi
  if [[ $1 =~ ^[0-9]*(\.[0-9]+)?$ ]]; then
		cryptonightr=$1
		shift
	else
		echo "Argument 7 must be an CryptoNightR Hashrate KHS"
		exit
	fi
	if [[ $1 =~ ^[0-9]*(\.[0-9]+)?$ ]]; then
		cuckooae=$1
		shift
	else
		echo "Argument 8 must be an CuckooAE Hashrate HS"
		exit
	fi
	if [[ $1 =~ ^[0-9]+$ ]]; then
		grin29d=$1
		shift
	else
		echo "Argument 9 must be an Grin29d Hashrate HS"
		exit
	fi
  if [[ $1 =~ ^[0-9]+$ ]]; then
		beamv2=$1
		shift
	else
		echo "Argument 10 must be an BeamV2 Hashrate HS"
		exit
	fi
	if [[ $1 =~ ^[0-9]+$ ]]; then
		x16rv2=$1
		shift
	else
		echo "Argument 11 must be an X16Rv2 Hashrate MHS"
		exit
	fi
	if [[ $1 =~ ^[0-9]+$ ]]; then
		randomx=$1
		shift
	else
		echo "Argument 12 must be an RandomX Hashrate KHS"
		exit
	fi
	if [[ $1 =~ ^[0-9]+$ ]]; then
		eaglesong=$1
		shift
	else
		echo "Argument 13 must be an Eaglesong Hashrate KHS"
		exit
	fi
	if [[ $1 =~ ^[0-9]*(\.[0-9]+)?$ ]]; then
		cuckaroom=$1
		shift
	else
		echo "Argument 14 must be an Cuckaroom Hashrate HS"
		exit
	fi
	if [[ $1 =~ ^[0-9]*(\.[0-9]+)?$ ]]; then
		cuckatoo32=$1
		shift
	else
		echo "Argument 15 must be an Cuckatoo32 Hashrate HS"
		exit
	fi
	if [[ $1 =~ ^[0-9]*(\.[0-9]+)?$ ]]; then
		kawpow=$1
		shift
	else
		echo "Argument 16 must be an KawPow Hashrate MS"
		exit
	fi
	if [[ $1 =~ ^[0-9]*(\.[0-9]+)?$ ]]; then
		cuckaroobfc=$1
		shift
	else
		echo "Argument 17 must be an CuckarooBFC Hashrate HS"
		exit
	fi
	if [[ $1 =~ ^[0-9]+$ ]]; then
		beamv3=$1
		shift
	else
		echo "Argument 18 must be an BeamV3 Hashrate HS"
		exit
	fi
	if [[ $1 =~ ^[0-9]*(\.[0-9]+)?$ ]]; then
		cuckarooz29=$1
		shift
	else
		echo "Argument 19 must be an CuckaRooz29 Hashrate HS"
		exit
	fi
	if [[ $1 =~ ^[0-9]*(\.[0-9]+)?$ ]]; then
		octopus=$1
		shift
	else
		echo "Argument 20 must be an Octopus Hashrate HS"
		exit
	fi
	if [[ $1 =~ ^[0-9]*(\.[0-9]+)?$ ]]; then
		autolykos=$1
		shift
	else
		echo "Argument 21 must be an Autolykos Hashrate HS"
		exit
	fi
	if [[ $1 =~ ^[0-9]*(\.[0-9]+)?$ ]]; then
		zelhash=$1
		shift
	else
		echo "Argument 22 must be an Zelhash Hashrate HS"
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
	echo "For argument 23 please select y/n"
	exit
	fi
fi
