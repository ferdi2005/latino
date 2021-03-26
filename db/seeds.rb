# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Study.create(title: "Le 5 declinazioni.", image: "coliseum.png", description: "Ripeti con noi le 5 declinazioni latine")
Study.create(title: "I verbi al modo indicativo.", image: "Scuola 1.jpg", description: "Focus sui verbi all'indicativo")
Study.create(title: "I verbi al modo congiuntivo.", image: "Scuola 2.jpg", description: "Focus sui verbi al congiuntivo")
Study.create(title: "Gli aggettivi di prima e seconda classe.", image: "Scuola 3.jpg", description: "Ripeti gli aggettivi latini")
Study.create(title: "I complementi.", image: "Scuola 4.jpg", description: "Impara gli indispensabili complementi con noi")


quiz1 = Quiz.create(title: "Verbi", description: "Quiz sui verbi", image: "Scuola 1.jpg")
quiz2 = Quiz.create(title: "Declinazioni", description: "Quiz sulle declinazioni", image: "Scuola 2.jpg")
quiz3 = Quiz.create(title: "Complementi", description: "Quiz sui complementi", image: "Scuola 3.jpg")
 
 
Question.create(
question_type: 0,
options: ["-mus","-tis","-s","-nt"], 
correct_options: [3],
text: "La desinenza della terza persona plurale del presente indicativo è:",
points: 5, 
quiz_id: 1)
 
Question.create(
question_type: 0,
options: ["Lunga","Breve"], 
correct_options: [1],
text: "Nel verbo 'Legitis' (3^ Coniugazione, indicativo presente) la quantità della vocale tematica è:",
points: 10, 
quiz_id: 1)
 
Question.create(
question_type: 0,
options: ["Ero","Fui","Eram","Eris"], 
correct_options: [2],
text: "La prima persona dell'indicativo imperfetto del verbo sum è:",
points: 5, 
quiz_id: 1)
 
Question.create(
question_type: 0,
options: ["Presente e Imperfetto","Presente e Futuro","Presente e Perfetto","Imperfetto e Perfetto"], 
correct_options: [1],
text: "Il modo imperativo ha i tempi:",
points: 5, 
quiz_id: 1)
 
Question.create(
question_type: 0,
options: ["Indicativo Passato prossimo, passato remoto, trapassato remoto","Indicativo Passato prossimo, passato remoto","Condizionale Presente"], 
correct_options: [0],
text: "Il perfetto indicativo latino corrisponde in italiano a:",
points: 5, 
quiz_id: 1)
 
Question.create(
question_type: 0,
options: ["Vis","Robis","Roboris","Viris"], 
correct_options: [2],
text: "Il genitivo singolare del sostantivo vis è",
points: 10, 
quiz_id: 2)
 
Question.create(
question_type: 0,
options: ["-is","-e","-i","-um"], 
correct_options: [0],
text: "Il genitivo singolare dei sostantivi di terza declinazione termina in:",
points: 5, 
quiz_id: 2)
 
Question.create(
question_type: 0,
options: ["-um","-e","-em","-o"], 
correct_options: [3],
text: "L'ablativo singolare dei sostantivi di seconda declinazione neutri termina in:",
points: 5, 
quiz_id: 2)
 
Question.create(
options: ["Dii","Dis/Dii","Deum/Deorum","Dei/dii/dis"], 
correct_options: [2],
text: "Il genitivo plurale del sostantivo deus, i può essere:",
question_type: 0,
points: 5, 
quiz_id: 2)
 
Question.create( 
question_type: 0,
options: ["-ibus","-ubus","-is"], 
correct_options: [1],
text: "Il dativo e il genitivo plurale del sostantivo arcus terminano in:",
points: 10, 
quiz_id: 2)
 
Question.create(
question_type: 0,
options: ["per + accusativo / ablativo semplice","causa/gratia + ablativo","causa/gratia + genitivo"], 
correct_options: [0],
text: "Il complemento di mezzo si trova con:",
points: 5, 
quiz_id: 3)
 
Question.create(
question_type: 0,
options: ["in/ad + accusativo","in + ablativo","per + accusativo","in + genitivo"], 
correct_options: [1],
text: "Il complemento di stato in luogo è:",
points: 5, 
quiz_id: 3)
 
Question.create( 
question_type: 0,
options: ["ob/propter + accusativo","prae+ablativo","ablativo semplice"], 
correct_options: [0],
text: "Il complemento di causa esterna è:",
points: 5, 
quiz_id: 3)
 
Question.create(
question_type: 0,
options: ["ab + accusativo","de + ablativo","in + accusativo","genitivo"], 
correct_options: [1],
text: "Il complemento di argomento si trova con:",
points: 5, 
quiz_id: 3)
 
Question.create( question_type: 0,
options: ["genitivo","ablativo semplice","ab + ablativo","de + ablativo"], 
correct_options: [0],
text: "Il complemento di qualità morale è:",
points: 5, 
quiz_id: 3)
