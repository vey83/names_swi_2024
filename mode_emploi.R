[Rafraîchir les graphiques]
1.Charger library.R
2.Charger functions.R

3.Charger noms_ch_wrangling.R
- actualiser le fichier de la variable noms_ch_raw
- OFS: https://www.bfs.admin.ch/bfs/fr/home/statistiques/population/naissances-deces/noms-suisse.html : Noms de famille de la population résidante permanente

4.Charger noms_cantons_wrangling.R
- actualiser le fichier de la variable noms_cantons_raw
- OFS: https://www.bfs.admin.ch/bfs/fr/home/statistiques/population/naissances-deces/noms-suisse.assetdetail.26925060.html

5.Charger create_names_chart_3.R
#FR: enlever # aux lignes 10 et 11, [29]: charger le fichier fr, [50] et [67]: écrire "fr", [92]: écrire "fr", [133]: écrire "fr"
#DE: enlever # aux lignes 15 et 16, [29]: charger le fichier de, [50] et [67]: écrire "de", [92]: écrire "de", [133]: écrire "de"
#IT: enlever # aux lignes 20 et 21, [29]: charger le fichier it, [50] et [67]: écrire "it", [92]: écrire "it", [133]: écrire "it"

6.Charger noms_regions_ling.R
- [7] actualiser le fichier de la variable reg_ling_raw
- OFS: https://www.bfs.admin.ch/bfs/fr/home/statistiques/population/naissances-deces/noms-suisse.assetdetail.26925058.html
- activer le code puis commit, push

7.Charger prenoms_wrangling.R
-[20] & [24] actualiser les fichiers
-OFS femmmes: https://www.bfs.admin.ch/bfs/fr/home/statistiques/population/naissances-deces/noms-suisse.assetdetail.26925114.html
-OFS hommes: https://www.bfs.admin.ch/bfs/fr/home/statistiques/population/naissances-deces/noms-suisse.assetdetail.26925115.html

8.Charger prenoms_all.R
[37]/[46] adapter noms de fichier [37] à la fonction choisie [46]
- commit, push

9.Charger bebes_top.R
[8] &[21]: adapter avec J_2023
[40]/[49]: adapter noms de fichiers à la fonction choisie

10.Charger manual_charts_summary.R?
  -normalement pas nécessaire si titres graphiques pas modifiés

11.Charger /excel_summaries/merge_summaries.R
- exécuter le code

12.Ouvrir le projet selfpick
- ouvrir le fichier names_swi_2024.R et exécuter le code
- republish selfpick
