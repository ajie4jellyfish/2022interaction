function setup() {
    initializeFields();
    createCanvas(500, 500);
}

function draw() {
    background(color(0xC5, 0xE6, 0xFA));
    fill(color(0xB2, 0xFF, 0xF1));
    rect(100, 100, 100, 150);
    rect(mouseX, mouseY, 100, 150);
}

function initializeFields() {
}
