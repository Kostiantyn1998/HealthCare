/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.1.39-MariaDB : Database - bereached
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bereached` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bereached`;

/*Table structure for table `ci_sessions` */

DROP TABLE IF EXISTS `ci_sessions`;

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ci_sessions` */

insert  into `ci_sessions`(`id`,`ip_address`,`timestamp`,`data`) values 
('016vap1a3e6345e7m89uphi8pulam72s','192.168.107.37',1610308241,'__ci_last_regenerate|i:1610308241;'),
('026vkgd372nug03vp5r5vmv20k0n09er','62.228.182.205',1535031288,'__ci_last_regenerate|i:1535031287;'),
('02pfqrmnmuj8qgbp4lvnq39q7o4b52jr','103.98.32.25',1535112589,'__ci_last_regenerate|i:1535112589;'),
('03kovetmignfddgn04uk1293dniea0hh','116.212.158.230',1534771327,'__ci_last_regenerate|i:1534771325;'),
('078600n91iremq5jr8mput73j988ppkj','192.168.107.37',1610293475,'__ci_last_regenerate|i:1610293475;'),
('09mh35uehmm7tojujerhoogd12g6aseg','45.56.153.186',1535018608,'__ci_last_regenerate|i:1535018608;'),
('0a7iir6j05h9kbsel9rojrmvjqmbmcst','192.168.107.37',1610369940,'__ci_last_regenerate|i:1610369940;'),
('0cu2lnb3a42fijc0j4fdi4jnrilqfrkg','45.56.153.179',1534650266,'__ci_last_regenerate|i:1534650266;'),
('0d3plj7sd5i8b8nqu1samk53snhtvhlt','64.64.108.140',1535546658,'__ci_last_regenerate|i:1535546658;'),
('0e3njl1p283undkojnefovb0rj7msplr','::1',1610071866,'__ci_last_regenerate|i:1610071866;'),
('0fjj3rspbqtqr44n7jg92i7rfru0ojiv','45.56.153.67',1535376466,'__ci_last_regenerate|i:1535376466;'),
('0i9uudgccjrodd429s2jp5r6onmam2kb','45.125.192.211',1534709011,'__ci_last_regenerate|i:1534709011;'),
('0l442i6fpja21eru2sao4bpgbgqcckvq','213.207.135.38',1535441832,'__ci_last_regenerate|i:1535441715;'),
('0naifj4ojbt242tr51olqrb777afuq8f','45.56.153.214',1535367572,'__ci_last_regenerate|i:1535367572;'),
('0nem4qb5mc3jmuj89f6m1jamncsn31k8','45.125.192.211',1534752034,'__ci_last_regenerate|i:1534752034;'),
('0o8l2nrmmfl68l7cl9jq325gsftvib5v','139.208.41.181',1534726816,'__ci_last_regenerate|i:1534726816;'),
('0qoi21kalucsphjmvabj54e6eeiagjgp','192.168.107.37',1610290165,'__ci_last_regenerate|i:1610290164;'),
('0rqu5ni95n5gk3f16rm4ci4n63k1g8a5','91.184.211.126',1535564970,'__ci_last_regenerate|i:1535564970;'),
('0svq8hh0m6qjje1neg9h2lgnc5e53u61','117.3.102.214',1534872404,'__ci_last_regenerate|i:1534872332;'),
('0vvs4logtsep3j7bsh2a2r3qn4eefres','192.168.107.37',1610313498,'__ci_last_regenerate|i:1610313498;'),
('12sa70g4a66118lg8hf9bgd4f8hi9bgc','45.56.153.216',1535617249,'__ci_last_regenerate|i:1535617248;'),
('138ldrlkh3mo6lbr3rv803bnj4549thr','62.228.182.205',1534970911,'__ci_last_regenerate|i:1534970911;'),
('14g9sb95s0fj0v1mjrcltpumcqpv3205','::1',1610287846,'__ci_last_regenerate|i:1610287846;'),
('16l335dg6pbhcdhm8niv1h4nb49h3ivb','45.125.192.211',1534650291,'__ci_last_regenerate|i:1534650291;'),
('18o4is3s3tirrqh7qugqkle332vfle2k','64.64.108.32',1534797346,'__ci_last_regenerate|i:1534797346;'),
('1ajcfegc52lbnt00kvj3qcjf3nvacvv6','103.98.32.25',1535172857,'__ci_last_regenerate|i:1535172857;'),
('1bmonb9hrfg127j68fi3067db3rgti4h','192.168.107.37',1610290497,'__ci_last_regenerate|i:1610290497;'),
('1c2lflkia9b04g03fscdhn6avuusvu7q','45.56.153.216',1535586542,'__ci_last_regenerate|i:1535586539;'),
('1cagq03blsrn4pnn38scfodpolmvsa5d','192.168.107.37',1610294348,'__ci_last_regenerate|i:1610294347;'),
('1cu6ld5resdjmu8q5jtiha4guv5hv92v','45.56.153.216',1535618008,'__ci_last_regenerate|i:1535618008;'),
('1dcv7rvq5pavgqak5p43d97de2qkdl79','45.56.153.80',1535254054,'__ci_last_regenerate|i:1535254054;'),
('1dvolf58774kaksmlugv4pt1e2j8533s','64.64.108.172',1534731295,'__ci_last_regenerate|i:1534731295;'),
('1gc7ag5s96gm67n6oht9bklbmuqsiil3','64.64.108.189',1535355087,'__ci_last_regenerate|i:1535355087;'),
('1gcfici14b9tbg098ommo4f24nra5vmj','45.125.192.211',1534730951,'__ci_last_regenerate|i:1534730951;'),
('1iacek0anr6p6ogfrhrpkobt9feovtp8','192.168.107.37',1610287783,'__ci_last_regenerate|i:1610287783;'),
('1m6v40393fk56qtuvpbiv5n80rqt3s4f','192.168.107.37',1610371658,'__ci_last_regenerate|i:1610371657;'),
('1o3tk96e565ben5dcub813i63uhnknr1','64.64.108.142',1534742141,'__ci_last_regenerate|i:1534742141;'),
('1piolpl528tva3ro2v5q5lro8u5ijmbt','128.0.249.119',1535526147,'__ci_last_regenerate|i:1535526012;'),
('1pk3cg90mbgkh771dl1n9eh2to7ha13l','117.3.102.214',1534927282,'__ci_last_regenerate|i:1534927282;'),
('1rufi35f36ig0lrkkh0ars2t0pgu3kci','45.56.153.173',1535544722,'__ci_last_regenerate|i:1535544722;'),
('1tsgfhkr1ckn4t6r708jud8dnodbmqcl','31.153.103.164',1534871608,'__ci_last_regenerate|i:1534871608;'),
('20njt6eo24dve1vqk29kalp06mj4idak','45.56.153.104',1535455011,'__ci_last_regenerate|i:1535455011;'),
('221hilbn7ljsq4e13itvc89m9ablhhi3','45.56.153.216',1535579301,'__ci_last_regenerate|i:1535579301;'),
('23erml5iju2l2l9u7f4b4seqrjimnl0j','45.56.153.67',1535339679,'__ci_last_regenerate|i:1535339679;'),
('26v85csbeumne9hlq1p03kpffi4v6nqu','64.64.108.172',1534733696,'__ci_last_regenerate|i:1534733696;'),
('28h7flagn24a26dp81hii164p2mf6uk5','45.56.153.112',1535254654,'__ci_last_regenerate|i:1535254654;'),
('2av10h8cks33achmvlep38t57mgu34pq','212.50.96.83',1535489211,'__ci_last_regenerate|i:1535489092;'),
('2gt7fkuf2raqt6jrjdtkk7bljplcklmj','64.64.108.111',1535630856,'__ci_last_regenerate|i:1535630856;'),
('2jls4mgda3g9gg5u8e10j47334ltimma','45.56.153.87',1534559693,'__ci_last_regenerate|i:1534559693;'),
('2jtv3skq3cskdpbfjtt541i5l6hjaeeh','45.56.153.220',1535109746,'__ci_last_regenerate|i:1535109746;'),
('2mit4ib9ckgd5fdpjprk6h1gcibb5vus','91.184.211.126',1535563505,'__ci_last_regenerate|i:1535563505;'),
('2o6j4jjv7jpue691afrph9akdj5sfuuj','192.168.107.37',1610371475,'__ci_last_regenerate|i:1610371475;'),
('2pgv6jics419sfd2n7dcn5a3tteegcng','45.125.192.211',1534688802,'__ci_last_regenerate|i:1534688544;'),
('2puq4ifvimgfqf4p50v080b2q8ao96s8','139.208.43.236',1535581428,'__ci_last_regenerate|i:1535581428;'),
('2qkntr29enc9req5lcdqq2b5blatnhnf','45.125.192.211',1534665965,'__ci_last_regenerate|i:1534665965;'),
('2ta5nmn9md8mic565f2fl6kc33d8ji55','192.168.107.37',1610288277,'__ci_last_regenerate|i:1610288277;'),
('2trm3mch5lue4l7d9dmfrg2a01515c2a','45.56.153.156',1534799856,'__ci_last_regenerate|i:1534799856;'),
('2ueurvrvkr4je4p7jse8oh2cspqlo9k2','45.56.153.186',1535022542,'__ci_last_regenerate|i:1535022542;'),
('2v16g9i1jk492upq3pfodonrq8seua64','103.98.32.25',1535106958,'__ci_last_regenerate|i:1535106958;'),
('2vprdd6uko10eobvurgd03ut1c6ankjp','45.56.153.156',1534804431,'__ci_last_regenerate|i:1534804431;'),
('339g42b04kk08m427gkpgru7gd12t763','45.125.192.211',1534752475,'__ci_last_regenerate|i:1534752474;'),
('33j1449ftvhdbfdrbhj3go0mgl6oafdi','192.168.107.37',1610290998,'__ci_last_regenerate|i:1610290998;'),
('34hgtlhrotpi8ifkbidi50c3rbhvj17m','64.64.108.70',1535619045,'__ci_last_regenerate|i:1535619045;'),
('34i8h7ejjuc0ij0r7kr4faobeergblq7','192.168.107.37',1610307704,'__ci_last_regenerate|i:1610307704;'),
('36of4ok21do8jgi1jtj5bl9jhgijus8c','45.56.153.104',1535457039,'__ci_last_regenerate|i:1535457039;'),
('384akmsiv4k3gnj03q6hrvdf13obol36','192.168.107.37',1610294434,'__ci_last_regenerate|i:1610294434;'),
('391l5s552ftn23td7932cedj4kni7tb3','192.168.107.37',1610290172,'__ci_last_regenerate|i:1610290172;'),
('3b2vs3cc4d7er38jc70nhtensvrir4hr','64.64.108.70',1535620147,'__ci_last_regenerate|i:1535620147;'),
('3c0911t8589lbipcinagnl18aul0nac3','45.56.153.112',1535253295,'__ci_last_regenerate|i:1535253295;'),
('3dni7es4m3jm46g6utncsoa15alkfpa1','62.228.182.205',1535009972,'__ci_last_regenerate|i:1535009971;'),
('3du1akl68h6b47et53n399v3bgfk2lsm','192.168.107.37',1610295378,'__ci_last_regenerate|i:1610295378;'),
('3eccgu8kn6hqu46f2fvvs6upoovjau2n','64.64.108.32',1534806678,'__ci_last_regenerate|i:1534806677;'),
('3fjejrjp3ngc1of0fb2qg2pnjrk7fkpt','::1',1610288761,'__ci_last_regenerate|i:1610288761;'),
('3mo0cfs39rgfq1aruvtvdiqfmrd6etrf','192.168.107.37',1610363998,'__ci_last_regenerate|i:1610363998;'),
('3om4l9t0472hegou6sfv9ggvkaea50tc','46.199.62.31',1535574585,'__ci_last_regenerate|i:1535574585;'),
('3pjd434f8311pf1unbscq9egkf3b7i2h','192.168.107.37',1610307628,'__ci_last_regenerate|i:1610307628;'),
('3psffrn5osetv8jl7pc7ej4llhk6fjst','45.125.192.211',1534734763,'__ci_last_regenerate|i:1534734763;'),
('3qi1srh3jnf7lm7rtjhmhrt5dqp6442t','192.168.107.37',1610293473,'__ci_last_regenerate|i:1610293473;'),
('3r57o087d8g3d18q3fgf0tv77kt8q2jg','91.184.211.126',1535582935,'__ci_last_regenerate|i:1535582935;'),
('3rp32sorttoltqc7lg1q8p3mvpn9imfq','212.50.96.83',1535487432,'__ci_last_regenerate|i:1535487432;'),
('3un0vd78ktormllmf3isj657aj07a86c','192.168.107.37',1610294577,'__ci_last_regenerate|i:1610294577;'),
('3v38u0haaf5qq47av3rerqc2g2h9ilks','45.56.153.112',1535255608,'__ci_last_regenerate|i:1535255400;'),
('40niprc2nqdjh0lv0o2bc458e18eipdm','::1',1610143659,'__ci_last_regenerate|i:1610143659;'),
('4177rl9l9ut8ubv2rvpvm1tqrb9sftl3','45.56.153.173',1535541208,'__ci_last_regenerate|i:1535541208;'),
('41hm05mp9hllucchc89r24529an1kec3','64.64.108.140',1535541521,'__ci_last_regenerate|i:1535541521;'),
('422vsvgqfplgos0hghkqhrtqa1p7hfvo','192.168.107.37',1610084341,'__ci_last_regenerate|i:1610084341;'),
('42rfkbnd9es0b8sj59dn6j16kt5rjib8','45.56.153.216',1535581099,'__ci_last_regenerate|i:1535581099;'),
('42sjpk4k2cbpqj9iim4lm1p9mj2k0jli','64.64.108.172',1534732539,'__ci_last_regenerate|i:1534732539;'),
('42tutqeo8kode7l908kc3gup61l27eu7','192.168.107.37',1610289934,'__ci_last_regenerate|i:1610289934;'),
('453p7jdcrnvtimkk2di2q9ehd6crlbql','103.98.32.25',1535116184,'__ci_last_regenerate|i:1535116172;'),
('4aigh5807loccmo942kismbkbjhre7q9','64.64.108.243',1534770418,'__ci_last_regenerate|i:1534770418;'),
('4at94rf709ktg59pdl5b0p2bb4gg8uk4','45.56.153.156',1534806009,'__ci_last_regenerate|i:1534806009;'),
('4cmksf2ev0p7h2g6ofmbt37eg51ke7s7','103.98.32.25',1535112275,'__ci_last_regenerate|i:1535112275;'),
('4hsbl0r1acpkgc1gjsm3bg6ehhvi90lg','45.56.153.218',1535508675,'__ci_last_regenerate|i:1535508675;'),
('4hu68vkepjf3o32g9eo9k3q64pp640gj','45.56.153.122',1535333454,'__ci_last_regenerate|i:1535333454;'),
('4l9r1n2sq10lhorrga7sqi3i3vrckq8m','212.50.96.83',1535490626,'__ci_last_regenerate|i:1535490626;'),
('4me9klcp7baq33onoof0m3ahbnfk92ei','::1',1610146248,'__ci_last_regenerate|i:1610146248;'),
('4mm8bs7r51i7l9n8eb4kn524im7jcj61','64.64.108.140',1535581100,'__ci_last_regenerate|i:1535581100;'),
('4prjg1cl33fbj0n7pt39ha3p8hkpm48p','64.64.108.142',1534735607,'__ci_last_regenerate|i:1534735607;'),
('4qnemrpdvrg0jkb24qcbjutkquc1tvtp','192.168.107.37',1610294948,'__ci_last_regenerate|i:1610294948;'),
('4tc6iodu552k4k9jecd6rjrgi6i8usms','192.168.107.37',1610284642,'__ci_last_regenerate|i:1610284642;'),
('4uoggbb2sg8qasqad7e3gtrpdjqonq80','45.125.192.211',1534710524,'__ci_last_regenerate|i:1534710504;'),
('4vmeurn09n72nkoe7oup5cft077v314m','45.56.153.87',1534563822,'__ci_last_regenerate|i:1534563822;'),
('51as0c4gjb2hf7tln9rrg2keooqs75i2','192.168.107.37',1610255039,'__ci_last_regenerate|i:1610255039;'),
('52ilkftqu4a0u0dcluh7em9o90rokca7','64.64.108.211',1535512731,'__ci_last_regenerate|i:1535512731;'),
('52l8jq0uh7ehugbe16kcq6a23j42ci94','45.56.153.195',1535013709,'__ci_last_regenerate|i:1535013690;'),
('5645q36okorulv8der037bvqh6h9ur8h','192.168.107.37',1610284651,'__ci_last_regenerate|i:1610284651;'),
('564nkd9mptqvb25l6tkqh3er493bo4iu','192.168.107.33',1610082970,'__ci_last_regenerate|i:1610082970;'),
('57rd6ru9am0lvqtvte6nge73gic4dc5o','::1',1610067189,'__ci_last_regenerate|i:1610067189;'),
('58d0eebv3ksulcrm7u6gg3on8dsognsf','45.56.153.186',1535033937,'__ci_last_regenerate|i:1535033936;'),
('58r1bpj8idh3p4bpvg6qk50vqhjva1om','103.98.32.25',1535172857,'__ci_last_regenerate|i:1535172857;'),
('59otdt4vochq5h5r1ib5ievsksaomvl2','192.168.107.37',1610284249,'__ci_last_regenerate|i:1610284247;'),
('5cgatqiu74r71ldc5dl02lj6gbu0v6av','192.168.107.37',1610371551,'__ci_last_regenerate|i:1610371551;'),
('5g6e3312qnak9qoigimtnud7q3ie09u4','45.56.153.67',1535333382,'__ci_last_regenerate|i:1535333382;'),
('5ghnlq619mrnobgovqtv06c300cg69b7','64.64.108.211',1535520159,'__ci_last_regenerate|i:1535520159;'),
('5glooc3g5vrmv0mrmgk01cneo9nrmr3t','106.0.59.157',1535280517,'__ci_last_regenerate|i:1535280517;'),
('5ircvak6onq5n5mp02j5p41fg5i2g76t','64.64.108.228',1535353402,'__ci_last_regenerate|i:1535353401;'),
('5mpgtnaov9fgnnm7t51kueeanij1ar8n','192.168.107.37',1610369985,'__ci_last_regenerate|i:1610369985;'),
('5nn9aprenh7us1bd40h68nq37t8uon8g','::1',1610029794,'__ci_last_regenerate|i:1610029794;'),
('5p11mv9ced1vddj8cadohs3q0pkj2jma','45.56.153.179',1534662360,'__ci_last_regenerate|i:1534662359;'),
('5u8b42ulgdu5735pl2i4af76u7mh5h95','213.207.135.38',1535441715,'__ci_last_regenerate|i:1535441715;'),
('5uom9ilmfnfbdqc2hhpsra24bto2hta7','::1',1610067759,'__ci_last_regenerate|i:1610067759;'),
('5vfvbl0dtn141nur9uds9qln32i9hrfs','64.64.108.211',1535529941,'__ci_last_regenerate|i:1535529941;'),
('6asntfbocno4n61tc1kl7421r4e7b4v1','192.168.107.37',1610370360,'__ci_last_regenerate|i:1610370360;'),
('6emaiirm2k91dehgl23accoe7mcdot4g','192.168.107.37',1610307568,'__ci_last_regenerate|i:1610307568;'),
('6fkjc1e0hp8pshqjk48ltlkpb7nkfnuj','192.168.107.37',1610366374,'__ci_last_regenerate|i:1610366374;'),
('6gtrqss83or86ike4t436a1q05akqg8r','192.168.107.37',1610294750,'__ci_last_regenerate|i:1610294750;'),
('6h71rme1i1p5oc31l1ucjt0tr7r5l8io','64.64.108.140',1535543438,'__ci_last_regenerate|i:1535543438;'),
('6hqq5cchru6fl7gebkjjojn3be3hdlqb','::1',1610079674,'__ci_last_regenerate|i:1610079674;'),
('6kaflnv1gtvuhugncesc31ebv142bqu2','::1',1610247455,'__ci_last_regenerate|i:1610247454;'),
('6mrnlofll9kpkq480culc8lnddl2qnd5','64.64.108.172',1534729639,'__ci_last_regenerate|i:1534729638;'),
('6nphpd5tfq9oeplh7fr2467bi7t09ovn','45.56.153.67',1535340853,'__ci_last_regenerate|i:1535340853;'),
('6nvnagbl6sbo8ht8v25rh70r87ehdcvr','103.98.32.25',1535116172,'__ci_last_regenerate|i:1535116172;'),
('6ourn12035c7tdhn5hr3gk3fh9be2tq9','46.199.31.85',1534574393,'__ci_last_regenerate|i:1534574391;'),
('6r5orbvv26b4v9qou7dh78iu6tl6f4oq','103.98.32.25',1535359816,'__ci_last_regenerate|i:1535359816;'),
('6rcnju2bdu0bjqnsm8qhti04othsm58r','64.64.108.70',1535587071,'__ci_last_regenerate|i:1535587071;'),
('6rgctslb0qniqv5psc9giejdt29dlgj8','45.56.153.216',1535616902,'__ci_last_regenerate|i:1535616902;'),
('6sacq785gitq08ajl0k9ie481uvhqhd9','64.64.108.140',1535578537,'__ci_last_regenerate|i:1535578536;'),
('6tagnd5kvgp6fp3l2mgaib2vjfa63p30','64.64.108.142',1535630024,'__ci_last_regenerate|i:1535630024;'),
('6uq9e8ccvbmvuc80es0pgglpei0dq1b4','45.125.192.211',1534709471,'__ci_last_regenerate|i:1534709471;'),
('6v8mnm4j34hvujnfub1v32fcvqag4l25','106.0.59.157',1535280517,'__ci_last_regenerate|i:1535280517;'),
('6vul0buag6ca9eah1hmuhn2eonjl1oe5','45.56.153.156',1534815265,'__ci_last_regenerate|i:1534815265;'),
('710d04ab8dvrrt031fol1le1te9af3dr','64.64.108.142',1534757118,'__ci_last_regenerate|i:1534757117;'),
('737f9hut591bqtvs904ii9prb3i9d41i','45.56.153.216',1535584202,'__ci_last_regenerate|i:1535584202;'),
('73c46mfddpermakg3k5rjffjs1oo56pb','192.168.107.37',1610287657,'__ci_last_regenerate|i:1610287657;'),
('76jm4i8cr69p5ftfd00mkjo3oi1r0j35','212.50.96.83',1535484136,'__ci_last_regenerate|i:1535484136;'),
('7aitjs2jhqtrerphk9u7mkdbrpv22c2p','46.199.21.154',1534876144,'__ci_last_regenerate|i:1534876144;'),
('7bvnn9srtqdon3stct13ib38g2phfac8','45.56.153.216',1535618685,'__ci_last_regenerate|i:1535618685;'),
('7d0qeifn9qrbohds2d8jspvs35rol9p3','192.168.107.37',1610294569,'__ci_last_regenerate|i:1610294569;'),
('7fouquu7rvqoac08ers332tb4933g7ba','192.168.107.37',1610289937,'__ci_last_regenerate|i:1610289937;'),
('7gq7j3h1k6639ioo9t5lt1jj9fkv11gf','64.64.108.140',1535542459,'__ci_last_regenerate|i:1535542459;'),
('7l4te9e7icigd2kf5e1dihp2cqbig22m','212.50.96.83',1535485280,'__ci_last_regenerate|i:1535485280;'),
('7msmb3iti5bi531pf0ak379gkrcjc69j','192.168.107.37',1610293551,'__ci_last_regenerate|i:1610293551;'),
('7nfr6b3sjjlmnp418g3mltb1prto2r97','45.56.153.67',1535408040,'__ci_last_regenerate|i:1535408039;'),
('7ormv3a3v6lngih7a5263cv5vtdfla3l','192.168.107.37',1610290817,'__ci_last_regenerate|i:1610290817;'),
('7qq8m7f26q6q6vcijuk1pf6iec2dsqhu','185.92.24.34',1535493569,'__ci_last_regenerate|i:1535493568;'),
('7vb1kmb30k54j3794bke1sgv821ndq4d','45.56.153.173',1535545873,'__ci_last_regenerate|i:1535545848;'),
('80hk6k07vgo79pqb3pifbcdveedio05h','64.64.108.172',1534730025,'__ci_last_regenerate|i:1534730025;'),
('80hmcllp64glorthf2pe0tvqmq3vvu00','103.98.32.25',1535462480,'__ci_last_regenerate|i:1535462479;'),
('82s042268276m916m8d88vhho52rgkus','::1',1610073033,'__ci_last_regenerate|i:1610073033;'),
('83qi5do8nq1veli5tk0c740au98oea4k','192.168.107.37',1610369707,'__ci_last_regenerate|i:1610369707;'),
('871a76idv2seprsvog6t7688rhkt2sou','45.125.192.211',1534710504,'__ci_last_regenerate|i:1534710504;'),
('876nbekicht9182gi4r6u3bfc4cgt43t','192.168.107.37',1610366358,'__ci_last_regenerate|i:1610366284;'),
('8fqbao9bgdk0n9jg95advsnfhk63c8l8','103.98.32.25',1535107601,'__ci_last_regenerate|i:1535107601;'),
('8h44vn3mee1tg08dofe0cdi1rdjil5j0','117.3.102.214',1534955029,'__ci_last_regenerate|i:1534955028;'),
('8jtftcjf933js9lke1r3rglsq8lbqeo5','64.64.108.189',1535355088,'__ci_last_regenerate|i:1535355087;'),
('8muoh79nh7q2q1j99sb9pv8g8sj3nddc','64.64.108.211',1535521736,'__ci_last_regenerate|i:1535521736;'),
('8pl3jn8kpe1v9es2lgd54q9om5qvomrj','45.56.153.173',1535529729,'__ci_last_regenerate|i:1535529728;'),
('8pr64sookm7c2tmqcjj8jhtmuljd55uh','45.56.153.173',1535536720,'__ci_last_regenerate|i:1535536543;'),
('8rcu93urktnj3em4a2hpf2ttr2vbqmnb','64.64.108.243',1534774512,'__ci_last_regenerate|i:1534774512;'),
('8rff32j301r3g2brfp0og3gtsectfp5b','128.0.249.119',1535630608,'__ci_last_regenerate|i:1535630607;'),
('8srm0a7kr43uv2reo8cngrv2dnrhgqb6','45.56.153.218',1535527104,'__ci_last_regenerate|i:1535527104;'),
('8tp2p05h6idc43221dsahij2b4etjdeq','45.125.192.211',1534667824,'__ci_last_regenerate|i:1534667824;'),
('8uectm6ug8s4dcs7qkpuaamskrr18hlg','213.207.135.38',1535437053,'__ci_last_regenerate|i:1535437053;'),
('910t3p0aku5u4ikeguf04h6m8bkgr7an','192.168.107.37',1610294469,'__ci_last_regenerate|i:1610294469;'),
('92k1ig39c8omhlmq6g9vi7qork3q9d1f','64.64.108.32',1534804763,'__ci_last_regenerate|i:1534804763;'),
('92upa2mlmv655ac6sric5487b60smpu8','45.56.153.216',1535618793,'__ci_last_regenerate|i:1535618685;'),
('93th4dedbs98q9mgvnf90rh283csfpmi','212.50.96.83',1535484488,'__ci_last_regenerate|i:1535484488;'),
('93uhsnhnlunsmb2v8l6o3bmgfvtreg0s','45.56.153.173',1535531165,'__ci_last_regenerate|i:1535531165;'),
('940tput9l3b6n6qkcucoiv7djnnvuv81','45.56.153.216',1535586574,'__ci_last_regenerate|i:1535586574;'),
('94ed2dakssrujmbucbk8q7muarum6b5n','192.168.107.37',1610288279,'__ci_last_regenerate|i:1610288279;'),
('94fknsouq8a2coc7d3eqlm7uiddanpbn','62.228.182.205',1534975022,'__ci_last_regenerate|i:1534975022;'),
('95rnpfh233u2ho8po4jp3lmgu3993uif','64.64.108.100',1534709498,'__ci_last_regenerate|i:1534709498;'),
('96dt74rkss27946badakb9mp2igqj827','64.64.108.142',1535632323,'__ci_last_regenerate|i:1535632323;'),
('9c0of7aiaastcj9ferdspthv5t56sbc2','213.207.135.38',1535428525,'__ci_last_regenerate|i:1535428524;'),
('9care55bi9d33gs9p3j1j0um53g5colp','64.64.108.140',1535545368,'__ci_last_regenerate|i:1535545368;'),
('9g999ook0cvtfqo19iojno3pgl1jb5j3','117.3.102.214',1535024397,'__ci_last_regenerate|i:1535024396;'),
('9hv3skb84fcovgpqcngdnrt5f7358qho','45.56.153.195',1535022825,'__ci_last_regenerate|i:1535022824;'),
('9imp3blj0r1n3ndf2epmuooea18bpdfh','192.168.107.37',1610284259,'__ci_last_regenerate|i:1610284259;'),
('9l5uf1jlikp5nfg36va2linfk5p7ge99','45.56.153.112',1535254207,'__ci_last_regenerate|i:1535254207;'),
('9les872bp36ivbosljvhivm9113l72s1','192.168.107.37',1610365261,'__ci_last_regenerate|i:1610365261;'),
('9nr63s24rpahjj51o6pf79i2rkm57hul','64.64.108.170',1534929963,'__ci_last_regenerate|i:1534929963;'),
('9o1ibrt7kfql64kavb9mgrlnkeom1709','64.64.108.142',1534741591,'__ci_last_regenerate|i:1534741591;'),
('9sdtgqeis2jfjrnp18paenp1cngfhb9u','45.56.153.218',1535510394,'__ci_last_regenerate|i:1535510393;'),
('9si77vkjai4pk1c2vqul3fm3mm1ndaki','64.64.108.140',1535579690,'__ci_last_regenerate|i:1535579690;'),
('a1ieghkjqpp97fok5fp47u5rf6ali0ue','64.64.108.70',1535587071,'__ci_last_regenerate|i:1535587071;'),
('a1vs55751b6jmpq6n917sirfdof4oraj','182.239.82.212',1535205529,'__ci_last_regenerate|i:1535205519;'),
('a5452nj8fk0nfbccksq97jl2qem5u1hr','106.0.59.157',1535279695,'__ci_last_regenerate|i:1535279695;'),
('a5dkaqpp87t84019ipgtkuom25193jt0','192.168.107.37',1610290504,'__ci_last_regenerate|i:1610290504;'),
('abrbfbrs7q4dde4icajguj2fh42arn32','117.3.102.214',1535024396,'__ci_last_regenerate|i:1535024395;'),
('ac19pqhnvhgp859fhamttib6aldeum8e','192.168.107.37',1610308261,'__ci_last_regenerate|i:1610308261;'),
('ac95n1kca23d136dppv1nrt80pnr8kmr','192.168.107.37',1610294738,'__ci_last_regenerate|i:1610294738;'),
('adb5j2g2uo17s70l9tau41k8p9mrsm74','64.64.108.211',1535510073,'__ci_last_regenerate|i:1535510073;'),
('admggo0683o13l9740kqvtonel1bqj9p','91.184.211.126',1535582936,'__ci_last_regenerate|i:1535582935;'),
('ag28g3bq1kpjt7mg06vhtgsok3kdkvai','64.64.108.111',1535633856,'__ci_last_regenerate|i:1535633856;'),
('ak6nqhbkei90a8ubm7tjd0ogs2pnoid3','192.168.107.37',1610294962,'__ci_last_regenerate|i:1610294962;'),
('akp3b0ko6vtrus1prcqfcitndmlki94p','45.56.153.173',1535543412,'__ci_last_regenerate|i:1535543412;'),
('aovcik46hpniprmrf2na8842bb81jgpk','31.153.103.164',1534790315,'__ci_last_regenerate|i:1534790311;'),
('b4ie86pcqsff1oanmgsrlmt9k7joudpr','::1',1609995765,'__ci_last_regenerate|i:1609995580;'),
('b52k22clk204pquolcfbk6gpb1aq43lq','103.98.32.25',1535110360,'__ci_last_regenerate|i:1535110360;'),
('b5regog8m0a6v035lpj0dg4qe4t2tjap','213.7.177.242',1535606642,'__ci_last_regenerate|i:1535606641;'),
('ba05cnfp4hufqkecdgbf43l19k7689t1','45.56.153.74',1535496695,'__ci_last_regenerate|i:1535496695;'),
('ba0eektij1lpf4cofi5bt0e94mqjffn6','45.56.153.216',1535578725,'__ci_last_regenerate|i:1535578725;'),
('bc3dcr2nr01pqmv8q4au5a8hluevn5jc','139.208.41.181',1534685868,'__ci_last_regenerate|i:1534685868;'),
('bc5f2lsjc1j6a0qsf4angoqoheiqkdns','182.239.82.212',1535205519,'__ci_last_regenerate|i:1535205519;'),
('bdj0aadaigtr8m7qfono10932fe1i210','192.168.107.37',1610284389,'__ci_last_regenerate|i:1610284389;'),
('bga3ba3189ju51p4iak7p0riml484pum','64.64.108.70',1535617766,'__ci_last_regenerate|i:1535617766;'),
('bhrn3s4fcs11jf0vq9onqt0bua2e9taq','45.56.153.156',1534819799,'__ci_last_regenerate|i:1534819799;'),
('bl26startqui7oi3bpuff697ae2us1e5','45.56.153.67',1535361956,'__ci_last_regenerate|i:1535361918;'),
('bp2sjmu7a9s7sicnjoeqn2o7be5hmuq3','213.207.135.41',1535359424,'__ci_last_regenerate|i:1535359370;'),
('bvba2vfs3hkpjk2qu27c4d58ms0f87er','62.228.182.205',1534975023,'__ci_last_regenerate|i:1534975022;'),
('bvlvlo79kde6f8tmtc8tp9vali8t1ruj','192.168.107.37',1610307680,'__ci_last_regenerate|i:1610307679;'),
('c0io39s1s4v0qs5udrqflrdtkgc9ltgj','103.98.32.25',1535108095,'__ci_last_regenerate|i:1535108095;'),
('c269pos75q7h1otidjviplme04hkkbkl','64.64.108.70',1535620147,'__ci_last_regenerate|i:1535620147;'),
('c4f61f5u9qrrt78kbemc55efvmfu26em','45.56.153.122',1535331737,'__ci_last_regenerate|i:1535331737;'),
('c4jf947lbn41lk6il3gihte5vvjmhbm2','139.208.41.181',1534727960,'__ci_last_regenerate|i:1534727960;'),
('c6j9s5tjteupupk1anbti23mmvon8sit','192.168.107.37',1610370683,'__ci_last_regenerate|i:1610370683;'),
('c7ellvi25p1imb3mh4rohjn11f54bbbv','192.168.107.37',1610291817,'__ci_last_regenerate|i:1610291817;'),
('ca21qv9lhgv9h69en3ejd14mh90us2s8','45.56.153.80',1535255312,'__ci_last_regenerate|i:1535255312;'),
('ca5a1vnpuqpmt5sr2egftib7fiatqfj0','45.125.192.211',1534754073,'__ci_last_regenerate|i:1534754073;'),
('caf13oanmrabb52n2iakh2pj3iovd1lh','::1',1609995580,'__ci_last_regenerate|i:1609995580;'),
('cbcdblepnb0pn9ejvka0ke5esj9bbf3d','106.67.50.89',1534877150,'__ci_last_regenerate|i:1534877148;'),
('cbratnicqnbunudgbgmbfocpliub7gdq','45.56.153.74',1535495957,'__ci_last_regenerate|i:1535495957;'),
('cbu1n9t3hns7qp8miho6ujfl9fk4bpom','192.168.107.37',1610084033,'__ci_last_regenerate|i:1610084033;'),
('cgftdn45r4q8ffccgg2qvnkcugdckalu','192.168.107.37',1610365476,'__ci_last_regenerate|i:1610365476;'),
('ckoe60mvvgjp345frqk2buvs0mfq3gfr','31.216.105.241',1534876145,'__ci_last_regenerate|i:1534876144;'),
('cmqa5o6bsul9kt5ftjs15ubqh4s342c1','116.212.158.230',1534754018,'__ci_last_regenerate|i:1534754003;'),
('cnib10gja3256k7o9llmqcol8q9k0vn1','103.98.32.25',1535359314,'__ci_last_regenerate|i:1535359314;'),
('cnq2h0jiv9qpc6ugp9d0nmkmu3e7jm3h','103.98.32.25',1535112943,'__ci_last_regenerate|i:1535112943;'),
('co8nq2ri7iqd3agegfn3kjl66uf82cia','192.168.107.37',1610254717,'__ci_last_regenerate|i:1610254717;'),
('coahgj445jujj99befstm9racav94jop','45.56.153.67',1535353926,'__ci_last_regenerate|i:1535353925;'),
('cqkqldro60ktmfjpskcsosk0261b9g0e','::1',1610289460,'__ci_last_regenerate|i:1610289460;'),
('cr1a23p4t9ap4qe2us3b51bu5o8at5cn','45.125.192.211',1534709809,'__ci_last_regenerate|i:1534709809;'),
('ct85bqunq1kfnkr19700authkgs2tqfo','192.168.107.37',1610370370,'__ci_last_regenerate|i:1610370370;'),
('d2hpn9ngajmcrldgsq2lo9j0cik2mpat','192.168.107.37',1610308265,'__ci_last_regenerate|i:1610308265;'),
('d2qqr1nq8vcjbkudte1e0047jb8bkunf','192.168.107.37',1610294893,'__ci_last_regenerate|i:1610294893;'),
('d3k975fhsk1elctmi121clo4a7djko9u','45.56.153.218',1535511911,'__ci_last_regenerate|i:1535511911;'),
('d7c51gvhh6b2ideg1gshue9qb08retq0','45.125.192.211',1534733059,'__ci_last_regenerate|i:1534733059;'),
('d7rop1etmnaupgqnfqe7k0emc943ob72','64.64.108.142',1534734763,'__ci_last_regenerate|i:1534734763;'),
('d8go4mdnknvk3belvq7abhddiiqk0b7r','64.64.108.211',1535525503,'__ci_last_regenerate|i:1535525503;'),
('d9levvtauq0f8do420qk0fnvilh5v2ej','45.56.153.112',1535255095,'__ci_last_regenerate|i:1535255095;'),
('d9ugsl4rq7u8ftv4pqrjqi0emp5t53n4','192.168.107.37',1610105590,'__ci_last_regenerate|i:1610105588;'),
('dc3ouh1kj2ssq6bio0dath9821l5oehd','45.56.153.195',1535013690,'__ci_last_regenerate|i:1535013690;'),
('de9gs7pd4ct1gpi6bc2unenmif4mqoek','64.64.108.111',1535634025,'__ci_last_regenerate|i:1535633856;'),
('defqilc967gm967tnberegtnmta7obbc','192.168.107.37',1610294891,'__ci_last_regenerate|i:1610294891;'),
('dgf3fu1blaeqmeorhdo873a0katufpvs','45.56.153.122',1535345295,'__ci_last_regenerate|i:1535345294;'),
('di5escpca8rvkt9atn1mbis1dr9qq7rg','117.3.102.214',1534925042,'__ci_last_regenerate|i:1534925042;'),
('djc5gllf0ca0di3480qaaqb5obfm0mcs','::1',1610071351,'__ci_last_regenerate|i:1610071351;'),
('dl9cnsivrqriqoet4flggb32sdmb6bqh','192.168.107.37',1610371440,'__ci_last_regenerate|i:1610371440;'),
('do6sigiqvspnt0iqh94bcnvqoq16ip9f','192.168.107.37',1610370413,'__ci_last_regenerate|i:1610370413;'),
('dot6m25jhnv6k78hl93s6a53srpuruen','103.98.32.25',1535364008,'__ci_last_regenerate|i:1535364008;'),
('dqmkh3g6oqm93q2e7og3u53l47t6t5eo','192.168.107.37',1610293554,'__ci_last_regenerate|i:1610293553;'),
('e1lane5anik0rtbp4p82g6qcscu0aorn','45.56.153.186',1535024373,'__ci_last_regenerate|i:1535024373;'),
('e4hdmfrhs1sqkfnu0btcifca2i58lb70','64.64.108.211',1535510590,'__ci_last_regenerate|i:1535510590;'),
('e5mpl8iihdi7870rjurt115fmi7od263','192.168.107.37',1610291970,'__ci_last_regenerate|i:1610291970;'),
('e8ndouelqsjj7c0u0qu839gk3is7mlsf','45.125.192.211',1534705450,'__ci_last_regenerate|i:1534705450;'),
('e9u28dclpdrt5e60icu4omg36vqt0g83','117.3.102.214',1534955028,'__ci_last_regenerate|i:1534955028;'),
('earrpkct2496r89gigb1vb470j48ckr2','45.56.153.156',1534804985,'__ci_last_regenerate|i:1534804985;'),
('ebqj749sqats4op9je6g4slj0dr0f5i9','45.56.153.156',1534819799,'__ci_last_regenerate|i:1534819799;'),
('ecb0j5mgl04nls0vhn3huhgi5a71c6c5','192.168.107.37',1610371503,'__ci_last_regenerate|i:1610371503;'),
('eefubk27utbe3jlc4njvs69l2ispbcsc','64.64.108.211',1535526812,'__ci_last_regenerate|i:1535526812;'),
('eet5ajd8qsqgu6qta41qshshjkntg32t','64.64.108.211',1535521378,'__ci_last_regenerate|i:1535521378;'),
('efkfdhgdqg884cbisjglf7ghdj4muruq','64.64.108.211',1535522204,'__ci_last_regenerate|i:1535522204;'),
('ejdarqdlbaudb6j8iqrctl42q02fgm6l','64.64.108.142',1534742151,'__ci_last_regenerate|i:1534742141;'),
('en21gf811sjvmmlpaf5q1l61pipm4qmq','::1',1610290225,'__ci_last_regenerate|i:1610290225;'),
('eokmcnsf3mcb0sjdl7mt24r5lm7hme2h','64.64.108.211',1535527790,'__ci_last_regenerate|i:1535527790;'),
('erp1e8us7j3jnvlaj9fqnip4ns888ro0','192.168.107.37',1610369757,'__ci_last_regenerate|i:1610369757;'),
('ervbis98dm2i63vh7116s3p8i8bgnvmf','::1',1610032296,'__ci_last_regenerate|i:1610032274;'),
('eu6n920fbmtud3s5g2ga3jraji4qnphr','64.64.108.100',1534710008,'__ci_last_regenerate|i:1534710008;'),
('f001bd1pti4osckh9sqan5cape7b4h1q','64.64.108.142',1534756677,'__ci_last_regenerate|i:1534756673;'),
('f05tflgolihg5dl8j04o4lmhka2nh9pc','45.56.153.218',1535509544,'__ci_last_regenerate|i:1535509544;'),
('f1o4dlh546r57p7v7i82b6m9rm3fuqqo','45.56.153.216',1535618357,'__ci_last_regenerate|i:1535618357;'),
('f1v3mj1fbc0schfg318tbocajrg0v446','192.168.107.37',1610252993,'__ci_last_regenerate|i:1610252993;'),
('f3veeo3935qstjggc172c4hnm4uqbj1m','64.64.108.142',1534737170,'__ci_last_regenerate|i:1534737170;'),
('f4rh51qdc8v8t9d57tdhg6dqp7c01am8','192.168.107.37',1610292311,'__ci_last_regenerate|i:1610292311;'),
('f72mk67bbnur2d8use5f183ea494hqik','64.64.108.211',1535511791,'__ci_last_regenerate|i:1535511791;'),
('fbeo2aev6i6c9lrmj1vod138bj3oe4g5','45.56.153.173',1535530842,'__ci_last_regenerate|i:1535530842;'),
('fdckd7aoc6h6vpkfeu9ffr45ads78ckv','192.168.107.37',1610370651,'__ci_last_regenerate|i:1610370651;'),
('fecgo90ofea5seqm4n9ondd958rnou82','45.56.153.147',1535076236,'__ci_last_regenerate|i:1535076234;'),
('fjea7dfuinm2g2k8kmfi8v0optgv23h0','45.56.153.67',1535353927,'__ci_last_regenerate|i:1535353925;'),
('fket1h3pgarftftvoe9ud28tvnncb029','192.168.107.37',1610307602,'__ci_last_regenerate|i:1610307602;'),
('flbo9f4om4erjpm6vjh0vdhnb5rjc4vo','103.47.209.109',1534557935,'__ci_last_regenerate|i:1534557935;'),
('flfn6a5lr92dro4p1jgslm2bvq72itmt','64.64.108.211',1535508844,'__ci_last_regenerate|i:1535508843;'),
('flsghe0okiohtdrd8dbst5re2llr7l8g','45.56.153.220',1534860428,'__ci_last_regenerate|i:1534860427;'),
('foa6f16mlo27d1v9rng6l7k3u7cv9qc6','64.64.108.142',1534765771,'__ci_last_regenerate|i:1534765771;'),
('fq97jhde2b8a0n351qehregpgl0cv3s9','64.64.108.100',1534710546,'__ci_last_regenerate|i:1534710495;'),
('fqaae119dqbud78ipvf47ad1lpeg6ha7','45.56.153.216',1535586577,'__ci_last_regenerate|i:1535586574;'),
('frn8c3qvjimmeqli42uer600kanpqrht','212.50.96.83',1535489092,'__ci_last_regenerate|i:1535489092;'),
('futuq2jmel16p238baq6qqiruur16eav','192.168.107.37',1610284510,'__ci_last_regenerate|i:1610284509;'),
('g6km088o9ite73gtc74klplahghivbr8','45.56.153.156',1534816116,'__ci_last_regenerate|i:1534816116;'),
('gd0mfv0udvseshrqa7aq236o3lq31etj','192.168.107.37',1610294933,'__ci_last_regenerate|i:1610294933;'),
('gdlirtnbh8r3vn8ldcdh5n5pcac3v0q3','64.64.108.243',1534774121,'__ci_last_regenerate|i:1534774121;'),
('ge38il4im6h1j9860f2rhmdm0kipgmtq','45.125.192.211',1534730159,'__ci_last_regenerate|i:1534730159;'),
('gf8a9pp3t2k96et1scsptedckh6vr3og','192.168.107.37',1610293007,'__ci_last_regenerate|i:1610293007;'),
('ghcitbm539ca83r2eo6kusj3botpbrgv','64.64.108.142',1534736809,'__ci_last_regenerate|i:1534736809;'),
('ghjgeni9ocs58toedt7ulh1ijmfl19pv','45.56.153.173',1535542923,'__ci_last_regenerate|i:1535542923;'),
('gigi2cs98uoap708fe4u700crg7q9gv1','213.7.177.242',1535606679,'__ci_last_regenerate|i:1535606641;'),
('gkemhnf86qkpulrhpcrpspl5vibvthng','45.56.153.173',1535545514,'__ci_last_regenerate|i:1535545514;'),
('glcjbljns1t51not1bnrtqfrd32hnjsv','45.56.153.173',1535528949,'__ci_last_regenerate|i:1535528949;'),
('gld5m5727r8dgaeukeesnke3cjth3t1s','222.112.215.242',1534555082,'__ci_last_regenerate|i:1534554838;'),
('gm1qt3puhulkdufrrqo4boa10b09s41q','::1',1610072223,'__ci_last_regenerate|i:1610072223;'),
('gm8e5t20vern5ff6vm9uv6b5o6o2kum7','62.228.182.205',1534972062,'__ci_last_regenerate|i:1534972062;'),
('gpj1kj1q1osvm6rfomofakkh30ns8e5t','64.64.108.211',1535527164,'__ci_last_regenerate|i:1535527164;'),
('gteol91vu85cs55p0mdstnu07i4a7gis','45.56.153.173',1535529295,'__ci_last_regenerate|i:1535529295;'),
('guop77k4v8d7mbd6j49j67po08n6uie6','192.168.107.37',1610287785,'__ci_last_regenerate|i:1610287785;'),
('h1anoghvua9i6qih9jvmnrr8cfg4il6r','192.168.107.37',1610370347,'__ci_last_regenerate|i:1610370347;'),
('h3staqieshnu2m146e46vgcni3rfo5pp','213.207.135.10',1535578142,'__ci_last_regenerate|i:1535578142;'),
('h7fr5fs42ihnulgssg7om2l074hgu3u9','192.168.107.37',1610294729,'__ci_last_regenerate|i:1610294729;'),
('h90pjgtgvn131d11ark6otlhq6p6a2hg','45.56.153.112',1535255400,'__ci_last_regenerate|i:1535255400;'),
('h9ut60jcuul6t9di37ao5l7g9l17i4ns','::1',1610289146,'__ci_last_regenerate|i:1610289146;'),
('hdv5o2e3nbn6s14cthoansfjqj4rl4b5','139.208.41.181',1534650266,'__ci_last_regenerate|i:1534650266;'),
('hf583kc4um7svn5v48ut01uoa40f5370','45.125.192.211',1534648865,'__ci_last_regenerate|i:1534648865;'),
('hit4al5soa11l26ncrbvdgh4q6v79jif','192.168.107.37',1610370665,'__ci_last_regenerate|i:1610370665;'),
('hjv6n7aptteg4i4rk46e46mrm7biotv1','192.168.107.37',1610370418,'__ci_last_regenerate|i:1610370418;'),
('hlbuld1ou618sg3af12gf3creb9a5f0p','192.168.107.37',1610294723,'__ci_last_regenerate|i:1610294723;'),
('hme7tsfdbf3i0icnpckv9lhcbbd5o225','192.168.107.37',1610293009,'__ci_last_regenerate|i:1610293009;'),
('hmiic8va6lieufqbq8ujua7bi1tegvn0','45.56.153.173',1535527104,'__ci_last_regenerate|i:1535527104;'),
('hs326a2ilj6sg5an0plne6tekd6b672r','45.56.153.220',1535109746,'__ci_last_regenerate|i:1535109746;'),
('hskfkt1eu9aqpkbtr7rrdou3p5v2oa0e','192.168.107.37',1610290045,'__ci_last_regenerate|i:1610290045;'),
('htf07qc6i0ubhcn8887rpktv7uejqchg','45.56.153.216',1535586539,'__ci_last_regenerate|i:1535586539;'),
('hthk6jf6malt20igh1r39q1cfv3k281d','45.56.153.186',1535033951,'__ci_last_regenerate|i:1535033936;'),
('htlinng2glsnc9eo6camlo8t5q7mlbho','192.168.107.37',1610255168,'__ci_last_regenerate|i:1610255168;'),
('htoln42baht1tngeqvfo5tvl9q8lt43p','64.64.108.172',1534734256,'__ci_last_regenerate|i:1534734256;'),
('i13i3lrp29ujlkhsc784don14on845l9','192.168.107.37',1610292372,'__ci_last_regenerate|i:1610292372;'),
('i1vjj6sqm56vmiout5eahitkujd0455i','192.168.107.37',1610369671,'__ci_last_regenerate|i:1610369671;'),
('i32h45vok2n36ieuecng8lbvgsjdpv65','45.56.153.82',1534904838,'__ci_last_regenerate|i:1534904837;'),
('i5nfkgvaruj513p8vinnabbug5efkc5e','64.64.108.70',1535586224,'__ci_last_regenerate|i:1535586224;'),
('i64isatc858hdfia78q9hpfims2el7gp','192.168.107.37',1610253773,'__ci_last_regenerate|i:1610253773;'),
('i651887bqp80lac009f4mmekmh6cpr0b','64.64.108.32',1534806677,'__ci_last_regenerate|i:1534806677;'),
('i90us0kk3u9omi7vnpkpcnmns3fk9p88','45.56.153.122',1535345296,'__ci_last_regenerate|i:1535345294;'),
('i9a9kg2rvgvrt27ibmmt215vmu4ldnvr','64.64.108.142',1534751688,'__ci_last_regenerate|i:1534751688;'),
('i9drfucnam2sm6mlteumurvd7p8ubcm5','192.168.107.37',1610369723,'__ci_last_regenerate|i:1610369723;'),
('i9tl91gm7grp19omoe5bcrgnh1qertlc','212.50.96.83',1535491031,'__ci_last_regenerate|i:1535490931;'),
('ibcl8u2gin8bfc0rj097ief89nm4ro5c','192.168.107.37',1610369692,'__ci_last_regenerate|i:1610369692;'),
('ibjloaba167cenljic38kotui8bm9m55','45.125.192.211',1534736057,'__ci_last_regenerate|i:1534736055;'),
('iddvfg7v7j3pd6h9qa4so3k7mimd5rfh','192.168.107.37',1610255139,'__ci_last_regenerate|i:1610255139;'),
('ie2a3re1rr4uqu1c0lj0unc75pejvh49','45.56.153.80',1535254927,'__ci_last_regenerate|i:1535254927;'),
('ihkcud3922ui195t5nfmo3f8snslk57v','64.64.108.211',1535540619,'__ci_last_regenerate|i:1535540619;'),
('iibrs3usa1q4oa3lankbg0vpatu9e3ll','192.168.107.37',1610370642,'__ci_last_regenerate|i:1610370642;'),
('ij2v9o7988kl2787m72pn0antp637l1v','45.125.192.211',1534734403,'__ci_last_regenerate|i:1534734403;'),
('ijmqg7b54ib7sfg7vqhbtlcsngcojdtk','192.168.107.37',1610369704,'__ci_last_regenerate|i:1610369704;'),
('in0k207g99020veh9v29r857athh4r9a','45.56.153.156',1534767655,'__ci_last_regenerate|i:1534767655;'),
('io68j8mjiso9201v4efvgo01pb3toakd','45.56.153.156',1534807476,'__ci_last_regenerate|i:1534807476;'),
('iq4ek1rqg03jpuvfoan7gf0jb6cjvqrn','45.56.153.220',1534860429,'__ci_last_regenerate|i:1534860428;'),
('iurcimp2bugkgg9rihoolm02ubek4hrg','46.199.31.85',1534610051,'__ci_last_regenerate|i:1534609820;'),
('ivi5tr8a7kcc2mg1c4hak8lniq8aoqjc','::1',1610063438,'__ci_last_regenerate|i:1610063438;'),
('j6qtdc2iqmqcesanavbfhktvr4a4s5a3','192.168.107.37',1610371450,'__ci_last_regenerate|i:1610371450;'),
('j8c3ur5eu2vcr3o1bmu2157bf7e4u4n3','192.168.107.37',1610284461,'__ci_last_regenerate|i:1610284461;'),
('j9g27s3o1g0eu43t957nbgre3qh2odkj','45.56.153.186',1534927444,'__ci_last_regenerate|i:1534927444;'),
('j9l0ri12ke7ehgg2n8df67goributu0v','45.56.153.218',1535511911,'__ci_last_regenerate|i:1535511911;'),
('j9m6jotp5om3f3a9dpn0utctro8p0po2','192.168.107.37',1610292601,'__ci_last_regenerate|i:1610292601;'),
('jcgqtrs5ccluaagc80nrmq5edf3gvi8q','::1',1610084411,'__ci_last_regenerate|i:1610084411;'),
('jdb7470p9mb0vmlrcrmm496slsfhu36a','192.168.107.37',1610365229,'__ci_last_regenerate|i:1610365229;'),
('je8bne4fu33vd4mastokfikgfg9ukcqd','192.168.107.37',1610308236,'__ci_last_regenerate|i:1610308235;'),
('jechhu65lok6lbrci29f8ctec0bf97ph','192.168.107.37',1610292374,'__ci_last_regenerate|i:1610292374;'),
('jhrbnd98ugjj6ukkmg9o9npdbud7fgo0','103.98.32.25',1535171582,'__ci_last_regenerate|i:1535171582;'),
('ji7sqnc9r052h6gsv17acfe7p9dbochp','::1',1610289864,'__ci_last_regenerate|i:1610289864;'),
('jj1ohdenlfue2b04tj1pvkgb52pmib4p','45.56.153.218',1535508039,'__ci_last_regenerate|i:1535508039;'),
('jk5f7gk9h5dtvk9i4d620oe0g9el0tbf','185.92.24.34',1535493568,'__ci_last_regenerate|i:1535493568;'),
('jkb0j6dc3usddfk0f85kqeq55a9n313l','103.47.209.109',1534558491,'__ci_last_regenerate|i:1534558491;'),
('jlj33cdhq7ualvs8iqkv91osa15bruj0','45.56.153.74',1535497072,'__ci_last_regenerate|i:1535497072;'),
('jm7do52mg79nub491kbdg8vlv7o3fi4f','117.3.102.214',1534927282,'__ci_last_regenerate|i:1534927282;'),
('jmejiklsri1h66qbhnbf0jekuvqfl0ho','45.56.153.67',1535376466,'__ci_last_regenerate|i:1535376466;'),
('jphreejd168rjtqpinb2mftk216h9ik7','45.56.153.156',1534806891,'__ci_last_regenerate|i:1534806891;'),
('jqetp03dpegc4r907ckpotcdggojd8h1','103.98.32.25',1535107261,'__ci_last_regenerate|i:1535107261;'),
('jr1n1itt20i50a9pmb16hnubbl57n7ar','103.98.32.25',1535364009,'__ci_last_regenerate|i:1535364008;'),
('jr9btgl5t37spojcnt1hu2gaqrf8ct5r','192.168.107.37',1610363920,'__ci_last_regenerate|i:1610363914;'),
('jrq1spns0frd9qvamgjrkvb3i7nv0mog','::1',1610288458,'__ci_last_regenerate|i:1610288458;'),
('jvi3eg0b468bagi6db0hrctrf5s1ojt5','45.56.153.186',1534924164,'__ci_last_regenerate|i:1534924163;'),
('k0qm2pi8d0bnje5posck1jtjv7ls3r26','64.64.108.170',1534923822,'__ci_last_regenerate|i:1534923821;'),
('k2d9pa5pghqoifq559jenms88vqhblte','45.56.153.173',1535545848,'__ci_last_regenerate|i:1535545848;'),
('k4rv8jiaq8v361e795nsgjitqpn2leed','64.64.108.142',1534762920,'__ci_last_regenerate|i:1534762920;'),
('k7i2dgr8jvc997q2ch3bs0ek5knjf9lu','192.168.107.37',1610293091,'__ci_last_regenerate|i:1610293091;'),
('k8bvculale8gst1bml08qmdt3asee4ll','192.168.107.37',1610287913,'__ci_last_regenerate|i:1610287913;'),
('k8oe31h2mb3kumi4dgkda3as865i1mr7','45.125.192.211',1534647829,'__ci_last_regenerate|i:1534647829;'),
('k9jucv049v944078v00f9mmt26hm60s2','192.168.107.37',1610294367,'__ci_last_regenerate|i:1610294367;'),
('kaffg64kje0e6494v7g6nisph4r29ck2','192.168.107.37',1610253635,'__ci_last_regenerate|i:1610253635;'),
('kao2n2e3qf3r4vp55a33lrm7ru4la7ca','64.64.108.140',1535541152,'__ci_last_regenerate|i:1535541152;'),
('kcu3tdlc1in6hesnqfktstdtm21fsqlt','212.50.96.83',1535483338,'__ci_last_regenerate|i:1535483338;'),
('keokvaqp9ai4egpo435h31kqpo5i2ls2','46.199.62.31',1535574585,'__ci_last_regenerate|i:1535574585;'),
('kfuhkkh87r20sqh5vth9k9dr1glaqn9r','45.56.153.211',1535457040,'__ci_last_regenerate|i:1535457039;'),
('kkpl5lra9t1iphhm69hq95k2lug63b1a','45.56.153.122',1535333462,'__ci_last_regenerate|i:1535333454;'),
('kndqht0qpo4vaatkillq6vjuoaenlhde','45.56.153.216',1535586029,'__ci_last_regenerate|i:1535586029;'),
('kqni4v7uomnrnaqc7pea5phb5sdjlsgf','192.168.107.37',1610252627,'__ci_last_regenerate|i:1610252627;'),
('ksaqe50cbbo5d2n02k19oonkgu8g3qcr','45.56.153.186',1535014390,'__ci_last_regenerate|i:1535014390;'),
('l0ttrc9bmfjhpv72vs1qk0tut88t9nev','128.0.249.119',1535356942,'__ci_last_regenerate|i:1535356942;'),
('l2g3jn951ddiikru3lf9mp563ue8jell','45.56.153.67',1535412719,'__ci_last_regenerate|i:1535412719;'),
('l3pikqfc0j5lbb9h2j401pftlqitqs70','192.168.107.37',1610290816,'__ci_last_regenerate|i:1610290816;'),
('l4es9oajpeopkfdrijocamhivb811p2h','192.168.107.37',1610313617,'__ci_last_regenerate|i:1610313616;'),
('l4ntcbeduiqg676rrq1tf5uls67k0ip4','192.168.107.37',1610294504,'__ci_last_regenerate|i:1610294504;'),
('l5q8al7fjf3rgimbspbmmf0b7c8sndm8','128.0.249.119',1535367166,'__ci_last_regenerate|i:1535367092;'),
('l7t244bkl2bi4imtlssf950iukog49u9','182.239.82.25',1535133455,'__ci_last_regenerate|i:1535133446;'),
('l89866n8gtbfbijjadufsm2949l5pr77','91.184.211.126',1535560870,'__ci_last_regenerate|i:1535560870;'),
('lbju51qqa9b08rpnvnfge19qd6k9qkoc','62.228.182.205',1534956871,'__ci_last_regenerate|i:1534956865;'),
('lddvu2s8u9rkhveajtob1im1m13rvtq2','::1',1610147989,'__ci_last_regenerate|i:1610147989;'),
('lfv1tc37g90eeeoor0o6sf019b130da6','64.64.108.211',1535534685,'__ci_last_regenerate|i:1535534685;'),
('lg7dam5se3vp40acusrtag7s8jkvk7ot','45.125.192.211',1534666960,'__ci_last_regenerate|i:1534666960;'),
('liednqebd623o1spui10i8n75fmso4pc','64.64.108.211',1535509456,'__ci_last_regenerate|i:1535509456;'),
('llbei7pttjaaqghkpptefgs8fc62fi0q','192.168.107.37',1610364328,'__ci_last_regenerate|i:1610364328;'),
('llffq5alq2cf3magr73a12f1iikqu8aq','45.56.153.216',1535586232,'__ci_last_regenerate|i:1535586232;'),
('ln1g03oef1qb6opj4uvbcj1t3pkd41n3','45.56.153.173',1535534820,'__ci_last_regenerate|i:1535534819;'),
('lnrnma8mn1bakrmr4taohu4l180qlhlg','192.168.107.37',1610370687,'__ci_last_regenerate|i:1610370687;'),
('lo1aacp5vfvsks9ko0ivttip74m22f9n','69.163.33.181',1534908822,'__ci_last_regenerate|i:1534908808;'),
('lotu8jpl3h39ubp1uvisiloftd2ih58q','62.228.182.205',1535118555,'__ci_last_regenerate|i:1535118497;'),
('lp0q84k0ef4navutrdt5dk5eh1c6dtvt','128.0.249.119',1535383441,'__ci_last_regenerate|i:1535383410;'),
('lq6pd21c2j371mqhuc5d7d05ljq4vnk0','192.168.107.37',1610083796,'__ci_last_regenerate|i:1610083796;'),
('lr3oubb96oamihq4lqn4v7mdnsp7u6po','45.56.153.98',1534757744,'__ci_last_regenerate|i:1534757742;'),
('lrf61plhse5i08gdmq7ngia85re2ghd5','64.64.108.243',1534766880,'__ci_last_regenerate|i:1534766880;'),
('lrgh2t0ke9edusmo02m8159ap44gjhbl','45.56.153.186',1535076275,'__ci_last_regenerate|i:1535076275;'),
('lrrf0moaivf6n6952t5ldit1hnc1a1c7','192.168.107.37',1610287915,'__ci_last_regenerate|i:1610287915;'),
('ls95kroid5tapfgsvkpj4n9maafgq4nb','::1',1610071041,'__ci_last_regenerate|i:1610071041;'),
('lv5cfbsciabtn86shnhrq4tb2r3nhbk3','45.56.153.87',1534561297,'__ci_last_regenerate|i:1534561297;'),
('lvum9ek4p8avj2pm0n4f0p5guj1ic4oj','192.168.107.37',1610294419,'__ci_last_regenerate|i:1610294419;'),
('m26eu73kqame79tg738ushd9rdr5gc9d','45.56.153.173',1535540861,'__ci_last_regenerate|i:1535540860;'),
('m2q58jicjve8v825egc40dmsit1h2c2s','64.64.108.211',1535512738,'__ci_last_regenerate|i:1535512731;'),
('m2vg11m27tvjpo9dj196lvneb8eno940','64.64.108.142',1535631735,'__ci_last_regenerate|i:1535631735;'),
('m3in7l472pdamio7qqqf5an1j6l3nifc','62.228.182.205',1535031287,'__ci_last_regenerate|i:1535031287;'),
('m65sbh9aekkbrfik6togdbcl8hjroo8l','192.168.107.37',1610294726,'__ci_last_regenerate|i:1610294726;'),
('m660e8kb5l9suk3viftbmqrjnpsn46ft','64.64.108.142',1535632362,'__ci_last_regenerate|i:1535632323;'),
('m7u2416dlkcm67jdlufj20gjucps64va','45.56.153.80',1535255619,'__ci_last_regenerate|i:1535255619;'),
('m8j9bqjo7kfvrqpinqoqive45ncisp70','45.56.153.80',1535253146,'__ci_last_regenerate|i:1535253146;'),
('mb2offtikcgkm4lc1iquffuoo57tmd1q','45.125.192.211',1534688544,'__ci_last_regenerate|i:1534688544;'),
('mdu9oh0k7um0a8qc79fs2ikdjf0pod23','45.56.153.156',1534805610,'__ci_last_regenerate|i:1534805610;'),
('mffk6ijr44mjhpfcei2begt04s6spc13','192.168.107.37',1610369737,'__ci_last_regenerate|i:1610369737;'),
('mgd4d7s5ge5morf9fk8nqu0407vduaap','45.56.153.173',1535531952,'__ci_last_regenerate|i:1535531952;'),
('mgq1vq16pqajh16ho0vur9p1c4bvoagh','45.56.153.216',1535616569,'__ci_last_regenerate|i:1535616569;'),
('mgqtj7maqi29q1srur332btqug07h7nf','45.56.153.80',1535252764,'__ci_last_regenerate|i:1535252763;'),
('mhaol4rat822jr320uj521sqbg30iaa2','45.56.153.80',1535255721,'__ci_last_regenerate|i:1535255619;'),
('mjoooir1e3r62stoc9i2vbvrl28if3oo','192.168.107.37',1610293489,'__ci_last_regenerate|i:1610293489;'),
('mlnsf9eo0qcig4gobdr1876e2vtiq43s','64.64.108.32',1534799870,'__ci_last_regenerate|i:1534799870;'),
('mmhrkn6qeevllu10vars50mapu4naaps','192.168.107.37',1610371446,'__ci_last_regenerate|i:1610371446;'),
('mqr7hvkus6ffp9e4j7au1ov95rbih90b','45.56.153.74',1535496263,'__ci_last_regenerate|i:1535496263;'),
('mtg11h61c2v6138ujptk103vgpmlal7v','46.199.58.117',1534790311,'__ci_last_regenerate|i:1534790311;'),
('mu56slsrbhbr7o7o7jq7i9bsa9bh3fp7','45.56.153.186',1534928840,'__ci_last_regenerate|i:1534928840;'),
('mvdbmhvfu4elbfn2pi8stg0fulc151b9','192.168.107.37',1610287165,'__ci_last_regenerate|i:1610287165;'),
('n2mjgl0p36qa9cos8jt1sor96ufftii0','106.67.91.195',1534569688,'__ci_last_regenerate|i:1534569686;'),
('n49uk2tm92umaj9o1tm8uo4p4076apd5','45.56.153.87',1534563856,'__ci_last_regenerate|i:1534563822;'),
('n4v9ga1msmbmhirhs8m1rlf001nqkmsc','192.168.107.37',1610254376,'__ci_last_regenerate|i:1610254376;'),
('n5m4aeaa1h02ouk1vsduthv68gcsrv35','45.56.153.87',1534556288,'__ci_last_regenerate|i:1534556288;'),
('n62947h9g0l4i2rq247fatc4r3tro3kt','45.56.153.87',1534560043,'__ci_last_regenerate|i:1534560043;'),
('n7rpfempvn0bn00desgg2kfmpefn12al','45.125.192.211',1534757742,'__ci_last_regenerate|i:1534757742;'),
('naja5mnrf2f51uie2rk56shvhb63ihjm','64.64.108.140',1535546659,'__ci_last_regenerate|i:1535546658;'),
('nbq5qde9e39mc0sq48uaeph2sq2on1ds','91.184.211.126',1535571516,'__ci_last_regenerate|i:1535571516;'),
('ndp9hbrvbkp0560qqblqiftl4dbu04po','192.168.107.37',1610295079,'__ci_last_regenerate|i:1610295079;'),
('nfo242t3djcetp53o09s48nu5rlsijup','91.184.211.126',1535567044,'__ci_last_regenerate|i:1535567044;'),
('nhkpvk2lra1sssjtha9q71v01504ss4q','45.56.153.87',1534558559,'__ci_last_regenerate|i:1534558559;'),
('ni1q0b8n00u93o8lj62677tmoi50rkpl','213.207.135.1',1535578144,'__ci_last_regenerate|i:1535578142;'),
('nigm1ri5e5a9vvlkiuk896itskde1rdj','::1',1610029402,'__ci_last_regenerate|i:1610029402;'),
('njv72tsbbg8ehbej2fu6pi1vqi90dr3m','46.199.50.99',1534925271,'__ci_last_regenerate|i:1534925257;'),
('nkeeudtdhpp69l7dkoqpquu3iqo07ncr','192.168.107.37',1610105692,'__ci_last_regenerate|i:1610105692;'),
('nkildpj03ckehgitgk7527ahgoksd1br','45.125.192.211',1534732607,'__ci_last_regenerate|i:1534732607;'),
('nlp5256knjrti05mg72ekoaubb8fmlaj','212.50.96.83',1535490931,'__ci_last_regenerate|i:1535490931;'),
('nmlubu65cf136bhg2nghbvls1oljn49h','45.56.153.183',1534930972,'__ci_last_regenerate|i:1534930972;'),
('nn2eiscsfl10h4jl90lu45a7s8u7bnd0','128.0.249.119',1535356641,'__ci_last_regenerate|i:1535356641;'),
('nqo0n02b8bk4f1qp8g23uk2lmr5k39tq','45.125.192.211',1534733652,'__ci_last_regenerate|i:1534733652;'),
('nqt2i2h1m6lgb9mk7rftto4u9dg3v9r6','103.47.209.109',1534561904,'__ci_last_regenerate|i:1534561893;'),
('nr1pkplgc3kcldmmf86777bfqnspgfs1','::1',1610065216,'__ci_last_regenerate|i:1610065216;'),
('nsa0vko65eb0afttim95tmddg9m2r7su','64.64.108.70',1535617390,'__ci_last_regenerate|i:1535617390;'),
('o0sgivp7hfq77qbo857rb7ruraff2h2a','64.64.108.32',1534805700,'__ci_last_regenerate|i:1534805700;'),
('o2scanv7tjqno5oned23gaqrg4cat1a3','64.64.108.243',1534774513,'__ci_last_regenerate|i:1534774512;'),
('o6664bkd9lklkgrapkbcd1fq6h2q5bg7','64.64.108.70',1535616155,'__ci_last_regenerate|i:1535616155;'),
('o67cb2gkj557k3bo1cnueo29rdg510no','192.168.107.37',1610294898,'__ci_last_regenerate|i:1610294897;'),
('od54vdd8r2id89skfcleqd74u0i74d8k','64.64.108.142',1534754762,'__ci_last_regenerate|i:1534754762;'),
('oelvea8v5012k6c7lds77bvffv4slgrv','192.168.107.37',1610366404,'__ci_last_regenerate|i:1610366404;'),
('ogjouqt95tfc6jljggm4lpfq9t09phms','42.111.31.42',1535605995,'__ci_last_regenerate|i:1535605993;'),
('ogp0jjt5fbedtejbtov6rpr8r739lfna','45.125.192.211',1534650614,'__ci_last_regenerate|i:1534650614;'),
('oinvvkjh7h1n1qdp7btoq0ohm42vi14o','64.64.108.211',1535525954,'__ci_last_regenerate|i:1535525954;'),
('oiou31hqoobbjmh8skdi4n2fseq8levn','45.125.192.211',1534650862,'__ci_last_regenerate|i:1534650614;'),
('ojuv1ksurjuab40eqf45eb7vd5krb3ou','192.168.107.37',1610294478,'__ci_last_regenerate|i:1610294478;'),
('ol7q8oal1uurt8vj4af2hrr9n7g6a0p7','45.56.153.173',1535528259,'__ci_last_regenerate|i:1535528259;'),
('onndf3dvsdkrh443olvgn0fsu08bsmjh','::1',1609995685,'__ci_last_regenerate|i:1609995389;'),
('ons1nnh60dkqi63chfqb17eosem24im2','62.228.182.205',1534969997,'__ci_last_regenerate|i:1534969997;'),
('oo4g9utlcrcfnln8an4efmv2titf3sqs','192.168.107.37',1610295404,'__ci_last_regenerate|i:1610295393;'),
('osav7n0bvo4gu3gcp5jcl1ro0ulrokqo','45.56.153.67',1535332032,'__ci_last_regenerate|i:1535332032;'),
('ov26egeoe8ednshavf0o6ognb84sjm1m','64.64.108.140',1535545890,'__ci_last_regenerate|i:1535545890;'),
('p03muj1krcsp60tgbv0ob7u42j9vgev6','64.64.108.32',1534805149,'__ci_last_regenerate|i:1534805149;'),
('p57dl88mmokjgse9ovrijmij2pm756mp','46.199.31.85',1534658541,'__ci_last_regenerate|i:1534658540;'),
('p5b52jjh5gio9mu9ipv9il4ruram6u36','46.199.31.85',1534658540,'__ci_last_regenerate|i:1534658540;'),
('p5k636aisgq6t9do3fdu8tm83skqlbne','45.56.153.74',1535497095,'__ci_last_regenerate|i:1535497072;'),
('p6eir44kumr45nehl8ngt062adjg5k6p','::1',1610032274,'__ci_last_regenerate|i:1610032274;'),
('p6kjnc0qkemiepk70an03dek3pvl8nk1','64.64.108.170',1534918206,'__ci_last_regenerate|i:1534918206;'),
('p9j236hr44fc3sqcngp7988pc6bl1grc','45.56.153.156',1534803063,'__ci_last_regenerate|i:1534803063;'),
('pjmsl0c6sahpd5r52e8siukcqscppfie','45.125.192.211',1534735504,'__ci_last_regenerate|i:1534735504;'),
('pk3fn27h9odtlk4uqb27iq2l0a23gmee','192.168.107.37',1610371652,'__ci_last_regenerate|i:1610371652;'),
('pld7a195iujv1jcgpg988do6qtap5qpd','192.168.107.37',1610294909,'__ci_last_regenerate|i:1610294909;'),
('plljfornd72k6j047in8tijsn9sf2bed','64.64.108.140',1535542887,'__ci_last_regenerate|i:1535542887;'),
('pm9ihq6lenn8d59vdbqbf8htji92eok8','45.56.153.216',1535585892,'__ci_last_regenerate|i:1535585892;'),
('ps1qrgadsepgo4qckdgdegtor6l2tjn3','91.184.211.126',1535565379,'__ci_last_regenerate|i:1535565379;'),
('pt8ge41fej9ftob3qsct90c7f1q9q5oh','192.168.107.37',1610366284,'__ci_last_regenerate|i:1610366284;'),
('pv4ppsk6e0994655etpk9jat46kkbn9f','64.64.108.100',1534707464,'__ci_last_regenerate|i:1534707464;'),
('pvr0snofvk1ditgp55ld49cn25tobvts','45.125.192.211',1534736055,'__ci_last_regenerate|i:1534736055;'),
('q28vf5r4j8h4jn0rgbgong9d5e3arbiq','64.64.108.172',1534728973,'__ci_last_regenerate|i:1534728973;'),
('q2mg0rgn88iiqkmatpamile6pto03mg2','64.64.108.100',1534708976,'__ci_last_regenerate|i:1534708976;'),
('q5d895j7n64gdm12nibb94u6jjmv8mco','213.207.135.41',1535359370,'__ci_last_regenerate|i:1535359370;'),
('q5jve9pu9lv2tl1sdg2fatkvkvqcedpq','45.56.153.216',1535579266,'__ci_last_regenerate|i:1535579266;'),
('q69eimi9ajohqq1gt49dm8s28t0d3rpt','192.168.107.37',1610291972,'__ci_last_regenerate|i:1610291972;'),
('qamisqvsv6tjdoehfn5ddlsnakjm7ipe','192.168.107.37',1610284257,'__ci_last_regenerate|i:1610284257;'),
('qcjmvtoflb0vojbjkqbegit33bmbqm6u','128.0.249.119',1535356942,'__ci_last_regenerate|i:1535356942;'),
('qd1bmcbbg6bjuko75qj8nps26abgto20','103.98.32.25',1535462479,'__ci_last_regenerate|i:1535462479;'),
('qd2nfjtd64h8jjn6eq491nooqqbh639s','192.168.107.37',1610293093,'__ci_last_regenerate|i:1610293093;'),
('qfjspdge1u18kki1dordt9nk2s0lj0s1','103.98.32.25',1535111930,'__ci_last_regenerate|i:1535111930;'),
('qgdi5ut2srqkaggvfe0ipvtmbi64cjfh','192.168.107.37',1610286906,'__ci_last_regenerate|i:1610286906;'),
('qhu47vu9nrtoipgth40e4r79dll1h9g7','46.199.62.31',1535573301,'__ci_last_regenerate|i:1535573301;'),
('qkisrjvsmlmrtsod5jvq7efhqqnvctgg','45.125.192.211',1534731310,'__ci_last_regenerate|i:1534731310;'),
('qm12ldqhimmnkfio3bdr8kgqdsoqr157','::1',1610233827,'__ci_last_regenerate|i:1610233818;'),
('qm48t1m69hv63oivrdggvc8aaodse8sj','106.0.59.157',1535275027,'__ci_last_regenerate|i:1535275027;'),
('qmc9g7gj0stmgh5903vfbi8c66aem47q','45.56.153.173',1535532841,'__ci_last_regenerate|i:1535532841;'),
('qqimu48dersdj9r9irmhfr8s8mo5c7cg','45.56.153.67',1535411419,'__ci_last_regenerate|i:1535411419;'),
('qqtagiefeeqnqqa7b65ljli3lmrl59ti','45.125.192.211',1534667826,'__ci_last_regenerate|i:1534667824;'),
('qs4ng977qf6jsnknvbqkoqfoe5ic0l73','45.56.153.173',1535532347,'__ci_last_regenerate|i:1535532347;'),
('qt9brfdsu1efg3hc5a01lg1ro6t7e2ha','192.168.107.37',1610294957,'__ci_last_regenerate|i:1610294957;'),
('qtp84q5l3ql1h69lll2vjv6qkj3bpq9q','45.56.153.173',1535542490,'__ci_last_regenerate|i:1535542490;'),
('qtt2quun218of0f4a27pf5lg7pgc4e67','192.168.107.37',1610291815,'__ci_last_regenerate|i:1610291815;'),
('r11hmfqd92b291bema4pq5it95p5ijkq','45.56.153.216',1535585072,'__ci_last_regenerate|i:1535585071;'),
('r1d091dlae6noqse5irsakt4r665jvkj','::1',1610109564,'__ci_last_regenerate|i:1610109564;'),
('r2s3p2b7c5kd3ou85k3c00j9pvnuh7a6','192.168.107.37',1610292309,'__ci_last_regenerate|i:1610292309;'),
('r49e271ro3ptlh21i0o3i0tte577t8t9','::1',1610147989,'__ci_last_regenerate|i:1610147989;'),
('r51o1qri3pg33j8vbu7ap46915pg64kj','45.56.153.74',1535504409,'__ci_last_regenerate|i:1535504409;'),
('r5r9eck2o64o7ds4aae83fvg7iq1ssi9','192.168.107.37',1610370656,'__ci_last_regenerate|i:1610370655;'),
('r85c9s3g6nl5eknv564pv9i24gpvgi9t','::1',1610062972,'__ci_last_regenerate|i:1610062972;'),
('rbhp84n6g65iv9rslf4eeke48suem01p','64.64.108.100',1534710495,'__ci_last_regenerate|i:1534710495;'),
('rcnjokii4bs9rtjf68sduj64pn5ejt36','45.125.192.211',1534735182,'__ci_last_regenerate|i:1534735182;'),
('re2jg3og3288514ctqbt1011aij6b80i','45.56.153.195',1535023294,'__ci_last_regenerate|i:1535023205;'),
('ricseq3slpq10fn2k6gulna9f04ve5gf','192.168.107.37',1610307681,'__ci_last_regenerate|i:1610307681;'),
('rkbmk2h1i8klssl56ra5upluhrtfnsk2','45.56.153.82',1534904837,'__ci_last_regenerate|i:1534904837;'),
('rm2pfnkv0ii90jhop2e0stk5t99uuodb','64.64.108.211',1535530660,'__ci_last_regenerate|i:1535530660;'),
('rm9cma4lb3jg5rttpbh510oie29chp88','45.125.192.211',1534729012,'__ci_last_regenerate|i:1534729012;'),
('rs68be2s1oebj4dl97a3tjeusa8o39to','45.56.153.216',1535617617,'__ci_last_regenerate|i:1535617617;'),
('rs93sm03t78b8ob5htbleh0emf24h61k','45.56.153.218',1535510076,'__ci_last_regenerate|i:1535510076;'),
('rugci5dk0kiamqmgsgjgp8urk1ml4ohc','45.56.153.67',1535412662,'__ci_last_regenerate|i:1535412592;'),
('rv4v96qsidgr9e648pe3bv8jniqvcc14','64.64.108.142',1535630466,'__ci_last_regenerate|i:1535630466;'),
('s0hrlds0kharbcr87072bmulc652dqgu','45.56.153.216',1535579764,'__ci_last_regenerate|i:1535579764;'),
('s167m6fl5nuqeat7f36g61iso38s4eh3','64.64.108.111',1535630525,'__ci_last_regenerate|i:1535630525;'),
('s1h7icifqm7uqvsthbbdhvu67pvn76p6','212.50.96.83',1535483035,'__ci_last_regenerate|i:1535483035;'),
('s25kq3evucj401ugu8soar5biatm2v6e','192.168.107.37',1610294732,'__ci_last_regenerate|i:1610294732;'),
('s5p52v5lstabmq5d2em0bkat2c6i1qhe','192.168.107.37',1610369702,'__ci_last_regenerate|i:1610369702;'),
('s8f71slj8ov69ippdet5qkp5mfocu3ie','45.125.192.211',1534726917,'__ci_last_regenerate|i:1534726917;'),
('s9jths3jti00m2n5tfcpn9i4f1phup6u','192.168.107.37',1610293590,'__ci_last_regenerate|i:1610293590;'),
('s9ms73q4ujf2emveqt37lcmkigceaq14','64.64.108.142',1534756215,'__ci_last_regenerate|i:1534756206;'),
('sch4gcrjpv2rpiqjbrj1bi5oedkagk99','64.64.108.142',1535629585,'__ci_last_regenerate|i:1535629584;'),
('scvvrf0e0vmblji7am0elqhnfogoohla','64.64.108.142',1535631310,'__ci_last_regenerate|i:1535631309;'),
('seg37iqamvc78s549c2ounofnc8ob50a','45.56.153.173',1535541562,'__ci_last_regenerate|i:1535541562;'),
('sjfrfl0u64q8v99lboqvlubln3e9c9km','64.64.108.161',1535583792,'__ci_last_regenerate|i:1535583792;'),
('so5kf94qu4lp658idop1e5ajkeinm92k','::1',1610290225,'__ci_last_regenerate|i:1610290225;'),
('sops35as73apsqu2f181d4uogl9r5b19','45.56.153.95',1534645906,'__ci_last_regenerate|i:1534645906;'),
('sqecg98oir3no5b69mbir817i7r37mtg','::1',1610030207,'__ci_last_regenerate|i:1610030207;'),
('srb1lhjf0ncsece3lhbpek8109pt4af2','192.168.107.37',1610252484,'__ci_last_regenerate|i:1610252483;'),
('sripig8db4951re44ms7ni3m003aa30i','45.56.153.67',1535335454,'__ci_last_regenerate|i:1535335454;'),
('ss481nod3cjqgha77p31vjam0n413ddn','192.168.107.37',1610083801,'__ci_last_regenerate|i:1610083801;'),
('st631o61p0pamtgjgr06bcgmgvcj6nkn','64.64.108.32',1534800929,'__ci_last_regenerate|i:1534800929;'),
('st84v0i2vmlibubsnckim6j0grhs355c','45.56.153.156',1534806530,'__ci_last_regenerate|i:1534806530;'),
('t1ul4t024o0adfrog12idt84p025f933','::1',1610084411,'__ci_last_regenerate|i:1610084411;'),
('t29ste6gr17158c2ndc4l1nkiqk6e48r','192.168.107.37',1610370011,'__ci_last_regenerate|i:1610370011;'),
('t3a26slq0qn94qpfc608vseb38tq1imh','45.56.153.218',1535511017,'__ci_last_regenerate|i:1535511017;'),
('t3c11kooi4a6h7a9iu4ec8nm3ou3b86d','42.109.196.18',1535543446,'__ci_last_regenerate|i:1535543331;'),
('t3mjro0r2n5ue68asgnk8pjn9vj9da7g','45.56.153.195',1535023205,'__ci_last_regenerate|i:1535023205;'),
('t3th2ieoeavrh0do980jl2gpcndc8hsc','192.168.107.37',1610294028,'__ci_last_regenerate|i:1610294028;'),
('tang8ngm4ai5mn56mk2jpt1vpkv2cruk','45.56.153.147',1535076234,'__ci_last_regenerate|i:1535076234;'),
('tcopc0g5v8kjjshst7o8o9a6ul842c3t','192.168.107.37',1610254984,'__ci_last_regenerate|i:1610254984;'),
('tdp3js3lj6gal7vtk7jo3d20d8pkstuj','192.168.107.37',1610365372,'__ci_last_regenerate|i:1610365371;'),
('te6p50t9pdtj5g5ncsu2h4ike3cqovkb','64.64.108.170',1534929963,'__ci_last_regenerate|i:1534929963;'),
('tetfbtf3tcoj5eea61u434388rns3uuq','45.56.153.186',1535024373,'__ci_last_regenerate|i:1535024373;'),
('tf0jv721nv5u94jg50c8n10jncnoi1bm','45.125.192.211',1534729651,'__ci_last_regenerate|i:1534729651;'),
('tfv6rqf0b4ao9aocjpo8o92ukvjg8hkp','45.56.153.156',1534813479,'__ci_last_regenerate|i:1534813479;'),
('th9pb23poqmep0d208tn5ecd9lh3su93','45.56.153.216',1535615745,'__ci_last_regenerate|i:1535615745;'),
('thjap3rs6o7s61a1auoukctgd7p1ivnd','93.109.175.50',1534752638,'__ci_last_regenerate|i:1534752403;'),
('tj2fnfvgh35kk1g15hrhtsdo0mj3oasv','192.168.107.37',1610364497,'__ci_last_regenerate|i:1610364497;'),
('tkvbqt4ffvl5vmbtccf4l6cegbmc37o0','45.56.153.156',1534807883,'__ci_last_regenerate|i:1534807883;'),
('tlj5i5s3igihv4jn89mil736o0uip7g0','139.208.41.181',1534688170,'__ci_last_regenerate|i:1534688170;'),
('tn7qlbo6f2vuu6vg1363rp4uqt7g9m33','182.239.82.25',1535133446,'__ci_last_regenerate|i:1535133446;'),
('tpptau4lojne1l1tb1r6sbel2lqtbmnb','45.56.153.67',1535340853,'__ci_last_regenerate|i:1535340853;'),
('tpqn7hpprvrgil1nd6215uk7h3qaa81d','103.47.209.109',1534561893,'__ci_last_regenerate|i:1534561893;'),
('ts9b9a7huui3e8r8m26jpe1hc8ogmqe6','192.168.107.37',1610369761,'__ci_last_regenerate|i:1610369761;'),
('tt2d31n9dt0cctvhn2gcj4f7c7pttdfg','45.56.153.67',1535412721,'__ci_last_regenerate|i:1535412719;'),
('u16ompbanttpoag86mdutaojamemti7p','64.64.108.70',1535584162,'__ci_last_regenerate|i:1535584162;'),
('u1qrjnhfgrak9rlnfn6ee6ckuv5bglp3','45.56.153.156',1534767657,'__ci_last_regenerate|i:1534767655;'),
('u3ehmvb1vfog47kuarf3bnhcbko36b29','93.109.175.50',1534766005,'__ci_last_regenerate|i:1534765965;'),
('u5nolle4n1ogb92tubjdp5aol23uucas','192.168.107.37',1610290037,'__ci_last_regenerate|i:1610290037;'),
('u9jp8o2e5dtrtqlnsoqre5cmt20cpsfk','213.207.135.38',1535428524,'__ci_last_regenerate|i:1535428524;'),
('uergu1f1h8t1ucbt9c7m8j5ido9md8r7','192.168.107.37',1610294915,'__ci_last_regenerate|i:1610294915;'),
('ug2in7kp7umjok0di3dg3ad6m93r8mna','93.109.175.50',1534765965,'__ci_last_regenerate|i:1534765965;'),
('uhmphit6vahulrlquarjut5emulanpjp','192.168.107.37',1610294397,'__ci_last_regenerate|i:1610294397;'),
('uiprpm91k4irh0kpl1s5ij80dm71a07s','49.15.79.120',1535363965,'__ci_last_regenerate|i:1535363940;'),
('ulrsi6dgrevu4egejov1dhe6vmi859jb','45.56.153.156',1534801234,'__ci_last_regenerate|i:1534801234;'),
('ur3qhrjuq3bffkdekj145rk85g96q747','::1',1610364934,'__ci_last_regenerate|i:1610364823;'),
('urfu9rvtbunqb2u2dmke2816akivvgak','212.50.96.83',1535482370,'__ci_last_regenerate|i:1535482370;'),
('ut14s90ll4p0au1meacl68k0m4855t7a','45.56.153.74',1535506373,'__ci_last_regenerate|i:1535506373;'),
('utp78ej5e9fmrs05dg7i3ru2dul3k3dv','192.168.107.37',1610369700,'__ci_last_regenerate|i:1610369700;'),
('v09oo7i9g8kr4q2t64lff0octa61ahov','192.168.107.37',1610307631,'__ci_last_regenerate|i:1610307631;'),
('v479r4b3e653k8jbto1c4u40ov04d5bq','192.168.107.37',1610366237,'__ci_last_regenerate|i:1610366237;'),
('v52rt17acff36b5tkg0bbuimh9t720k9','64.64.108.70',1535615824,'__ci_last_regenerate|i:1535615824;'),
('v657je8qus8len455c65j5t7jok6svui','45.56.153.95',1534646472,'__ci_last_regenerate|i:1534646472;'),
('v7nbg1oe5irpqioou12qimso31tgjlv3','103.98.32.25',1535108424,'__ci_last_regenerate|i:1535108424;'),
('v8qjk5c7opr4pm6mjos0ncv1o99to27e','64.64.108.142',1534752558,'__ci_last_regenerate|i:1534752557;'),
('vaptjb1ddeb32lumnvkguv7etj7tldr2','69.163.33.181',1534908808,'__ci_last_regenerate|i:1534908808;'),
('vbqmd7tajkdgt3lv2t8mmkddnmk0ajm5','192.168.107.37',1610292597,'__ci_last_regenerate|i:1610292597;'),
('vj888b3hk748envr07oqneju5iodu092','192.168.107.37',1610294563,'__ci_last_regenerate|i:1610294563;'),
('vkd4jt99psh49pss4rltef4gkh0qg8f6','45.56.153.80',1535267353,'__ci_last_regenerate|i:1535267339;'),
('vkkj6otsu0v1ljpjv4utvgf1vpudfjqu','64.64.108.70',1535616569,'__ci_last_regenerate|i:1535616569;'),
('vo29vo7helda9p7mo36j19ame5p5i7v4','45.56.153.186',1534930972,'__ci_last_regenerate|i:1534930972;'),
('vo49gs0orrdooi3p5bjmh4ohltg99jqk','192.168.107.37',1610291004,'__ci_last_regenerate|i:1610291003;'),
('votm79mfda76cabjl0f21goifsfq4qp9','45.56.153.190',1534688171,'__ci_last_regenerate|i:1534688170;'),
('vpo8utpcm6m3jaon73smkic68m98m0eb','31.153.103.164',1534774957,'__ci_last_regenerate|i:1534774957;'),
('vul8dqanfs662fn19eiea6q9qbbuqj57','45.56.153.80',1535267339,'__ci_last_regenerate|i:1535267339;');

/*Table structure for table `enum_accomplishment` */

DROP TABLE IF EXISTS `enum_accomplishment`;

CREATE TABLE `enum_accomplishment` (
  `accomp_id` int(11) unsigned NOT NULL,
  `accomp_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`accomp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `enum_accomplishment` */

insert  into `enum_accomplishment`(`accomp_id`,`accomp_description`) values 
(1,'Certificate'),
(2,'Organization'),
(4,'Project'),
(8,'Language');

/*Table structure for table `enum_comanysize` */

DROP TABLE IF EXISTS `enum_comanysize`;

CREATE TABLE `enum_comanysize` (
  `size_id` int(11) unsigned NOT NULL,
  `size_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `enum_comanysize` */

insert  into `enum_comanysize`(`size_id`,`size_description`) values 
(1,'1 to 9 Employees'),
(2,'10 to 19 Employees'),
(4,'20 to 49 Employees'),
(8,'50 to 99 Employees'),
(16,'100 to 499 Employees'),
(32,'500 to 999 Employees'),
(64,'1000 to 1499 Employees'),
(128,'1500 to 1999 Employees'),
(256,'2000 to 2499 Employees');

/*Table structure for table `enum_companyuser_type` */

DROP TABLE IF EXISTS `enum_companyuser_type`;

CREATE TABLE `enum_companyuser_type` (
  `companyuser_type` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `companyuser_role` varchar(255) DEFAULT '',
  PRIMARY KEY (`companyuser_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `enum_companyuser_type` */

insert  into `enum_companyuser_type`(`companyuser_type`,`companyuser_role`) values 
(1,'Deny such employ'),
(2,'Verify employee'),
(3,'Verify and give access rights'),
(4,'Report');

/*Table structure for table `enum_educationdegree` */

DROP TABLE IF EXISTS `enum_educationdegree`;

CREATE TABLE `enum_educationdegree` (
  `degree_id` int(11) unsigned NOT NULL,
  `degree_description` varchar(255) DEFAULT NULL,
  `degree_short_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`degree_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `enum_educationdegree` */

insert  into `enum_educationdegree`(`degree_id`,`degree_description`,`degree_short_description`) values 
(1,'Associate of Arts(A.A.)','A.A'),
(2,'Bachelor of Arts(B.A.)','B.A.'),
(4,'Bachelor of Fine Arts(BFA)','BFA'),
(8,'Master of Arts(M.A.)','M.A.'),
(16,'Master of Fine Arts(MFA)','MFA'),
(32,'Associate of Science(A.S.)','A.S.'),
(64,'Bachelor of Science(B.S.)','B.S.'),
(128,'Master of Science(M.S.)','M.S.'),
(256,'Associate of Applied Science(AAS)','AAS'),
(512,'Bachelor of Applied Science(BAS)','BAS'),
(1024,'Master of Business Administration(MBA)','MBA'),
(2048,'Doctor of Philosophy(Ph.D.)','Ph.D.'),
(4096,'Juris Doctor(J.D.)','J.D.'),
(8192,'Doctor of Medicine(M.D.)','M.D.'),
(16384,'Doctor of Dental Surgery(DDS)','DDS');

/*Table structure for table `enum_employmenttype` */

DROP TABLE IF EXISTS `enum_employmenttype`;

CREATE TABLE `enum_employmenttype` (
  `emptype_id` int(11) unsigned NOT NULL,
  `emptype_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`emptype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `enum_employmenttype` */

insert  into `enum_employmenttype`(`emptype_id`,`emptype_description`) values 
(1,'Full Time'),
(2,'Part Time');

/*Table structure for table `enum_industry` */

DROP TABLE IF EXISTS `enum_industry`;

CREATE TABLE `enum_industry` (
  `industry_id` int(11) unsigned NOT NULL,
  `industry_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`industry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `enum_industry` */

insert  into `enum_industry`(`industry_id`,`industry_description`) values 
(1,'Defense & Space'),
(3,'Computer Hardware'),
(4,'Computer Software'),
(5,'Computer Networking'),
(6,'Internet'),
(7,'Semiconductors'),
(8,'Telecommunications'),
(9,'Law Practice'),
(10,'Legal Services'),
(11,'Management Consulting'),
(12,'Biotechnology'),
(13,'Medical Practice'),
(14,'Hospital & Health Care'),
(15,'Pharmaceuticals'),
(16,'Veterinary'),
(17,'Medical Devices'),
(18,'Cosmetics'),
(19,'Apparel & Fashion'),
(20,'Sporting Goods'),
(21,'Tobacco'),
(22,'Supermarkets'),
(23,'Food Production'),
(24,'Consumer Electronics'),
(25,'Consumer Goods'),
(26,'Furniture'),
(27,'Retail'),
(28,'Entertainment'),
(29,'Gambling & Casinos'),
(30,'Leisure, Travel & Tourism'),
(31,'Hospitality'),
(32,'Restaurants'),
(33,'Sports'),
(34,'Food & Beverages'),
(35,'Motion Pictures and Film'),
(36,'Broadcast Media'),
(37,'Museums and Institutions'),
(38,'Fine Art'),
(39,'Performing Arts'),
(40,'Recreational Facilities and Services'),
(41,'Banking'),
(42,'Insurance'),
(43,'Financial Services'),
(44,'Real Estate'),
(45,'Investment Banking'),
(46,'Investment Management'),
(47,'Accounting'),
(48,'Construction'),
(49,'Building Materials'),
(50,'Architecture & Planning'),
(51,'Civil Engineering'),
(52,'Aviation & Aerospace'),
(53,'Automotive'),
(54,'Chemicals'),
(55,'Machinery'),
(56,'Mining & Metals'),
(57,'Oil & Energy'),
(58,'Shipbuilding'),
(59,'Utilities'),
(60,'Textiles'),
(61,'Paper & Forest Products'),
(62,'Railroad Manufacture'),
(63,'Farming'),
(64,'Ranching'),
(65,'Dairy'),
(66,'Fishery'),
(67,'Primary/Secondary Education'),
(68,'Higher Education'),
(69,'Education Management'),
(70,'Research'),
(71,'Military'),
(72,'Legislative Office'),
(73,'Judiciary'),
(74,'International Affairs'),
(75,'Government Administration'),
(76,'Executive Office'),
(77,'Law Enforcement'),
(78,'Public Safety'),
(79,'Public Policy'),
(80,'Marketing and Advertising'),
(81,'Newspapers'),
(82,'Publishing'),
(83,'Printing'),
(84,'Information Services'),
(85,'Libraries'),
(86,'Environmental Services'),
(87,'Package/Freight Delivery'),
(88,'Individual & Family Services'),
(89,'Religious Institutions'),
(90,'Civic & Social Organization'),
(91,'Consumer Services'),
(92,'Transportation/Trucking/Railroad'),
(93,'Warehousing'),
(94,'Airlines/Aviation'),
(95,'Maritime'),
(96,'Information Technology and Services'),
(97,'Market Research'),
(98,'Public Relations and Communications'),
(99,'Design'),
(100,'Non-Profit Organization Management'),
(101,'Fund-Raising'),
(102,'Program Development'),
(103,'Writing and Editing'),
(104,'Staffing and Recruiting'),
(105,'Professional Training & Coaching'),
(106,'Venture Capital & Private Equity'),
(107,'Political Organization'),
(108,'Translation and Localization'),
(109,'Computer Games'),
(110,'Events Services'),
(111,'Arts and Crafts'),
(112,'Electrical/Electronic Manufacturing'),
(113,'Online Media'),
(114,'Nanotechnology'),
(115,'Music'),
(116,'Logistics and Supply Chain'),
(117,'Plastics'),
(118,'Computer & Network Security'),
(119,'Wireless'),
(120,'Alternative Dispute Resolution'),
(121,'Security and Investigations'),
(122,'Facilities Services'),
(123,'Outsourcing/Offshoring'),
(124,'Health, Wellness and Fitness'),
(125,'Alternative Medicine'),
(126,'Media Production'),
(127,'Animation'),
(128,'Commercial Real Estate'),
(129,'Capital Markets'),
(130,'Think Tanks'),
(131,'Philanthropy'),
(132,'E-Learning'),
(133,'Wholesale'),
(134,'Import and Export'),
(135,'Mechanical or Industrial Engineering'),
(136,'Photography'),
(137,'Human Resources'),
(138,'Business Supplies and Equipment'),
(139,'Mental Health Care'),
(140,'Graphic Design'),
(141,'International Trade and Development'),
(142,'Wine and Spirits'),
(143,'Luxury Goods & Jewelry'),
(144,'Renewables & Environment'),
(145,'Glass, Ceramics & Concrete'),
(146,'Packaging and Containers'),
(147,'Industrial Automation'),
(148,'Government Relations');

/*Table structure for table `enum_job_company_seeker_action` */

DROP TABLE IF EXISTS `enum_job_company_seeker_action`;

CREATE TABLE `enum_job_company_seeker_action` (
  `action_id` int(11) unsigned NOT NULL,
  `action_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `enum_job_company_seeker_action` */

insert  into `enum_job_company_seeker_action`(`action_id`,`action_name`) values 
(1,'ignored'),
(2,'saved'),
(3,'shortlisted'),
(4,'reached'),
(5,'deleted');

/*Table structure for table `enum_job_seeker_action` */

DROP TABLE IF EXISTS `enum_job_seeker_action`;

CREATE TABLE `enum_job_seeker_action` (
  `action_id` int(11) unsigned NOT NULL,
  `action_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `enum_job_seeker_action` */

insert  into `enum_job_seeker_action`(`action_id`,`action_name`) values 
(1,'saved'),
(2,'applied'),
(3,'ignored'),
(4,'reached');

/*Table structure for table `enum_proficiency` */

DROP TABLE IF EXISTS `enum_proficiency`;

CREATE TABLE `enum_proficiency` (
  `proficiency_id` int(11) unsigned NOT NULL,
  `proficiency_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`proficiency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `enum_proficiency` */

insert  into `enum_proficiency`(`proficiency_id`,`proficiency_description`) values 
(1,'Elementary'),
(2,'Limited Working'),
(4,'Professional Working'),
(8,'Full Professional'),
(16,'Native or Bilingual');

/*Table structure for table `enum_senioritylevel` */

DROP TABLE IF EXISTS `enum_senioritylevel`;

CREATE TABLE `enum_senioritylevel` (
  `seniority_id` int(11) unsigned NOT NULL,
  `seniority_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`seniority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `enum_senioritylevel` */

insert  into `enum_senioritylevel`(`seniority_id`,`seniority_description`) values 
(1,'A - Entry Level'),
(2,'B - Associate'),
(4,'C - Mid-Senior Level'),
(8,'D - Director'),
(16,'E - Executive');

/*Table structure for table `enum_stages` */

DROP TABLE IF EXISTS `enum_stages`;

CREATE TABLE `enum_stages` (
  `stage_id` int(11) unsigned NOT NULL,
  `stage_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `enum_stages` */

insert  into `enum_stages`(`stage_id`,`stage_description`) values 
(1,'Phone Interview'),
(2,'On-Site Interview'),
(3,'On-Site Presentation'),
(4,'Assignment'),
(5,'Case Interview');

/*Table structure for table `pref_sharelink` */

DROP TABLE IF EXISTS `pref_sharelink`;

CREATE TABLE `pref_sharelink` (
  `sharelink` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`sharelink`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pref_sharelink` */

insert  into `pref_sharelink`(`sharelink`) values 
('http://sharedlink');

/*Table structure for table `pref_version` */

DROP TABLE IF EXISTS `pref_version`;

CREATE TABLE `pref_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ios_version` varchar(10) NOT NULL DEFAULT '',
  `android_version` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `pref_version` */

insert  into `pref_version`(`id`,`ios_version`,`android_version`) values 
(1,'1.0','1.0');

/*Table structure for table `tbl_chat` */

DROP TABLE IF EXISTS `tbl_chat`;

CREATE TABLE `tbl_chat` (
  `chat_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `chat_job` bigint(20) DEFAULT NULL,
  `chat_seeker` bigint(20) DEFAULT NULL,
  `seeker_like` tinyint(1) DEFAULT NULL,
  `companyuser_like` tinyint(1) DEFAULT NULL,
  `chat_room` varchar(255) DEFAULT NULL,
  `chat_createdat` bigint(20) DEFAULT NULL,
  `stageNumber` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_chat` */

insert  into `tbl_chat`(`chat_id`,`chat_job`,`chat_seeker`,`seeker_like`,`companyuser_like`,`chat_room`,`chat_createdat`,`stageNumber`) values 
(2,4,5,NULL,NULL,'j4_s5',NULL,0),
(3,4,1,NULL,NULL,'j4_s1',NULL,0),
(6,3,4,NULL,NULL,'j3_s4',1533264357,1),
(7,1,1,NULL,NULL,'j1_s1',1533265875,0),
(10,5,5,NULL,NULL,'j5_s5',1533572135,0),
(11,6,1,NULL,NULL,'j6_s1',1533575068,0),
(12,4,8,NULL,NULL,'j4_s8',1533752038,0),
(13,5,8,NULL,NULL,'j5_s8',1533752109,0),
(14,4,6,NULL,NULL,'j4_s6',1533753738,0),
(15,6,5,NULL,NULL,'j6_s5',1533753940,0),
(16,11,8,NULL,NULL,'j11_s8',1534238996,0),
(17,5,9,NULL,NULL,'j5_s9',1534258886,0),
(18,10,9,NULL,NULL,'j10_s9',1534305018,0),
(24,12,9,NULL,NULL,'j12_s9',1534729739,2),
(25,3,9,NULL,NULL,'j3_s9',1534735581,3),
(26,13,10,NULL,NULL,'j13_s10',1535112993,0),
(27,12,1,NULL,NULL,'j12_s1',1535279751,0),
(28,33,4,NULL,NULL,'j33_s4',1535490698,0),
(29,7,5,NULL,NULL,'j7_s5',1535490754,0);

/*Table structure for table `tbl_company` */

DROP TABLE IF EXISTS `tbl_company`;

CREATE TABLE `tbl_company` (
  `company_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_size` int(11) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_email` varchar(255) DEFAULT NULL,
  `company_address1` varchar(255) DEFAULT NULL,
  `company_address2` varchar(255) DEFAULT NULL,
  `company_city` varchar(255) DEFAULT NULL,
  `Banned` tinyint(1) DEFAULT NULL,
  `company_logo` varchar(255) DEFAULT NULL,
  `company_profileviews` int(11) NOT NULL DEFAULT '0',
  `company_recommendations` int(11) NOT NULL DEFAULT '0',
  `company_aboutus` text,
  `company_website` varchar(255) DEFAULT NULL,
  `company_yearfound` varchar(4) DEFAULT NULL,
  `company_industry` int(11) DEFAULT NULL,
  `company_createdat` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_company` */

insert  into `tbl_company`(`company_id`,`company_size`,`company_name`,`company_email`,`company_address1`,`company_address2`,`company_city`,`Banned`,`company_logo`,`company_profileviews`,`company_recommendations`,`company_aboutus`,`company_website`,`company_yearfound`,`company_industry`,`company_createdat`) values 
(1,2,'Taixing Software','bigshark0522@gmail.com','235, High Tech and Science Development Zone','Yanji, Jilin, China','Yanji',NULL,'http://localhost:8080/uploadfiles/company/image_test_1610028799.gif',3,1,'We have been working as a recruiter for developing mobile apps.','www.be-reached.com','2017',4,NULL),
(3,2,'Google','google@google.com','engkomi','','nicosia',NULL,'',2,0,'','','',127,NULL),
(4,2,'marios','ms@google.com','1','2','nicosia',NULL,'',0,0,'','','',90,1533540180),
(5,2,'Test Company1','bigshark0522@yahoo.com','235 East Street','Yanji, Jilin, China','Yanji',NULL,NULL,0,0,NULL,NULL,NULL,54,1533547291),
(6,2,'second cup','second@google.com','ba','ba','nicosia',NULL,'',0,0,'','','',65,1533756165),
(7,1,'eVenturers','leorajasekaran@eVenturers.com','yes','ecr main road','pondy',NULL,'',0,0,'','','',4,1533969976),
(8,2,'tech park','techpark@yopmail.com','new address 1','','pune',NULL,'',0,0,'','','',120,1535359550);

/*Table structure for table `tbl_company_recommended` */

DROP TABLE IF EXISTS `tbl_company_recommended`;

CREATE TABLE `tbl_company_recommended` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) DEFAULT NULL,
  `seeker_id` bigint(20) DEFAULT NULL,
  `isRecommended` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_company_recommended` */

insert  into `tbl_company_recommended`(`id`,`company_id`,`seeker_id`,`isRecommended`) values 
(1,1,1,1);

/*Table structure for table `tbl_company_user` */

DROP TABLE IF EXISTS `tbl_company_user`;

CREATE TABLE `tbl_company_user` (
  `companyuser_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `companyuser_company` int(11) DEFAULT NULL,
  `companyuser_personalposition` varchar(255) DEFAULT NULL,
  `companyuser_email` varchar(255) DEFAULT NULL,
  `companyuser_phonenumber` varchar(20) DEFAULT NULL,
  `companyuser_mobilenumber` varchar(20) DEFAULT NULL,
  `companyuser_address1` varchar(255) DEFAULT NULL,
  `companyuser_address2` varchar(255) DEFAULT NULL,
  `companyuser_city` varchar(255) DEFAULT NULL,
  `companyuser_createdat` bigint(20) DEFAULT NULL,
  `companyuser_verified` tinyint(1) DEFAULT NULL COMMENT '0: pending, 1: block, 2: verified. 3: verified and give access, 4: report',
  `fcmtoken` varchar(255) DEFAULT NULL,
  `companyuser_image` varchar(255) DEFAULT NULL,
  `companyuser_facebookid` varchar(255) DEFAULT NULL,
  `companyuser_linkedinid` varchar(255) DEFAULT NULL,
  `companyuser_googleid` varchar(255) DEFAULT NULL,
  `PasswordHash` varchar(255) DEFAULT NULL,
  `Iterations` varchar(255) DEFAULT NULL,
  `Salt` varchar(255) DEFAULT NULL,
  `preferredindustry` int(11) DEFAULT NULL,
  `preferredjobfields` varchar(255) DEFAULT NULL,
  `preferredlocation` varchar(255) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`companyuser_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_company_user` */

insert  into `tbl_company_user`(`companyuser_id`,`companyuser_company`,`companyuser_personalposition`,`companyuser_email`,`companyuser_phonenumber`,`companyuser_mobilenumber`,`companyuser_address1`,`companyuser_address2`,`companyuser_city`,`companyuser_createdat`,`companyuser_verified`,`fcmtoken`,`companyuser_image`,`companyuser_facebookid`,`companyuser_linkedinid`,`companyuser_googleid`,`PasswordHash`,`Iterations`,`Salt`,`preferredindustry`,`preferredjobfields`,`preferredlocation`,`timezone`,`language`) values 
(1,1,'CEO','bigshark0522@gmail.com','86155846401','86154574878','235, High Tech and Science Development Zone','Yanji, Jilin, China','Yanji',1532444758,3,'f88HULmbg_A:APA91bF5uQq_QoCLRUExsbPAVZCJxpF_LACNnPECGXFpFVvaJTidaI9T3uwtHok7MKuvpOuUMS0zm6O-SPJMEfKqIZR-HPPzr1A9KUimtLCDzKmTnncGYTxPrOruDeVJ4KHjw5DExTf-','http://localhost:8080/uploadfiles/company/image_test_1610028799.gif',NULL,NULL,NULL,'bf165feccdac54b03f5ba98b1bc8622c3339aefbfb546eade73d2bb0bfaae2af','3265','_J,cHS>cGsUIds#hoo]2A0!d1Jwv><Qg',4,'','Cyprus','Asia/Shanghai',NULL),
(2,1,'1 part manager','bigshark0522@hotmail.com','25428668','458256865','235, High Tech and Science Development Zone','Yanji, Jilin, China','Yanji',1532507472,2,'','http://18.218.241.173/be-reached/uploadfiles/company/image_test_1532508422.jpg',NULL,NULL,NULL,'2406d6e6fd37e8a9c5add5a852b388a4b0bc86823115367effc39cf734c7bb3b','6756','*E;*KLmZF1aZCHYZd(I^0}9G}TlzAJm3',0,'','Cyprus',NULL,NULL),
(3,3,'HR manager','google@google.com','99326623','99256365','engkomi','','nicosia',1532855512,NULL,'dzvAIj4izFo:APA91bFalIH-9ispiHg53aT3YsBQirD066SZulCzp-D8dQBvbkg3ci_xVNim8EWly7VuPTlpaMM0lKHv1M7PdoeFRvwAVNynWLDmLsln36GbFzxY9FyZtNAKEW39gpLCqeajWR2HjSF0mRo0OUy4jemlgOBEjE-Iew',NULL,NULL,NULL,NULL,'80b09f289da0544a4e357bfbedeafb959ee3feb8ce1c81f358183386cb300057','5807','u*9&2cvx#L3*^@ljM#Yp:^Dk)ni%g!BK',0,'','Cyprus',NULL,NULL),
(4,4,'manager','ms@google.com','258147369','258369147','1','2','nicosia',1533540180,NULL,'cBmKAUiMzrk:APA91bHEMB8r2THHbYlll2LtzBrcJDfMjfyxm_buGgr1P3RMph5-HIwcawy4v9FozKR_-xR0YaZdYqa0WGAFuQ0i-6R4_57au_od0bXilURKg_aXbjC3AyJrPNR-Y2O2NhNQJN4Ihj2mRa2IGi_78zupQKjbPhKZYg',NULL,NULL,NULL,NULL,'60a1f06ab23a750c27361ee4b8e51f28d4143d605fc9a80907167166a6aa70bb','5675','Ja6]nzfWHGY4ZNii0e?4BX,I&({VYx8k',0,'','Cyprus',NULL,NULL),
(5,6,'x','second@google.com','222222','22222','ba','ba','nicosia',1533756165,NULL,'dzvAIj4izFo:APA91bFalIH-9ispiHg53aT3YsBQirD066SZulCzp-D8dQBvbkg3ci_xVNim8EWly7VuPTlpaMM0lKHv1M7PdoeFRvwAVNynWLDmLsln36GbFzxY9FyZtNAKEW39gpLCqeajWR2HjSF0mRo0OUy4jemlgOBEjE-Iew',NULL,NULL,NULL,NULL,'7962afcadcc9cbbe0d68f41ef4908a5d4f1ee39cf65f5ba0237dc0d27e865d53','4537','LtMYY[Cm/m3!Hnpm,Oe$4zPrRvHu*4?v',94,'text','Egkomi',NULL,NULL),
(6,1,'Hr manager','bigshark0522@yahoo.com','17854218548','28545286599','235, High Tech and Science Development Zone','Yanji, Jilin, China','Yanji',1533872357,NULL,'dJRGXIQdI8Y:APA91bGZMhahqaMeJNLoxO88IzaPpwd70nqNixpPv1epbSviR0WJ3TxIsEjPkhcaJIT6w1umiI-M3_AfAnm7J9fLddLiK5nw_Kib2DDdL8NpQYMyWnPww-fGbx-ahgYUubS6CiNd9TjHU8oHpOIpzh5LyX0GMJ-z7Q',NULL,NULL,NULL,NULL,'9a307b9d494babf38884e46989d7aea1e09261e17bff058d320c84380a1360f9','5675','7Cd<!MDnMt{YVzzS!B4><hqrL6<E%6/<',0,'','Cyprus',NULL,NULL),
(7,7,'Developer','leorajasekaran@eVenturers.com','9894141108','9894141108','yes','ecr main road','pondy',1533969977,NULL,'ey8aLhbnJWg:APA91bGWY_i4n2s4avE2frlJG9EPf5VrtLW8OxKkHTOi8KIw3eNen1fqWWpGlSA0dBmyMxMck_RcI2sMe-gyX5DBLV53hqNTgSQsTrHrhq3yoTtAQuS5z4LUZ1R2bHrN-K2n02PWMKbGbxJ-S3bBh5xjs5uMQqFRFQ',NULL,NULL,NULL,NULL,'9898df028503405901e1eab0b2bc8750361a43cf3661837345fd1ed54410fc2b','5817','^w7vC7iIU.hMA:Vu^AU$PX[ImKHErd?9',4,'','pondy',NULL,NULL),
(8,7,'HR','eventurers.php@gmail.com','32165488','852468400','yes','ecr main road','pondy',1535106676,NULL,'ec5piPuIqkA:APA91bH56zqqxsacPRa0Y5wWW8PaZ2aC0jfljCS_Dl1XTrJwM9eXExvx6JY_ZXKZ2_XVa1GP7iB2fNa_zK3Dy9z6jwxM-eSJoZYdkB0EQUpAwovmS6Gayz_6IKkj4o344yVaeHYk60-y',NULL,NULL,NULL,NULL,'d569d5e601dc1fba2b0a635b9daae17ee3c4380ab154a22695520327967d6210','5534','o_sALaA+^i)xxrC?oGVj#]<*]^*OvU7U',50,'hey','Cyprus',NULL,NULL),
(9,8,'MD','techpark@yopmail.com','8563207088','8654782068','new address 1','','pune',1535359551,NULL,'ec5piPuIqkA:APA91bH56zqqxsacPRa0Y5wWW8PaZ2aC0jfljCS_Dl1XTrJwM9eXExvx6JY_ZXKZ2_XVa1GP7iB2fNa_zK3Dy9z6jwxM-eSJoZYdkB0EQUpAwovmS6Gayz_6IKkj4o344yVaeHYk60-y',NULL,NULL,NULL,NULL,'b7768ab5c9092827c2aad696f26e7c0be511a92280a5acc939bfba116cfdc5ff','7215','+Dn).T11vYAg(N+!:8XBt[pf0IGbEkEs',0,'','pune',NULL,NULL);

/*Table structure for table `tbl_company_viewed` */

DROP TABLE IF EXISTS `tbl_company_viewed`;

CREATE TABLE `tbl_company_viewed` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) DEFAULT NULL,
  `seeker_id` bigint(20) DEFAULT NULL,
  `isViewed` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_company_viewed` */

insert  into `tbl_company_viewed`(`id`,`company_id`,`seeker_id`,`isViewed`) values 
(1,1,7,1),
(2,3,7,1),
(3,1,9,1),
(4,3,9,1),
(5,0,1,1),
(6,1,1,1);

/*Table structure for table `tbl_job` */

DROP TABLE IF EXISTS `tbl_job`;

CREATE TABLE `tbl_job` (
  `job_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `job_companyuser` bigint(20) DEFAULT NULL,
  `job_location` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `job_level` int(11) DEFAULT NULL,
  `job_skills` varchar(255) DEFAULT NULL,
  `job_employmenttype` tinyint(4) DEFAULT NULL,
  `job_yearsofexperience` int(11) DEFAULT NULL,
  `job_stages` bigint(11) DEFAULT NULL,
  `job_description` varchar(512) DEFAULT NULL,
  `job_createdat` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_job` */

insert  into `tbl_job`(`job_id`,`job_companyuser`,`job_location`,`job_title`,`job_level`,`job_skills`,`job_employmenttype`,`job_yearsofexperience`,`job_stages`,`job_description`,`job_createdat`) values 
(1,1,'Yanji, Jilin, China','App Development',1,'iOS, Android',2,1,125,'App has 2 side users, company and seekers.\nSeekers are able to find jobs with skills, location and industry',1532503920),
(2,2,'Hunchun','Android app developer',2,'java, android',1,2,135,'Android app with gps location tracking and has many services',1532508707),
(3,1,'Yanji, Jilin, China','iPhone App Development',2,'iOS App Development, Swift',2,1,12345,'iOS app with location services and google map search functions.',1532508852),
(4,3,'Nicosia','Alex Test',1,'Java',2,10,1,'Test',1533230560),
(5,3,'Marios','Marios',2,'Test',2,25,3,'Test',1533231315),
(6,3,'protaras','protaras',4,'protaras',1,1514,2,'Protaras',1533332112),
(7,4,'Nicosia','Sales Executive',2,'Sales',1,2,12,'Great opportunity',1533540297),
(9,3,'engkomi','second cup',2,'barista',2,0,1,'Coffee',1533756028),
(10,6,'Cyprus','GPS tracking app',2,'app developer, tester',2,0,134,'App working with locations and real time networking',1533872902),
(11,3,'paphos','waiter',2,'waiting skills, bartending',2,1,12,'Waiting',1534238842),
(12,1,'延吉','软件开发',4,'Software development',1,3,25,'开发',1534497443),
(13,8,'hey','new job',8,'c c',2,2147483647,3,'Job description',1535106967),
(14,8,'hey','new job',8,'c c',2,2,3,'Job description',1535106977),
(15,8,'hey','new job',8,'c c',2,2,3,'Job description',1535106985),
(16,8,'hey','hey',16,'c',2,0,4,'Tes',1535107030),
(17,8,'hey','hey',16,'c',2,0,4,'Tes',1535107182),
(18,8,'hey','hey',16,'c',2,0,4,'Tes',1535107189),
(19,4,'nicosia','Sales test',1,'none',1,2580,12,'No description available',1535483412),
(20,4,'nicosia','Sales test',1,'none',1,2580,12,'No description available',1535483414),
(21,4,'nicosia','Sales test',1,'none',1,2580,12,'No description available',1535483417),
(22,4,'nicosia','Sales test',1,'none',1,2580,12,'No description available',1535483417),
(23,4,'nicosia','Sales test',1,'none',1,2580,12,'No description available',1535483418),
(24,4,'nicosia','Sales test',1,'none',1,2580,12,'No description available',1535483418),
(25,4,'nicosia','Sales test',1,'none',1,2580,12,'No description available',1535483419),
(26,4,'nicosia','Sales test',1,'none',1,2580,12,'No description available',1535483419),
(27,4,'nicosia','Sales test',1,'none',1,2580,12,'No description available',1535483420),
(28,4,'nicosia','Sales test',1,'none',1,2580,12,'No description available',1535483421),
(29,4,'nicosia','Sales test',1,'none',1,2580,12,'No description available',1535483438),
(30,4,'nicosia','Sales test',1,'none',1,2580,12,'No description available',1535483439),
(31,4,'nicosia','Sales test',1,'none',1,2580,12,'No description available',1535483443),
(32,4,'nicosia','Sales test',1,'none',1,2580,12,'No description available',1535484488),
(33,4,'nicosia','Sales test',1,'none',1,2580,12,'No description available',1535484490);

/*Table structure for table `tbl_job_draft` */

DROP TABLE IF EXISTS `tbl_job_draft`;

CREATE TABLE `tbl_job_draft` (
  `job_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `job_companyuser` bigint(20) DEFAULT NULL,
  `job_location` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `job_level` int(11) DEFAULT NULL,
  `job_skills` varchar(255) DEFAULT NULL,
  `job_employmenttype` tinyint(4) DEFAULT NULL,
  `job_yearsofexperience` int(11) DEFAULT NULL,
  `job_stages` bigint(11) DEFAULT NULL,
  `job_description` varchar(512) DEFAULT NULL,
  `job_createdat` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_job_draft` */

/*Table structure for table `tbl_job_seekeraction` */

DROP TABLE IF EXISTS `tbl_job_seekeraction`;

CREATE TABLE `tbl_job_seekeraction` (
  `action_seeker` bigint(20) NOT NULL,
  `action_job` bigint(20) DEFAULT NULL,
  `action_status` tinyint(1) DEFAULT NULL,
  `action_timestamp` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_job_seekeraction` */

insert  into `tbl_job_seekeraction`(`action_seeker`,`action_job`,`action_status`,`action_timestamp`) values 
(4,3,4,1533209994),
(5,4,2,1533230763),
(5,3,2,1533230768),
(5,2,2,1533230771),
(5,1,2,1533230776),
(5,5,4,1533572135),
(1,3,2,1533260259),
(1,1,4,NULL),
(1,5,3,1533264098),
(1,4,2,1533738357),
(1,2,2,1533264174),
(5,6,4,1533753940),
(1,6,4,1533575068),
(5,7,4,1535490754),
(6,7,3,1533582916),
(6,6,1,1533580146),
(6,5,1,1533580148),
(6,4,4,1533753738),
(6,3,3,1533668712),
(6,2,3,1533668743),
(6,1,3,1533673374),
(8,7,2,1533751937),
(8,6,2,1533751947),
(8,5,4,1533752109),
(8,4,4,1533752038),
(8,3,2,1533751961),
(8,2,2,1533751966),
(5,9,3,1533760437),
(8,9,1,1533763499),
(8,1,1,1533763500),
(8,11,4,1534238996),
(8,10,2,1534238939),
(9,11,1,1534258246),
(9,9,3,1534258263),
(9,7,1,1534258265),
(9,6,3,1534258273),
(9,5,4,1534258886),
(9,3,4,1534735581),
(9,1,2,1534258316),
(9,10,4,1534305018),
(9,4,2,1534258340),
(9,2,3,1534258420),
(9,12,4,1534729739),
(5,12,1,1534610047),
(5,11,1,1534610051),
(10,18,3,1535107361),
(10,17,3,1535107375),
(10,16,2,1535107379),
(10,15,2,1535107383),
(10,13,4,1535112993),
(5,18,2,1535118530),
(5,17,1,1535118555),
(7,18,3,1535255198),
(7,17,1,1535255202),
(7,16,3,1535255215),
(7,15,3,1535255219),
(7,14,3,1535255264),
(7,13,2,1535255275),
(7,12,2,1535255297),
(7,11,1,1535255357),
(7,10,1,1535255383),
(7,9,3,1535255386),
(7,7,1,1535255390),
(7,6,3,1535255400),
(7,5,2,1535255409),
(7,4,3,1535255414),
(7,3,2,1535255425),
(7,2,2,1535255595),
(7,1,2,1535255607),
(1,12,4,1535279751),
(5,16,3,1535441779),
(5,15,3,1535441780),
(5,14,2,1535441784),
(5,13,1,1535441786),
(5,10,3,1535484136),
(4,33,4,1535490698),
(9,33,3,1535530660),
(9,32,3,1535579690);

/*Table structure for table `tbl_job_stages` */

DROP TABLE IF EXISTS `tbl_job_stages`;

CREATE TABLE `tbl_job_stages` (
  `job_stage_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `job_stage_job` bigint(20) DEFAULT NULL,
  `job_stage_number` int(11) DEFAULT NULL,
  `job_stage_stage` int(11) DEFAULT NULL,
  PRIMARY KEY (`job_stage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_job_stages` */

insert  into `tbl_job_stages`(`job_stage_id`,`job_stage_job`,`job_stage_number`,`job_stage_stage`) values 
(4,1,0,1),
(5,6,0,2),
(6,5,0,3),
(7,4,0,1),
(8,11,0,1),
(9,12,0,2),
(10,3,0,1),
(11,12,1,5),
(12,3,1,2),
(13,3,2,3);

/*Table structure for table `tbl_letter` */

DROP TABLE IF EXISTS `tbl_letter`;

CREATE TABLE `tbl_letter` (
  `letter_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `letter_job` bigint(20) DEFAULT NULL,
  `letter_seeker` bigint(20) DEFAULT NULL,
  `letter_startdate` bigint(20) DEFAULT NULL,
  `letter_salary` int(11) DEFAULT NULL,
  `letter_message` text,
  `letter_type` tinyint(1) DEFAULT NULL COMMENT '1: offer letter, 2: rejection letter',
  `letter_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: pending, 1: accepted, 2: declined',
  PRIMARY KEY (`letter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_letter` */

/*Table structure for table `tbl_notification` */

DROP TABLE IF EXISTS `tbl_notification`;

CREATE TABLE `tbl_notification` (
  `notification_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `notification_type` tinyint(2) DEFAULT NULL,
  `notification_seeker` bigint(20) DEFAULT NULL,
  `notification_companyuser` bigint(20) DEFAULT NULL,
  `notification_job` bigint(20) DEFAULT NULL,
  `notification_read` tinyint(1) DEFAULT NULL,
  `notification_message` varchar(255) DEFAULT NULL,
  `notification_title` varchar(255) DEFAULT NULL,
  `notification_timestamp` bigint(20) DEFAULT NULL,
  `notification_chat` bigint(20) DEFAULT NULL,
  `notification_schedule` bigint(20) DEFAULT NULL,
  `notification_letter` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_notification` */

insert  into `tbl_notification`(`notification_id`,`notification_type`,`notification_seeker`,`notification_companyuser`,`notification_job`,`notification_read`,`notification_message`,`notification_title`,`notification_timestamp`,`notification_chat`,`notification_schedule`,`notification_letter`) values 
(7,5,0,5,0,0,'Thank you for signing up with be-reached! Please complete your profile and verify your email.','Be-reached',1533756165,NULL,NULL,NULL),
(8,5,0,6,0,1,'Thank you for signing up with be-reached! Please complete your profile and verify your email.','Be-reached',1533872357,NULL,NULL,NULL),
(9,5,0,7,0,0,'Thank you for signing up with be-reached! Please complete your profile and verify your email.','Be-reached',1533969977,NULL,NULL,NULL),
(13,7,7,1,1,1,'主贤 全 is interested in your job App Development','Be-reached',1534021890,NULL,NULL,NULL),
(14,7,8,3,11,0,'kotsios x is interested in your job waiter','Be-reached',1534238927,NULL,NULL,NULL),
(15,7,8,6,10,1,'kotsios x is interested in your job GPS tracking app','Be-reached',1534238939,NULL,NULL,NULL),
(18,7,9,3,5,0,'Sin Zhehe is interested in your job Marios','Be-reached',1534258285,NULL,NULL,NULL),
(21,7,9,3,4,0,'Sin Zhehe is interested in your job Alex Test','Be-reached',1534258340,NULL,NULL,NULL),
(32,9,9,1,12,1,'Sin Zhehe is interested in your job 软件开发','Be-reached',1534510269,NULL,NULL,NULL),
(38,3,9,1,0,1,'You added Sin Zhehe to the saved seeker list.','Be-reached',1534512350,NULL,NULL,NULL),
(42,5,9,1,12,1,'You added Sin Zhehe to the shortlisted seeker list.','Be-reached',1534543938,NULL,NULL,NULL),
(44,5,7,1,1,1,'You added 主贤 全 to the shortlisted seeker list.','Be-reached',1534545316,NULL,NULL,NULL),
(47,5,9,1,12,1,'You added Sin Zhehe to the shortlisted seeker list.','Be-reached',1534650773,NULL,NULL,NULL),
(58,10,9,1,12,1,'Congratulations! Taixing Software hired you 软件开发','New Job Reach Alert',1534729739,24,NULL,NULL),
(59,19,9,1,12,1,'You created a chat with Sin Zhehe for the 软件开发','New Chat Created!',1534729740,24,NULL,NULL),
(60,10,9,1,3,1,'Congratulations! Taixing Software hired you iPhone App Development','New Job Reach Alert',1534735581,25,NULL,NULL),
(61,19,9,1,3,1,'You created a chat with Sin Zhehe for the iPhone App Development','New Chat Created!',1534735582,25,NULL,NULL),
(62,5,9,1,1,1,'You added Sin Zhehe to the shortlisted seeker list.','Be-reached',1534754102,NULL,NULL,NULL),
(63,1,0,8,0,0,'Thank you for signing up with be-reached! Please complete your profile and verify your email.','Be-reached',1535106676,NULL,NULL,NULL),
(64,7,0,NULL,NULL,0,'  is interested in your job ','Be-reached',1535106967,NULL,NULL,NULL),
(65,7,0,NULL,NULL,0,'  is interested in your job ','Be-reached',1535106977,NULL,NULL,NULL),
(66,7,0,NULL,NULL,0,'  is interested in your job ','Be-reached',1535106985,NULL,NULL,NULL),
(67,7,0,NULL,NULL,0,'  is interested in your job ','Be-reached',1535107030,NULL,NULL,NULL),
(68,7,0,NULL,NULL,0,'  is interested in your job ','Be-reached',1535107182,NULL,NULL,NULL),
(69,7,0,NULL,NULL,0,'  is interested in your job ','Be-reached',1535107189,NULL,NULL,NULL),
(70,3,1,8,0,1,'You added Zhuxian Quan to the saved seeker list.','Be-reached',1535107222,NULL,NULL,NULL),
(71,2,10,0,0,0,'Thank you for signing up with be-reached! Please complete your profile and verify your email.','Be-reached',1535107310,NULL,NULL,NULL),
(72,2,10,0,0,0,'Thank you for signing up with be-reached! Please complete your profile and verify your email.','Be-reached',1535107311,NULL,NULL,NULL),
(73,9,10,8,16,0,'Ev Ev is interested in your job hey','Be-reached',1535107379,NULL,NULL,NULL),
(74,9,10,8,15,0,'Ev Ev is interested in your job new job','Be-reached',1535107383,NULL,NULL,NULL),
(75,9,10,8,13,0,'Ev Ev is interested in your job new job','Be-reached',1535107393,NULL,NULL,NULL),
(76,5,10,8,15,1,'You added Ev Ev to the shortlisted seeker list.','Be-reached',1535107618,NULL,NULL,NULL),
(77,10,10,8,13,0,'Congratulations! eVenturers hired you new job','New Job Reach Alert',1535112993,26,NULL,NULL),
(78,19,10,8,13,0,'You created a chat with Ev Ev for the new job','New Chat Created!',1535112995,26,NULL,NULL),
(79,9,5,8,18,0,'Marios S is interested in your job hey','Be-reached',1535118530,NULL,NULL,NULL),
(80,9,7,8,13,0,'主贤 全 is interested in your job new job','Be-reached',1535255275,NULL,NULL,NULL),
(81,9,7,1,12,1,'主贤 全 is interested in your job 软件开发','Be-reached',1535255297,NULL,NULL,NULL),
(82,9,7,3,5,0,'主贤 全 is interested in your job Marios','Interested',1535255409,NULL,NULL,NULL),
(83,9,7,1,3,1,'主贤 全 is interested in your job iPhone App Development','Interested',1535255425,NULL,NULL,NULL),
(84,9,7,2,2,0,'主贤 全 and 3 users are interested in \'Android app developer\'','Interested',1535255595,NULL,NULL,NULL),
(85,9,7,1,1,1,'主贤 全 and 2 users are interested in \'App Development\'','Interested',1535255607,NULL,NULL,NULL),
(86,3,6,1,0,1,'You added alex alex to the saved seeker list.','Be-reached',1535279698,NULL,NULL,NULL),
(87,10,1,1,12,1,'Congratulations! Taixing Software hired you 软件开发','New Job Reach Alert',1535279751,27,NULL,NULL),
(88,19,1,1,12,1,'You created a chat with Zhuxian Quan for the 软件开发','New Chat Created!',1535279752,27,NULL,NULL),
(89,5,7,1,12,1,'主贤 全 is shortlisted in \'软件开发\'','Shortlisted',1535333544,NULL,NULL,NULL),
(90,1,0,9,0,0,'Thank you for signing up with be-reached! Please complete your profile and verify your email.','Be-reached',1535359551,NULL,NULL,NULL),
(91,9,5,8,14,0,'Marios S is interested in \'new job\'','Interested',1535441784,NULL,NULL,NULL),
(92,7,0,NULL,NULL,0,'  is interested in your job ','Be-reached',1535483412,NULL,NULL,NULL),
(93,7,0,NULL,NULL,0,'  is interested in your job ','Be-reached',1535483414,NULL,NULL,NULL),
(94,7,0,NULL,NULL,0,'  is interested in your job ','Be-reached',1535483417,NULL,NULL,NULL),
(95,7,0,NULL,NULL,0,'  is interested in your job ','Be-reached',1535483417,NULL,NULL,NULL),
(96,7,0,NULL,NULL,0,'  is interested in your job ','Be-reached',1535483418,NULL,NULL,NULL),
(97,7,0,NULL,NULL,0,'  is interested in your job ','Be-reached',1535483418,NULL,NULL,NULL),
(98,7,0,NULL,NULL,0,'  is interested in your job ','Be-reached',1535483419,NULL,NULL,NULL),
(99,7,0,NULL,NULL,0,'  is interested in your job ','Be-reached',1535483420,NULL,NULL,NULL),
(100,7,0,NULL,NULL,0,'  is interested in your job ','Be-reached',1535483420,NULL,NULL,NULL),
(101,7,0,NULL,NULL,0,'  is interested in your job ','Be-reached',1535483421,NULL,NULL,NULL),
(102,7,0,NULL,NULL,0,'  is interested in your job ','Be-reached',1535483438,NULL,NULL,NULL),
(103,7,0,NULL,NULL,0,'  is interested in your job ','Be-reached',1535483439,NULL,NULL,NULL),
(104,7,0,NULL,NULL,0,'  is interested in your job ','Be-reached',1535483443,NULL,NULL,NULL),
(105,7,0,NULL,NULL,0,'  is interested in your job ','Be-reached',1535484488,NULL,NULL,NULL),
(106,7,0,NULL,NULL,0,'  is interested in your job ','Be-reached',1535484490,NULL,NULL,NULL),
(107,10,4,4,33,0,'Congratulations! marios hired you Sales test','New Job Reach Alert',1535490698,28,NULL,NULL),
(108,19,4,4,33,1,'You have reached Marios Sarpetsas Take you to chat with the Marios Sarpetsas.','Reached',1535490699,28,NULL,NULL),
(109,10,5,4,7,0,'Congratulations! marios hired you Sales Executive','New Job Reach Alert',1535490754,29,NULL,NULL),
(110,19,5,4,7,0,'You have reached Marios S Take you to chat with the Marios S.','Reached',1535490755,29,NULL,NULL),
(111,5,8,4,7,1,'kotsios x is shortlisted in \'Sales Executive\'','Shortlisted',1535490965,NULL,NULL,NULL),
(115,12,9,1,12,0,'Taixing Software created a schedule: Wed 29 Aug 07:30 PM.','Schedule!',1535541039,NULL,13,NULL),
(116,13,9,1,12,0,'You created a schedule: Wed 29 Aug 07:30 PM for Sin Zhehe','Schedule Set',1535541039,NULL,13,NULL),
(117,11,9,1,12,0,'You created a stage for Sin Zhehe in job 软件开发','Stage has been updated',1535541041,NULL,13,NULL),
(118,12,9,1,3,0,'Taixing Software created a schedule: Wed 29 Aug 08:00 PM.','Schedule!',1535541605,NULL,14,NULL),
(119,13,9,1,3,0,'You created a schedule: Wed 29 Aug 08:00 PM for Sin Zhehe','Schedule Set',1535541605,NULL,14,NULL),
(120,11,9,1,3,0,'You created a stage for Sin Zhehe in job iPhone App Development','Stage has been updated',1535541606,NULL,14,NULL),
(127,18,9,1,12,0,'Stage advaced','Stage advaced',1535579301,NULL,13,NULL),
(128,18,9,1,3,0,'Stage advaced','Stage advaced',1535579764,NULL,14,NULL),
(129,12,9,1,12,0,'Taixing Software created a schedule: Thu 30 Aug 06:30 AM.','Schedule!',1535581206,NULL,15,NULL),
(148,22,9,1,12,0,'Taixing Software rescheduled: Thu 30 Aug 09:30 AM for you','Reschedule Set',1535586574,NULL,15,NULL),
(149,15,9,1,12,0,'You rescheduled: Thu 30 Aug 09:00 AM for Sin Zhehe','Reschedule Set',1535586575,NULL,15,NULL),
(150,22,9,1,12,0,'Taixing Software rescheduled: Thu 30 Aug 04:30 PM for you','Reschedule Set',1535615782,NULL,15,NULL),
(151,15,9,1,12,0,'You rescheduled: Thu 30 Aug 04:00 PM for Sin Zhehe','Reschedule Set',1535615783,NULL,15,NULL),
(152,18,9,1,12,0,'You have been advanced to Case Interview for 软件开发','Advanced candidate',1535617326,NULL,15,NULL),
(153,17,9,1,12,0,'Sin Zhehe has advanced to Case Interview for 软件开发','Advanced candidate',1535617328,NULL,15,NULL),
(154,12,9,1,3,0,'Taixing Software created a schedule: Thu 30 Aug 08:30 PM.','Schedule!',1535630158,NULL,16,NULL),
(155,13,9,1,3,0,'You created a schedule: Thu 30 Aug 08:00 PM for Sin Zhehe','Schedule Set',1535630160,NULL,16,NULL),
(156,11,9,1,3,0,'You created a stage for Sin Zhehe in job iPhone App Development','Stage has been updated',1535630161,NULL,16,NULL),
(157,18,9,1,3,0,'You have been advanced to On-Site Interview for iPhone App Development','Advanced candidate',1535630466,NULL,16,NULL),
(158,17,9,1,3,0,'Sin Zhehe has advanced to On-Site Interview for iPhone App Development','Advanced candidate',1535630467,NULL,16,NULL),
(159,12,9,1,3,0,'Taixing Software created a schedule: Thu 30 Aug 11:00 PM.','Schedule!',1535631368,NULL,17,NULL),
(160,13,9,1,3,0,'You created a schedule: Thu 30 Aug 10:30 PM for Sin Zhehe','Schedule Set',1535631370,NULL,17,NULL),
(161,11,9,1,3,0,'You created a stage for Sin Zhehe in job iPhone App Development','Stage has been updated',1535631371,NULL,17,NULL),
(162,18,9,1,3,0,'You have been advanced to On-Site Presentation for iPhone App Development','Advanced candidate',1535631481,NULL,17,NULL),
(163,17,9,1,3,0,'Sin Zhehe has advanced to On-Site Presentation for iPhone App Development','Advanced candidate',1535631482,NULL,17,NULL);

/*Table structure for table `tbl_schedule` */

DROP TABLE IF EXISTS `tbl_schedule`;

CREATE TABLE `tbl_schedule` (
  `schedule_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `schedule_seeker` bigint(20) DEFAULT NULL,
  `schedule_job_stage` bigint(20) DEFAULT NULL,
  `schedule_startdate` bigint(20) DEFAULT NULL,
  `schedule_enddate` bigint(20) DEFAULT NULL,
  `schedule_review` text,
  `schedule_rating` float DEFAULT NULL,
  `schedule_status` tinyint(11) DEFAULT NULL COMMENT '0, null - pending, \\n1: completed \n2: stopped, 3: offered',
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_schedule` */

insert  into `tbl_schedule`(`schedule_id`,`schedule_seeker`,`schedule_job_stage`,`schedule_startdate`,`schedule_enddate`,`schedule_review`,`schedule_rating`,`schedule_status`) values 
(4,1,4,1535763600,1535774400,NULL,NULL,NULL),
(5,5,5,1534236300,1534236300,NULL,NULL,NULL),
(6,8,6,1534149000,1534149900,NULL,NULL,NULL),
(7,6,7,1534081500,1534081500,NULL,NULL,NULL),
(8,8,8,1534498234,1534500000,NULL,NULL,NULL),
(13,9,9,1535542200,1535549400,'Seems good',9,1),
(14,9,10,1535544000,1535547600,'Great experience',10,1),
(15,9,11,1535616000,1535623200,'Perfect, OK!',10,1),
(16,9,12,1535630400,1535634000,'Great interview! Perfect!',9,1),
(17,9,13,1535639414,1535644800,'Good action.\nHighly recommended!',10,1);

/*Table structure for table `tbl_seeker` */

DROP TABLE IF EXISTS `tbl_seeker`;

CREATE TABLE `tbl_seeker` (
  `seeker_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `seeker_profileimage` varchar(255) DEFAULT NULL,
  `seeker_firstname` varchar(255) DEFAULT NULL,
  `seeker_surname` varchar(255) DEFAULT NULL,
  `seeker_age` int(3) DEFAULT NULL,
  `seeker_email` varchar(255) DEFAULT NULL,
  `seeker_profileemail` varchar(255) DEFAULT NULL,
  `seeker_title` varchar(255) NOT NULL DEFAULT 'Seeking job',
  `seeker_phonenumber` varchar(255) DEFAULT NULL,
  `seeker_address1` varchar(255) DEFAULT NULL,
  `seeker_address2` varchar(255) DEFAULT NULL,
  `seeker_city` varchar(255) DEFAULT NULL,
  `seeker_website` varchar(255) DEFAULT NULL,
  `seeker_profileviews` int(11) NOT NULL DEFAULT '0',
  `seeker_recommendations` int(11) NOT NULL DEFAULT '0',
  `PasswordHash` varchar(255) DEFAULT NULL,
  `Iterations` varchar(255) DEFAULT NULL,
  `Salt` varchar(255) DEFAULT NULL,
  `fcmtoken` varchar(255) DEFAULT NULL,
  `seeker_createdat` bigint(20) DEFAULT NULL,
  `preferredindustry` varchar(255) DEFAULT NULL,
  `preferredjobfields` varchar(255) DEFAULT NULL,
  `preferredlocation` varchar(255) DEFAULT NULL,
  `seeker_cvfile` varchar(255) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`seeker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_seeker` */

insert  into `tbl_seeker`(`seeker_id`,`seeker_profileimage`,`seeker_firstname`,`seeker_surname`,`seeker_age`,`seeker_email`,`seeker_profileemail`,`seeker_title`,`seeker_phonenumber`,`seeker_address1`,`seeker_address2`,`seeker_city`,`seeker_website`,`seeker_profileviews`,`seeker_recommendations`,`PasswordHash`,`Iterations`,`Salt`,`fcmtoken`,`seeker_createdat`,`preferredindustry`,`preferredjobfields`,`preferredlocation`,`seeker_cvfile`,`timezone`,`language`) values 
(1,'http://18.218.241.173/be-reached/uploadfiles/seeker/image_test_1532502721.jpg','Zhuxian','Quan',30,'bigshark0810@gmail.com','bigshark0810@gmail.com','App recruiter at Hongqi Software\nMaster of Science(M.S.) of Yanbian University','578799797','214, Yanhe Street','Yanji, Jilin, China','Yanji','www.google.com',5,1,'d35fcf7b41c4c8e6608af686b9bc355bbef8e417c540851d8d4607596e40239a','4895','V]pncay*IA!ei[nIjF3)}&([).]QRFZC','fUcj8z6sjbw:APA91bF7rqy6ktgFafb_4dmH0jS1LjhkHGje1vSVrsvMLjhWsTjD1uvm1g9_7xwfJRObapPqSs37FqmYwCjzJEayr2X2ZfHXNiCuPoP3eu6mdojADL0EmF44LQttSMqfAXis1XDnoKNGn_Vez1HJI7_EnrYrLRP4MQ',1532494984,'4','','Cyprus','http://18.218.241.173/be-reached/uploadfiles/seeker/image_test_1533738343.jpg','Asia/Shanghai',NULL),
(2,'http://18.218.241.173/be-reached/uploadfiles/seeker/image_test_1532509054.jpg','Zhuxian1','Quan',29,'bigshark0810@hotmail.com','bigshark0810@hotmail.com','Seeking job','4250854875','231 west road','Yanji, Jilin, China','Yanji','www.zhuxian.com',4,1,'3ff2618c224d2e5933f30e24a7fa316244bb8aa694b9be953d6a9252dbee693d','6333',':3HK]z750{TvN6f+RP{ELm(}9:lh4)Y]','fUcj8z6sjbw:APA91bF7rqy6ktgFafb_4dmH0jS1LjhkHGje1vSVrsvMLjhWsTjD1uvm1g9_7xwfJRObapPqSs37FqmYwCjzJEayr2X2ZfHXNiCuPoP3eu6mdojADL0EmF44LQttSMqfAXis1XDnoKNGn_Vez1HJI7_EnrYrLRP4MQ',1532509016,'4','','Cyprus','http://18.218.241.173/be-reached/uploadfiles/seeker/image_test_1533487349.jpg',NULL,NULL),
(4,'http://18.218.241.173/be-reached/uploadfiles/seeker/image_test_1533222327.jpg','Marios','Sarpetsas',1000,'msarpetsas@gmail.com','msarpetsas@gmail.com','Seeking job','99123456','Address 1','Address 2','Nicosia',NULL,4,0,'c7321227dfe71834caa8016d5ddbb37196a66c808833885fe6c9c6f4267cd474','7311','!f]E*t{R4?r%XMLltP/;(U#1k6?6eJg:','cBmKAUiMzrk:APA91bHEMB8r2THHbYlll2LtzBrcJDfMjfyxm_buGgr1P3RMph5-HIwcawy4v9FozKR_-xR0YaZdYqa0WGAFuQ0i-6R4_57au_od0bXilURKg_aXbjC3AyJrPNR-Y2O2NhNQJN4Ihj2mRa2IGi_78zupQKjbPhKZYg',1533209982,'0','','Cyprus',NULL,NULL,NULL),
(5,'http://18.218.241.173/be-reached/uploadfiles/seeker/image_test_1534609963.jpg','Marios','S',32,'ms@google.com','ms@google.com','Seeking job','99533555','latsia','nicosia','nicosia',NULL,4,0,'c9accc0a5eb69a65df7f11330868f04c140bb2b3086e75c00d895ad6fc4ee2e5','1140','eOTa&fmQAlTCPkBv:Fx2m#%+aSFoSA1*','dzvAIj4izFo:APA91bFalIH-9ispiHg53aT3YsBQirD066SZulCzp-D8dQBvbkg3ci_xVNim8EWly7VuPTlpaMM0lKHv1M7PdoeFRvwAVNynWLDmLsln36GbFzxY9FyZtNAKEW39gpLCqeajWR2HjSF0mRo0OUy4jemlgOBEjE-Iew',1533230743,'0','','Cyprus','http://18.218.241.173/be-reached/uploadfiles/seeker/image_test_1534774957.pdf',NULL,NULL),
(6,'http://18.218.241.173/be-reached/uploadfiles/seeker/image_test_1533581911.jpg','alex','alex',2539,'ap@gmail.com','ap@gmail.com','Seeking job','1111111','x','x','x',NULL,4,1,'2c757356cb113ff062afa571d5790899200444af533bb8bc0ab6f35ce141f02e','1487','rSjUpn.L{P+,uOJO%Z2RXe^;(D7!HAP)','dzvAIj4izFo:APA91bFalIH-9ispiHg53aT3YsBQirD066SZulCzp-D8dQBvbkg3ci_xVNim8EWly7VuPTlpaMM0lKHv1M7PdoeFRvwAVNynWLDmLsln36GbFzxY9FyZtNAKEW39gpLCqeajWR2HjSF0mRo0OUy4jemlgOBEjE-Iew',1533580126,'0','','Cyprus',NULL,NULL,NULL),
(7,'http://18.218.241.173/be-reached/uploadfiles/seeker/image_test_1533731262.jpg','主贤','全',29,'bigshark0317@gmail.com','bigshark0317@gmail.com','Software developer at Hongqi No1','15874586932','real testing address','address 2','nigosia','www.test.com',5,1,'ebb5d336c05e70da4d9899774e38d811d4a8366c48c6a162c9a504bd71511220','4899','bjjvXxNO(Yy9sz}(q}X,x7tteol(yi+K','123456',1533730639,'0','','Cyprus','http://18.218.241.173/be-reached/uploadfiles/seeker/image_test_1533731827.pdf','Asia/Shanghai',NULL),
(8,NULL,'kotsios','x',22,'k@google.com','k@google.com','Seeking job\nBachelor of Fine Arts(BFA) of d','9963663','a','a','js',NULL,4,1,'5eb6c04c63d12cd9a20674f89e06245c64587bf8f64288fd1e3e130524d06987','4913','M2,2m:N$PNzA1_<q_.W3NYYv5v&Mpy1<','dzvAIj4izFo:APA91bFalIH-9ispiHg53aT3YsBQirD066SZulCzp-D8dQBvbkg3ci_xVNim8EWly7VuPTlpaMM0lKHv1M7PdoeFRvwAVNynWLDmLsln36GbFzxY9FyZtNAKEW39gpLCqeajWR2HjSF0mRo0OUy4jemlgOBEjE-Iew',1533751905,'0','','Cyprus',NULL,NULL,NULL),
(9,'http://18.218.241.173/be-reached/uploadfiles/seeker/image_test_1534287169.jpg','Sin','Zhehe',32,'sin@gmail.com','sin@gmail.com','Manager at Xinjiang pictures','1752808569','red street yanji Jilin China','234 road','Yanji','www.sin.com',4,4,'246d1851bd66b1c8c751baad4ab15ec3e43d0b002e4f0d64a61c76621dd00666','6086',':gW6&%LsJk)^7V^R{)SH_Wv4j.)Viw89','fUcj8z6sjbw:APA91bF7rqy6ktgFafb_4dmH0jS1LjhkHGje1vSVrsvMLjhWsTjD1uvm1g9_7xwfJRObapPqSs37FqmYwCjzJEayr2X2ZfHXNiCuPoP3eu6mdojADL0EmF44LQttSMqfAXis1XDnoKNGn_Vez1HJI7_EnrYrLRP4MQ',1534258179,'0','','Cyprus','http://18.218.241.173/be-reached/uploadfiles/seeker/image_test_1534287196.pdf','Asia/Pyongyang',NULL),
(10,NULL,'Ev','Ev',25,'eventurers.php@gmail.com','eventurers.php@gmail.com','exp at Ev\nMaster of Arts(M.A.) of institut','965248070','tes','tes','tes','',1,1,'2f52caef11c65c5dda12e8dfad210c2edcedb86d4a6580a2d627ae0cab7d1aab','6953','rW2%#Xpw{&q_E(E(B+#x%k>d8#j06.Ny','ec5piPuIqkA:APA91bH56zqqxsacPRa0Y5wWW8PaZ2aC0jfljCS_Dl1XTrJwM9eXExvx6JY_ZXKZ2_XVa1GP7iB2fNa_zK3Dy9z6jwxM-eSJoZYdkB0EQUpAwovmS6Gayz_6IKkj4o344yVaeHYk60-y',1535107310,'0','','Puducherry',NULL,NULL,NULL);

/*Table structure for table `tbl_seeker_accomplishment` */

DROP TABLE IF EXISTS `tbl_seeker_accomplishment`;

CREATE TABLE `tbl_seeker_accomplishment` (
  `accomplishment_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `accomplishment_type` bigint(20) DEFAULT NULL,
  `accomplishment_description` varchar(255) DEFAULT NULL,
  `accomplishment_language` varchar(255) DEFAULT NULL,
  `accomplishment_proficiency` int(11) DEFAULT NULL,
  `accomplishment_seeker` bigint(255) DEFAULT NULL,
  PRIMARY KEY (`accomplishment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_seeker_accomplishment` */

insert  into `tbl_seeker_accomplishment`(`accomplishment_id`,`accomplishment_type`,`accomplishment_description`,`accomplishment_language`,`accomplishment_proficiency`,`accomplishment_seeker`) values 
(1,1,'I have certified by Taxing software',NULL,NULL,1),
(2,2,'Taxing software is my organization',NULL,NULL,1),
(3,4,'I have done project related with job search',NULL,NULL,1),
(4,8,NULL,'English',4,1),
(6,8,NULL,'Chinese (Simplified)',16,1),
(7,1,'Cet',NULL,NULL,10),
(8,2,'Tes',NULL,NULL,10);

/*Table structure for table `tbl_seeker_companyaction` */

DROP TABLE IF EXISTS `tbl_seeker_companyaction`;

CREATE TABLE `tbl_seeker_companyaction` (
  `action_companyuser` bigint(20) DEFAULT NULL,
  `action_seeker` bigint(20) NOT NULL,
  `action_status` tinyint(1) DEFAULT NULL,
  `action_timestamp` bigint(20) DEFAULT NULL,
  `action_job` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_seeker_companyaction` */

insert  into `tbl_seeker_companyaction`(`action_companyuser`,`action_seeker`,`action_status`,`action_timestamp`,`action_job`) values 
(1,1,5,1533179148,3),
(1,1,2,1533179179,0),
(3,1,2,1533751500,0),
(3,5,2,1533751523,0),
(1,4,4,1533261966,3),
(1,1,4,NULL,1),
(1,4,2,1533264342,0),
(3,5,4,1533753940,6),
(3,5,4,1533572135,5),
(3,1,4,1533575068,6),
(4,1,2,1533674034,0),
(4,4,2,1533674038,0),
(3,6,2,1533750951,0),
(3,1,3,1533751590,4),
(3,5,3,1533751610,4),
(3,8,4,1533752038,4),
(3,8,4,1533752109,5),
(3,8,5,1533752487,6),
(3,6,4,1533753738,4),
(3,2,2,1533753962,0),
(3,7,2,1533753967,0),
(1,7,2,1533989892,0),
(4,2,2,1533828076,0),
(1,2,2,1533984933,0),
(3,8,4,1534238996,11),
(3,9,2,1534258893,0),
(3,9,4,1534258886,5),
(6,9,2,1534304987,0),
(6,9,4,1534305018,10),
(1,9,2,1534512350,0),
(1,7,1,1535279773,1),
(1,9,3,1534754102,1),
(1,9,4,1534729739,12),
(1,9,4,1534735581,3),
(3,9,1,1534871622,4),
(4,8,1,1535491007,7),
(8,1,2,1535107222,0),
(8,10,1,1535107637,15),
(8,10,4,1535112993,13),
(1,6,2,1535279698,0),
(1,1,4,1535279751,12),
(1,7,3,1535333544,12),
(4,4,4,1535490698,33),
(4,5,4,1535490754,7);

/*Table structure for table `tbl_seeker_education` */

DROP TABLE IF EXISTS `tbl_seeker_education`;

CREATE TABLE `tbl_seeker_education` (
  `education_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `education_schoolname` varchar(255) DEFAULT NULL,
  `education_degree` int(11) DEFAULT NULL,
  `education_from` varchar(20) DEFAULT NULL,
  `education_to` varchar(20) DEFAULT NULL,
  `education_fields` varchar(255) DEFAULT NULL,
  `education_grade` varchar(255) DEFAULT NULL,
  `education_description` varchar(255) DEFAULT NULL,
  `education_seeker` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`education_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_seeker_education` */

insert  into `tbl_seeker_education`(`education_id`,`education_schoolname`,`education_degree`,`education_from`,`education_to`,`education_fields`,`education_grade`,`education_description`,`education_seeker`) values 
(2,'Yanbian University',128,'1/4/2006','31/3/2010','Computer Engineering','Senior Grade','I have studied computer science in this university',1),
(3,'Shenyang Industry University',128,'1/4/2004','31/3/2006','Engineering','First grade','This was my first University',1),
(4,'d',4,'9/5/2018','9/7/2018','hs','gs','Hbd',8),
(5,'institut',8,'24/7/2018','24/8/2018','tes','v','some(\"Tes\")',10),
(6,'Indy 3',2,'24/8/2018','24/8/2015','hey','c','Desc',10);

/*Table structure for table `tbl_seeker_experience` */

DROP TABLE IF EXISTS `tbl_seeker_experience`;

CREATE TABLE `tbl_seeker_experience` (
  `experience_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `experience_jobtitle` varchar(255) DEFAULT NULL,
  `experience_company` varchar(255) DEFAULT NULL,
  `experience_from` varchar(20) DEFAULT NULL,
  `experience_to` varchar(20) DEFAULT NULL,
  `experience_location` varchar(255) DEFAULT NULL,
  `experience_description` text,
  `experience_seeker` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`experience_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_seeker_experience` */

insert  into `tbl_seeker_experience`(`experience_id`,`experience_jobtitle`,`experience_company`,`experience_from`,`experience_to`,`experience_location`,`experience_description`,`experience_seeker`) values 
(2,'App developer','Taixing software','28/7/2010','28/7/2012','Yanji, Jilin, China','I was an mobile app developer of this company.\nI have built 5 apps in this company.',1),
(3,'App recruiter','Hongqi Software','1/6/2016','Present','Yanji, Jilin, China','Rest defense',1),
(4,'tester','Kongdi Electronics','1/10/2012','30/11/2014','Nigosia','As a tester coach, I was the no1',7),
(5,'Software developer','Hongqi No1','9/1/2017','Present','Yanhe, Longjing China','Head developer in that company will be the best time in my life',7),
(6,'x','x','9/8/2018','9/6/2018','c','Fc',8),
(7,'Manager','Xinjiang pictures','15/8/2014','Present','Xinjiang China','Manager of procedures',9),
(8,'exp','Ev','24/7/2016','Present','test','Ter',10),
(9,'d','d','27/8/2018','27/7/2018','d','F',5);

/*Table structure for table `tbl_seeker_recommended` */

DROP TABLE IF EXISTS `tbl_seeker_recommended`;

CREATE TABLE `tbl_seeker_recommended` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `seeker_id` bigint(20) DEFAULT NULL,
  `companyuser_id` bigint(20) DEFAULT NULL,
  `isRecommended` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_seeker_recommended` */

insert  into `tbl_seeker_recommended`(`id`,`seeker_id`,`companyuser_id`,`isRecommended`) values 
(1,2,1,1),
(2,7,1,1),
(3,9,3,1),
(4,9,6,1),
(5,9,1,1),
(6,9,NULL,1),
(7,1,8,1),
(8,10,8,1),
(9,6,1,1),
(10,8,4,1);

/*Table structure for table `tbl_seeker_viewed` */

DROP TABLE IF EXISTS `tbl_seeker_viewed`;

CREATE TABLE `tbl_seeker_viewed` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `seeker_id` bigint(20) DEFAULT NULL,
  `companyuser_id` bigint(20) DEFAULT NULL,
  `isViewed` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_seeker_viewed` */

insert  into `tbl_seeker_viewed`(`id`,`seeker_id`,`companyuser_id`,`isViewed`) values 
(1,1,1,1),
(2,6,1,1),
(3,4,1,1),
(4,7,1,1),
(5,2,1,1),
(6,5,3,1),
(7,2,4,1),
(8,7,3,1),
(9,1,6,1),
(10,2,6,1),
(11,4,6,1),
(12,7,6,1),
(13,4,3,1),
(14,8,1,1),
(15,7,4,1),
(16,6,4,1),
(17,8,3,1),
(18,5,1,1),
(19,9,1,1),
(20,9,3,1),
(21,6,6,1),
(22,9,6,1),
(23,8,6,1),
(24,1,3,1),
(25,6,3,1),
(26,8,4,1),
(27,2,8,1),
(28,1,8,1),
(29,10,8,1),
(30,7,8,1),
(31,9,8,1),
(32,5,8,1),
(33,1,4,1),
(34,4,4,1),
(35,5,4,1);

/*Table structure for table `tbl_user` */

DROP TABLE IF EXISTS `tbl_user`;

CREATE TABLE `tbl_user` (
  `user_id` bigint(50) NOT NULL AUTO_INCREMENT,
  `user_fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_phonenumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_birthday` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_countryname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_streetname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_zip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_available` int(4) NOT NULL,
  `user_sex` int(4) NOT NULL,
  `user_height` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_weight` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_photourl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_kind` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_mdmo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_doctorid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_hospitalname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_billingname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_bankname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_bankcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_bankaccountnumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_bankroutingnumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_history` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_user` */

insert  into `tbl_user`(`user_id`,`user_fullname`,`user_phonenumber`,`user_birthday`,`user_email`,`user_password`,`user_category`,`user_countryname`,`user_streetname`,`user_city`,`user_zip`,`user_available`,`user_sex`,`user_height`,`user_weight`,`user_language`,`user_photourl`,`user_kind`,`user_token`,`user_mdmo`,`user_doctorid`,`user_hospitalname`,`user_billingname`,`user_bankname`,`user_bankcode`,`user_bankaccountnumber`,`user_bankroutingnumber`,`user_price`,`user_history`) values 
(1,'kostya0','','','test001@gmail.com','1234560','','United States','','','',0,0,'','','ENGLISH(US)','','user','','','','','','','','','','',''),
(3,'kostya','123456789','4/1/1989','test01@gmail.com','123456','Pediatrician','United States','','','',1,0,'','','ENGLISH(US)','http://192.168.107.37:8080/uploadfiles/users/image_test_1610146429.jpg','doctor','','','','','','','','','','',''),
(4,'kostya12','123456789','4/1/1989','test02@gmail.com','123456','Pediatrician','United States','','','',0,0,'','','ENGLISH(US)','','doctor','','','','','','','','','','',''),
(5,'kostya123','123456789','4/1/1989','test@gmail.com','123456','Cardiologist','United States','','','',0,0,'','','ENGLISH(US)','','doctor','','','','','','','','','','',''),
(6,'kostya chum','852963147','10/1/2007','android@gmail.com','123','','United States','gdfgdfg','sighere','25413',0,0,'190','98','ENGLISH(US)','http://192.168.107.37:8080/uploadfiles/users/image_test_1610255139.png','user','','','','','','','','','','',''),
(7,'doctor\'s full name','45213','','doctor@gmail.com','123','Cardiologist','United States','','','',0,0,'','','ENGLISH(US)','http://192.168.107.37:8080/uploadfiles/users/image_test_1610313498.png','doctor','','','','','','','','','','',''),
(8,'','','','reee@gmail.com','','Pediatrician','united state','','','',0,0,'','','ENGLISH(US)','','doctor','','','','','','','','','','',''),
(10,'ddssd','1547893','11/1/2021','a@gmail.com','a','Pediatrician','United States','dsdas','eddsss','323213',1,1,'','','ENGLISH(US)','http://192.168.107.37:8080/uploadfiles/users/image_test_1610365372.png','doctor','','credt','34324','fdsfsdf','fdfsd','fsdf','sfdsf','sfdsf','sfd','15','years'),
(11,'Yana','123456789','11/1/2016','ab@gmail.com','1','','United States','','newyok','2346576',0,0,'192','85','ENGLISH(US)','http://192.168.107.37:8080/uploadfiles/users/image_test_1610369940.png','user','','','','','','','','','','','');

/*Table structure for table `tbl_user_ratevalue` */

DROP TABLE IF EXISTS `tbl_user_ratevalue`;

CREATE TABLE `tbl_user_ratevalue` (
  `ratevalue_id` bigint(50) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(50) NOT NULL,
  `user_ratevalue` float NOT NULL,
  PRIMARY KEY (`ratevalue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbl_user_ratevalue` */

insert  into `tbl_user_ratevalue`(`ratevalue_id`,`user_id`,`user_ratevalue`) values 
(1,3,5),
(2,3,4.8),
(3,4,3.2);

/*Table structure for table `jobs_view` */

DROP TABLE IF EXISTS `jobs_view`;

/*!50001 DROP VIEW IF EXISTS `jobs_view` */;
/*!50001 DROP TABLE IF EXISTS `jobs_view` */;

/*!50001 CREATE TABLE  `jobs_view`(
 `job_id` bigint(11) unsigned ,
 `job_companyuser` bigint(20) ,
 `job_location` varchar(255) ,
 `job_title` varchar(255) ,
 `job_level` int(11) ,
 `job_skills` varchar(255) ,
 `job_employmenttype` tinyint(4) ,
 `job_yearsofexperience` int(11) ,
 `job_stages` bigint(11) ,
 `job_description` varchar(512) ,
 `job_createdat` bigint(20) ,
 `companyuser_id` bigint(20) unsigned ,
 `companyuser_company` int(11) ,
 `companyuser_personalposition` varchar(255) ,
 `companyuser_email` varchar(255) ,
 `companyuser_phonenumber` varchar(20) ,
 `companyuser_mobilenumber` varchar(20) ,
 `companyuser_address1` varchar(255) ,
 `companyuser_address2` varchar(255) ,
 `companyuser_city` varchar(255) ,
 `companyuser_createdat` bigint(20) ,
 `companyuser_verified` tinyint(1) ,
 `fcmtoken` varchar(255) ,
 `companyuser_image` varchar(255) ,
 `companyuser_facebookid` varchar(255) ,
 `companyuser_linkedinid` varchar(255) ,
 `companyuser_googleid` varchar(255) ,
 `PasswordHash` varchar(255) ,
 `Iterations` varchar(255) ,
 `Salt` varchar(255) ,
 `preferredindustry` int(11) ,
 `preferredjobfields` varchar(255) ,
 `preferredlocation` varchar(255) ,
 `timezone` varchar(255) ,
 `language` varchar(20) ,
 `company_id` int(11) unsigned ,
 `company_size` int(11) ,
 `company_name` varchar(255) ,
 `company_email` varchar(255) ,
 `company_address1` varchar(255) ,
 `company_address2` varchar(255) ,
 `company_city` varchar(255) ,
 `Banned` tinyint(1) ,
 `company_logo` varchar(255) ,
 `company_profileviews` int(11) ,
 `company_recommendations` int(11) ,
 `company_aboutus` text ,
 `company_website` varchar(255) ,
 `company_yearfound` varchar(4) ,
 `company_industry` int(11) ,
 `company_createdat` bigint(20) 
)*/;

/*View structure for view jobs_view */

/*!50001 DROP TABLE IF EXISTS `jobs_view` */;
/*!50001 DROP VIEW IF EXISTS `jobs_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `jobs_view` AS select `a`.`job_id` AS `job_id`,`a`.`job_companyuser` AS `job_companyuser`,`a`.`job_location` AS `job_location`,`a`.`job_title` AS `job_title`,`a`.`job_level` AS `job_level`,`a`.`job_skills` AS `job_skills`,`a`.`job_employmenttype` AS `job_employmenttype`,`a`.`job_yearsofexperience` AS `job_yearsofexperience`,`a`.`job_stages` AS `job_stages`,`a`.`job_description` AS `job_description`,`a`.`job_createdat` AS `job_createdat`,`b`.`companyuser_id` AS `companyuser_id`,`b`.`companyuser_company` AS `companyuser_company`,`b`.`companyuser_personalposition` AS `companyuser_personalposition`,`b`.`companyuser_email` AS `companyuser_email`,`b`.`companyuser_phonenumber` AS `companyuser_phonenumber`,`b`.`companyuser_mobilenumber` AS `companyuser_mobilenumber`,`b`.`companyuser_address1` AS `companyuser_address1`,`b`.`companyuser_address2` AS `companyuser_address2`,`b`.`companyuser_city` AS `companyuser_city`,`b`.`companyuser_createdat` AS `companyuser_createdat`,`b`.`companyuser_verified` AS `companyuser_verified`,`b`.`fcmtoken` AS `fcmtoken`,`b`.`companyuser_image` AS `companyuser_image`,`b`.`companyuser_facebookid` AS `companyuser_facebookid`,`b`.`companyuser_linkedinid` AS `companyuser_linkedinid`,`b`.`companyuser_googleid` AS `companyuser_googleid`,`b`.`PasswordHash` AS `PasswordHash`,`b`.`Iterations` AS `Iterations`,`b`.`Salt` AS `Salt`,`b`.`preferredindustry` AS `preferredindustry`,`b`.`preferredjobfields` AS `preferredjobfields`,`b`.`preferredlocation` AS `preferredlocation`,`b`.`timezone` AS `timezone`,`b`.`language` AS `language`,`c`.`company_id` AS `company_id`,`c`.`company_size` AS `company_size`,`c`.`company_name` AS `company_name`,`c`.`company_email` AS `company_email`,`c`.`company_address1` AS `company_address1`,`c`.`company_address2` AS `company_address2`,`c`.`company_city` AS `company_city`,`c`.`Banned` AS `Banned`,`c`.`company_logo` AS `company_logo`,`c`.`company_profileviews` AS `company_profileviews`,`c`.`company_recommendations` AS `company_recommendations`,`c`.`company_aboutus` AS `company_aboutus`,`c`.`company_website` AS `company_website`,`c`.`company_yearfound` AS `company_yearfound`,`c`.`company_industry` AS `company_industry`,`c`.`company_createdat` AS `company_createdat` from ((`tbl_job` `a` join `tbl_company_user` `b` on((`a`.`job_companyuser` = `b`.`companyuser_id`))) join `tbl_company` `c` on((`b`.`companyuser_company` = `c`.`company_id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
