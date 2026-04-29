import { defineConfig } from 'vite'

export default defineConfig({
  slidev: {
    markdown: {
      markdownItOptions: {
        linkify: false,
      },
    },
  },
})