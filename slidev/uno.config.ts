import { defineConfig } from "unocss";

export default defineConfig({
  preflights: [
    {
      getCSS: ({ theme }) => `
        .slidev-code, pre {
          --slidev-code-font-size: 0.75em;
          font-variant-ligatures: none !important;
        }

        pre {
          font-family: var(--slidev-code-font-family) !important;
          padding: var(--slidev-code-padding) !important;
          font-size: var(--slidev-code-font-size) !important;
          line-height: var(--slidev-code-line-height) !important;
          border-radius: var(--slidev-code-radius) !important;
          background: var(--slidev-code-background);
        }

        html {
          font-size: 18px;
        }

        body {
          color: ${theme.colors?.gray["8"]};
        }

        h1, h2, h3, h4, h5, h6, strong, th {
          color: ${theme.colors?.gray["950"]};
          font-weight: 700 !important;
        }

        h2 {
          margin-bottom: 1rem;
        }


        table {
          border-color: ${theme.colors?.gray["3"]};
          border-width: 1px;
          border-style: solid;
          font-size: 0.75em;
          margin-bottom: ${theme.spacing?.xs};
        }

        .slidev-layout tr {
          border-color: ${theme.colors?.gray["3"]} !important;
        }

        .slidev-layout td, th {
          border-right-color: ${theme.colors?.gray["3"]};
          border-right-width: 1px;
          border-right-style: solid;
          font-size: 1em;
          padding: 0.5rem !important;
          padding-top: 0.5rem !important;
          padding-bottom: 0.5rem !important;
        }
          
        th {
          font-weight: 700 !important;
        }

        .slidev-layout blockquote {
          background: transparent !important;
          border-left-width: 3px !important;
          border-left-color: ${theme.colors?.gray["2"]} !important;
          color: ${theme.colors?.gray["5"]} !important;
          border-radius: 0px !important;
          font-size: 1em !important;
        } 
      `,
    },
  ],
});
