Genx = {
    -->> اعدادات اساسية
    basicResource = {

        License = "GLufZvOx", -->> الرخصه
        serverDiscord = "https://discord.gg/p-e", -->> دسكورد السيرفر
        --tokenBot = "MTA5NjU2NDk3MTE1ODEzMDg0OA.GG1hjN.fUusdw5f5rJ4-3ZEQX4b-uSa4A1Iz9ksSqL3uk", -->> توكن اي بوت داخل سيرفرك عشان يجيب صور دسكورد الاعبين
        
        -- [موقع الازرار]: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
        openKey = 'G', -->> زر فتح المنيو 
        openCommand = "gnx", -->> كوماند فتح المنيو

        limitMi = 1, -->> اقل حد للكتابة في الشات
        limitM = 200, -->> اعلى حد للكتابة في الشات
        BlackListChat = { -->> الكلمات الممنوعه بالشات
            "جيجي","بوست","كلب","هاك","discord.gg","https","/e ","السيرفر","منيك","نيك","@everyone","admin","ايدي","انتقل","وصخ","حيوان","حمار","اداره",
            "ادارة","دمن","هطف","admin","<","اهين","شرموط","fuck","you","كس","السيرفر","سيرفر","سيرفركم","ادمن"
        },

    },

    -->> اعدادات الحمايات
    optionsAnti = {
        checkMenu = {false, "kick"}, -->> حماية المنيوهات
        checkDiscordLink = false, -->> اجبار اللاعب على ربط الدسكورد
        checkClient = {false, "kick"}, -->> فحص ملفات اللاعب
        emotePr = {true, "kick"}, -->> حماية رقص الجميع
        spawnBots = {false, "kick"}, -->> حماية البوتات
        WeaponObjects = true, -- >> سلاح حذف الاوبجكتات
        spawnCars = {false, "kick"}, -->> حماية السيارات
        spawnObjects = {true, "kick"}, -->> حماية الاوبجكتات
        Explosion = {true, "kick"}, -->> حماية التفجيرات
        kickPlayers = {true, "kick"}, -->> حماية طرد العالم من السيارة
        giveAllWeapons = {true, "kick"}, -->> حماية اعطاء الكل اسلحة
        removeAllWeapons = {true, "kick"}, -->> حماية حذف اسلحة جميع اللاعبين
        ptFxEvent = {true, "kick"}, -->> حماية البارتكلات
        StopResource = {false, "kick"}, -->> حماية الريسورسات من الايقاف
        Spectator = {true, "kick"}, -->> حماية السبكتيد 
        FlyHack = {false, "kick"}, -->> حماية الطيران
        SpeedHack = {false, "kick"}, -->> حماية السرعة
        FreeCam = {false, "kick"}, -->> حماية الفري كام
        Jump = {false, "kick"}, -->> حماية القفز العالي
        Visible = {false, "kick"}, -->> حماية الاختفاء
        PROXY = {false, "kick"}, -->> حماية البروكسي
        VPN = {false, "kick"}, -->> حماية الفي بس ان
        Commands = {false, "kick"}, -->> حماية الفي بس ان
        BlackListWeapons = true, -->> حماية الاسلحة (يحذف السلاح الممنوع فقط) 
        chatMix = true, -->> حماية الشات
    },

    -->> اعدادات حدود
    Limits = { 
        spawnCars = 5, -->> رسبنة السيارات بغير مكان القراجات
        spawnCarsSPAM = 7, -->> رسبنة السيارات بسبام
        CountEx = 7, -->> التفجيرات
        CountExSpam = 7, -->> سبام التفجيرات
        ENTITY = 10, -->> رسبنة البوتات
        OBJECTS = 7, -->> رسبنة الاوبجكتات
    },

    -->> البرمشنات
    permissionGenx = {
        checkMenu = {"genx.menu", "genx"}, -->> اللي يقدر يفتح منيوهات
        listSpawnCars = {"admin.spawncars", "genx"}, -->> اللي يقدر يرسبن سيارات ممنوعة
        perExplode = {"police.easy_cuff", "genx"}, -->> صلاحية التفجير
        AimEntity = {"genx.menu", "genx"}, -->> صلاحية سلاح حذف الاوبجكتات
        FlyHack = {"player.noclip", "genx"}, -->> صلاحية الطيران
        SpeedHack = {"genx.menu", "genx"}, -->> صلاحية السرعة
        FreeCam = {"genx.menu", "genx"}, -->> صلاحية الفري كام
        Jump = {"player.jump", "genx"}, -->> صلاحية الجمب
        Visible = {"genx.menu", "genx"}, -->> صلاحية الاختفاء
        Spectator = {"RAR.Spectate", "genx"}, -->> صلاحية السبكتيت
        WeaponsAction = {"admin.blacklist_weapons", "genx"}, -->> صلاحية الاسلحة الممنوعة

        showPlayers = {"genx.players"}, -->> قائمة جميع اللاعبين
        showBans = {"genx.menu"}, -->> قائمة المحظورين
        showSettings = {"genx.settings"}, -->> قائمة اعدادات الحماية
        showAdmins = {"genx.players"}, -->> قائمة مزايا الادمنية EsP خيارات اخرى
        showServerF = {"genx.menu"}, -->> قائمة خصائص الادارة
        showLogs = {"genx.menu"}, -->> اللوقات
    },

    -->> الاسلحة الممنوعة
    BlacklistedWeapons = {"WEAPON_RAILGUN", "WEAPON_GARBAGEBAG", "WEAPON_SNSPISTOL_MK2","WEAPON_FLAREGUN", "WEAPON_RPG", "WEAPON_MINIGUN","WEAPON_RAILGUN", "WEAPON_HOMINGLAUNCHER","WEAPON_RAYMINIGUN","WEAPON_PROXMINE", "WEAPON_SNOWBALL", "WEAPON_PIPEBOMB","WEAPON_SMOKEGRENADE", "WEAPON_ROCKET", "WEAPON_EXPLOSION ", "WEAPON_FLARE", "WEAPON_MUSKET" },
    MaxAmmo = 3000, -->> اعلى حد للرصاص 

    -->> اسلحة حذف الاوبجكت
    WeaponsObject = {
        ["WEAPON_APPISTOL"] = true,
    },

    -->> البوتات المسموحة
    ListPeds = {"a_f_o_indian_01","csb_prologuedriver"},
    
    -->> السيارات الممنوع رسبنتها
    ListCars = {
        "savage","cargobob","mule2","mule","chernobog","oppressor2","apc","insurgent","airjet","tug","jet","freight","barrage","caracara",
        "starling","rhino","akula","tankercar","cargoplane","Titan","Dump","deluxo","buzzard","RHINO","avenger","bombushka","oppressor","khanjali"
    }
}


