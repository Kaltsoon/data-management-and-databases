#!/usr/bin/env zx

import { usePowerShell, $, path, minimist } from "zx";

usePowerShell();

const argv = minimist(process.argv.slice(2), {});
const filePath = argv._[1];

const pathParts = filePath
  .split(path.sep)
  .filter((part) => part && part !== ".");

const fileName = pathParts[0].split(".")[0];

await $`npx slidev export ${fileName}.md --timeout 60000 --output ${path.join(
  "..",
  "slides",
  `${fileName}.pdf`
)}`;
