// Updated version that has thru-holes and micro USB ports in the correct position: the box is slightly larger to allow room for the switch.
baseHeight =5;

wallHeight = 45;

baseWidth = 61;

baseLength = 150;

gapz = 5;
gapy = 22;

shft=5; // shift holes away from y = 0 this amount 

module fourForty ()   // countersunk no 4-40 bolt
{
cylinder(r = (0.136*25.4/2), h = baseHeight);
cylinder(r=(0.21875*25.4/2), h = (0.112*25.4));
} // number 4-40 hex socket head cap screw coutersink

difference(){

cube([baseLength,baseWidth+shft,baseHeight],center=false);

translate([6,shft,0]) {fourForty();}


translate([46,shft,0]) {fourForty();}


translate([88,12.5+shft,0]) {fourForty();}


translate([88,40.5+shft,0]) {fourForty();}


translate([139,2.5,0]) {fourForty();}




translate([140,46+shft,0]) {fourForty();}




}

translate([0,-baseHeight,0]){
cube([baseLength,baseHeight,wallHeight],center=false);
}

difference(){ // cutouts for wallplug and switch

translate([0,baseHeight+baseWidth,0]){
cube([baseLength,baseHeight,wallHeight],center=false);
}

translate([10,baseHeight+baseWidth,10+baseHeight]){
cube([30,baseHeight,23],center=false);
}

translate([50,baseHeight+baseWidth,7+baseHeight]){

cube([23.5,baseHeight,15],center=false);
}

}

translate([-baseHeight,-baseHeight,0]){
cube([baseHeight,baseWidth+3*baseHeight,wallHeight],center=false);
}

difference(){

translate([-baseHeight+baseLength,-baseHeight,0]){
cube([baseHeight,baseWidth+3*baseHeight,wallHeight],center=false);
}

translate([-baseHeight+baseLength,-baseHeight+8.7+shft,6.5]){
cube([baseHeight,10,gapz],center=false);
}

}
