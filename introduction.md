<div style="text-align: justify">

# Avant-propos

Ce mémoire est parti d'une idée assez simple. Celle de combiner les grandes bases de données en ligne sur biodiversité et les méthodes d'intelligence artificielle pour prédire la distribution géographique des sites de biodiversité exceptionnelle. 

Il existe de nombreuses façons de mesurer la biodiversité et d'identifier les endroits où celle-ci est la plus exceptionnelle. Ces sites sont notamment importants à des fins de conservation et de gestion des aires protégées. Par contre, plusieurs de ces mesures ont été développées pour un petit nombre de sites ou d'espèces et nécessitent de connaître la composition en espèces exacte à un endroit donné. Or, la composition exacte est difficile, voire impossible, à connaître pour certains endroits, notamment en région éloignée, ce qui empêche l'utilisation de certaines mesures sur de très grandes échelles spatiales.

Des sources de données nouvelles se sont cependant développées récemment. Il s'agit notamment de bases de données en ligne massives comme GBIF, eBird et iNaturalist. Celles-ci sont imparfaites, mais contiennent tout de même beaucoup d'informations pouvant être mises à profit, notamment pour une évaluation de la biodiversité à grande étendue spatiale. Ces bases de données, largement basées sur des contributions citoyennes, sont cependant le reflet de biais déjà présents dans les données écologiques, notamment en faveur des villes, et ne règlent pas le manque de données en région éloignées.

D'un autre côté, nous assistons également au développement de méthodes prédictives en intelligence artificielle de plus en plus poussées et de plus en plus performantes. Celles-ci offrent la possibilité d'obtenir des prédictions assez justes pour la distribution des espèces, ainsi que des inférences compensant entre autres pour le manque de données.

Par contre, regrouper ces différents éléments, les bases de données massives et les méthodes d'intelligence artificielle, pour la prédiction de la biodiversité soulève des questions d'applicabilité, puisque les mesures de biodiversité et le cadre théorique derrière celles-ci n'ont justement pas été développées pour une échelle aussi étendue et un si grand volume de données.

Mon projet est donc à la jonction de ces éléments. J'ai exploré les bases de données et les méthodes prédictives, puis j'ai cherché à vérifier comment elles peuvent s'intégrer avec les mesures de biodiversité actuelles, en particulier pour comprendre ce qu'elles font ressortir lorsque utilisées de cette façon. Je souhaite que ces travaux amènent une nouvelle vue des possibilités actuellement ouvertes, ainsi qu'une nouvelle compréhension des concepts soulevés. J'espère que ceux-ci pourront être utiles pour la conservation et la gestion des aires protégées.

- Idée simple
- Mesures pour biodiversité --> identification sites exceptionnels
    - MAIS besoin composition en espèces exacte
    - Donc impossible pour certains endroits
    - Particulièrement plus difficile pour grandes étendues spatiales
- Grandes bases de données sur biodiversité
    - Reflet des biais échantillonnages --> surtout villes, peu données au Nord
- Méthodes d'intelligence artificielle + en + performantes
    - Possibilité prédictions justes, inférences compensant manque données
- Or, soulève questions sur l'applicabilité des mesures, sur ce qu'elles montrent réellement.

Idée simple: Si les LCBD étaient utilisées sur des prédictions réalisées par des modèles de distribution d'espèces, cela permettrait d'obtenir des prédictions d'unicité écologique spatialement explicite à grande échelle spatiale, permettant d'identifier, rapidement, des sites importants pour la conservation.

# Mise en contexte

L’identification des zones clés de biodiversité est l’une des priorités pour la conservation et la gestion des aires protégées. En particulier, il y a actuellement un besoin pour développer des méthodes permettant d'identifier les sites les plus importants pour la biodiversité de façon efficace sur de grandes étendues spatiales. Or, identifier de tels endroits implique plusieurs questions complexes. En premier, il est nécessaire de définir ce que constituent des zones clés de biodiversité. Plusieurs définitions et plusieurs mesures ont été suggérées à ce sujet, mais celles-ci varient généralement quand à l'étendue spatiale ou aux régions ciblées. Ensuite, au-delà de la définition de la biodiversité, il est nécessaire de trouver des données qui permettent d'évaluer avec justesse le caractère unique ou exceptionnel des sites. La récolte de données en écologie est parfois difficile à certains endroits, par exemple pour certaines régions éloignées. Lorsque nécessaire, les observations directes peuvent parfois être remplacées par des prédictions réalisées à partir de données plus générales. Par contre, une panoplie de méthodes prédictives existent et la plupart d'entre elles n'ont pas été évaluées spécifiquement avec certaines mesures de biodiversité. Finalement, il est également nécessaire d'adapter à la fois les mesures de biodiversité et les méthodes prédictives aux grandes étendues spatiales. La biodiversité varie parfois différemment en fonction des échelles. Il en est de même quand à la performance des mesures. Intégrer le tout peut donc s'avérer complexe et implique d'avoir une compréhension développée des définitions de la biodiversité, des données et des méthodes disponibles, ainsi que des facteurs pouvant influencer la biodiversité en fonction des échelles spatiales.

Dans mon mémoire, je me suis intéressé à cette question en cherchant à vérifier l'applicabilité d'une mesure donnée, celles des contributions locales à la diversité bêta, pour identifier les zones de biodiversité exceptionnelle à grande étendue spatiale. De plus, j'ai cherché à vérifier si cette méthode pouvait être appliquée à des prédictions de distribution d'espèces produites à partir de données provenant de grandes bases de données citoyennes. Mon mémoire est donc divisé en trois sections. La première comporte une mise en contexte, ainsi qu'une revue de littérature présentant les concepts pertinents. La seconde partie consiste en un article scientifique présentant les résultats de mes travaux et analyses. La dernière partie consiste en un retour sur les résultats, en lien avec la mise en contexte présentée dans la première section.

# Biodiversité

La biodiversité comporte une composante spatiale très importante, dont la conception a évolué avec le temps. Dans cette section, j'expliquerai comment celle-ci est passée d'une formulation théorique large à une mesure spatialement explicite mesurant l'unicité écologique et pouvant être évaluée pour des endroits donnés. 

Depuis les premières formulations des composantes de la diversité des espèces par @Whittaker1960VegSis, une formulation étendue des concepts, l'attention s'est progressivement tournée vers le partitionnement de ces composantes, menant entre autres à la formulation d'une mesure spatialement explicite par @Legendre2013BetDiv pouvant être utilisée en conservation, et ce, y compris pour un très grand nombre de sites [@Niskanen2017DriHig] ou même sur des distributions d'espèces prédites [@Vasconcelos2018ExpImp].

@Whittaker1960VegSis a détaillé trois composantes de la diversité des espèces au sein des communautés écologiques: 1) la diversité alpha, soit la richesse en espèce d'un site ou d'une communauté donnée, 2) la diversité beta, qui représente le degré de différenciation dans les composition des communautés au sein d'un environnement, et 3) la diversité gamma, soit la richesse en espèces des communautés d'un environnement une fois regroupées, de sorte que la diversité gamma est le résultat à la fois des diversités alpha et beta.

Sous cette formulation initiale, la diversité bêta peut être mesurée comme le ratio entre la diversité gamma et la diversité alpha moyenne des sites d'un échantillon, autrement dit le ratio entre le nombre d'espèces totales et le nombre d'espèces moyen [@Whittaker1960VegSis; @Whittaker1972EvoMea].

La diversité bêta représente la variation dans la composition en espèces au sein des sites d'une région géographique d'intérêt [@Legendre2005AnaBet].

La diversité bêta totale au sein d'une communauté peut, entre autres, être décomposée en contributions locales à la diversité bêta (_local contributions to beta diversity_, LCBD), ce qui permet d'identifier les sites possédant une composition en espèces exceptionnelle, donc une biodiversité unique [@Legendre2013BetDiv].

La plupart des études ayant utilisé la mesure des LCBD l'ont utilisé à échelle locale, donc sur des étendues spatiales restreintes, et sur un petit nombre de sites [@Legendre2013BetDiv; @daSilva2014LocReg; @Heino2017ExpSpe; @Heino2017UnrCor]. Par exemple, l'étude ayant présenté la mesure l'a utilisé sur des communautés de poissons échantillonnées à intervalles le long d'une rivière [@Legendre2013BetDiv].

Quelques études ont utilisé la mesure des LCBD sur de plus grandes étendues spatiales, donc comportant potentiellement une plus forte hétérogénéité spatiale, mais ces études comportaient un nombre de sites assez faible [@Yang2015ComSim; @Poisot2017HosPar; @Taranu2020LarMul].

Quelques études récentes l'ont utilisée sur des données arrangées en grille, donc spatialement continues [@Tan2017HowBet; @Tan2019UndPro; @Legendre2019SpaTem; @DAntraccoli2020MorSpe]. Cependant, celles-ci portaient également sur des échelles spatiales restreintes. 

Une étude récente l'a utilisée sur un grand nombre de sites [@Niskanen2017DriHig]. Cette dernière a également cherché à prédire la mesure directement en fonction de conditions environnementales.

Une avenue intéressante a été exploré par @Vasconcelos2018ExpImp en utilisant la mesure sur des prédictions réalisés par des modèles de distribution d'espèces en fonction des conditions climatiques actuelles et de scénarios de changements climatiques. 

# Données

De plus en plus de données sont disponibles en ligne, et ce, massivement. Il faut donc passer vers une approche dirigée par les données disponibles dans une optique de synthèse, ce qui permet généralement de révéler de nouvelles informations écologiques à partir de données existantes[@Poisot2019DatSyn].

De grandes bases de données sur la biodiversité fournissent des informations écologiques à exploiter, notamment eBird, GBIF et iNaturalist.

En même temps, nous disposons désormais de données de plus en plus précises sur les conditions environnementales partout sur le globe. Par exemple, WorldClim et CHELSA fournissent des données climatiques, alors que Copernicus et EarthEnv fournissent des informations sur l'utilisation du territoire. Dans les deux cas, ces informations sont parfois disponibles à des échelles spatiales très fines. 

# Modèles

L'étude de la biodiversité dans l'espace peut également profiter de l'essor des méthodes prédictives, entre autres celles issues de l'intelligence artificielle. Les modèles de distribution d'espèces (_species distribution models_, SDM) [@Guisan2005PreSpe] servent notamment à prédire la distribution des espèces en fonction des conditions environnementales à partir d'observations déjà réalisées. 

Il existe une grande variété de SDM, allant des premiers modèles comme BIOCLIM [@Nix1986BioAna], à des modèles plus récents comme MAXENT [@Phillips2006MaxEnt; @Phillips2008ModSpe] et à différentes méthodes apparentées à l'intelligence artificielle (et non spécifique à la distribution d'espèces), notamment les _Randoms Forests_ [@Breiman2001RanFor] ou encore les _Boosted Regression Trees_ [@Elith2008WorGui].

@Carlson2020EmbSpe ont récemment suggéré d'utiliser les _Bayesian Additive Regression Trees_ (BART)[@Chipman2010BarBay] pour les SDM, ce qui permet d'obtenir de meilleurs résultats en réduisant le sur-ajustement, tout en permettant d'évaluer l'incertitude sous une formulation bayésienne.

Plusieurs de ces méthodes représentent toutefois des méthodes d'apprentissage supervisé, de sorte qu'elles ont besoin d'être entraînées sur des données déjà étiquetées. La principale conséquence au niveau des SDM est donc le besoin de disposer de données d'absence, en plus de données de présence, afin de pouvoir entraîner les algorithmes. Or, les données d'absence sont plus difficiles à obtenir, notamment en raison du problème du double-zéro [@Legendre2012NumEco]. 

La base de données _eBird_ comporte toutefois un avantage à ce sujet, puisqu'il s'agit d'une base de données semi-structurée [@Johnston2020AnaGui]. Les données (et donc les observations) y sont structurées par listes d'observations. En rapportant leurs observations, les utilisateurs doivent déclarer si celles-ci constituent une liste complète des espèces détectées lors de leur échantillonnage. Ainsi, cela permet un peu plus justement d'inférer la non-détection d'autres espèces

Plusieurs méthodes ont été suggérées afin de réaliser des prédictions au niveau de la communauté à partir de SDM. La méthode la plus simple consiste à réaliser des prédictions séparées pour chaque espèce présente dans la communauté, puis à superposer les prédictions (_stacked SDM_, S-SDM ), de façon à connaître la composition en espèces pour chaque site d'une région d'intérêt [@Ferrier2002ExtSta; @Ferrier2006SpaMod]. Des méthodes plus complexes ont également été suggérées, notamment par @Guisan2011SesNew, @Pollock2014UndCoo, @Ovaskainen2017HowMak et @Staniczenko2017LinMac. Ces modèles ont l'avantage de prendre en compte plusieurs facteurs supplémentaires affectant la distribution des espèces, comme la co-occurrence entre les espèces, mais ils sont cependant plus complexes à réaliser.  Malgré leur simplicité, les S-SDM offrent toutefois des résultats comparables aux autres modèles quant aux prédictions de valeurs concernant les communautés [@Norberg2019ComEva; @Zurell2020TesSpe].

# Enjeux spatiaux

Plusieurs études ont cherché à comprendre les déterminants d'une forte mesure d'unicité écologique telle qu'évaluée par le mesure des LCBD.

Or, ceux-ci ont peu été étudiés à grande échelle spatiale et sur un très grand nombre de sites.

Selon la formulation initiale de @Legendre2013BetDiv, les LCBD devraient normalement identifier les sites les plus uniques, que ce soit en raison de leur nombre d'espèces élevé ou faible, d'une composition particulière dans une région ou en raison de la présence d'espèces rares. 

Leur exemple initial a montré une relation négative entre la richesse spécifique et la valeur d'unicité [@Legendre2013BetDiv]. Ainsi, les sites les plus pauvres ressortent comme les plus uniques.

Cette relation négative également été observée dans la plupart des études ayant repris la mesure [@Heino2017UnrCor], mais d'autres études ont montré que la relation pouvait également être positive  [@Kong2017SpaVar].

Certaines études ont avancé que cette relation serait influencée par la présence d'espèces rares dans la communauté [@Yao2019VarCom]. La relation serait positive lorsque la proportion d'espèces rares est plus élevée.

Par contre, la rareté est complexe à définir, en particulier sur de grandes étendues spatiales, où, par exemple, certaines espèces peuvent être très communes à échelle locale dans une région donnée, mais rares pour l'ensemble de la région, ce qui pourrait influencer la relation richesse-LCBD.

De plus, la diversité bêta totale augmente avec l'étendue spatiale [@Barton2013SpaSca] et dépend de l'échelle, notamment en raison de l'augmentation de l'hétérogénéité spatiale, ainsi qu'en raison du recoupement de bassins d'espèces locaux différents [@Heino2015ComAna]. 