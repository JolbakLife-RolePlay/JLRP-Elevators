fx_version 'cerulean'
use_fxv2_oal 'yes'
game 'gta5'
lua54 'yes'

name 'JLRP-Elevator'
author 'Mahan Moulaei'
discord 'Mahan#8183'
description 'JolbakLifeRP Elevator/Lift'

version '0.0.0'


client_scripts {
	'@ox_lib/init.lua',
	'config.lua',
	'shared/*.lua',
	'client/*.lua',
}

dependencies {
	'ox_lib'
}