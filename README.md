This is a rails template with <a href="https://vuejs.org/" target="_blank">VueJS</a> and <a href="https://vitejs.dev/" target="_blank">ViteJS</a> as roll up. Also you can choose between CSS Frameworks as: <a href="https://tailwindcss.com/" target="_blank">Tailwind CSS</a>, <a href="https://getbootstrap.com/" target="_blank">Bootstrap</a>, or <a href="https://bulma.io/" target="_blank">Bulma</a>.



This is the best option to start a project with Rails 7 + Vue 3 + Vite + Tailwind CSS. You can make a fast project and start working on it without any problem. Now you can choose between Tailwind CSS, Bootstrap or Bulma.

Now you have the option to start de project with <a href="https://reactjs.org/" target="_blank">React JS (18)</a>, with the preference of choosing different CSS Frameworks.

This template starts with Active Storage by default when you create it. If you don't want, just remove it.

### JS Frameworks

- `VueJS 3` to start a project with Vue just add the flag `--vue` to command line.
- `ReactJS 18` to start a project with Vue just add the flag `--react` to command line.

### CSS Frameworks

- `template.rb` has <a href="https://tailwindcss.com/" target="_blank">Tailwind CSS</a> as default Framework CSS. [Start](https://github.com/IsraelDCastro/rails-vite-tailwindcss-template#tailwindcss)
- `template_bootstrap.rb.rb` has <a href="https://getbootstrap.com/" target="_blank">Bootstrap</a> 5 as default Framework CSS. [Start](https://github.com/IsraelDCastro/rails-vite-tailwindcss-template#bootstrap)
- `template_bulma.rb.rb` has <a href="https://bulma.io/" target="_blank">Bulma</a> as default Framework CSS. [Start](https://github.com/IsraelDCastro/rails-vite-tailwindcss-template#bulma)

## Installation

I use the flags `--skip-webpack-install --skip-javascript` to prevent installing webpack or esBuild to avoid conflicts with ViteJS⚡️.

## <a name="tailwindcss"></a>[Rails 7 + Vue 3 + ViteJS + Tailwind CSS](#tailwindcss)

##### From GitHub with vue

```bash
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m https://raw.githubusercontent.com/IsraelDCastro/rails-vite-tailwindcss-template/master/template.rb --vue
```

##### Making a git clone of the project with vue

```bash
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m template.rb --vue
```

## <a name="tailwindcss"></a>[Rails 7 + ReactJS 18 + ViteJS + Tailwind CSS](#tailwindcss)

##### From GitHub with react

```bash
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m https://raw.githubusercontent.com/IsraelDCastro/rails-vite-tailwindcss-template/master/template.rb --react
```

##### Making a git clone of the project with react

```bash
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m template.rb --react
```

Just be sure to be inside the project when you run the command, from outside be sure to put the correct file direction.

### Default dependencies

> - autoprefixer
> - postcss
> - sass
> - tailwindcss
> - vite
> - vue (Only with flag `--vue`)
> - react (Only with flag `--react`)
> - react-dom (Only with flag `--react`)

## <a name="bootstrap"></a>[Rails 7 + Vue 3 + ViteJS + Bootstrap 5](#bootstrap)

##### From GitHub with vue

```bash
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m https://raw.githubusercontent.com/IsraelDCastro/rails-vite-tailwindcss-template/master/template_bootstrap.rb --vue
```

##### Making a git clone of the project with vue

```bash
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m template_bootstrap.rb --vue
```

## <a name="bootstrap"></a>[Rails 7 + ReactJS 18 + ViteJS + Bootstrap 5](#bootstrap)

##### From GitHub with react

```bash
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m https://raw.githubusercontent.com/IsraelDCastro/rails-vite-tailwindcss-template/master/template_bootstrap.rb --react
```

##### Making a git clone of the project with react

```bash
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m template_bootstrap.rb --react
```

Just be sure to be inside the project when you run the command, from outside be sure to put the correct file direction.

> - autoprefixer
> - postcss
> - sass
> - bootstrap
> - @popperjs/core
> - vite
> - vue (Only with flag `--vue`)
> - react (Only with flag `--react`)
> - react-dom (Only with flag `--react`)

## <a name="bulma"></a>[Rails 7 + Vue 3 + ViteJS + Bulma](#bulma)

##### From GitHub with vue

```bash
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m https://raw.githubusercontent.com/IsraelDCastro/rails-vite-tailwindcss-template/master/template_bulma.rb --vue
```

##### Making a git clone of the project with vue

```bash
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m template_bulma.rb --vue
```

## <a name="bulma"></a>[Rails 7 + ReactJS 18 + ViteJS + Bulma](#bulma)

##### From GitHub with react

```bash
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m https://raw.githubusercontent.com/IsraelDCastro/rails-vite-tailwindcss-template/master/template_bulma.rb --react
```

##### Making a git clone of the project with react

```bash
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m template_bulma.rb --react
```

Just be sure to be inside the project when you run the command, from outside be sure to put the correct file direction.

> - autoprefixer
> - postcss
> - sass
> - bulma
> - vite
> - vue (Only with flag `--vue`)
> - react (Only with flag `--react`)
> - react-dom (Only with flag `--react`)

### Default dev dependencies

> - @vitejs/plugin-vue (Only with flag `--vue`)
> - @vue/compiler-sfc (Only with flag `--vue`)
> - eslint
> - eslint-plugin-tailwindcss (Only the template with Tailwind CSS has this package).
> - eslint-plugin-vue (Only with flag `--vue`)
> - path
> - vite-plugin-full-reload
> - vite-plugin-ruby
> - @vitejs/plugin-react-refresh (Only with flag `--react`)
> - eslint-plugin-react (Only with flag `--react`)

### Default gems

> - gem "vite_rails"
> - gem "vite_ruby"
> - gem "image_processing", "~> 1.2"
> - gem "annotate", group: :development

### Thank you ⭐️

If you have any questions, just make an issue, I'll answer you as soon as possible.
