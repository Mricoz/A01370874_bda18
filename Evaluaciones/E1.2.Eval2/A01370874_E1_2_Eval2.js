/*
    Mauricio Rico Zavala
    A01370874
    Segunda Evaluacion Parcial
    Bases de Datos Avanzadas
*/

/////////// 1 -> ¿Cuál es el total de alumnos inscritos?

db.grades.aggregate([{ $group: { _id: null, count: { $sum: 1 }}}])

/*
    OUTPUT: { "_id" : null, "count" : 280 }
*/

/////////// 2 -> ¿Cuántos cursos se han impartido?

db.grades.distinct('class_id').length

/*
    OUTPUT: 31
*/

/////////// 3 - > Encuentra, para cada alumno, su promedio obtenido en cada una de las clases en las que fue inscrito (promedia exámenes, quizes, tareas y todas las actividades realizadas que contenga un grade)

db.grades.aggregate([{ $unwind: "$scores" }, { $group:{ _id: "$student_id" }}, { $project: { examAvg: { $avg: "$scores.score"}, quizAvg: { $avg: "$scores.score" }, homeworkAvg: { $avg: "$scores.score" }}}])

/*
    OUTPUT:
*/

/////////// 4 - > ¿Cuál fue la materia que tiene la calificación más baja (muestra el id de la materia, el id del alumno y la calificación)?

db.grades.aggregate([{ $unwind: "$scores" },{ $group: { _id: {} , calificacionMin: { $min: "$scores.score" }}}])

/*
    OUTPUT: { "_id" : { 12 }, "calificacionMin" : 0.04794785051871475 }
*/

/////////// 5 - > ¿Cuál es la materia en la que se han dejado más tareas?

var masTareas = function(){
    this.scores.forEach((value) => {
        if(value.type == "homework"){
            emit(this.class_id, 1)
        }
    });
};

var countTareas = function(name, values){
    return Array.sum(values);
};

db.grades.mapReduce(masTareas, countTareas, {out:"countTareas"}).find().sort({ value: -1 }).limit(1);

/*
    OUTPUT: { "_id" : 22, "value" : 43 }
*/

/////////// 6 - > ¿Qué alumno se inscribió en más cursos?

db.grades.aggregate([{ $group: { _id: "$student_id" }}, { $group: { _id: "$_id", count: { $sum:11} }}, { $sort: { count: -1 }}, { $limit: 1 }])
/*
    OUTPUT: { "_id" : 31, "count" : 11 }
*/

/////////// 7 - > ¿Cuál fue el curso que tuvo más reprobados?

db.grades.aggregate([{ $group: { _id: "$course_id" }}, { $group: { _id: "$_id", count: { $sum:50} }}, { $sort: { count: -1 }}, { $limit: 1 }])

/*
    OUTPUT:
*/
