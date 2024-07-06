# RexshackGaming
- discord : https://discord.gg/YUV7ebzkqs
- youtube : https://www.youtube.com/@rexshack/videos
- tebex store : https://rexshackgaming.tebex.io/
- support me : https://ko-fi.com/rexshackgaming

# rex-gunsmith
- For RSG RedM Framework : https://discord.gg/eW3ADkf4Af

# Dependancies
- rsg-core
- rsg-target
- ox_lib

# Installation:
- ensure that the dependancies are added and started
- add rex-gunsmith to your resources folder
- items have already been added to rsg-core check you have the latest version
- images have already been added to rsg-core check you have the latest version
- add the following table to your database : rex-gunsmith.sql

# Add Jobs
- add jobs to "\rsg-core\shared\jobs.lua"
```lua
    ['valgunsmith'] = {
        label = 'Valentine Gunsmith',
        type = 'gunsmith',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 10 },
            ['1'] = { name = 'Gunsmith', payment = 15 },
            ['2'] = { name = 'Master Gunsmith', isboss = true, payment = 25 },
        },
    },
    ['rhogunsmith'] = {
        label = 'Rhodes Gunsmith',
        type = 'gunsmith',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 10 },
            ['1'] = { name = 'Gunsmith', payment = 15 },
            ['2'] = { name = 'Master Gunsmith', isboss = true, payment = 25 },
        },
    },
    ['stdgunsmith'] = {
        label = 'StDenis Gunsmith',
        type = 'gunsmith',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 10 },
            ['1'] = { name = 'Gunsmith', payment = 15 },
            ['2'] = { name = 'Master Gunsmith', isboss = true, payment = 25 },
        },
    },
    ['tumgunsmith'] = {
        label = 'Tumbleweed Gunsmith',
        type = 'gunsmith',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 10 },
            ['1'] = { name = 'Gunsmith', payment = 15 },
            ['2'] = { name = 'Master Gunsmith', isboss = true, payment = 25 },
        },
    },
    ['anngunsmith'] = {
        label = 'Annesburg Gunsmith',
        type = 'gunsmith',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 10 },
            ['1'] = { name = 'Gunsmith', payment = 15 },
            ['2'] = { name = 'Master Gunsmith', isboss = true, payment = 25 },
        },
    },
```

# Add SQL
```sql
CREATE TABLE `rex_gunsmith` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `gunsmithid` varchar(50) DEFAULT NULL,
    `owner` varchar(50) DEFAULT NULL,
    `rent` int(3) NOT NULL DEFAULT 0,
    `status` varchar(50) DEFAULT 'closed',
    `money` double(11,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `rex_gunsmith_stock` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `gunsmithid` varchar(50) DEFAULT NULL,
    `item` varchar(50) DEFAULT NULL,
    `stock` int(11) NOT NULL DEFAULT 0,
    `price` double(11,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `rex_gunsmith` (`gunsmithid`, `owner`, `money`) VALUES
('valgunsmith', 'vacant', 0.00),
('rhogunsmith', 'vacant', 0.00),
('stdgunsmith', 'vacant', 0.00),
('tumgunsmith', 'vacant', 0.00),
('anngunsmith', 'vacant', 0.00);

INSERT INTO `management_funds` (`job_name`, `amount`, `type`) VALUES
('valgunsmith', 0, 'boss'),
('rhogunsmith', 0, 'boss'),
('stdgunsmith', 0, 'boss'),
('tumgunsmith', 0, 'boss'),
('anngunsmith', 0, 'boss');
```

# Starting the resource:
- add the following to your server.cfg file : ensure rex-gunsmith
