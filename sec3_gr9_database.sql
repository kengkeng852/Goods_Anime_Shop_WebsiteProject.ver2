DROP DATABASE IF EXISTS webpro;
CREATE DATABASE IF NOT EXISTS `webpro` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `webpro`;

CREATE TABLE `administrator_information` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `first_name` VARCHAR(30) NOT NULL,
  `last_name` VARCHAR(30) NOT NULL,
  `role`VARCHAR(30) NOT NULL,
  `email` VARCHAR(30) NOT NULL
);

CREATE TABLE `administrator_login_information` (
  `idlog` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(30) NOT NULL unique,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(30) NOT NULL,
  `login_log` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  KEY `id_idx` (`idlog`),
  CONSTRAINT `idlog` FOREIGN KEY (`idlog`) REFERENCES `administrator_information` (`id`)
);

CREATE TABLE `products` (
  `Proid` VARCHAR(30) NOT NULL PRIMARY KEY,
  `name` VARCHAR(70) NOT NULL,
  `price` DECIMAL(8,2) NOT NULL,
  `quantity` INT NOT NULL,
  `category` VARCHAR(20) NOT NULL,
  `animename` VARCHAR(30) NOT NULL,
  `brand` VARCHAR(30) NOT NULL,
  `release_date` VARCHAR(10) NOT NULL,
  `image_url` VARCHAR(200) NOT NULL,
  `buyurl` VARCHAR(200) NOT NULL,
  `origin` VARCHAR(50) NOT NULL,
  `information` TEXT NOT NULL
);

insert into `administrator_information` 
values (001,'Kongphob', 'Wutthiumphol','Owner','kongphobkong852@hotmail.com'),
(002,'Chommakorn', ' Sontesadisai','Manager','Chommakorn@hotmail.com'),
(003,'Nattanicha', 'Sinsawet','Admin','Nattanicha@hotmail.com'),
(004,'Poohtanmai', 'Siriwachirapap','Admin','Poohtanmai@hotmail.com');

insert into `administrator_login_information` (idlog,username, password, role)
values (001,'kengkeng1234','kongkong','admin'),
(002,'kaofangg1234','kaokao','admin'),
(003,'testest1234','testtest','admin'),
(004,'poohpooh1234','poohpooh','admin');

insert into `products`
values 
('G-M-01','MG GUNDAM GP01',2500,5,'gunpla','Gundam','BANDAI','1997/08','https://media.discordapp.net/attachments/894196174582595624/1096672014539960361/GP01.jpg','https://www.vcagundam.com/product/787/mg-gundam-gp01','Japan','	The MG GP01 fully lives up to the billing of Bandai superb series of "Master Grade" kits. Besides the standard beam saber, shield and rrrifle accessories, the "Core Fighter" pulls out of the middle of the model and transforms into a jet fighter-type vehicle. Like other MG kits, inner mechanical details and opening hatches are to be found throughout the model. '),
('G-M-02','MG SHINING GUNDAM',2500,5,'gunpla','Gundam','BANDAI','2002/05','https://media.discordapp.net/attachments/894196174582595624/1094502820205580368/Shining.jpg','https://www.vcagundam.com/product/860/mg-shining-gundam','Japan','	Bandai Master Grade kit of the GM Sniper II will be supremely posable upon completion thanks to its new moveable back parts, ready to drop to one knee and take aim at a moment notice with its 75mm SniperRifle! It also has the Bullpup MachineGun, shield, two beam sabers, three MachineGun magazines'),
('G-M-03','MG GUNDAM BARBATOS',4500,12,'gunpla','Gundam','BANDAI','2019/12','https://cdn.discordapp.com/attachments/1079714818107383888/1079721606043160666/BarbatosMG.jpg','https://www.vcagundam.com/product/2435/mg-gundam-barbatos','Japan','From "Mobile Suit Gundam: Iron Blooded Orphans," arrives the fourth form of the main Gundam, Barbatos, as an MG!The internal mechanisms such as the Gundam from and Ahab Reactors, have been thoroughly recreated. Features excellent color separation, improved dynamic movement gimmicks, and plentiful option parts.Barbatos fourth form colors have been replicated with precision, and the internal parts such as the Gundam frame have been carefully crafted to match their appearance in the series.'),

('G-R-01','RG STRIKE FREEDOM GUNDAM',3000,10,'gunpla','Gundam','BANDAI','2013/11','https://media.discordapp.net/attachments/894196174582595624/1094503654372933723/RGstrike.jpg','https://www.vcagundam.com/product/4/rg-strike-freedom-gundam','Japan','The RG version of the Strike Freedom from Gundam Seed Destiny is here, utilizing a modified gold colored advanced ms joint system! All armaments including BeamRifles, RailGuns, chest cannon, beam sabers, beam shield, and deployable DRAGOON pods are included. Wing internal detail is gold electroplated to give off a a very bright gold appearance!'),
('G-R-02','RG UNICORN GUNDAM',1290,10,'gunpla','Gundam','BANDAI','2017/08','https://cdn.discordapp.com/attachments/1079714818107383888/1079725344501796874/UnicornRG.jpg','https://www.vcagundam.com/product/1088/rg-unicorn-gundam','Japan','In the fall of 2017, a 1/1 scale RX-0 Unicorn Gundam will be installed at the Diver City Tokyo Plaza shopping center, and to commemorate the event, Bandai is bringing out this amazingly detailed RG Unicorn Gundam! It features an advanced inner framework, and it can transform between Unicorn mode and Destroy mode. Its armed with two guns, a shield and two beam sabers. Dont wait on this one, order it today!'),
('G-R-03','RG RX-78-2 GUNDAM',2500,10,'gunpla','Gundam','BANDAI','2010/07','https://media.discordapp.net/attachments/894196174582595624/1094503935613603920/RGrx78.jpg','https://www.vcagundam.com/product/58/rg-rx-78-2-gundam','Japan','The ever-popular! The year 2010, Bandai launches its newest grade class : RG. RG stands for "Real Grade" and with this grade line, Bandai loads an extreme amazing level of detail. Combining MG + PG into a size of a HG 1/144 kit which features complete with dynamic action and moving features. The new inner frame is "stress free" and features Advanced MS Joints, and stands about 12.5 centimeters tall after assembled. This is a must have collection to all Gundam Gunpla hobbylist!'),

('G-H-01','HG MSN-06S SINANJU',2600,7,'gunpla','Gundam','BANDAI','2010/10','https://media.discordapp.net/attachments/894196174582595624/1094504181789900820/HGsinanju.jpg','https://www.vcagundam.com/product/85/hg-msn-06s-sinanju','Japan','Bandai has created magic by bringing you the Sinanju, previously available only in a 1/100 scale Master Grade kit, as a 1/144 scale High Grade kit! This special HGUC has many of the same features which made the MG Version so special such as movable thrusters on the legs and backpack, a Grenade Launcher which attaches to the Beam Rifle or shield, and Beam Axes that can be attached to the shield.'),
('G-H-02','HG PMX-003 THE-O',2400,7,'gunpla','Gundam','BANDAI','2002/12','https://media.discordapp.net/attachments/894196174582595624/1094504206234288208/HGpmx.jpg','https://www.vcagundam.com/product/514/hg-pmx-003-the-o','Japan','Typical Bandai High Grade kit quality with beautiful detail, snap assembly, and full poseabbility with poly caps. Weapons load includes a BeamRifle, as well as a Beam Sword for The-Os hideaway extra arms to wield! Comes with stickers for the detail that are not molded in color. Molded in Bandai patented multi-gate technology which allows multiple colors on one tree. Parts are pre colored!'),
('G-H-03','HG SAZABI (METALLIC COATING VER)',5500,7,'gunpla','Gundam','BANDAI','2010/01','https://cdn.discordapp.com/attachments/1079714818107383888/1079724729717506108/SazabiHG.jpg','https://www.vcagundam.com/product/1244/hg-sazabi-metallic-coating-ver','Japan','Bandais High Grade Universal Century 1/144 HGUC MSN-04 SAZABI (COATING VER)! Last piloted by Char Aznable in "Char Counterattack," the sizzlin Sazabi now joins Bandai HGUC series as a superbly detailed snap-fit plastic kit! Molded in a brilliant Metallic Coating color, the Sazabi will be fully poseable with polycap joints upon completion.'),

('G-P-01','PG Gundam RX-78-2',12000,7,'gunpla','Gundam','BANDAI','1998/11','https://media.discordapp.net/attachments/894196174582595624/1094504822184628315/PGrx78.jpg','https://www.vcagundam.com/product/252/pg-rx-78-2-gundam','Japan','The PG RX-78-2 Gundam model kit that Bandai has produced is truly amazing. The most striking aspect is the incredible level of INNER detail. It is almost a shame to put any of the cover panels on this thing, because there is so much on the inside that a little silver and black paint will make very interesting to look at. Bandai is aware of this, and is also going to market an optional parts set for the kit that includes transparent body pieces! This is due in December, we are told.'),
('G-P-02','PG Zaku II',12000,7,'gunpla','Gundam','BANDAI','1998/03','https://media.discordapp.net/attachments/894196174582595624/1094504834994024561/PGzaku.jpg','https://www.vcagundam.com/product/253/pg-ms-06f-zaku-ii','Japan','Bandai is Perfect Grade Zaku is the perfect partner for the Perfect Grade RX-78 released earlier. Because of the nature of the Zaku, it does not have quite as many little gimmicks as the Gundam, but all the fun stuff you would expect is here: fully-articulated hands, a moving and illuminating camera eye (requires two LR43 watch batteries, sold separately), operable hatches all over the body (20 locations), and inner detail at the same, amazing level as that of the Gundam kit (including 24 moving hydraulic dampers). '),
('G-P-03','PG Gundam Exia',18000,7,'gunpla','Gundam','BANDAI','2017/12','https://cdn.discordapp.com/attachments/1079714818107383888/1079723751421263933/ExiaPG.jpg','https://www.vcagundam.com/product/1372/pg-gundam-exia','Japan','This incredibly detailed Perfect Grade kit of the Gundam Exia from "Mobile Suit Gundam 00". This version does not come with the LED light set. Featuring a carefully engineered inner frame, it is fully posable after assembly and is loaded with weapons; a special base is included as well.'),

('O-L-01','Luffy Acrylic Diorama Stand',1400,1,'Stand','One Piece','Shueisha','2019/05','https://media.discordapp.net/attachments/894196174582595624/1094511181290549248/luffyacrylic.jpg','https://jp.mercari.com/item/m82376289873','Japan','新品未使用です。緩衝材に包み、oppに入れ発送致します。 ワンピース one piece'),
('O-L-02','Luffy One Piece 25th Anniversary Fair Acrylic GIGA Figure',12100,1,'Stand','One Piece','Shueisha','2022/12','https://media.discordapp.net/attachments/894196174582595624/1094511520039309362/luffygiga.jpg','https://www.aitaikuji.com/products/one-piece-jump-shop-25th-anniversary-goods-giga-acrylic-stand-monkey-d-luffy','Japan','ONE PIECE has hit its 25th anniversary with a plethora of Jump Shop goods! New items feature the Mugiwara crew and other characters from the saga on acrylic stands, accessories, stationery, and much more!'),
('O-L-03','Luffy Mugi Mugi Film Red Kessenfuku ver.',730,1,'Doll','One Piece','Shueisha','2022/08','https://media.discordapp.net/attachments/894196174582595624/1094512080809365554/luffykessenfuku.jpg','https://store.toei-anim.co.jp/shop/g/gONP00727P1','Japan','【サイズ】横・幅・Ｗ65mm×縦・高さ・Ｈ60mm×奥行・Ｄ80mm【素材】ポリエステル【生産国】 中国'),

('O-Z-01','Zoro Acrylic Diorama Stand',1400,1,'Stand','One Piece','Shueisha','2019/11','https://media.discordapp.net/attachments/894196174582595624/1094511181055672361/zoroacrylic.jpg','https://jp.mercari.com/item/m44551543270','Japan','ONE PIECE名場面ジオラマフィギュア　和　ゾロ十郎です。購入後自宅にて保管していました。 水濡れ防止して発送いたします。 【即購入可です】 キャラクター...コミック・アニメ・ゲーム'),
('O-Z-02','Zoro One Piece 25th Anniversary Fair Acrylic GIGA Figure',12100,1,'Stand','One Piece','Shueisha','2022/12','https://media.discordapp.net/attachments/894196174582595624/1094511519833800714/zorogiga.jpg','https://www.aitaikuji.com/one-piece-jump-shop-25th-anniversary-goods-giga-acrylic-stand-roronoa-zoro','Japan','ONE PIECE has hit its 25th anniversary with a plethora of Jump Shop goods! New items feature the Mugiwara crew and other characters from the saga on acrylic stands, accessories, stationery, and much more!'),
('O-Z-03','Zoro Mugi Mugi Film Red Kessenfuku ver.',730,1,'Doll','One Piece','Shueisha','2022/08','https://media.discordapp.net/attachments/894196174582595624/1094512080570294352/zorokessenfuku.jpg','https://store.toei-anim.co.jp/shop/g/gONP00728P1','Japan','【サイズ】横・幅・Ｗ65mm×縦・高さ・Ｈ60mm×奥行・Ｄ80mm【素材】ポリエステル【生産国】中国'),

('O-S-01','Sanji Acrylic Diorama Stand',1400,1,'Stand','One Piece','Shueisha','2019/03','https://media.discordapp.net/attachments/894196174582595624/1094511180774649926/sanjiacrylic.jpg','https://jp.mercari.com/item/m83290146503','Japan','ONEPIECE 名場面ジオラマフィギュア 〜和〜 サン五郎 アクリルスタンド 麦わらストアで購入後、未開封のまま暗所保管しておりました。緩衝材＋水濡れ防止の上発送いたします。即購入可能です。宜しくお願い申し上げます'),
('O-S-02','Sanji One Piece 25th Anniversary Fair Acrylic GIGA Figure',12100,1,'Stand','One Piece','Shueisha','2022/12','https://media.discordapp.net/attachments/894196174582595624/1094511519632470067/sanjigiga.jpg','https://www.aitaikuji.com/one-piece-jump-shop-25th-anniversary-goods-giga-acrylic-stand-sanji','Japan','ONE PIECE has hit its 25th anniversary with a plethora of Jump Shop goods! New items feature the Mugiwara crew and other characters from the saga on acrylic stands, accessories, stationery, and much more!'),
('O-S-03','Sanji Mugi Mugi Film Red Kessenfuku ver.',730,1,'Doll','One Piece','Shueisha','2022/08','https://media.discordapp.net/attachments/894196174582595624/1094512080377348116/sanjikessenfuku.jpg','https://store.toei-anim.co.jp/shop/g/gONP00731P1','Japan','【サイズ】横・幅・Ｗ65mm×縦・高さ・Ｈ60mm×奥行・Ｄ80mm【素材】ポリエステル【生産国】中国'),

('A-E-01','Eren Kororin M size',1650,1,'Doll','Attack On Titan','TakaraTomy Arts','2022/05','https://media.discordapp.net/attachments/894196174582595624/1094515321672585236/erenkokorin.jpg','https://www.1999.co.jp/eng/10839130','Japan','Fans of the wildly popular TV anime series "Attack on titan" will definitely want to get their hands on this brand new medium-sized Fuwa Kororin plush toy, modeled after the character Eren Yeager in an adorable chibi style. This fun and cute plush toy makes for an excellent addition to any fan collection, so do not miss out and be sure to order yours today![Size]: 200mm [Materials]: Polyester'),
('A-E-02','Eren Nendoroid',5500,1,'Figure','Attack On Titan','GOOD SMILE COMPANY','2014/04','https://media.discordapp.net/attachments/894196174582595624/1094515582050770954/erennendoroid.jpg','https://www.goodsmile.info/en/product/4095/Nendoroid+Eren+Yeager.html','Japan','From the popular anime series "Attack on Titan" comes a rerelease of Nendoroid Eren Yeager! He comes with three expressions including his standard expression, a shouting expression and a surprised expression! Just like Mikasa, he also comes with his dual blades, vertical maneuvering equipment with effect parts and blood effect parts.'),
('A-E-03','Eren Mayla Classic ICONIQUE SHOES',7350,1,'Shoes','Attack On Titan','Mayla Classic','2022/05','https://media.discordapp.net/attachments/894196174582595624/1094512464818876506/erenshoes.jpg','https://mayla.jp/SHOP/sha2430.html','Japan','壁の外の世界を夢見る少年。訓練兵団に入団後は、 壁外進出を試みる調査兵団への配属を目指す。 強い気持ちを持ち、その性格は猪突猛進。'),

('A-M-01','Mikasa Kororin M size',1650,1,'Doll','Attack On Titan','TakaraTomy Arts','2022/05','https://media.discordapp.net/attachments/894196174582595624/1094515321446076476/mikasakokorin.jpg','https://www.1999.co.jp/eng/10839131','Japan','Fans of the wildly popular TV anime series "Attack on titan" will definitely want to get their hands on this brand new medium-sized Fuwa Kororin plush toy, modeled after the character Mikasa Ackerman in an adorable chibi style. This fun and cute plush toy makes for an excellent addition to any fan collection, so do not miss out and be sure to order yours today![Size]: 200mm [Materials]: Polyester'),
('A-M-02','Mikasa Nendoroid',5500,1,'Figure','Attack On Titan','GOOD SMILE COMPANY','2014/01','https://media.discordapp.net/attachments/894196174582595624/1094515581811691610/mikasanendoroid.jpg','https://www.goodsmile.info/en/product/13970/Nendoroid+Mikasa+Ackerman+Survey+Corps+Ver.html','Japan','from "Attack on Titan" comes a Nendoroid of Mikasa Ackerman in her Survey Corps uniform!Face plates: Determined face Shouting face Stunned face Optional parts: Cloak Dual blades Vertical Maneuvering Equipment Other optional parts for different poses.'),
('A-M-03','Mikasa Mayla Classic ICONIQUE SHOES',7350,1,'Shoes','Attack On Titan','Mayla Classic','2022/05','https://media.discordapp.net/attachments/894196174582595624/1094512464537854002/mikasashoes.jpg','https://mayla.jp/SHOP/sha2430.html','Japan','壁の外の世界を夢見る少年。訓練兵団に入団後は、 壁外進出を試みる調査兵団への配属を目指す。 強い気持ちを持ち、その性格は猪突猛進。'),

('A-A-01','Armin Kororin M size',1650,1,'Doll','Attack On Titan','TakaraTomy Arts','2022/05','https://media.discordapp.net/attachments/894196174582595624/1094515321236357130/arminkokorin.jpg','https://www.1999.co.jp/eng/10839132','Japan','Fans of the wildly popular TV anime series "Attack on titan" will definitely want to get their hands on this brand new medium-sized Fuwa Kororin plush toy, modeled after the character Armin Arlert in an adorable chibi style. This fun and cute plush toy makes for an excellent addition to any fan collection, so do not miss out and be sure to order yours today![Size]: 200mm [Materials]: Polyester'),
('A-A-02','Armin Nendoroid',5500,1,'Figure','Attack On Titan','GOOD SMILE COMPANY','2014/10','https://media.discordapp.net/attachments/894196174582595624/1094515581572628611/arminnendoroid.jpg','https://www.goodsmile.info/en/product/13971/Nendoroid+Armin+Arlert+Survey+Corps+Ver.html','Japan','from Attack on Titan" comes a Nendoroid of Armin Arlert in her Survey Corps uniform!Face plates: Determined face Shouting face Stunned face Optional parts: Cloak Dual blades Vertical Maneuvering Equipment Other optional parts for different poses.'),
('A-A-03','Armin Mayla Classic ICONIQUE SHOES',7350,1,'Shoes','Attack On Titan','Mayla Classic','2022/05','https://cdn.discordapp.com/attachments/1079714818107383888/1079718583862579271/ArminShoes.jpg','https://mayla.jp/SHOP/sha2430.html','Japan','壁の外の世界を夢見る少年。訓練兵団に入団後は、 壁外進出を試みる調査兵団への配属を目指す。 強い気持ちを持ち、その性格は猪突猛進。');









