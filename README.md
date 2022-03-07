<h1 align="center">Rails 7 + Vue 3 + ViteJS + Tailwind CSS</h1>

This is a rails template with <a href="https://vuejs.org/" target="_blank">VueJS</a> and <a href="https://vitejs.dev/" target="_blank">ViteJS</a> as roll up. Also it has <a href="https://tailwindcss.com/" target="_blank">Tailwind CSS</a>.

This is the best option to start a project with Rails 7 + Vue 3 + Vite + Tailwind CSS. You can make a fast project and start working on it without any problem.

This template starts with Active Storage by default when you create it. If you don't want, just remove it.

### Framework CSS

`template.rb` has Tailwind CSS as default Framework CSS.

[comment]: <> (`template_bootstrap.rb` working on it.)

### Installation

I use the flags `--skip-webpack-install --skip-javascript` to prevent installing webpack or esBuild to avoid conflicts with ViteJS⚡️.

##### From GitHub

```bash
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m https://raw.githubusercontent.com/IsraelDCastro/rails-vite-tailwindcss-template/master/template.rb
```

##### Making a git clone of the project

```bash
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m template.rb
```
Just be sure to be inside the project when you run the command, from outside be sure to put the correct file direction.

### Default dependencies

> - autoprefixer
> - postcss
> - sass
> - tailwindcss
> - vite
> - vue

### Default dev dependencies

> - @vitejs/plugin-vue
> - @vue/compiler-sfc
> - eslint
> - eslint-plugin-tailwindcss
> - eslint-plugin-vue
> - path
> - vite-plugin-full-reload
> - vite-plugin-ruby

### Default gems

> - gem "vite_rails"
> - gem "vite_ruby"
> - gem "image_processing", "~> 1.2"
> - gem "annotate", group: :development

### Thank you ⭐️

If you have any questions, just make an issue, I'll answer you as soon as possible.
