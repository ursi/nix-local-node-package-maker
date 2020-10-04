const fs = require(`fs`);
const packageName = process.argv[2]

let packages = new Set(require(`./packages`));

packages.add(packageName);

let packagesArray = [];

for (const x of packages) {
	packagesArray.push(x);
}

packagesArray.sort();

fs.writeFileSync(`packages.json`, JSON.stringify(packagesArray, null, 4));
