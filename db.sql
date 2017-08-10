CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) DEFAULT NULL,
  `author_id` varchar(45) NOT NULL,
  `text` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`news_id`),
  CONSTRAINT `news_id:id` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

LOCK TABLES `comments` WRITE;
INSERT INTO `comments` VALUES (18,1,'1','comment1'),(19,11,'2','comment2'),(20,12,'3','comment3'),(21,13,'4','comment4'),(22,14,'5','comment5'),(23,15,'6','comment6'),(24,15,'7','comment7'),(25,12,'8','comment8'),(26,13,'9','comment9'),(27,11,'10','comment10'),(28,1,'11','comment11'),(29,1,'12','comment12'),(30,16,'13','comment13'),(31,17,'14','comment14'),(32,18,'15','comment15'),(33,18,'16','comment16'),(34,19,'17','comment17'),(39,11,'1','123321'),(40,21,'1','123'),(41,20,'1','comment check tomcat war');
UNLOCK TABLES;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `text` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;


LOCK TABLES `news` WRITE;
INSERT INTO `news` VALUES (1,'Deception tech helps to thwart hackers\' attacks','2017-08-09','In World War II, the Allies employed all kinds of sneaky tricks to deceive their enemies into thinking they had more troops and weapons at their disposal than they actually had.\nThe camouflage techniques of one unit active in North Africa, which on one occasion consulted a stage magician about the way he fooled audiences, proved decisive in several key battles. And the biggest deception of all was Operation Fortitude which fooled the Nazis about where the D-Day landings would actually take place.\nThe same principles of deception and misdirection, albeit on a much smaller scale, are now starting to be used by some organisations to thwart malicious hackers keen to establish a bridgehead on internal networks.\n\"It\'s a classic idea of warfare to prevent the adversary from having a real understanding of your reality,\" said Ori Bach from deception technology firm Trapx. \"It\'s just like the Allies in WWII. They made fake tanks, fake air bases, fake everything.\"\nAnd just like those ersatz weapons of war, the fakes implanted on a network look just like the real thing.\n\"We create a shadow network that is mimicking the real network and is constantly changing,\" he said.\nThe use of so-called deception technology has grown out of a realisation that no organisation can mount perfect digital defences. At some point, the attackers are going to worm their way in.\nGiven that, said Mr Bach, it was worth preparing for their arrival by setting up targets that are simply too juicy for the malicious hackers to ignore once they land and start looking around.\n\"We want our shadow network to be more attractive to the hackers than the real stuff,\" he said.'),(11,'Customers \'furious\' with TNT after cyber-attack meltdown\n','2017-08-09','When Leah Charpentier ordered a vintage coffee table, on 8 June - a birthday present for her brother - she didn\'t think it would take more than six weeks to be delivered.\nShe also didn\'t expect for the furniture to arrive with one of its casters broken off.\nThis particular coffee table was just one of hundreds of thousands of items caught up in an extraordinary meltdown at courier TNT, which was badly affected by the NotPetya cyber-attack that hit many companies around the world on 28 June.\nBusinesses in Ukraine were hit hardest, and since many TNT operations and communications are based in the country, a significant proportion of its systems were infiltrated and data encrypted - locking employees out - as a result.\n\"Manual processes\" are still being used to put packages through the system, and TNT says it is \"reasonably possible\" that some information will never be fully recovered.\nThe BBC has spoken to several customers who have had exasperating experiences with the courier, which is owned by FedEx.\nSmall businesses have been affected too - some say they have lost thousands of pounds because of missing or waylaid shipments.\nAnd a source close to FedEx and TNT operations in Europe has told the BBC that depots have been pushed to their limit while both companies continue to try to get the backlog of packages under control.\n\'Furious\'\nMs Charpentier\'s table faced the disruption of the cyber-attack after its initial delivery had been delayed because of its size.\nBut when it arrived late to its destination in London following the extended delay, her brother was not expecting the delivery and so was out at the time. The furniture was shipped back to Rome and then sent out again via another courier, DHL.\nMs Charpentier still doesn\'t know who is responsible for the broken leg, but because of the confusion and the fact that the table was sent back to Italy without TNT contacting her first, she says: \"I\'m still furious at TNT.\"\nTotal shipping costs were 150 euros (£135), and Ms Charpentier says she might have to spend a further 180 euros to get the furniture repaired.\n'),(12,'FBI sting \'unmasks\' US cyber-extortionist targeting girls\n','2017-08-09','The FBI has charged an American man officers believe to be behind an online extortion campaign to make young girls share explicit pictures of themselves.\nFacebook messages in the name of \"Brian Kil\" were sent to the girls, using the Tor anonymising network, from 2012.\nThey threatened to kill them and their families or blow up their schools if they did not share explicit images.\nThe FBI says it tricked \"Brian Kil\" into viewing a video bearing virus-like code that logged his real net address.\nPipe bombs\nBuster Hernandez has been charged with several counts of sexual exploitation of a child, threatening to use explosives and threatening to injure.\nMr Hernandez has yet to enter a plea.\nIf convicted, he faces a mandatory minimum sentence of 15 years in jail.\nThe Facebook messages claimed \"Brian Kil\" had already accessed explicit pictures the girls had previously shared, which he would publish unless they sent him more.\nTaunting investigators\nIn at least three cases, the messages claimed the sender would also visit the girl\'s school and use pipe bombs and guns to kill her and her friends.\nTwo schools were closed for 24 hours while police investigated these threats.\nThe Tor anonymising network hides a person\'s identity by bouncing requests for data through many different computers.\nAnd messages excerpted in the court documents show \"Brian Kil\" taunting investigators for their inability to track him down.\n\'Reign of terror\'\nBut after local police in Indiana called on the FBI for help investigating the case of two victims who lived in the state, agents added extra code to one video file uploaded along with other images to a private Dropbox account.\nAnd when this video was viewed, the code grabbed the IP address of Mr Hernandez\'s computer, the FBI alleges.\n\"Mr Hernandez\'s reign of terror is over,\" said US Attorney Josh Minkler in a statement.\n\"Those who think they can outwit law enforcement and are above being caught should think again.\"'),(13,'India blocks the Internet Archive\n','2017-08-09','The Internet Archive\'s Wayback Machine is being blocked by many of India\'s net providers.\nThe online tool allows the public to see old versions of websites and contains more than 302 billion saved web pages.\nAffected users are being shown a message saying that access has been restricted under the orders of the government\'s Department of Telecommunications.\nHowever, no explanation has been given.\n\"Courts and security agencies do block certain websites and the reasons are sometimes not disclosed,\" Shambhu Choudhary, the director of the government\'s Press Information Bureau told the BBC.\n\"These are based on directives from security agencies.\"\nAlthough the blockage is reportedly widespread, some locals have reported still being able to access the archive.\nThe San Francisco-based Internet Archive project told the Medianama news site that it was also at a loss to explain the situation.\n\"Obviously, we are disappointed and concerned by this situation and are very eager to understand why it\'s happening and see full access restored,\" said office manager Chris Butler.\nIndia had 462.1 million internet users out of a general population of 1.3 billion people in mid-2016, according to the Internet and Mobile Association of India.\nThat makes its online audience the second largest in the world after China.\nIn 2014, the country ordered local internet service providers (ISPs) to block the Internet Archive, along with Vimeo, the Daily Motion and 29 other popular sites, over concerns they provided access to \"Jihadi propaganda\".'),(14,'\'Hate speech\' tweets painted at Twitter HQ in protest\n','2017-08-09','A German satirist who claims Twitter is failing to delete hate speech has captured the firm\'s attention offline - by stencilling the offending messages outside its Hamburg office.\nShahak Shapira, who is Jewish, said he had reported 300 incidents of hate speech in six months, but Twitter had responded to just nine.\nA YouTube video has emerged showing Mr Shapira stencilling 30 tweets.\n\"Germany needs a final solution to Islam,\" reads one.\n\"Let\'s gas the Jews,\" says another, in reference to the Nazis\' murder of six million Jews during World War Two.\n\"If Twitter forces me to see these things, then they\'ll have to see them too,\" the artist said in the video, posted on Monday.\nHe described the comments as \"not just plain insults or jokes, but absolutely serious threats of violence\".\nThey include statements that are homophobic, xenophobic, or involve holocaust denial.'),(15,'Google fires diversity memo author\n','2017-08-09','A Google employee who wrote a controversial memo about workplace diversity has been fired, the BBC can confirm.\nThe controversial memo broke the firm’s code of conduct, Google’s chief executive Sundar Pichai said on Monday in an email to employees.\nThe memo, shared widely at the weekend, suggested there were fewer women at Google due to biological differences.\nMr Pichai said the text crossed the line due to it \"advancing harmful gender stereotypes in our workplace”.\nEntitled Google’s Ideological Echo Chamber, the paper argued that \"the abilities of men and women differ in part due to biological causes and that these differences may explain why we don\'t see equal representation of women in tech and leadership”.\nThe author wrote: \"We need to stop assuming that gender gaps imply sexism.\"\nGoogle has not confirmed who the employee is, but media reports name him as James Damore.\n\"[I was fired for] perpetuating gender stereotypes,\" he told Reuters.\nHe also claimed to have received \"many personal messages from fellow Googlers expressing their gratitude\" for speaking out.'),(16,'US military to shoot down consumer drones','2017-08-09','The Pentagon has given US military bases permission to shoot down or otherwise destroy consumer drones flying overhead and nearby.\nA spokesman revealed that guidance was issued on 4 August.\nHe said the exact terms of the policy were classified.\nThe move comes days after the US Army ordered its own troops to stop using drones made by Chinese manufacturer DJI because of alleged \"cyber-vulnerabilities\".\nPrivacy worries\nIt became illegal to fly personal drones within 400ft (122m) of the US\'s 133 military facilities in April.\nThe Federal Aviation Administration announced at the time that those who disobeyed the order would face financial penalties and possible criminal charges.\nThe watchdog has forecast that US-based hobbyists will own more than 3.5 million drones by 2021, and that there could be a further 1.6 million commercial models in operation.\nThe technology\'s growing popularity has raised privacy and safety concerns.\nThere have already been incidents in which members of the public have shot down drones flying over their own properties.\nAnd the new guidance is intended to clarify what steps military bases can take, and warn local communities of the potential counter-measures.\n\"We retain the right of self-defence and when it comes to... drones operating over military installations, this new guidance does afford us the ability to take action to stop those threats,\" Navy Captain Jeff Davis said in a written statement, adding that this included \"tracking, disabling and destroying\" the aircraft.\nMilitary ban\nThe US Army\'s ban on DJI drones was first reported on 2 August by the SUAS News website.\nIt published a memo revealing that the armed forces had been told to cease all use of the Shenzhen-based firm\'s drones, to uninstall its applications and to disconnect any storage media from its devices.'),(17,'Podcast patent ruled invalid by court\n','2017-08-09','A company that charged others for uploading video and audio content on to their own websites has had its podcast patent invalidated by a US court.\nThe Electronic Frontiers Foundation (EFF) argued that Personal Audio LCC had \"not invented anything new\" when it acquired the patent in 2012.\nBuilding up patent libraries to aggressively pursue others for payments while making few if any products of one\'s own is sometimes referred to as \"patent trolling\".\nPersonal Audio had tried to develop a digital audio player in the 1990s.\nThe product never went on sale.\nIn 2013, founder James Logan said he had spent $1.6m (£1.2m) on his creation.\n\"During the life of Personal Audio, I invested $1.6m, and lost it all,\" he said in a Slashdot interview that is on Personal Audio\'s website.\n\"Personal Audio, LLC, the patent holding company, is the attempt by the investor, me, to get a return on that investment.\n\"When investors like me get our money back, plus some if we\'re lucky, it means that start-ups are not as risky as they might otherwise be.\"\nHowever, the patent his company owns is not for one of his inventions.\nThe technology at the heart of the legal dispute allowed websites to be updated with new video and audio podcasts.\nCompanies targeted by Personal Audio for using it included the broadcasters CBS, NBC and Fox, and consumer electronics giant Samsung.\nHowever, the EFF said people had already been uploading podcasts before Personal Audio filed for the patent in 2009.'),(18,'Lonely Planet attempts Instagram competitor\n','2017-08-09','That’s the message Lonely Planet’s chief executive, Daniel Houghton, wants you to hear as his company launches a new app, Trips.\nSince 1973, his firm has been using a vast human network of travel experts, and local knowledge, to pack its best-selling guides with tailored information. But that job is getting harder.\nAs Google’s dominance grows (even with its latest legal problems) I wonder how the travel brand can remain relevant at a time when we’re more often than not turning to algorithms and search engines to guide us around new places.\nEnter, Trips. The app - available on iOS from Tuesday - can be seen as a clean blend of Instagram and the slick writing platform, Medium.\nIts goal is to provide travellers with a space to curate their best holiday photos into beautiful, shareable posts. Along the way, Lonely Planet’s network can offer added insight about the place you, or your friend, have visited.\nTrips follows Guides, the app the company launched in February last year. That app was mostly a continuation of what the books offer: travel advice, pulled together from human recommendations.'),(19,'Game of Thrones hackers demand ransom\n','2017-08-09','Hackers who have leaked Game of Thrones scripts and other data from entertainment company HBO have released a note demanding a ransom payment.\nIn a new dump, they also published a script for the as yet unbroadcast fifth episode of the current series.\nCompany documents and video episodes of other HBO shows were also shared.\nThe hackers claim to have 1.5TB of data in total, but HBO has said it does not believe its email system has been compromised.\nDocuments in the latest leak were marked \"HBO is falling\", according to the Wired news site, and included legal information, employment agreements and other company files.\nThe Associated Press reports that some documents appeared to contain personal contact information for Game of Thrones actors.\nThe ransom note featured in a video containing scrolling text, addressed to HBO chief executive Richard Plepler.\nHowever, the hackers have not made public how much they want.\n\"Our demand is clear and non-negotiable: we want XXXX dollars to stop leaking your data,\" the redacted note reads.\n\"HBO spends $12m for market research and $5m for [Game of Thrones series seven] advertisements. So consider us another budget for your advertisements.\"\nIt was signed: \"Mr Smith\".\nAlthough the note is not dated, it gives HBO a deadline of three days to make the payment.\nThe broadcaster has said it continues to investigate the incident.'),(20,'Disney to start online streaming, bypassing Netflix\n','2017-08-09','Media giant Walt Disney plans to start its own online streaming services in the US for movies, shows and sports in a shift aimed at bringing productions directly to consumers.\nThe plans come as the firm grapples with falling television subscriptions and challenges from online video.\nIt will launch an ESPN-branded sports service early next year and a Disney streaming service in 2019.\nThe firm also said it would end a distribution deal with Netflix.\nThe company made the announcements on Tuesday as it reported an almost 9% fall in quarterly profits and little change in revenues compared to the same period in 2016.\nDisney boss Robert Iger said the streaming services \"mark the beginning of what will be an entirely new growth strategy for the company\".\n\'Offensive move\'\nDisney has already launched its own subscription-based video streaming service in the UK.\nDisney Life was introduced in 2015 and features many of the company\'s films, music, books and television programmes in a single app.\nWith the digital push, Disney is trying to insert itself into territory currently claimed by Amazon and Netflix, which have won audiences with a combination of original programmes available on-demand and a business model focused on monthly subscriptions instead of advertising.\nMr Iger said making Disney and ESPN content available on standalone sites and apps is a better bet in the long run than continuing to rely on cable television, movie theatres and licensing agreements to distribute its work.\nDisney said its distribution deal with Netflix for new Disney and Pixar movies would end in 2019, with discussions ongoing about the fate of Star Wars and Marvel franchises. The news sent Netflix shares down almost 3% in after hours trade.\n\"It\'s not just a defensive move,\" Mr Iger said. \"It\'s an offensive move.\"\nAs part of the online push, Disney plans to take majority ownership of BAMTech, a video-streaming company started by Major League Baseball. Disney will pay $1.58bn (£1.2bn) to increase its stake in the firm from 33% to 75%.\nDisney also plans to increase its investment in movies and television series to produce more original content for the streaming service, Mr Iger said.\nDisney hasn\'t decided how much the streaming services will cost, but the company\'s goal is to reach a wide audience, Mr Iger said.'),(21,'Hackers \'could target electricity grid\' via solar panel tech','2015-01-01','Hackers could target electricity grids through security flaws in solar panel equipment, a Dutch researcher has said.\nWillem Westerhof found 17 vulnerabilities in inverters, which convert electricity produced by the panels so it can be used on the grid.\nHe said internet-connected inverters could be targeted by hackers.\nOne manufacturer said that only \"a small fraction\" of its devices were affected.\nAfter discovering vulnerabilities in devices produced by a range of manufacturers, Mr Westerhof carried out a field test near Amsterdam on two inverters made by SMA.\nHe told the BBC the test showed it would be possible for an attacker to remotely control the devices and alter the flow of power.\nBecause energy equipment on the grid needs to balance supply with demand, overloading the system could result in a power cut.\n\'Serious consequences\'\n\"If an attacker does that on a large scale, that has serious consequences for the power grid stability,\" said Mr Westerhof.\nEnergy researcher Iain Staffell, at Imperial College London, told the BBC, \"It\'s certainly a risk to electricity supply and could stress grid operations.\"\nHowever, he did not believe it could cause blackouts and he pointed out that a large number of inverters would have to be attacked at once for any significant effect to occur.\nSMA responded by pointing out the limitations to such an attack:\nonly four of its models are affected by the vulnerabilities\nusers are advised to change default passwords when installing the devices, though this is not required\ninverters not connected to the internet are safe\n\"The security of our devices has highest priority for SMA in all respects,\" the company said in a statement.\n\"We already assessed the mentioned issues on a technical basis and [are working] intensively on the correction.\"\nIt added that it would publish further responses to Mr Westerhof\'s research in the coming days and that it was working on a report about the security of its products with the Dutch National Cyber Security Centre.');
UNLOCK TABLES;