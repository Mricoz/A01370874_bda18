// Mauricio Rico Zavala
// A01370874
// Actividad mapReduce

// 1

var zip = function(){
    emit(this.address.zipcode, 1);
}

var countZip = function(zipCode, values){
    return Array.sum(values);
}

db.restaurants.mapReduce(zip, countZip, {out:"each"}).find();

// 2

var grades = function(){
    emit(this.name, this.grades.length);
}

var countGrades = function(name, values){
    return Array.sum(values);
}

db.restaurants.mapReduce(grades, countGrades, {out:"countGrades"}).find();

// 3

var scores = function(){
    this.grades.forEach((value) => {
        emit(this.name, value.score)
    });
}

var countScores = function(name, values){
    return Array.sum(values);
}

db.restaurants.mapReduce(scores, countScores, {out:"countScores"}).find();

// 4

var countPerGrade = function(){
    this.grades.forEach((value) => {
        emit(value.grade, 1)
    });
}

var countPerGr = function(name, values){
    return Array.sum(values);
}

db.restaurants.mapReduce(countPerGrade, countPerGr, {out:"perGrades"}).find();

// 5

ar countCuisine = function(){
    emit(this.cuisine, 1)
}

var countPerCuisine = function(name, values){
    return Array.sum(values);
}

db.restaurants.mapReduce(countCuisine, countPerCuisine, {out:"perCuisine"}).find();

// 6

var mapClose = function(){
    var lat = -73.9653967;
    var long = 40.6064339;

    this.address.coord
}

var countClose = function(name, values){
    return Array.sum(values);
}

db.restaurants.mapReduce(mapClose, countClose, {out:"tenCloser"}).find();
