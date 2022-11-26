# Tech-Chalenger2022-S1E1
## Exercice :
*Verifier la validité d'une heure.*
### Enoncé :
Visionnaire du temps Vous souhaitez intégrer la Brigade du Temps,  
équipe d'élite composée uniquement de méta-humains capables de voir dans le futur.  
En rassemblant les meilleurs méta-humains, la Brigade est d'une aide précieuse pour anticiper certains événements néfastes à l'Humanité et la Planète, et les prévoyants et en proposant des solutions optimales avant même qu'ils n'adviennent.  
La Brigade est composée de 4 Ordres : la Prévoyance, l'Innovation, la Sagesse et la Protection. Aujourd'hui c'est le grand jour : après des mois de préparation, vous allez passer l'ultime examen pour intégrer l'Ordre de la Prévoyance. Vous devrez montrer que vous êtes un méta-humain, et l'un des meilleurs.  
Vous entrez dans une grande pièce blanche, où seule une horloge est accrochée au mur : on vous informe que pour réessir ce test, vous allez devoir voir les futures actions se passant dans cette pièce et les décrire. Pour réellement vous mettre à l'épreuve, un puissant brouilleur temporel a été mis en place : certaines de vos visions ne seront pas des futurs possibles. Il vous faut donc discerner les visions justes des visions brouillées.  
Vous avez une idée : si l'horloge indique une heure qui ne peut pas exister, votre vision sera forcément une vision brouillée. Ecrivez un programme qui prend en entrée une heure au format hh:mm, et qui renvoie si cette heure est possible ou non.  
  
### Données entrée :
 - ne chaîne de 5 caractères au format hh:mm, où hh et mm sont des entiers (compris entre 00 et 99)
  
### Attendue :
Votre programme devra renvoyer sur la sortie standard YES si la chaîne en entrée est une heure valide, NO sinon. ces deux conditions doivent être satisfaites :  

* 00 <= hh <= 23
* 00 <= mm <= 59
