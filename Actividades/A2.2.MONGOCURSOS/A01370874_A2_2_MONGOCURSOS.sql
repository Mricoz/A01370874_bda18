-- Ejercicio Mongodb
-- Mauricio Rico Zavala


use cursos
db.createCollection("cursos")
db.cursos.insert({titulo:"Bases de datos", profesor:{nombre:"Ariel Lucien", nomina:"L12345678", direccion:"Santa Fe", genero:"Masculino", cursos:[{titulo: "Bases de datos", ano:2018}]}, ano:2018})
db.cursos.update({titulo: "Bases de datos"}, {$set: {alumnos:[{nombre:"Mauricio Rico", matricula:"A01370874", direccion:"CDMX", genero:"Masculino", cursos:[{titulo:"Bases de datos", ano:2018}]}]} })
db.cursos.update({titulo: "Bases de datos"}, {$set: {evaluacionesEscritas:[{numero:1, preguntasTeoricas: 7, preguntasPracticas:12}]}})
db.cursos.update({titulo: "Bases de datos"}, {$push: {evaluacionesEscritas:{numero:2, preguntasTeoricas: 3, preguntasPracticas:2}}})
db.cursos.update({titulo: "Bases de datos"}, {$push: {evaluacionesEscritas:{numero:3, preguntasTeoricas: 1, preguntasPracticas:11}}})
db.cursos.update({titulo: "Bases de datos"}, {$push: {evaluacionesEscritas:{numero:4, preguntasTeoricas: 8, preguntasPracticas:9}}})
db.cursos.update({titulo: "Bases de datos"}, {$set: {"alumnos.0.evaluaciones":[{numero:1, calificacion:70}]}})
db.cursos.update({titulo: "Bases de datos"}, {$push: {"alumnos.0.evaluaciones":{numero:2, calificacion:64}}})
db.cursos.update({titulo: "Bases de datos"}, {$push: {"alumnos.0.evaluaciones":{numero:3, calificacion:94}}})
db.cursos.update({titulo: "Bases de datos"}, {$push: {"alumnos.0.evaluaciones":{numero:4, calificacion:100}}})
db.cursos.update({titulo: "Bases de datos"}, {$set: {"alumnos.0.calificacionFinal":82}})
db.cursos.update({titulo: "Bases de datos"}, {$set: {"evaluacionCurso":[{matricula:"A01370874", calificacion:100}]}})
db.cursos.update({titulo: "Bases de datos"}, {$set: {"evaluacionProfesor":[{matricula:"A01370874", calificacion:100}]}})
db.cursos.update({titulo: "Bases de datos"}, {$set: {"comentariosAlumno":[{matricula:"A01370934", comentarios:["Excelente clase!"]}]}})

-- Output db.cursos.find().pretty()
{
        "_id" : ObjectId("5aac39af41e94a5851bbf472"),
        "titulo" : "Bases de datos",
        "profesor" : {
                "nombre" : "Ariel Lucien",
                "nomina" : "L12345678",
                "direccion" : "Santa Fe",
                "genero" : "Masculino",
                "cursos" : [
                        {
                                "titulo" : "Bases de datos",
                                "ano" : 2018
                        }
                ]
        },
        "ano" : 2018,
        "alumnos" : [
                {
                        "nombre" : "Mauricio Rico",
                        "matricula" : "A01370874",
                        "direccion" : "CDMX",
                        "genero" : "Masculino",
                        "cursos" : [
                                {
                                        "titulo" : "Bases de datos",
                                        "ano" : 2018
                                }
                        ],
                        "evaluaciones" : [
                                {
                                        "numero" : 1,
                                        "calificacion" : 70
                                },
                                {
                                        "numero" : 2,
                                        "calificacion" : 64
                                },
                                {
                                        "numero" : 3,
                                        "calificacion" : 94
                                },
                                {
                                        "numero" : 4,
                                        "calificacion" : 100
                                }
                        ],
                        "calificacionFinal" : 82
                }
        ],
        "evaluacionesEscritas" : [
                {
                        "numero" : 1,
                        "preguntasTeoricas" : 7,
                        "preguntasPracticas" : 12
                },
                {
                        "numero" : 2,
                        "preguntasTeoricas" : 3,
                        "preguntasPracticas" : 2
                },
                {
                        "numero" : 3,
                        "preguntasTeoricas" : 1,
                        "preguntasPracticas" : 11
                },
                {
                        "numero" : 4,
                        "preguntasTeoricas" : 8,
                        "preguntasPracticas" : 9
                }
        ],
        "evaluacionCurso" : [
                {
                        "matricula" : "A01370874",
                        "calificacion" : 100
                }
        ],
        "evaluacionProfesor" : [
                {
                        "matricula" : "A01370874",
                        "calificacion" : 100
                }
        ],
        "comentariosAlumno" : [
                {
                        "matricula" : "A01370934",
                        "comentarios" : [
                                "Excelente clase!"
                        ]
                }
        ]
}
