import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react-swc'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    proxy: {
      "/app/": {
        target: "http://localhost:4000",
        secure: false,
        ws: true,
      },
      "/api/": {
        target: "http://localhost:4000",
        secure: false,
        ws: true,
      },
    },
  },
  base: process.env.NODE_ENV === "production" ? "/pwa/" : "/"
})
