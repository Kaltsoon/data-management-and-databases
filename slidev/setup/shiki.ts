import { defineShikiSetup } from "@slidev/types";
import { transformerMetaHighlight } from "@shikijs/transformers";

export default defineShikiSetup(() => {
  return {
    themes: {
      dark: "github-dark",
      light: "github-light",
    },
    transformers: [
      transformerMetaHighlight(),
    ],
  };
});
