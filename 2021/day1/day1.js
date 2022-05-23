fs = require("fs");

const lines = fs.readFileSync("input.txt", { encoding: "utf-8" }).split("\n");

let counter = 0;

for (let i = 0; i < lines.length-1; i++) {
    if (i == 0){
        console.log(lines[i] + " no previous measurment");
        continue;
    }
    if (lines[i] > lines[i-1]){
        counter++;
        console.log(lines[i] + " increased")
    }
    else if (lines[i] == lines[i-1]){
        console.log(lines[i] + " equal")
    }
    else 
        console.log(lines[i] + " decreased")
}

console.log(counter+1)

