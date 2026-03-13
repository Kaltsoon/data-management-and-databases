#!/usr/bin/env zx

import { usePowerShell, $, path, minimist, spinner } from "zx";

usePowerShell();

const argv = minimist(process.argv.slice(2), {});
const filePath = argv._[1];

if (!filePath) {
  const changedSlides = await getChangedSlides();

  for (const name of changedSlides) {
    await exportFile(name);
  }

  process.exit(0);
}

const pathParts = filePath
  .split(path.sep)
  .filter((part) => part && part !== ".");

const fileName = pathParts[0].split(".")[0];

await exportFile(fileName);

async function getChangedSlides() {
  const status = await $`git status --short`;
  const paths = status
    .toString()
    .split("\n")
    .filter((path) => path.endsWith(".md"))
    .map((path) => path.split(" ").at(-1).replace(/\.md/, ""));

  return paths;
}

async function exportFile(name) {
  await spinner(`Exporting ${name} to PDF...`, () => $`npx slidev export ${name}.md --timeout 60000 --output ${path.join(
    "..",
    "slides",
    `${name}.pdf`,
  )}`)
}
