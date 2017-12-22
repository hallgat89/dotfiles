#!/bin/bash
#######################################
#
# készítő: Sömike
#
# A script az xgamma programot használja
# A gamma értékének változtatása mindhárom csatornán (RGB) azonos mértékben történik
#
# Eltolt csatorna értéket használók figyelem!
# Ha valaki eltolt csatorna értékekkel használja a megjelenítőjét, akkor a csatornák közötti beállított
# különbség állandó marad. így nem tolódik el a gamma érték változtatása egyetlen csatorna irányába sem.
# Viszont érdemes lekérdezni a gamma szinteket, és ha szükséges át kell írni 
# a script megfelelő változójának a kezdeti értékét.
#
# Az aktuális gamma szintek lekérdezése:
# Terminálban adjuk ki az "xgamma" parancsot (idézőjelek nélkül)
#
# a script paramétereként három érték (egyszerre csak egy) szerepelhet:
# increase, decrease, default
# increase --> A gamma érték növelése
# descrease --> A gamma érték csökkentése
# default --> A gamma érték alaphelyzetbe állítása 
# Alaphelyzet: alapértelmezetten (de ez megváltoztatható) mindhárom csatornán (RGB) az érték: 1.0
#
# A scriptet érdemes "Gyorsbillentyű"-höz rendelni, persze olyanhoz ami még nem foglalt. Illetve nem használja böngésző meg ilyesmi.
# Az egyéni gyorsbillentyű létrehozását mindenki keresse meg a saját rendszerén
# Három gyorsbillentyűt kell konfigurálni (GammaNövelés, GammaCsökkentés, GammaAlaphelyzet)
# A gyorsbillentyű "Parancs" mezőjébe a script fájlt teljes elérési úttal kell megadni, majd utána beírni a megfelelő paramétert (increase, decrease, default)
#
# Példa gamma növelésre:
# /home/<felhasználóneved>/utvonal/ahol/ahová/a/scriptet/tetted/<scriptNeve> increase
# Az én esetemben CTRL+P gyorsbillentyűre konfolva a parancs így néz ki:
# /home/somike1604/gammaChanger.sh increase
#
#  -- EULA -- 
# A script szabadon módosítható, sokszorosítható, felhasználható otthoni célokra
# Vállalati felhasználás részemről tiltott. 
# Ha eladod jutalékot azért illik adni :)
# A scriptet mindenki saját felelősségére használhatja. A használatból eredő bármilyen természetű kárért felelősséget nem vállalok. (Például: kiég a szemed, leég a monitor meg ilyesmi)
# A script kimásolásával és/vagy elkészítésével a végfelhasználói szerződést elfogadottnak tekintem.
# Punk-Tum
#
# Használd egészséggel
#
###################################################################
 
# gamma változtatás mértéke (ízlés szerint módosítható, de csak módjával érdemes )
step=0.01
 
# minden csatornát külön állítok (RGB) (módosítható ha eltolt csatorna értékeket használunk)
newRedGamma=1.0
newGreenGamma=1.0
newBlueGamma=1.0
 
# növelő függvény
function increase {
    newRedGamma=$(echo $redGamma+$step | bc)
    newGreenGamma=$(echo $greenGamma+$step | bc)
    newBlueGamma=$(echo $blueGamma+$step | bc)
}
 
#csökkentő függvény
function decrease {
    newRedGamma=$(echo $redGamma-$step | bc)
    newGreenGamma=$(echo $greenGamma-$step | bc)
    newBlueGamma=$(echo $blueGamma-$step | bc)
}
 
# az alapértelmezetten megadott gamma értékeket fogjuk használni
function default {
    :  # nem kell csinálni semmit 
}
 
#aktuális gamma érték lekérése minden csatornára
output=$(xgamma 2>&1)
AllGammaValues=$(echo $output | grep -o -E '[0-9.]+')
 
#csatornák értékeinek szétválasztása
arrIN=(${AllGammaValues// / })
redGamma=${arrIN[0]}
greenGamma=${arrIN[1]}
blueGamma=${arrIN[2]}
 
# függvényhívásra használjuk az argumentumot ( default, increase vagy decrease)
$1
 
#módosított gamma érték kiküldése/beállítása
xgamma -rgamma $newRedGamma -ggamma $newGreenGamma -bgamma $newBlueGamma

notify-send "$AllGammaValues"
