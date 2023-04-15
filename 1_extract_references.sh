#!/bin/bash


###Insert the taxon name for your reference of interest between the first two "/   /"
### Note that for some species (e.g., Polypodium hesperium), there are two references in the reference library
###For these species, indicate the reference number in the tag to disambiguate between them (e.g., "Polypodium_hesperium_2")


awk '/Thelypteris/ {print; getline; print}' combinedTarget.fasta > ref_seq.fasta

awk '/Woodsia_scopulina/ {print; getline; print}' combinedTarget.fasta >> ref_seq.fasta ###add additional ref if needed

sed -E "s/>L([0-9]*)_.*_.*_(.*_.*)_[1-2]__REF/>\2-\1/g" ref_seq.fasta > target.fa


rm ref_seq.fasta


#### The first column shows the number of loci for which there are data for each reference
#331 Cycadales_Cycadales_Cycas_micholitzii_1__REF
#272 Cycadales_Cycadales_Dioon_edule_1__REF
#349 Cycadales_Cycadales_Encephalartos_barteri_1__REF
#361 Cycadales_Cycadales_Stangeria_eriopus_1__REF
#227 EusporangiateMonilophytes_Equisetales_Equisetum_diffusum_1__REF
#330 EusporangiateMonilophytes_Equisetales_Equisetum_hyemale_1__REF
#181 EusporangiateMonilophytes_Marattiales_Angiopteris_evecta_1__REF
#390 EusporangiateMonilophytes_Marattiales_Danaea_nodosa_1__REF
#332 EusporangiateMonilophytes_Marattiales_Marattia_attenuata_1__REF
#252 EusporangiateMonilophytes_Ophioglossales_Botrypus_virginianus_1__REF
#291 EusporangiateMonilophytes_Ophioglossales_Ophioglossum_petiolatum_1__REF
#404 EusporangiateMonilophytes_Ophioglossales_Sceptridium_dissectum_1__REF
#300 EusporangiateMonilophytes_Psilotales_Psilotum_nudum_1__REF
#309 EusporangiateMonilophytes_Psilotales_Tmesipteris_parva_1__REF
#228 Ginkgoales_Ginkgoales_Ginkgo_biloba_1__REF
#128 Gnetales_Ephedra_sinica_1__REF
#368 Gnetales_Gnetum_montanum_1__REF
#370 Gnetales_Welwitschia_mirabilis_1__REF
#370 Hornworts_Anthocerotales_Anthoceros_agrestis_1__REF
#340 Hornworts_Anthocerotales_Anthoceros_agrestis_2__REF
#282 Hornworts_Anthocerotales_Leiosporoceros_dussii_1__REF
#230 Hornworts_Anthocerotales_Nothoceros_aenigmaticus_1__REF
#336 Hornworts_Anthocerotales_Nothoceros_vincentianus_1__REF
#334 Hornworts_Anthocerotales_Paraphymatoceros_hallii_1__REF
#378 Hornworts_Anthocerotales_Phaeoceros_carolinianus_1__REF
#337 Hornworts_Anthocerotales_Phaeoceros_carolinianus_2__REF
#349 Hornworts_Dendrocerotales_Megaceros_flagellaris_1__REF
#354 Hornworts_Dendrocerotales_Phaeomegaceros_coriaceus_1__REF
#353 LeptosporangiateMonilophytes_Azolla_genome__REF
#239 LeptosporangiateMonilophytes_Cyatheales_Alsophila_pinulosa_1__REF
#302 LeptosporangiateMonilophytes_Cyatheales_Culcita_macrocarpa_1__REF
#316 LeptosporangiateMonilophytes_Cyatheales_Plagiogyria_japonica_1__REF
#303 LeptosporangiateMonilophytes_Cyatheales_Thyrsopteris_elegans_1__REF
#359 LeptosporangiateMonilophytes_Gleicheniales_Dipteris_conjugata_1__REF
#186 LeptosporangiateMonilophytes_Hymenophyllales_Hymenophyllum_bivalve_1__REF
#405 LeptosporangiateMonilophytes_Osmundales_Osmunda_javanica_1__REF
#382 LeptosporangiateMonilophytes_Osmundales_Osmunda_sp_1__REF
#388 LeptosporangiateMonilophytes_Osmundales_Osmundastrum_cinnamomeum_1__REF
#310 LeptosporangiateMonilophytes_Polypodiales_Adiantum_aleuticum_1__REF
#368 LeptosporangiateMonilophytes_Polypodiales_Adiantum_raddianum_1__REF
#376 LeptosporangiateMonilophytes_Polypodiales_Argyrochosma_nivea_1__REF
#357 LeptosporangiateMonilophytes_Polypodiales_Asplenium_cf_x_lucrosum_1__REF
#210 LeptosporangiateMonilophytes_Polypodiales_Asplenium_nidus_1__REF
#362 LeptosporangiateMonilophytes_Polypodiales_Asplenium_platyneuron_1__REF
#352 LeptosporangiateMonilophytes_Polypodiales_Athyrium_sp_1__REF
#367 LeptosporangiateMonilophytes_Polypodiales_Blechnum_spicant_1__REF
#223 LeptosporangiateMonilophytes_Polypodiales_Bolbitis_repanda_1__REF
#381 LeptosporangiateMonilophytes_Polypodiales_Ceratopteris_thalictroides_1__REF
#397 LeptosporangiateMonilophytes_Polypodiales_Cryptogramma_acrostichoides_1__REF
#409 LeptosporangiateMonilophytes_Polypodiales_Cystopteris_fragilis_1__REF
#354 LeptosporangiateMonilophytes_Polypodiales_Cystopteris_fragilis_2__REF
#325 LeptosporangiateMonilophytes_Polypodiales_Cystopteris_protrusa_1__REF
#310 LeptosporangiateMonilophytes_Polypodiales_Cystopteris_reevesiana_1__REF
#306 LeptosporangiateMonilophytes_Polypodiales_Cystopteris_utahensis_1__REF
#306 LeptosporangiateMonilophytes_Polypodiales_Davallia_fejeensis_1__REF
#333 LeptosporangiateMonilophytes_Polypodiales_Dennstaedtia_davallioides_1__REF
#151 LeptosporangiateMonilophytes_Polypodiales_Didymochlaena_truncatula_1__REF
#401 LeptosporangiateMonilophytes_Polypodiales_Diplazium_wichurae_1__REF
#383 LeptosporangiateMonilophytes_Polypodiales_Gaga_arizonica_1__REF
#325 LeptosporangiateMonilophytes_Polypodiales_Gymnocarpium_dryopteris_1__REF
#317 LeptosporangiateMonilophytes_Polypodiales_Homalosorus_pycnocarpos_1__REF
#394 LeptosporangiateMonilophytes_Polypodiales_Leucostegia_immersa_1__REF
#384 LeptosporangiateMonilophytes_Polypodiales_Lindsaea_linearis_1__REF
#304 LeptosporangiateMonilophytes_Polypodiales_Lindsaea_microphylla_1__REF
#394 LeptosporangiateMonilophytes_Polypodiales_Lonchitis_hirsuta_1__REF
#361 LeptosporangiateMonilophytes_Polypodiales_Myriopteris_rufa_1__REF
#248 LeptosporangiateMonilophytes_Polypodiales_Nephrolepis_exaltata_1__REF
#319 LeptosporangiateMonilophytes_Polypodiales_Notholaena_montieliae_1__REF
#228 LeptosporangiateMonilophytes_Polypodiales_Onoclea_sensibilis_1__REF
#316 LeptosporangiateMonilophytes_Polypodiales_Parahemionitis_cordata_1__REF
#269 LeptosporangiateMonilophytes_Polypodiales_Phlebodium_pseudoaureum_1__REF
#319 LeptosporangiateMonilophytes_Polypodiales_Phymatosorus_grossus_1__REF
#350 LeptosporangiateMonilophytes_Polypodiales_Pityrogramma_trifoliata_1__REF
#258 LeptosporangiateMonilophytes_Polypodiales_Pleopeltis_polypodioides_1__REF
#380 LeptosporangiateMonilophytes_Polypodiales_Polypodium_amorphum_1__REF
#395 LeptosporangiateMonilophytes_Polypodiales_Polypodium_glycyrrhiza_1__REF
#361 LeptosporangiateMonilophytes_Polypodiales_Polypodium_hesperium_1__REF
#357 LeptosporangiateMonilophytes_Polypodiales_Polypodium_hesperium_2__REF
#302 LeptosporangiateMonilophytes_Polypodiales_Polystichum_acrostichoides_1__REF
#305 LeptosporangiateMonilophytes_Polypodiales_Pteris_ensiformis_1__REF
#369 LeptosporangiateMonilophytes_Polypodiales_Pteris_vittata_1__REF
#255 LeptosporangiateMonilophytes_Polypodiales_Thelypteris_acuminata_1__REF
#408 LeptosporangiateMonilophytes_Polypodiales_Vittaria_appalachiana_1__REF
#320 LeptosporangiateMonilophytes_Polypodiales_Vittaria_lineata_1__REF
#310 LeptosporangiateMonilophytes_Polypodiales_Woodsia_ilvensis_1__REF
#342 LeptosporangiateMonilophytes_Polypodiales_Woodsia_scopulina_1__REF
#375 LeptosporangiateMonilophytes_Salvinia_genome__REF
#337 LeptosporangiateMonilophytes_Salviniales_Azolla_cf_caroliniana_1__REF
#367 LeptosporangiateMonilophytes_Salviniales_Pilularia_globulifera_1__REF
#331 LeptosporangiateMonilophytes_Schizaeales_Anemia_tomentosa_1__REF
#271 LeptosporangiateMonilophytes_Schizaeales_Lygodium_japonicum_1__REF
#304 Liverworts_Jungermanniales_Barbilophozia_barbata_1__REF
#309 Liverworts_Jungermanniales_Bazzania_trilobata_1__REF
#257 Liverworts_Jungermanniales_Calypogeia_fissa_1__REF
#319 Liverworts_Jungermanniales_Odontoschisma_prostratum_1__REF
#407 Liverworts_Jungermanniales_Scapania_nemorosa_1__REF
#385 Liverworts_Jungermanniales_Schistochila_sp_1__REF
#383 Liverworts_Lunulariales_Lunularia_cruciata_1__REF
#379 Liverworts_Marchantiales_Conocephalum_conicum_1__REF
#222 Liverworts_Marchantiales_Marchantia_emarginata_1__REF
#387 Liverworts_Marchantiales_Marchantia_paleacea_1__REF
#330 Liverworts_Marchantiales_Marchantia_polymorpha_1__REF
#350 Liverworts_Marchantiales_Ricciocarpos_natans_1__REF
#321 Liverworts_Metzgeriales_Metzgeria_crassipilis_1__REF
#345 Liverworts_Pallaviciniales_Pallavicinia_lyellii_1__REF
#386 Liverworts_Pelliales_Pellia_cf_epiphylla_1__REF
#363 Liverworts_Pelliales_Pellia_neesiana_1__REF
#298 Liverworts_Porellales_Frullania_sp_1__REF
#383 Liverworts_Porellales_Porella_navicularis_1__REF
#322 Liverworts_Porellales_Porella_pinnata_1__REF
#404 Liverworts_Porellales_Radula_lindenbergiana_1__REF
#311 Liverworts_Ptilidiales_Ptilidium_pulcherrimum_1__REF
#307 Liverworts_Sphaerocarpales_Sphaerocarpos_texanus_1__REF
#369 Lycophytes_Isoetales_Isoetes_sp_1__REF
#402 Lycophytes_Isoetales_Isoetes_tegetiformans_1__REF
#299 Lycophytes_Lycopodiales_Dendrolycopodium_obscurum_1__REF
#332 Lycophytes_Lycopodiales_Diphasiastrum_digitatum_1__REF
#357 Lycophytes_Lycopodiales_Huperzia_lucidula_1__REF
#279 Lycophytes_Lycopodiales_Huperzia_myrsinites_1__REF
#373 Lycophytes_Lycopodiales_Huperzia_selago_1__REF
#258 Lycophytes_Lycopodiales_Huperzia_squarrosa_1__REF
#260 Lycophytes_Lycopodiales_Lycopodiella_appressa_1__REF
#334 Lycophytes_Lycopodiales_Lycopodium_annotinum_1__REF
#375 Lycophytes_Lycopodiales_Lycopodium_deuterodensum_1__REF
#300 Lycophytes_Lycopodiales_Phylloglossum_drummondii_1__REF
#332 Lycophytes_Lycopodiales_Pseudolycopodiella_caroliniana_1__REF
#326 Lycophytes_Selaginellales_Selaginella_acanthonota_1__REF
#315 Lycophytes_Selaginellales_Selaginella_apoda_1__REF
#310 Lycophytes_Selaginellales_Selaginella_cf_pallescens_1__REF
#376 Lycophytes_Selaginellales_Selaginella_kraussiana_1__REF
#410 Lycophytes_Selaginellales_Selaginella_moellendorffii_1__REF
#349 Lycophytes_Selaginellales_Selaginella_moellendorffii_1__REF
#317 Lycophytes_Selaginellales_Selaginella_selaginoides_1__REF
#335 Lycophytes_Selaginellales_Selaginella_wallacei_1__REF
#321 Lycophytes_Selaginellales_Selaginella_willdenowii_1__REF
#385 Mosses_Andreaeales_Andreaea_rupestris_1__REF
#375 Mosses_Bartramiales_Philonotis_fontana_1__REF
#293 Mosses_Bryales_Bryum_argenteum_1__REF
#292 Mosses_Bryales_Plagiomnium_insigne_1__REF
#267 Mosses_Bryales_Rosulabryum_cf_capillare_1__REF
#381 Mosses_Buxbaumiales_Buxbaumia_aphylla_1__REF
#364 Mosses_Buxbaumiales_Diphyscium_foliosum_1__REF
#349 Mosses_Dicranales_Ceratodon_purpureus_1__REF
#347 Mosses_Dicranales_Dicranum_scoparium_1__REF
#398 Mosses_Dicranales_Leucobryum_albidum_1__REF
#330 Mosses_Dicranales_Leucobryum_glaucum_1__REF
#324 Mosses_Encalyptales_Encalypta_streptocarpa_1__REF
#360 Mosses_Funariales_Physcomitrella_patens_1__REF
#351 Mosses_Funariales_Physcomitrium_sp_1__REF
#318 Mosses_Grimmiales_Racomitrium_elongatum_1__REF
#387 Mosses_Grimmiales_Racomitrium_varium_1__REF
#381 Mosses_Grimmiales_Scouleria_aquatica_1__REF
#377 Mosses_Hedwigiales_Hedwigia_ciliata_1__REF
#352 Mosses_Hypnales_Anomodon_attenuatus_1__REF
#328 Mosses_Hypnales_Calliergon_cordifolium_1__REF
#402 Mosses_Hypnales_Claopodium_rostratum_1__REF
#256 Mosses_Hypnales_Climacium_dendroides_1__REF
#315 Mosses_Hypnales_Fontinalis_antipyretica_1__REF
#388 Mosses_Hypnales_Leucodon_brachypus_1__REF
#386 Mosses_Hypnales_Leucodon_julaceus_1__REF
#326 Mosses_Hypnales_Loeskeobryum_brevirostre_1__REF
#398 Mosses_Hypnales_Neckera_douglasii_1__REF
#390 Mosses_Hypnales_Pseudotaxiphyllum_elegans_1__REF
#343 Mosses_Hypnales_Rhynchostegium_serrulatum_1__REF
#326 Mosses_Hypnales_Stereodon_subimponens_1__REF
#287 Mosses_Hypnales_Thuidium_delicatulum_1__REF
#336 Mosses_Polytrichales_Atrichum_angustatum_1__REF
#272 Mosses_Polytrichales_Polytrichum_commune_1__REF
#298 Mosses_Pottiales_Syntrichia_princeps_1__REF
#379 Mosses_Rhizogoniales_Aulacomnium_heterostichum_1__REF
#403 Mosses_Rhizogoniales_Orthotrichum_lyellii_1__REF
#296 Mosses_Sphagnales_Sphagnum_lescurii_1__REF
#348 Mosses_Sphagnales_Sphagnum_palustre_1__REF
#357 Mosses_Sphagnales_Sphagnum_recurvum_1__REF
#367 Mosses_Takakiales_Takakia_lepidozioides_1__REF
#340 Mosses_Tetraphidales_Tetraphis_pellucida_1__REF
#353 Mosses_Timmiales_Timmia_austriaca_1__REF
#412 Pinales_Abies_lasiocarpa_1__REF
#408 Pinales_Acmopyle_pancheri_1__REF
#311 Pinales_Agathis_robusta_1__REF
#362 Pinales_Amentotaxus_argotaenia_1__REF
#359 Pinales_Araucaria_rulei_1__REF
#358 Pinales_Araucaria_sp_1__REF
#402 Pinales_Athrotaxis_cupressoides_1__REF
#432 Pinales_Austrocedrus_chilensis_1__REF
#326 Pinales_Austrotaxus_spicata_1__REF
#283 Pinales_Callitris_gracilis_1__REF
#416 Pinales_Callitris_macleayana_1__REF
#364 Pinales_Calocedrus_decurrens_1__REF
#231 Pinales_Cathaya_argyrophylla_1__REF
#270 Pinales_Cedrus_libani_1__REF
#430 Pinales_Cephalotaxus_harringtonia_1__REF
#383 Pinales_Chamaecyparis_lawsoniana_1__REF
#426 Pinales_Cryptomeria_japonica_1__REF
#392 Pinales_Cunninghamia_lanceolata_1__REF
#363 Pinales_Cupressus_dupreziana_1__REF
#394 Pinales_Dacrycarpus_compactus_1__REF
#340 Pinales_Dacrydium_balansae_1__REF
#396 Pinales_Diselma_archeri_1__REF
#359 Pinales_Falcatifolium_taxoides_1__REF
#351 Pinales_Falcatifolium_taxoides_2__REF
#364 Pinales_Fokienia_hodginsii_1__REF
#392 Pinales_Glyptostrobus_pensilis_1__REF
#403 Pinales_Halocarpus_bidwillii_1__REF
#271 Pinales_Juniperus_scopulorum_1__REF
#318 Pinales_Keteleeria_evelyniana_1__REF
#412 Pinales_Lagarostrobos_franklinii_1__REF
#393 Pinales_Larix_speciosa_1__REF
#405 Pinales_Manoao_colensoi_1__REF
#412 Pinales_Metasequoia_glyptostroboides_1__REF
#372 Pinales_Microbiota_decussata_1__REF
#428 Pinales_Microcachrys_tetragona_1__REF
#333 Pinales_Microstrobos_fitzgeraldii_1__REF
#392 Pinales_Nageia_nagi_1__REF
#396 Pinales_Neocallitropsis_pancheri_1__REF
#299 Pinales_Nothotsuga_longibracteata_1__REF
#319 Pinales_Papuacedrus_papuana_1__REF
#390 Pinales_Parasitaxus_usta_1__REF
#389 Pinales_Phyllocladus_hypophyllus_1__REF
#393 Pinales_Picea_engelmannii_1__REF
#404 Pinales_Pilgerodendron_uviferum_1__REF
#412 Pinales_Pinus_jeffreyi_1__REF
#394 Pinales_Pinus_parviflora_1__REF
#411 Pinales_Pinus_ponderosa_1__REF
#412 Pinales_Pinus_radiata_1__REF
#124 Pinales_Pinus_taeda_1__REF
#398 Pinales_Platycladus_orientalis_1__REF
#384 Pinales_Podocarpus_coriaceus_1__REF
#404 Pinales_Podocarpus_rubens_1__REF
#363 Pinales_Prumnopitys_andina_1__REF
#363 Pinales_Pseudolarix_amabilis_1__REF
#306 Pinales_Pseudotaxus_chienii_1__REF
#358 Pinales_Pseudotsuga_wilsoniana_1__REF
#422 Pinales_Retrophyllum_minus_1__REF
#359 Pinales_Saxegothaea_conspicua_1__REF
#355 Pinales_Sciadopitys_verticillata_1__REF
#163 Pinales_Sequoia_sempervirens_1__REF
#239 Pinales_Sequoiadendron_giganteum_1__REF
#330 Pinales_Sundacarpus_amarus_1__REF
#410 Pinales_Taiwania_cryptomerioides_1__REF
#379 Pinales_Taxodium_distichum_1__REF
#334 Pinales_Taxus_baccata_1__REF
#335 Pinales_Taxus_cuspidata_1__REF
#407 Pinales_Tetraclinis_sp_1__REF
#346 Pinales_Thuja_plicata_1__REF
#330 Pinales_Thujopsis_dolabrata_1__REF
#251 Pinales_Torreya_nucifera_1__REF
#345 Pinales_Torreya_taxifolia_1__REF
#391 Pinales_Tsuga_heterophylla_1__REF
#373 Pinales_Widdringtonia_cedarbergensis_1__REF
#409 Pinales_Wollemia_nobilis_1__REF