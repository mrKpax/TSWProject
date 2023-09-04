DROP DATABASE IF EXISTS WorkInProgress;
CREATE DATABASE WorkInProgress;
USE WorkInProgress;

CREATE TABLE Prodotto(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,  
    categoria ENUM('Attrezzatura', 'Accessori', 'Abbigliamento', 'FoodAndBeverage', 'Allenamenti') NOT NULL,
    descrizione VARCHAR(500) NOT NULL,
    marca VARCHAR(50) NOT NULL, 
    immagine VARCHAR(50) NOT NULL,
    IVA FLOAT NOT NULL,
    prezzo FLOAT NOT NULL
);

INSERT INTO Prodotto VALUES(1, "Set di fasce di resistenza tonificanti", "Attrezzatura", "Pensate per aiutarti a sfidare il tuo corpo. Porta il tuo allenamento al livello successivo, aumentando forza, energia e resistenza, che sia per un buon riscaldamento o per migliorare costantemente la tua flessibilità. 1 x Fascia di resistenza tonificante con resistenza bassa - Grigio chiaro, 1 x Fascia di resistenza tonificante con resistenza media - Grigio Scuro, 1 x Fascia di resistenza tonificante con resistenza alta - Nero", "Prozis", "fasce_resistenza_prozis.jpg", 22, 30);
INSERT INTO Prodotto VALUES(2, "Powermove - Manubrio regolabile - da 5 kg a 25 kg", "Attrezzatura", "Non sempre è pratico (certe volte è persino impossibile) tenere un grande numero di manubri a casa. Man mano che diventi più forte ed hai bisogno di più peso, dovrai procurarti manubri più pesanti. Senza nemmeno accorgertene, avrai a casa tua una piramide di manubri! Qual è l'alternativa? Un singolo manubrio regolabile con un'ampia gamma di pesi!", "Powermove", "manubrio_regolabile_powermove.jpg", 22, 290);
INSERT INTO Prodotto VALUES(3, "SELEKTOR - Manubri Regolabili 2-20Kg (coppia)", "Attrezzatura", "Avete presente i tradizionali manubri regolabili in cui si sentono i dischi che si muovono, che vanno impostati da entrambi i lati e che anche da leggeri sono incredibilmente ingombranti? non una semplice evoluzione, una vera rivoluzione: vi trovate di fronte un prodotto completamente ri-progettato per i palati più esigenti. Venduti in coppia e corredati delle loro basi per riporli ordinatamente, sono ideali per studi personal, Home & Garage gym, consentono di avere un intero set racchiuso in due manubri dal design di classe. La nuova versione migliorata, disponibile da Giugno 2020 prevede i seguenti carichi2 - 4 - 6 - 8 - 10 - 12 - 14 - 16 - 18 - 20 Kg", "Lacertosus", "selektor_lacertosus.jpg", 22, 697);
INSERT INTO Prodotto VALUES(4, "Bilanciere Olimpico Training 220 cm", "Attrezzatura", "OB86-E, il Bilanciere Maschile in Versione Training, perfetto compagno di allenamento nelle home e garage gym. La rinomata affidabilità di questo bilanciere, confermata dalla certezza che non contiene parti in plastica, lo rende ideale in tutte le palestre commerciali dove è richiesto un bilanciere affidabile, robusto e incredibilmente duraturo nel tempo. Perfetto in abbinamento alle panche o ai power rack per eseguire tutti gli esercizi classici dell'allenamento: panca, military, squat, stacchi, affondi. OB86-E Bilanciere Olimpico Training è perfetto per gli esercizi di base ed è il compagno ideale per la tua Home-Gym! Questo bilanciere non è droppabile (non può essere lasciato cadere carico di pesi) pertanto NON è adatto al CrossTraining. I manicotti di caricamento diametro 50mm sono rotanti per ridurre lo stress sulle articolazioni, aumentare il comfort e gli esercizi che si possono eseguire; l'impugnatura è cromata per garantire una lunga durata nel tempo e una pulizia semplice e veloce. Questo bilanciere olimpico è compatibile con tutti i dischi olimpici, con foro diametro nominale 50mm.", "Lacertosus", "bilanciere_lacertosus.jpg", 22, 175);
INSERT INTO Prodotto VALUES(5, "Urethane Plate Set", "Attrezzatura", "I dischi di Technogym in poliuretano assicurano agli utenti più sicurezza, durata e maneggevolezza. I nostri dischi sono rivestiti in resistente poliuretano per carichi pesanti, materiale progettato per durare più a lungo e prevenire eventuali danni alle attrezzature, alle pareti o alle pavimentazioni.", "Technogym", "plate_set_technogym.jpg", 22, 1450);
INSERT INTO Prodotto VALUES(6, "Bumper Plate 5kg", "Attrezzatura", "Realizzati in gomma completamente nera, questi dischi sono progettati per resistere a un uso intensivo e assicurare un ottimo assorbimento degli impatti e un buon rimbalzo. La texture opaca sui lati esterni dei dischi li rende meno vulnerabili ai graffi.", "Technogym", "bumper_plates_technogym.jpg", 22, 80);
INSERT INTO Prodotto VALUES(7, "Bumper Plate 10kg", "Attrezzatura", "Realizzati in gomma completamente nera, questi dischi sono progettati per resistere a un uso intensivo e assicurare un ottimo assorbimento degli impatti e un buon rimbalzo. La texture opaca sui lati esterni dei dischi li rende meno vulnerabili ai graffi.", "Technogym", "bumper_plates_technogym.jpg", 22, 85);
INSERT INTO Prodotto VALUES(8, "Bumper Plate 15kg", "Attrezzatura", "Realizzati in gomma completamente nera, questi dischi sono progettati per resistere a un uso intensivo e assicurare un ottimo assorbimento degli impatti e un buon rimbalzo. La texture opaca sui lati esterni dei dischi li rende meno vulnerabili ai graffi.", "Technogym", "bumper_plates_technogym.jpg", 22, 110);
INSERT INTO Prodotto VALUES(9, "Bumper Plate 20kg", "Attrezzatura", "Realizzati in gomma completamente nera, questi dischi sono progettati per resistere a un uso intensivo e assicurare un ottimo assorbimento degli impatti e un buon rimbalzo. La texture opaca sui lati esterni dei dischi li rende meno vulnerabili ai graffi.", "Technogym", "bumper_plates_technogym.jpg", 22, 150);
INSERT INTO Prodotto VALUES(10, "Bumper Plate 25kg", "Attrezzatura", "Realizzati in gomma completamente nera, questi dischi sono progettati per resistere a un uso intensivo e assicurare un ottimo assorbimento degli impatti e un buon rimbalzo. La texture opaca sui lati esterni dei dischi li rende meno vulnerabili ai graffi.", "Technogym", "bumper_plates_technogym.jpg", 22, 185);
INSERT INTO Prodotto VALUES(11, "Set Bumper Raw, 100kg", "Attrezzatura", "Ideati per accontentare gli atleti che stanno iniziando un percorso nell’allenamento da WL e PL. I dischi Bumper RAW line sono Ideali per Home Gym, Garage Gym, palestre, centri CrossTraining e Functional Training ; sono il prodotto adatto a te: realizzati interamente in gomma full black e con l’anello centrale in acciaio inox, sono la soluzione ideale per ridurre i costi di attrezzatura, così non dovrai rinunciare ai kg che ti servono per allenarti al top. Non perdere tempo sul web alla ricerca di materiale usato o rincorrendo dubbie occasioni: solo da Lacertosus® puoi trovare il marchio RAW line che ti garantirà la qualità e risparmio. I dischi Bumpers Raw Line se utilizzati per allenamenti da weightlifting o crosstraining dove è previsto il DROP sono da utilizzarsi esclusivamente in abbinamento ai pavimenti gommati da almeno 15mm di spessore.", "Lacertosus", "set_dischi_lacertosus.jpg", 22, 395);
INSERT INTO Prodotto VALUES(12, "Fit Resistance Kit - Set per allenamento da 10 pezzi", "Che tu sia un atleta professionista in cerca di un modo per migliorare il tuo allenamento, oppure un principiante o uno sportivo esperto in cerca di un esercizio fisico più efficace, questo versatile set permetterà ad i tuoi allenamenti di offrirti risultati più rapidi e produttivi!", "Prozis", "fit_resistance_kit_prozis.jpg", 22, 35);
INSERT INTO Prodotto VALUES(13, "Kettlebell SET Beginner I", "Attrezzatura", "La prima scelta per i box CrossTraining in Italia ed Europa. Ottimo per le Home-Gym. Versatili, dure ed efficienti, ma nel contempo dal design accattivante e dalle finiture uniche, le kettlebells Lacertosus® sono la perfetta sintesi per l'efficienza del tuo allenamento ed il gusto per la cura maniacale dei dettagli che contraddistingue la nostra azienda. In ghisa, nero opaca, fusione in pezzo unico, tolleranza del taglio di peso ridotta al minimo, maniglia ideale per favorire la presa per il tuo WOD e dal diametro adeguato per qualsiasi mano che debba impugnarla. Pezzatura incisa a stampo sul corpo e anello colorato che ne facilita il distinzione. La Russian Black è costruita per durare e per accompagnare i tuoi progressi nel tempo. E' il prodotto derivante da 10 anni di sviluppo. Il minimo per avere il massimo! Include: 1 x Kettlebell Russian Black 8 Kg, 1 x Kettlebell Russian Black 10 Kg, 1 x Kettlebell Russian Black 12 Kg", "Lacertosus", "kettlebell_lacertosus_1.jpg", 22, 127);
INSERT INTO Prodotto VALUES(14, "Kettlebell SET Beginner II", "Attrezzatura", "La prima scelta per i box CrossTraining in Italia ed Europa. Ottimo per le Home-Gym. Versatili, dure ed efficienti, ma nel contempo dal design accattivante e dalle finiture uniche, le kettlebells Lacertosus® sono la perfetta sintesi per l'efficienza del tuo allenamento ed il gusto per la cura maniacale dei dettagli che contraddistingue la nostra azienda. In ghisa, nero opaca, fusione in pezzo unico, tolleranza del taglio di peso ridotta al minimo, maniglia ideale per favorire la presa per il tuo WOD e dal diametro adeguato per qualsiasi mano che debba impugnarla. Pezzatura incisa a stampo sul corpo e anello colorato che ne facilita il distinzione. La Russian Black è costruita per durare e per accompagnare i tuoi progressi nel tempo. E' il prodotto derivante da 10 anni di sviluppo. Il minimo per avere il massimo! Include: 1 x Kettlebell Russian Black 8 Kg, 1 x Kettlebell Russian Black 10 Kg, 1 x Kettlebell Russian Black 12 Kg, 1 x Kettlebell Russian Black 16 Kg", "Lacertosus", "kettlebell_lacertosus_2.jpg", 22, 197);
INSERT INTO Prodotto VALUES(15, "Flat Bench / Panca piana", "Attrezzatura", "La panca piana Lacertosus® LFB è robusta, progettata per durare una vita di intensi allenamenti. Lo schienale misura 29 x 108 cm, l'altezza da terra è di 46 cm; la superficie è lavabile e l'imbottitura è duratura e confortevole, con la durezza necessaria a sopportare anche i carichi più impegnativi. Ruote posteriori ricoperte in gomma per un spostamento facile. Utile per eseguire esercizi quali croci o spinte con manubri, pull over, rematore con manubri, addominali e tante altre varianti a corpo libero o con bilanciere, manubri o kettlebells. In ogni palestra, box, garage o home gym la panca piana è una presenza che non può mancare. La struttura metallica della LFB è garantita a vita; la garanzia non si applica per fenomeni di usura o uso improprio delle attrezzature.", "Lacertosus", "panca_piana_lacertosus.jpg", 22, 171);
INSERT INTO Prodotto VALUES(16, "Panca regolabile PRO Black", "Attrezzatura", "La panca regolabile Lacertosus® LAB è incredibilmente versatile: passa da piana a inclinata rapidamente ed è la più robusta sul mercato in questa fascia di prezzo, garantita con oltre 320kg di portata. Le sue dimensioni la rendono particolarmente versatile anche per i powerlifters più esigenti ed è il prodotto più richiesto nell'allestimento delle home e garage gyms. Alta qualità, cura dei dettagli e garanzia di sicurezza per l'utilizzatore sono i punti chiave della panca #LAB, la panca che hai sempre desiderato, con la quale potrai allenarti fino allo sfinimento!", "Lacertosus", "panca_regolabile_lacertosus.jpg", 22, 425);
INSERT INTO Prodotto VALUES(17, "Fasce in cotone per il sollevamento pesi 2.0 - Paio (2) - Black", "Accessori", "Nella strada per il miglioramento, i tuoi polsi potrebbero pagarne le conseguenze. Queste robuste fasce in cotone per il sollevamento pesi ti aiuteranno ad alleviare la tensione su mani e polsi e a concentrarti sulla crescita dei muscoli di braccia e petto.", "Prozis", "straps_prozis.jpg", 22, 19);
INSERT INTO Prodotto VALUES(18, "Powerlifting Straps", "Accessori", "Per noi di Lacertosus®, quando si parla di sicurezza “troppo non è mai abbastanza” per questo abbiamo riprogettato interamente la nostra linea di lifting accessories migliorando sotto ogni aspetto, dal design accattivante ai migliori materiali, ogni singolo prodotto, dalla più piccola polsiera alla più rigida cintura! Realizzati in fibra di cotone altamente resistente e di massima qualità i nuovi powerlifting straps sono pensati da atleti per atleti che amano superare i propri limiti.", "Lacertosus", "straps_lacertosus.jpg", 22, 25);
INSERT INTO Prodotto VALUES(19, "Fasce per Polsi 2.0 - Paio (2) - Black", "Accessori", "Nella strada per il miglioramento, i tuoi polsi possono pagarne le conseguenze. Sappiamo che sforzarsi e spingersi oltre i propri limiti può essere una sfida. Queste fasce per polsi possono aiutarti a diminuire un po' la pressione durante quelle sessioni di allenamento intenso. Noterai la differenza.", "Prozis", "polsiere_prozis.jpg", 22, 19);
INSERT INTO Prodotto VALUES(20, "Wrist Wraps Pro", "Accessori", "Per noi di Lacertosus®, quando si parla di sicurezza “troppo non è mai abbastanza” per questo abbiamo riprogettato interamente la nostra linea di lifting accessories migliorando sotto ogni aspetto, dal design accattivante ai migliori materiali, ogni singolo prodotto, dalla più piccola polsiera alla più rigida cintura! Se ami allenarti tutti i giorni, affrontando workout ed esercizi sempre diversi, i nuovissimi Wrist Wraps Pro, pensati da atleti per atleti, sono esattamente ciò che stavi cercando.", "Lacertosus", "polsiere_lacertosus.jpg", 22, 25);
INSERT INTO Prodotto VALUES(21, "Ginocchiere 2.0 - Paio (2) - Black", "Accessori", "Nella strada per il miglioramento, le tue ginocchia potrebbero pagarne le conseguenze. Queste ginocchiere elastiche e robuste comprimono le ginocchia, aiutando ad alleviare la tensione e a proteggere le articolazioni.", "Prozis", "ginocchiere_prozis.jpg", 22, 28);
INSERT INTO Prodotto VALUES(22, "Weightlifting Knee Sleeves", "Accessori", "Per noi di Lacertosus®, quando si parla di sicurezza “troppo non è mai abbastanza” per questo abbiamo riprogettato interamente la nostra linea di lifting accessories migliorando sotto ogni aspetto, dal design accattivante ai migliori materiali, ogni singolo prodotto, dalla più piccola polsiera alla più rigida cintura! Disegnate per chi ambisce a superare il massimo, realizzate in neoprene traspirante della migliore qualità, le nuove weightlifting knee sleeves sono state ideate per migliorare la tua performance offrendo massimo supporto all’articolazione del ginocchio riducendo il rischio di infortunio. Ideali per tutte le tipologie di allenamento dal powerlifting al fitness generale, perfette per tutti gli esercizi dell’arto inferiore dallo squat agli affondi.", "Lacertosus", "ginocchiere_lacertosus.jpg", 22, 49);
INSERT INTO Prodotto VALUES(23, "Paracalli a 3 dita Cross Training NeoSuede - Paio (2) - Blue", "Accessori", "Nella strada per il miglioramento, le tue mani possono pagarne le conseguenze. Aumenta l'aderenza e concedi alle tue mani un po' di riposo durante tutti quegli esercizi di trazione e sollevamento. Noterai una differenza quando finirai l'allenamento.", "Prozis", "paracalli_prozis.jpg", 22, 28);
INSERT INTO Prodotto VALUES(24, "Lifting Belt", "Accessori", "Per noi di Lacertosus®, quando si parla di sicurezza “troppo non è mai abbastanza” per questo abbiamo riprogettato interamente la nostra linea di lifting accessories migliorando sotto ogni aspetto, dal design accattivante ai migliori materiali, ogni singolo prodotto, dalla più piccola polsiera alla più rigida cintura! La nuova lifting belt, racchiude lo stile unico del design Lacertosus in un prodotto di alta qualità, confortevole da indossare e resistente nel tempo. Realizzato con tessuti polimerici di pregiata fattura, la cintura offre un’ottima protezione e un’elevata stabilità durante esercizi impegnativi come stacchi o squat.", "Lacertosus", "cintura_lacertosus.jpg", 22, 75);
INSERT INTO Prodotto VALUES(25, "Cintura Powerlifting 10mm", "Accessori", "Lifting Belt Elite, la cintura da powerlifting a norme IPF in 100% vero cuoio italiano, un prodotto di alta manifattura per gli Atleti più esigenti.", "Lacertosus", "cintura_powerlifting_lacertosus.jpg", 22, 115);
INSERT INTO Prodotto VALUES(26, "100% Real Whey Protein 1000 g", "FoodAndBeverage", "La proteina whey è un integratore che non ha bisogno di presentazioni. Apprezzata per il suo imbattibile profilo nutrizionale, la proteina whey è una risorsa inestimabile per le persone attive. Quando ricavata da fonti della miglior qualità disponibile, un buon prodotto di proteina whey ti offre ciò di cui hai bisogno per raggiungere i tuoi obiettivi di aumento della massa muscolare. Grazie alla loro esperienza, il nostro team di nutrizionisti ed ingegneri alimentari ha seguito l'idea che le cose semplici sono le più efficaci ed ha creato il miglior integratore di proteina whey: 100% Real Whey Protein.", "Prozis", "proteine_prozis_1.jpg", 22, 33);
INSERT INTO Prodotto VALUES(27, "Xtreme Whey Protein SS 2000 g", "FoodAndBeverage", "La proteina whey ultra filtrata in Xtreme Whey è un'eccezionale fonte di amminoacidi a catena ramificata (BCAA) presenti in natura ed anche di glutammina e precursori, e contribuisce alla crescita ed al mantenimento della massa muscolare. Per rendere il processo di digestione proteica più facile per il tuo organismo, questa formula è stata arricchita con il complesso brevettato DigeZyme®, una miscela di enzimi digestivi. E, tocco finale, Xtreme Whey presenta 12 vitamine, incluse le vitamine C e D, per dare quel qualcosa in più.", "Prozis", "proteine_prozis_2.jpg", 22, 70);
INSERT INTO Prodotto VALUES(28, "Powa 2.0 300 g", "FoodAndBeverage", "Il nome POWA ha sempre significato innovazione ed un incredibile successo nell'universo XCORE. Quando questo rivoluzionario prodotto è stato lanciato la prima volta, è stato un vero trionfo. Negli ultimi 5 anni, la sua formula è stata scrupolosamente rielaborata ed i suoi ingredienti sono stati ulteriormente sviluppati e testati per degli effetti sinergici. Ora, sentiamo che abbiamo finalmente raggiunto un mondo nuovo. Un mondo più focalizzato ed esponenzialmente esplosivo, il mondo POWA, che è pronto per sfidare i limiti di tutto ciò che hai sempre creduto possibile.", "Prozis", "pre_prozis_1.jpg", 22, 33);
INSERT INTO Prodotto VALUES(29, "Big Shot - Pre-Workout 46 servings", "FoodAndBeverage", "Sei pronto a fare il colpaccio? Con questo stimolante pre-allenamento il tuo allenamento non sarà più lo stesso. Senti l'adrenalina ed ottieni tutta la concentrazione di cui hai bisogno per superare le sfide più difficili. Questa formula con ingredienti testati e trasparenza scientificamente provata, stabilirà un nuovo concetto di potenza e crescita, rivoluzionando il modo di allenarsi e di raggiungere i propri obiettivi di forza muscolare. Presto, verrai rinominato 'Big Shot' in palestra! Basta dare il meglio e superare i propri limiti!", "Prozis", "pre_prozis_2.jpg", 22, 27);
INSERT INTO Prodotto VALUES(30, "BCAA Drink 500 mL", "FoodAndBeverage", "Le tue giornate attive e impegnate andranno a meraviglia! Non ci sono dubbi! Goditi questa rinfrescante bevanda ricca di bontà e tieni alta l'idratazione e le tue forze tutti i giorni. Con un ottimo rapporto di BCAA, questa bevanda offre anche caffeina, vitamine del complesso B, magnesio e zinco, per darti forza per raggiungere i tuoi obiettivi. La parte migliore? Placherà la tua sete e risolleverà il tuo spirito. Basta un sorso: con la sua nuova formula e il gusto migliorato, non potrebbe essere più semplice!", "Prozis", "bevanda_prozis_1.jpg", 22, 2);
INSERT INTO Prodotto VALUES(31, "Amino X RTD 500 mL", "FoodAndBeverage", "Xcore AminoX è una deliziosa bevanda con BCAA, glutamina, zinco e magnesio, ideale da bere durante o dopo l'allenamento. È il modo più efficiente di ingerire proteine, che contribuiscono alla crescita della massa muscolare. Un sorso dopo l'altro, darai una nuova spinta al tuo benessere.", "Prozis", "bevanda_prozis_2.jpg", 22, 2);
INSERT INTO Prodotto VALUES(32, "Canottiera Script Men - Light Gray", "Abbigliamento", "La canottiera Script è una canottiera semplice, ma che permette le migliori prestazioni. La tecnologia TurboCotton© offre un assorbimento ottimale dell'umidità. Perfetta per allenamenti ad alta intensità.", "Prozis", "canotta_prozis.jpg", 22, 28);
INSERT INTO Prodotto VALUES(33, "Maglietta TurboWool - Black/Gray", "Abbigliamento", "Maglietta dalle elevate prestazioni che aiuta a regolare la temperatura corporea durante gli allenamenti e nel corso della giornata. Punti di raffreddamento strategici, per una migliore ventilazione delle aree ad elevata sudorazione. Vestibilità aderente, ma con eccellente potere elastico che permette libertà di movimento.", "Prozis", "tshirt_prozis.jpg", 22, 78);
INSERT INTO Prodotto VALUES(34, "Nike Alpha - Bra imbottito e regolabile a sostegno elevato - Donna", "Abbigliamento", "Questo bra offre il massimo sostegno con compression fit e massima stabilità, per un fit sicuro. Le imbottiture in schiuma tecnica offrono sostegno incapsulato e definizione ideale, mentre il fit regolabile sulla schiena dona una sensazione di comfort e una traspirabilità totale. La traspirabilità sul davanti e sul retro offre la giusta freschezza quando l'allenamento entra nel vivo. Questo prodotto è realizzato con fibre di poliestere riciclato per almeno il 50%.", "Nike", "bra_nike.jpg", 22, 65);
INSERT INTO Prodotto VALUES(35, "Nike Pro Flex Vent Max - Shorts - Uomo", "Abbigliamento", "Realizzati in un tessuto leggero ed elasticizzato, gli shorts Nike Pro Flex Vent Max seguono i movimenti del corpo durante gli allenamenti più intensi. La cintura elastica con risvolto consente di regolare il fit e tiene a posto gli shorts.", "Nike", "shorts_nike.jpg", 22, 45);
INSERT INTO Prodotto VALUES(36, "Leggings 7/8 Optime Power", "Abbigliamento", "Porta il tuo gioco al livello successivo grazie a questi leggings adidas. Realizzati in tessuto adimove elasticizzato in quattro direzioni per offrirti un supporto ottimale, ti donano un look unico e mantengono la forma anche durante le sessioni più intense. La tecnologia antiumidità AEROREADY ti aiuta a mantenere la pelle asciutta, mentre le cuciture ridotte al minimo eliminano ogni distrazione. Questo prodotto contiene almeno il 70% di materiali riciclati ed è solo una delle nostre azioni concrete per contrastare l'inquinamento causato dalla plastica.", "Adidas", "leggings_adidas.jpg", 22, 65);
INSERT INTO Prodotto VALUES(37, "Allenamento Beginner", "Allenamenti", "Il nostro team di esperti fitness e allenatori personali lavorerà a stretto contatto con te per comprendere le tue esigenze, i tuoi obiettivi e il tuo livello di fitness attuale. Il risultato? Un piano di allenamento completamente personalizzato che massimizza i tuoi risultati. Che tu voglia perdere peso, guadagnare massa muscolare, migliorare la tua resistenza o raggiungere un altro obiettivo specifico, abbiamo il piano perfetto per te. Offriamo piani per tutti i livelli di fitness, dai principianti agli atleti avanzati. I nostri piani di allenamento sono progettati per adattarsi al tuo stile di vita. Puoi scegliere tra allenamenti in palestra, a casa o all'aperto.", "WorkInProgress", "beginner.jpg", 22, 40);
INSERT INTO Prodotto VALUES(38, "Allenamento Intermediate", "Allenamenti", "Il nostro team di esperti fitness e allenatori personali lavorerà a stretto contatto con te per comprendere le tue esigenze, i tuoi obiettivi e il tuo livello di fitness attuale. Il risultato? Un piano di allenamento completamente personalizzato che massimizza i tuoi risultati. Che tu voglia perdere peso, guadagnare massa muscolare, migliorare la tua resistenza o raggiungere un altro obiettivo specifico, abbiamo il piano perfetto per te. Offriamo piani per tutti i livelli di fitness, dai principianti agli atleti avanzati. I nostri piani di allenamento sono progettati per adattarsi al tuo stile di vita. Puoi scegliere tra allenamenti in palestra, a casa o all'aperto.", "WorkInProgress", "intermediate.jpg", 22, 60);
INSERT INTO Prodorro VALUES(39, "Allenamento Pro", "Allenamenti", "Il nostro team di esperti fitness e allenatori personali lavorerà a stretto contatto con te per comprendere le tue esigenze, i tuoi obiettivi e il tuo livello di fitness attuale. Il risultato? Un piano di allenamento completamente personalizzato che massimizza i tuoi risultati. Che tu voglia perdere peso, guadagnare massa muscolare, migliorare la tua resistenza o raggiungere un altro obiettivo specifico, abbiamo il piano perfetto per te. Offriamo piani per tutti i livelli di fitness, dai principianti agli atleti avanzati. I nostri piani di allenamento sono progettati per adattarsi al tuo stile di vita. Puoi scegliere tra allenamenti in palestra, a casa o all'aperto.", "WorkInProgress", "pro.jpg", 22, 80);

CREATE TABLE Cliente(
	username VARCHAR(20) NOT NULL, 
    cf VARCHAR(16) NOT NULL,
    nome VARCHAR(30) NOT NULL,
    cognome VARCHAR(30) NOT NULL,
    via VARCHAR(50) NOT NULL,
    citta VARCHAR(30) NOT NULL,
    provincia VARCHAR(30) NOT NULL,
    cap VARCHAR(8) NOT NULL,
    telefono VARCHAR(21) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL, 
    psw VARCHAR(50) NOT NULL
);

INSERT INTO Cliente VALUES("WorkInProgress", "WRKPGR02D16D615Q", "WorkIn", "Progress", "Via Giovanni Paolo II, 132", "Fisciano", "Salerno", "84084", "3332578096", "WorkInProgress@gmail.com");
INSERT INTO Cliente VALUES("user1", "FRNDTS64B28F205S", "Franco", "DeVitis", "Via Luca Comerio, 1", "Milano", "Milano", "20145", "3436788001", "franco.devitis@gmail.com");
INSERT INTO Cliente VALUES("user2", "NTNBLT93L46G479R", "Antonia", "Borlotti", "Via Donato Creti, 19", "Bologna", "Bologna", "40128", "3299154789", "antonia.borlotti@gmail.com");

CREATE TABLE Indirizzo(
	id INT PRIMARY KEY AUTO_INCREMENT,
    via VARCHAR(50) NOT NULL,
    citta VARCHAR(30) NOT NULL,
    cap VARCHAR(8) NOT NULL,
    username VARCHAR(20) NOT NULL,
    FOREIGN KEY(username) REFERENCES Cliente(username)
		ON UPDATE CASCADE
        ON DELETE RESTRICT
);

INSERT INTO Cliente VALUES(1, "Via Paolo Lomazzo, 25", "Milano", "20145", "user1");
INSERT INTO Cliente VALUES(2, "Viale Cassiodoro, 4", "Milano", "20145", "user1");
INSERT INTO Cliente VALUES(3, "Via Di Saliceto, 4", "Bologna", "40128", "user2");

CREATE TABLE Metodo_di_pagamento(
	id INT PRIMARY KEY AUTO_INCREMENT,
    numero_carta VARCHAR(30) NOT NULL,
    cvv VARCHAR(4) NOT NULL,
    data_scadenza VARCHAR(15) NOT NULL,
    username VARCHAR(20) NOT NULL,
	FOREIGN KEY(username) REFERENCES Cliente(username)
		ON UPDATE CASCADE
        ON DELETE RESTRICT
);

INSERT INTO Metodo_di_pagamento VALUES(1, "123456789", "111", "2027-28-02", "user1");
INSERT INTO Metodo_di_pagamento VALUES(2, "987654321", "222", "2025-13-07", "user1");
INSERT INTO Metodo_di_pagamento VALUES(3, "998876412", "990", "2026-05-11", "user2");

CREATE TABLE Ordine(
	id INT PRIMARY KEY,
    username VARCHAR(20) NOT NULL,
    prezzo_totale FLOAT NOT NULL,
    destinatario VARCHAR(50) NOT NULL,
    metodo_di_pagamento VARCHAR(20) NOT NULL,
    circuito VARCHAR(20) NOT NULL,
    numero_carta VARCHAR(30) NOT NULL,
    indirizzo_di_spedizione VARCHAR(50) NOT NULL,
    numero_di_tracking VARCHAR(50) NOT NULL,
    note VARCHAR(100),
    data_ordine DATE NOT NULL,
    metodo_di_spedizione ENUM('Standard', 'Economic', 'Express') NOT NULL,
    confezione_regalo BOOLEAN NOT NULL,
    FOREIGN KEY(username) REFERENCES Cliente(username)
		ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE Fattura(
	sdi VARCHAR(8) PRIMARY KEY,
    importo FLOAT NOT NULL,
    data_scadenza VARCHAR(15) NOT NULL,
    data_emissione VARCHAR(15) NOT NULL,
    stato_del_pagamento VARCHAR(15),
    CHECK(stato_del_pagamento='Paid' OR stato_del_pagamento='Pending'),
    IVA FLOAT NOT NULL,
    id INT UNIQUE NOT NULL,
    FOREIGN KEY(id) REFERENCES Ordine(id)
		ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE Composizione(
	id INT NOT NULL,
    id_prodotto INT NOT NULL,
    prezzo FLOAT NOT NULL,
    quantita INT NOT NULL,
    IVA FLOAT NOT NULL,
    PRIMARY KEY(id, id_prodotto),
    FOREIGN KEY(id) REFERENCES Ordine(id)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
	FOREIGN KEY(id_prodotto) REFERENCES Prodotto(id_prodotto)
		ON UPDATE CASCADE
        ON DELETE RESTRICT
);