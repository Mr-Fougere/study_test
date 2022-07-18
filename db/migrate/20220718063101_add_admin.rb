
class AddAdmin < ActiveRecord::Migration[5.0]
  def up
    User.create(username:"admin",password:"qulbutoquiz",email:"admin@qulbutoquiz.com",created_at:"2022-01-01 00:00:00.000000",updated_at:"2022-01-01 00:00:00.000000",role:"admin")
    User.create(username:"test",password:"test",email:"test@qulbutoquiz.com",created_at:"2022-01-01 00:00:00.000000",updated_at:"2022-01-01 00:00:00.000000",role:"test")

    Question.create(id:1,question:"which pokemon is Pikachu ?",answer1:"25",answer2:"45",answer3:"63",answer4:"52",goodAnswer:"1",theme:"sprite",category:"pokemon")
    Question.create(id:2,question:"which pokemon is Snorlax ?",answer1:"14",answer2:"49",answer3:"398",answer4:"143",goodAnswer:"4",theme:"sprite",category:"pokemon")
    Question.create(id:3,question:"which pokemon is Wobbuffet ?",answer1:"20",answer2:"45",answer3:"202",answer4:"52",goodAnswer:"3",theme:"sprite",category:"pokemon")
    Question.create(id:4,question:"which pokemon is Cyndaquil ?",answer1:"155",answer2:"345",answer3:"163",answer4:"452",goodAnswer:"1",theme:"sprite",category:"pokemon")
    Question.create(id:5,question:"which pokemon is Girafairg",answer1:"251",answer2:"450",answer3:"203",answer4:"76",goodAnswer:"3",theme:"sprite",category:"pokemon")
    Question.create(id:6,question:"which pokemon is Treecko",answer1:"250",answer2:"252",answer3:"67",answer4:"51",goodAnswer:"2",theme:"sprite",category:"pokemon")
    Question.create(id:7,question:"which pokemon is Rapion?",answer1:"451",answer2:"333",answer3:"444",answer4:"555",goodAnswer:"1",theme:"sprite",category:"pokemon")
    Question.create(id:8,question:"which pokemon is Skitty ?",answer1:"654",answer2:"345",answer3:"300",answer4:"5",goodAnswer:"3",theme:"sprite",category:"pokemon")
    Question.create(id:9,question:"What is the types of Wyrdeer?",answer1:"Normal / Psy",answer2:"Normal / Fighting",answer3:"Fighting / Ghost",answer4:"Psy / Fighting",goodAnswer:"1",theme:"type",category:"pokemon")
    Question.create(id:10,question:"Which pokemon evolve level 36 ?",answer1:"446",answer2:"391",answer3:"10",answer4:"2",goodAnswer:"2",theme:"sprite",category:"pokemon")
    Question.create(id:11,question:"Which pokemon can learn  Leaf Storm?",answer1:"251",answer2:"453",answer3:"389",answer4:"522",goodAnswer:"3",theme:"sprite",category:"pokemon")
    Question.create(id:12,question:"Which pokemon can learn Jungle healing?",answer1:"406",answer2:"893",answer3:"549",answer4:"103",goodAnswer:"2",theme:"sprite",category:"pokemon")
    Question.create(id:13,question:"Which pokemon is  dark and fire types?",answer1:"228",answer2:"560",answer3:"717",answer4:"861",goodAnswer:"1",theme:"sprite",category:"pokemon")
    Question.create(id:14,question:"Which pokemon is not plant and flying types?",answer1:"187",answer2:"357",answer3:"724",answer4:"189",goodAnswer:"3",theme:"sprite",category:"pokemon")
    Question.create(id:15,question:"Which pokemon is ground and ghost types?",answer1:"Yamask",answer2:"Zorua",answer3:"Hisui Zorua",answer4:"Shedinja",goodAnswer:"1",theme:"type",category:"pokemon")
    Question.create(id:16,question:"what generation is Popplio ?",answer1:"2",answer2:"3",answer3:"8",answer4:"7",goodAnswer:"4",theme:"generation",category:"pokemon")
    Question.create(id:17,question:"what generation is Snorunt ?",answer1:"5",answer2:"4",answer3:"2",answer4:"3",goodAnswer:"4",theme:"generation",category:"pokemon")
    Question.create(id:18,question:"what generation is Palossand ?",answer1:"5",answer2:"7",answer3:"4",answer4:"2",goodAnswer:"2",theme:"generation",category:"pokemon")
    Question.create(id:19,question:"which move is normal type ? ",answer1:"Sumbmission",answer2:"SmokeScreen",answer3:"Ember",answer4:"Aerial Ace",goodAnswer:"2",theme:"type",category:"Attaque")
    Question.create(id:20,question:"which move can't be learned by Braziken ?",answer1:"Flamme Wheel",answer2:"Ember",answer3:"Aerial Ace",answer4:"Sand Attack",goodAnswer:"1",theme:"move",category:"pokemon")

 end

end
