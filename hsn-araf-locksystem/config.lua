Config = {}
Config.Locale = 'tr'

Config.MinMoney = 25
Config.MaxMoney = 100
Config.Money = 'cash'

Config.MinItemAmount = 1
Config.MaxItemAmount = 3

Config.AnimDict = "anim@veh@std@panto@ds@base"
Config.AnimName = "hotwire"

Config.AlarmTime = 10 -- seconds
Config.HighChanceItems = {
    'goldbar',
    'jewels',
    'id_card',
    'bandage',
    'cannabis',
    Config.Money
}

Config.NormalChanceItems = {
    'blue_phone',
    'cola',
    'chips',
    'lockpick',
    'medikit',
    Config.Money
}

Config.LowChanceItems = {
    'water',
    'bread',
    'havuc',
    'patates',
    'taco',
    Config.Money
}
