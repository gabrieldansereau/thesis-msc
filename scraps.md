# Mise en contexte

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

Idée simple: Si les LCBD étaient utilisées sur des prédictions réalisées par des modèles de répartition d'espèces, cela permettrait d'obtenir des prédictions d'unicité écologique spatialement explicite à grande échelle spatiale, permettant d'identifier, rapidement, des sites importants pour la conservation.

Or, identifier de tels endroits soulève trois enjeux importants: 1) la
définition de ce qui constitue réellement une zone clé ou un site de
biodiversité exceptionnelle; 2) la récolte de données permettant d'évaluer les
sites de manière efficace sur de grandes étendues spatiales; et 3) 

Or, bien définir ce qui constitue réellement une zone clé ou un site de
biodiversité exceptionnelle est une question complexe, en particulier lorsqu’il
est nécessaire de considérer différentes échelles spatiales au sein desquelles
la biodiversité varie différemment.

# Biodiversité 

La biodiversité peut difficilement être séparée de sa composante spatiale. La biodiversité ne peut être séparée de sa composante spatiale. Dimension spatiale.

La biodiversité peut difficilement être séparée de sa composante spatiale. La biodiversité ne peut être séparée de sa composante spatiale. Dimension spatiale.

« L'intérêt en écologie des communautés pour la diversité bêta découle du fait que la variation spatiale dans la composition en espèces permet de tester des hypothèses portant sur les processus qui génèrent et maintiennent la biodiversité dans les écosystèmes » [@Legendre2013BetDiv].

Voici une brève revue de l'historique de la diversité bêta, telle que suggérée par @Legendre2013BetDiv. Les concepts de alpha, bêta et gamma ont tout d'abord été présentés par Whittaker [-@Whittaker1960VegSis; -@Whittaker1972EvoMea] pour représenter les composantes de la diversité des espèces, telle qu'observée en milieu naturel.

La biodiversité comporte une dimension spatiale très importante, dont la conception a évolué avec le temps. Dans cette section, j'expliquerai comment celle-ci est passée d'une formulation théorique large à une mesure spatialement explicite, mesurant l'unicité écologique et pouvant être évaluée pour des endroits donnés, donc potentiellement importante en conservation. 

Dans le cadre du présent mémoire, trois phases importantes sont à retenir du développement du concept de diversité bêta, soit une première phase portant sur la définition de la diversité bêta même, une deuxième sur son partitionnement et une troisième sur son utilisation comme mesure spatialement explicite pour évaluer l'unicité écologique de sites spécifiques.

Depuis les premières formulations des composantes de la diversité des espèces par @Whittaker1960VegSis, une formulation étendue des concepts, l'attention s'est progressivement tournée vers le partitionnement de ces composantes, menant entre autres à la formulation d'une mesure spatialement explicite par @Legendre2013BetDiv pouvant être utilisée en conservation, et ce, y compris pour un très grand nombre de sites [@Niskanen2017DriHig] ou même sur des répartitions d'espèces prédites [@Vasconcelos2018ExpImp].

@Legendre2005AnaBet ont reformulé la diversité bêta comme la variation dans la composition en espèces entre les des sites d'une région géographique d'intérêt. En comparant les mesures de diversité bêta par la variance de la matrice de communautés et par le partitionnement de la variation en mesures de distance, ils ont également montré que la variance de la matrice des communautés est la bonne mesure et peut être partitionné par partitionnement canonique, alors que le partitionnement par mesure de distances est inapproprié [@Legendre2005AnaBet].

La diversité bêta représente la variation dans la composition en espèces au sein des sites d'une région géographique d'intérêt [@Legendre2005AnaBet].

@Koleff2003MeaBet ont également reformulé les mesures de diversité bêta pour effectuer des comparaison par paires, en fonction de trois composantes de concordance ou de non-concordance. Ainsi, pour une comparaison entre deux quadrats, $a$ est le nombre d'espèces partagées par les deux quadrats, $b$ est le nombre d'espèces absentes du quadrat focal, mais présentes dans le quadrat voisin, et $c$ est le nombre d'espèces présentes dans le quadrat focal, mais absentes dans le quadrat voisin. La recherche d'une valeur seule permettant de quantifier la variation a également mené à d'autres mesures, notamment les mesures additives et multiplicatives de @Jost2007ParDiv et de @Chao2012ProRes.

- Structure dans @Legendre2012NumEco & @Borcard2018NumEco
    - Deux aspects structure communautés: turnover, variation [@Anderson2011NavMul]
    - Approche multiplicative [@Whittaker1960VegSis; @Whittaker1972EvoMea]
        - Autres indices révisés par @Koleff2003MeaBet; @Tuomisto2010DivBet; @Anderson2011NavMul + @Chao2012ProRes ?
    - Approche additive [@Lande1996StaPar; @Veech2002AddPar] - Par site ou mesure générale?
    - Approche basée sur nombres de Hill [@Jost2007ParDiv]
    - ~Distances~
    - Calcul par variance [@Legendre2005AnaBet; @Legendre2013BetDiv]
    - Calcul par dissimilarité [@Anderson2006MulDis; @Anderson2011NavMul], puis [@Legendre2013BetDiv], peut-être @Legendre2005AnaBet ?
    - LCBD
    - Partitionnement en remplacement, différence de richesse, emboîtement
        - [@Legendre2014IntRep]
        - Famille indices Podani @Podani2011NewCon
        - Famille indices Baselga @Baselga2010ParTur; @Baselga2013MulSit

# Modèles 

L'étude de la biodiversité dans l'espace peut également profiter de l'essor des méthodes prédictives, entre autres celles issues de l'intelligence artificielle. Les modèles de répartition d'espèces (_species distribution models_, SDM) [@Guisan2005PreSpe] servent notamment à prédire la répartition des espèces en fonction des conditions environnementales à partir d'observations déjà réalisées. 

# Enjeux spatiaux

Puisque la mesure des LCBD n'a pas encore été utilisée à la fois à grande échelle spatiale et sur un très grand nombre de sites, une telle démarche doit s'accompagner de vérifications pour comprendre quels sites sont alors identifiés comme uniques.

Cependant, deux enjeux persistent quant à l'utilité de la mesure en conservation et pour la gestion des aires protégées, de même qu'en lien avec les déterminants d'une forte unicité écologique. 

Plusieurs études ont cherché à comprendre les déterminants d'une forte mesure d'unicité écologique telle qu'évaluée par le mesure des LCBD. Or, ceux-ci ont peu été étudiés à grande échelle spatiale et sur un très grand nombre de sites.

# Article

## Intro

Community-level analyses can be applied to the resulting community prediction, but this has been lacking for community measures other than species richness [@Ferrier2006SpaMod]. 

These alternative methods all have different strengths, but even S-SDM, in a sense the most simple and less community-specific method, has been shown to provide reliable community predictions [@Norberg2019ComEva; @Zurell2020TesSpe]. This is important, as in the context of large-scale studies with a high number of sites and species, reducing the model complexity with a simpler yet efficient model such as an S-SDM can reduce the number of computations in an important way. 

By comparison, S-SDMs may be a relevant for first step to establish some baselines for ecological uniqueness and LCBD indices, as these have rarely been used in predictive frameworks, and doing so would already raise important issues

Given that few studies have used LCBD indices and ecological uniqueness within predictive frameworks, applying them on S-SDMs might prove a valid first step to establish some baselines.