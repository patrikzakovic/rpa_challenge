# RPA Challenge

Robot pre vyriešenie RPA challenge na stránke rpachallenge.com,
ktorý pozostáva z viacnásobného vyplnenia formulára s dátami, ktoré
sú načítané zo stiahnutého MS Excel súboru.

## Prerekvizity

Pred spustením projektu sa uistite, že máte nainštalované nasledujúce programy a knižnice:
1. **Editor zdrojového kódu**
    * [Visual Studio Code](https://code.visualstudio.com/) + rozšírenia [Robot Framework Language Server](https://marketplace.visualstudio.com/items?itemName=robocorp.robotframework-lsp) alebo [RobotCode](https://marketplace.visualstudio.com/items?itemName=d-biehl.robotcode)
    * Na stiahnutie dotupné tu https://code.visualstudio.com/Download
    * Návod na inštaláciu dostupný tu https://www.youtube.com/watch?v=naL0cZNQh1g
2. **Python 3.10.6**
    * Návod na inštaláciu dostupný tu https://docs.robotframework.org/docs/getting_started/testing#install-python
3. **Node.js 20.11.1**
    * Na stiahnutie dotupné tu https://nodejs.org/en/download/
    * Návod na inštaláciu dostupný tu https://www.youtube.com/watch?v=J8ZPZq_34aY

## Inštalácia
1. Skopírujte si projekt z GitHubu na svoj počítač.
2. Otvorte terminál/príkazový riadok a prejdite do priečinka s projektom.
3. Nainštalujte Python knižnicu *virtualenv* príkazom:
```
pip install virtualenv
```
4. Vytvorte virtuálne prostredie príkazom:
```
python3 -m venv venv
```
5. Aktivujte virtuálne prostredie príkazom:

bash/zsh
```
source venv/bin/activate
```
PowerShell
```
C:\> <venv>\Scripts\Activate.ps1
```
cmd.exe
```
<venv>\Scripts\activate.bat
```
6. Nainštalujte potrebné knižnice definované s konkrétnymi verziami v rámci requirements.txt príkazom:
```
pip install -r requirements.txt
```
6. Vykonajte inicializáciu robotframework-browser knižnice príkazom:
```
rfbrowser init
```

## Spustenie
Robota spustíme príkazom:
```
robot robot.robot
```