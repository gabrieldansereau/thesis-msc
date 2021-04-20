# Introduction {-}

La diversité bêta, définie comme la variation dans la composition en espèces
entre les sites au sein d'une région géographique d'intérêt
[@Legendre2005AnaBet], est une mesure essentielle pour décrire l'organisation de
la biodiversité dans l'espace.

# Méthodes {-}

Nous avons mesuré comment l'unicité compositionnelle varie sur des échelles
spatiales étendues et continues. Nous avons utilisé _Julia v1.5.3_
[@Bezanson2017JulFre] pour la majorité des analyses et _R v4.0.2_ 
[@RCoreTeam2020RLan] pour certaines étapes spécifiques. Tous les scripts
utilisés pour les analyses sont disponibles au site
<https://github.com/gabrieldansereau/betadiversity-hotspots>.

## Données d'occurrence {-}

Nous avons restreint nos analyses à la famille des parulines du nouveau monde
(_Parulidae_) en Amérique du Nord (Canada, États-Unis, Mexique) à l'aide de la
librairie _R_ `auk`.