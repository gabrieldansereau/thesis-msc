# Introduction

Beta diversity, defined as the variation in species composition among sites in a
geographic region of interest [@Legendre2005AnaBet], is an essential measure to
describe the organization of biodiversity though space. Total beta diversity
within a community can be partitioned into local contributions to beta diversity
(LCBD) [@Legendre2013BetDiv], which allows the identification of sites with
exceptional species composition, hence unique biodiversity. Such a method,
focusing on specific sites, is useful for both community ecology and
conservation biology, as it highlights areas that are most important for their
research or conservation values. However, the use of LCBD indices is currently
limited in two ways. First, LBCD indices are typically used on data collected
over local or regional scales with relatively few sites, for example on fish
communities at intervals along a river or stream [@Legendre2013BetDiv]. Second,
LCBD calculation methods require complete information on community composition,
such as a community composition matrix $Y$; thus, they are inappropriate for
partially sampled sites (e.g. where data for some species is missing), let alone
for unsampled ones. Accordingly, the method is of limited use to identify areas
with exceptional biodiversity in regions with sparse sampling. However,
predictive approaches are increasingly common given the recent development of
computational methods, which often uncover novel ecological insights from
existing data [@Poisot2019DatSyn], including in unsampled or lesser-known
locations, as well as larger spatial scales. Here, we examine whether the LCBD
method can assess ecological uniqueness over broad and continuous scales based
on predictions of species distributions and evaluate whether this reveals novel
ecological insights regarding the identification of exceptional biodiversity
areas.

Species distribution models (SDMs) [@Guisan2005PreSpe] can bring a new
perspective to LCBD studies by filling in gaps and performing analyses on much
broader scales.  In a community matrix $Y$, such as required for LCBD
calculation, ecological communities are abstracted as assemblages of species
present at different sites. Viewing communities as such opens the perspective of
predicting community composition from predictions of individual species, which
is precisely the aim of SDMs. Community-level modelling from SDMs is not an
especially novel idea [@Ferrier2002ExtSta; @Ferrier2006SpaMod], but it is
increasingly relevant with the advent of large-scale, massive, and open data
sources on species occurrences, often contributed by citizens, such as eBird and
GBIF. At their core, SDMs aim at predicting the distribution of a species based
on information about where the species was previously reported, matched with
environmental data at those locations, and then make predictions at other
(unsampled) locations based on their respective environmental conditions.
However, going from single-species SDMs to a whole community is not a trivial
task, and many solutions have been suggested, such as stacked species
distribution models (S-SDMs) [@Ferrier2006SpaMod], spatially explicit species
assemblage modelling (SESAM) [@Guisan2011SesNew], joint species distribution
models (JSDMs) [@Pollock2014UndCoo], and hierarchical modelling of species
communities (HMSC) [@Ovaskainen2017HowMak]. These alternative methods all have
different strengths, but even S-SDM, in a sense the most simple and less
community-specific method, has been shown to provide reliable community
predictions [@Norberg2019ComEva; @Zurell2020TesSpe]. This is important, as in
the context of large-scale studies with a high number of sites and species,
reducing the model complexity with a simpler yet efficient model such as an
S-SDM can reduce the number of computations in an important way. Regardless of
the method used, community-level analyses can be applied to the resulting
community prediction, but this has been lacking for community measures other
than species richness [@Ferrier2006SpaMod]. Notably, the LCBD framework has, to
our knowledge, never been applied to SDM results. The computation of local
contributions to beta diversity (LCBD) on SDM predictions, however, raises the
issue of calculating the uniqueness scores on much larger community matrices
than on the typical scales on which it has been used. 

The total number of sites will increase (1) because of the continuous scale of
the predictions, as there will be more sites in the region of interest than the
number of sampled sites, and (2)  because of the larger spatial extent allowed
for the SDM predictions. A high number of SDM-predicted sites with a large
extent opens up the possibility of capturing a lot of variability of habitats­
and community composition, but also many very similar ones, which could change
the way that exceptional sites contribute to the overall variance in the
large-scale community. LCBD scores have typically been used at local or regional
scales with relatively few sites [@Legendre2013BetDiv; @daSilva2014LocReg;
@Heino2017UnrCor; @Heino2017ExpSpe]. Some studies did use the measure over
broader, near-continental extents [@Yang2015ComSim; @Poisot2017HosPar;
@Taranu2020LarMul], but the total number of sites in these studies was
relatively small. Recent studies also investigated LCBD and beta diversity on
sites distributed in grids or as pixels of environmental raster layers, hence
continuous scales, but these did not cover large extents and a high number of
sites [@Tan2017HowBet; @Tan2019UndPro; @Legendre2019SpaTem;
@DAntraccoli2020MorSpe]. @Niskanen2017DriHig predicted LCBD values of plant
communities (and three other diversity measures) on a continuous scale and a
high number of sites (> 25 000) using Boosted Regression Trees (BRTs). However,
they modelled the diversity measures directly instead of modelling species
distributions first, as we are suggesting here. They obtained lower predictive
accuracy for LCBD than for their other diversity measures, mentioning that it
highlighted the challenge of predicting LCBD specifically. They also computed
LCBD indices at a regional scale, not a continental one, while a using a fine
spatial resolution (1 km x 1 km). Therefore, the distribution of LCBD values at
broad, continuous scales with a high number of sites and predicted species
assemblages remains to be investigated.

Measuring ecological uniqueness from LCBD indices on extended continuous scales
also raises the question of which sites will be identified as exceptional and
for what reason. The method intends that sites should stand out and receive a
high LCBD score whenever they display an exceptional community composition, be
it a unique assemblage of species that may have a high conservation value or a
richer or poorer community than most in the region [@Legendre2013BetDiv]. Both
the original study and many of the later empirical ones have shown a negative
relationship between LCBD scores and species richness [@Legendre2013BetDiv;
@daSilva2014LocReg; @Heino2017UnrCor; @Heino2017ExpSpe], although other studies
observed both negative and positive relationships at different sites
[@Kong2017SpaVar] or quadrats [@Yao2021EcoUni]. Therefore, this relationship
should still be investigated, especially at broad continuous scales, where LCBD
indices have not yet been used. Total beta diversity increases with spatial
extent [@Barton2013SpaSca] and is strongly dependent on scale, notably because
of higher environmental heterogeneity and sampling of different local species
pool [@Heino2015ComAna], which could potentially add some variation to the
relationship. Neither the previous studies at broad spatial extents
[@Poisot2017HosPar; @Taranu2020LarMul; @Yang2015ComSim], on spatially continuous
data [@Tan2019UndPro; @DAntraccoli2020MorSpe], or on a high number of sites
[@Niskanen2017DriHig] have specifically measured the variations of the
richness-LCBD relationship according to different regions and spatial extents.
These studies brought forward relevant elements which now need to be combined.

This study shows that species distribution modelling offers relevant LCBD and
community-level predictions on broad spatial scales, similar to those obtained
from occurrence data and providing uniqueness assessments in poorly sampled
regions. Our results further highlight a changing relationship between site
richness and LCBD values depending on (i) the region on which it is used, as
species-poor and species-rich regions display different uniqueness profiles; and
on (ii) the scale at which it is applied, as increasing the spatial extent can
merge the uniqueness profiles of contrasting subregions to create a new,
distinct one at a broader scale. Hence, our method could prove useful to
identify beta diversity hotspots in unsampled locations on large spatial scales,
which could be important targets for conservation purposes.