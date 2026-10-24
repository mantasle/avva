
function normalizeString(str) {
   return str.normalize("NFD").toLowerCase().replace(/[\u0300-\u036f]+/g, '')
   .replace(/( g| tak)\.$/, '')
   .replace(/^[a-z]\. ?/g, '');
 }

 console.log(normalizeString("Kulviečių"));
 console.log(normalizeString("P. Vaičiūno g."));
 console.log(normalizeString("Žeimių tak."));
 console.log(normalizeString("Lietavos g.31"));
console.log("[" + normalizeString("P. Vaičiūno g.") + "]");
console.log("[" + normalizeString("P. Vaičiūno g.") + "]");   // turi būti [vaiciuno]
console.log("[" + normalizeString("P.Vaičiūno") + "]");       // turi būti [vaiciuno]
console.log("[" + normalizeString("A. Kulviečio g.") + "]");  // turi būti [kulviecio]
console.log("[" + normalizeString("Kulviečių") + "]");        // turi būti [kulvieciu]
