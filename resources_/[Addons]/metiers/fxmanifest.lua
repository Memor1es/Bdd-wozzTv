fx_version 'adamant'
games { 'gta5' }

dependency 'essentialmode'

ui_page 'gui/ui.html'

files {
	'gui/ui.html',
	'gui/job-icon.png',
	'gui/pricedown.ttf',
	"gui/chomeur.png",
	"gui/cadet.png",
	"gui/agent.png",
	"gui/sergent.png",
	"gui/sergent-chef.png",
	"gui/capitaine.png",
	"gui/lieutenant.png",
	"gui/commandant.png",
	"gui/mineur.png",
	"gui/bucheron.png",
	"gui/fermier.png",
	"gui/pecheur.png",
	"gui/brasseur.png",
	"gui/vigneron.png",
	"gui/ambulancier.png",
	"gui/mecano.png",
	"gui/taxi.png",
	"gui/joaillier.png",
	"gui/journaliste.png",
	"gui/brinks.png",
	"gui/burgershot.png",
	"gui/ballas.png",
	"gui/evenementiel.png",
	"gui/patron-burgershot.png",
	"gui/patron-mecano.png",
	"gui/patron-journaliste.png",
	"gui/patron-evenementiel.png",
	"gui/bar.png",
	"gui/patron-bar.png",
	"gui/patron-brinks.png",
	"gui/avocat.png",
	"gui/juge.png",
	"gui/enqueteur.png",
	"gui/procureur.png",
	"gui/gouverneur.png",
	"gui/gouverneur-adjoint.png",
}

client_script {
	'gui/gui.lua',
	'poleemploi/metiers_config.lua',
	'chomeur/chomeur_config.lua',
	'fermier/fermier_config.lua',
	'bucheron/bucheron_config.lua',
	'mineur/mineur_config.lua',
	'pecheur/pecheur_config.lua',
	'vigneron/vigneron_config.lua',
	'brasseur/brasseur_config.lua',
	--'livreur/livreur_config.lua',
	'police/police_client.lua',
    'police/police_client_vehicle.lua',
    'police/police_client_veset.lua',
    'police/police_client_notif.lua',
	'police/police_radar.lua',
    'police/police_Menu.lua',
	'poleemploi/metiers_client.lua',
	'chomeur/chomeur_client.lua',
	'fermier/fermier_client.lua',
	'bucheron/bucheron_client.lua',
	'mineur/mineur_client.lua',
	'pecheur/pecheur_client.lua',
	'vigneron/vigneron_client.lua',
	'brasseur/brasseur_client.lua',
	'mecano/mecano_client.lua',
	'mecano/mecano_Menu.lua',
	'joaillier/joaillier_client.lua',
	'joaillier/joaillier_config.lua',
	'journaliste/journaliste_client.lua',
	'journaliste/journaliste_config.lua',
	'journaliste/journaliste_menu.lua',
	'journaliste/journaliste_utils.lua',
	'journaliste/menu.lua',
	'journaliste/jour_camera.lua',
	'brinks/brinks_client.lua',
	'brinks/brinks_config.lua',
	--'police/police_radar.lua'
	--'ambulancier/healthPlayerManager.lua',
	--'ambulancier/ambulancier_client.lua',
	--'ambulancier/ambulancier_Menu.lua'
}

server_script {
	'@mysql-async/lib/MySQL.lua',
	-- 'configserveur/server_config.lua',
	'poleemploi/metiers_server.lua',
	'chomeur/chomeur_server.lua',
	'police/police_server.lua',
    'police/police_server_notif.lua',
	'fermier/fermier_server.lua',
	'bucheron/bucheron_server.lua',
	'mineur/mineur_server.lua',
	'pecheur/pecheur_server.lua',
	'vigneron/vigneron_config.lua',
	'vigneron/vigneron_server.lua',
	'brasseur/brasseur_config.lua',
	'brasseur/brasseur_server.lua',
	'mecano/mecano_server.lua',
	'joaillier/joaillier_server.lua',
	'joaillier/joaillier_config.lua',
	'journaliste/journaliste_server.lua',
	'brinks/brinks_server.lua',
	'brinks/brinks_client.lua',
	--'ambulancier/ambulancier_server.lua'

}

export 'getIsCop'
export 'getIsInService'
export 'getIsInServiceBrasseur'
export 'getIsInServiceBucheron'
export 'getIsInServiceFermier'
export 'getIsInServiceMineur'
export 'getIsInServicePecheur'
export 'getIsInServiceMecano'
export 'getIsInServiceVigneron'
export 'getIsInServiceJoaillier'
export 'getIsInServiceBrinks'