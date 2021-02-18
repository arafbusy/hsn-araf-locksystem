fx_version 'adamant'
game 'gta5'
description 'hsn-araf-locksystem | Advanced Lock System by Hasan.#7803 and Araf Beats#6082'
client_scripts {
    'locale.lua',
    'locales/tr.lua',
    'locales/en.lua',

    'client/client.lua',
    'config.lua',
}
server_scripts {
    'locale.lua',
    'locales/tr.lua',
    'locales/en.lua',

    'server/server.lua',
    'config.lua',
    
    '@mysql-async/lib/MySQL.lua'
}

exports {
    'AddKeys'
}
