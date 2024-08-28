//Declare an Integer variable called totalGuests and set it to 100
Integer totalGuests = 100;
//Declare an Integer variable called totalAmountSugar and set it to 159 (number of teaspoons in a bag of sugar).
Integer totalAmountSugar = 159;
//Declare an Integer variable called totalAmountTea and set it to 35 (number of teabags).
Integer totalAmountTea = 35;
//Loop: Add a teaspoon of sugar and one tea bag to a tea cup. Serve until there is no sugar or tea left.

// WHILE:
/*
while (totalAmountSugar != 0 && totalAmountTea !=0 && totalGuests!=0) {
    totalAmountSugar --;
    totalAmountTea --;
    totalGuests --;
    System.debug('Guests served to serve ' + totalGuests);
    if ((totalAmountTea == 0) && totalGuests != 0) {
        System.debug('Can\'t serve teas anymore. because there is no more tea. Sugar remaining: ' + totalAmountSugar);
    } else if (totalAmountSugar == 0 && totalGuests != 0) {
        System.debug('Can\'t serve teas anymore. because there is no more sugar. Tea remaining: ' + totalAmountTea);
    }
}
if (totalGuests == 0) {
    System.debug('Everyone was served');
}
    */

// DO-WHILE:
/*
do {
    totalAmountSugar --;
    totalAmountTea --;
    totalGuests --;
    System.debug('Guests served to serve ' + totalGuests);
    if (totalAmountTea == 0 || totalAmountSugar == 0) {
        System.debug('Can\'t serve teas anymore. because there is no more tea or sugar.');
        System.debug('Tea remaining: ' + totalAmountTea + ' total sugar remaining: ' + totalAmountSugar);
        break;
    }
} while (totalGuests > 0);
*/

Integer x = 1;
while (x < 2) {
    System.debug(x);
    x ++;
}