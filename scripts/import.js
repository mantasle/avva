const fs = require('fs');
const Papa = require('papaparse');

const osmFilePath = fs.readFileSync("./data/jonava.geojson", "utf8")
const csvFilePath = fs.readFileSync("./data/addresses_rows.csv", "utf8")

function normalizeString(str) {
   return str.normalize("NFD").toLowerCase().replace(/[\u0300-\u036f]+/g, '').trim()
   .replace(/ g\.$/, '')
   .replace(/tak\.$/, 'takas')
   .replace(/^[a-z]\. ?/g, '')
 }

function splitTitle(title) {
  const words = title.trim().split(" ");
  const newHouseNumber = words.pop();
  const newStreet = words.join(" ");

  return { street: newStreet, houseNumber: newHouseNumber };
}

function makeKey(street, houseNumber) {
  const normalizedStreet = normalizeString(street);
  const normalizedNumber = houseNumber.toLowerCase();
  return `${normalizedStreet}|${normalizedNumber}`;
}

const adresai = new Map();
const csvAdresai = Papa.parse(csvFilePath, { header: true });

JSON.parse(osmFilePath).features.forEach((feature) => {

  const props = feature.properties;
  if (!props["addr:street"]) {
    return;
  } 
    
  if (!props["building"]) { 
    return;
  }

  const key = makeKey(props["addr:street"], props["addr:housenumber"]);
  adresai.set(key, feature);
 });

console.log(adresai.size)


let skaitliukas = 0;

csvAdresai.data.forEach((row) => {

  const address = splitTitle(row.title);
  const key = makeKey(address.street, address.houseNumber);
  adresai.get(key) ? skaitliukas++ : console.log(row.title);
});

console.log(skaitliukas);