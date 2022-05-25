const { exit } = require("process");

function threesome(lines, index) {
    return parseInt(lines[index]) + parseInt(lines[index+1]) + parseInt(lines[index+2]);   // The function returns the product of p1 and p2
}

fs = require("fs");

const lines = fs.readFileSync("input.txt", { encoding: "utf-8" }).split("\n");

let counter = 0;

for (let i = 0; i < lines.length-1; i++) {

    trees = threesome(lines, i)

    if (i == 0){
        console.log(trees + " no previous measurment");
        continue;
    }
    if (trees > threesome(lines, i-1)){
        counter++;
        console.log(trees + " increased")
    }
    else if (trees == threesome(lines, i-1)){
        console.log(trees + " equal")
    }
    else 
        console.log(trees + " decreased")

}

console.log(counter)

