import { defineConfig } from "vite";
import * as path from "path";
import FullReload from "vite-plugin-full-reload";
import RubyPlugin from "vite-plugin-ruby";

export default defineConfig({
  plugins: [
    RubyPlugin(),
    FullReload(["config/routes.rb", "app/views/**/*"], { delay: 250 }),
  ],
  resolve: {
    alias: [
      {
        find: "@/lib",
        replacement: path.resolve(__dirname, "./app/frontend/components/lib/")
      },
      {
        find: "@/components",
        replacement: path.resolve(__dirname, "./app/frontend/components/")
      },
      {
        find: "@/entrypoints",
        replacement: path.resolve(__dirname, "./app/frontend/entrypoints")
      }
    ]
  },
})
