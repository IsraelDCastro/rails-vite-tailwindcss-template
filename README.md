This is a rails template with <a href="https://vuejs.org/" target="_blank">VueJS</a> and <a href="https://vitejs.dev/" target="_blank">ViteJS</a> as roll up. Also you can choose between CSS Frameworks as: <a href="https://tailwindcss.com/" target="_blank">Tailwind CSS</a>, <a href="https://getbootstrap.com/" target="_blank">Bootstrap</a>, or <a href="https://bulma.io/" target="_blank">Bulma</a>.

This is the best option to start a project with Rails 7 + Vite. You can make a fast project and start working on it without any problem. Now you can choose between Tailwind CSS, Bootstrap or Bulma.

Now you have the option to start the project with <a href="https://reactjs.org/" target="_blank">React JS (18)</a>, with the preference of choosing different CSS Frameworks.

This template starts with Active Storage by default when you create it. If you don't want, just remove it.

### JS Frameworks

- To start a project without Vue or React just add the flag `--normal` to command line.
- `VueJS 3` to start a project with Vue just add the flag `--vue` to command line.
- `ReactJS 18` to start a project with Vue just add the flag `--react` to command line.

### CSS Frameworks

- `template.rb` has <a href="https://tailwindcss.com/" target="_blank">Tailwind CSS</a> as default Framework CSS. [Start](https://github.com/IsraelDCastro/rails-vite-tailwindcss-template#rails-tailwind-css-template)
- `template_bootstrap.rb` has <a href="https://getbootstrap.com/" target="_blank">Bootstrap</a> 5 as default Framework CSS. [Start](https://github.com/IsraelDCastro/rails-vite-tailwindcss-template/blob/master/README_BOOTSTRAP.md#rails-bootstrap-template)
- `template_bulma.rb` has <a href="https://bulma.io/" target="_blank">Bulma</a> as default Framework CSS. [Start](https://github.com/IsraelDCastro/rails-vite-tailwindcss-template/blob/master/README_BULMA.md#rails-bulma-template)

# Rails Tailwind CSS Template

## Installation

Make sure you have `vips` in your brew list, or run `brew install vips`.

I use the flags `--skip-webpack-install --skip-javascript` to prevent installing webpack or esBuild to avoid conflicts with ViteJS⚡️.

## Rails 7 + ViteJS + Tailwind CSS

##### From GitHub without Vue or React

```bash
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m https://raw.githubusercontent.com/IsraelDCastro/rails-vite-tailwindcss-template/master/template.rb --normal
```

##### Making a git clone of the project without Vue or React

```bash
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m template.rb --normal
```
When you clone the repo just be sure to be inside the project when you run the command, from outside be sure to put the correct file direction.

## Rails 7 + Vue 3 + ViteJS + Tailwind CSS

##### From GitHub with vue

```bash
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m https://raw.githubusercontent.com/IsraelDCastro/rails-vite-tailwindcss-template/master/template.rb --vue
```

##### Making a git clone of the project with vue

```bash
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m template.rb --vue
```
When you clone the repo just be sure to be inside the project when you run the command, from outside be sure to put the correct file direction.

## Rails 7 + ReactJS 18 + ViteJS + Tailwind CSS

##### From GitHub with react

```bash
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m https://raw.githubusercontent.com/IsraelDCastro/rails-vite-tailwindcss-template/master/template.rb --react
```

##### Making a git clone of the project with react

```bash
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m template.rb --react
```
When you clone the repo just be sure to be inside the project when you run the command, from outside be sure to put the correct file direction.

## Add Hotwired + Stimulus

To use and add Hotwired + Stimulus to the project you have to add the flag `--hotwired` when you run the command to create the project. When you add the flag `--hotwired`, a `generators` folder will be copied into `lib` folder, so when you run `rails g stimulus controllerName`, when the file is created, it will appear in the `frontend/controllers` folder.

And that is all, now you will have `Hotwired + Stimulus` installed in your project.

### Package manager

By default, templates use `bun` as the package manager. You can override with the flag `--package-manager=yarn|npm|pnpm|bun`.

Examples with Bun:

> - Install: `bun install`
> - Add dev deps: `bun add -d eslint prettier`
> - Run executables: `bunx <pkg>`

### Default dependencies

> - autoprefixer
> - postcss
> - tailwindcss
> - vite
> - vue (Only with flag `--vue`)
> - react (Only with flag `--react`)
> - react-dom (Only with flag `--react`)
> - @hotwired/stimulus (Only with flag `--hotwired`)
> - @hotwired/turbo-rails (Only with flag `--hotwired`)

---

### Default dev dependencies

> - @vitejs/plugin-vue (Only with flag `--vue`)
> - @vue/compiler-sfc (Only with flag `--vue`)
> - eslint
> - eslint-plugin-tailwindcss (Only the template with Tailwind CSS has this package).
> - eslint-plugin-vue (Only with flag `--vue`)
> - path
> - prettier
> - eslint-plugin-prettier
> - eslint-config-prettier
> - vite-plugin-full-reload
> - vite-plugin-ruby
> - @vitejs/plugin-react (Only with flag `--react`)
> - eslint-plugin-react (Only with flag `--react`)

### Default gems

> - gem "vite_rails"
> - gem "ruby-vips", ">= 2.1.4"
> - gem "annotate", group: :development
> - gem 'devise' 
> - gem 'name_of_person'
> - gem "stimulus-rails" (Only with flag `--hotwired`)

### Thank you ⭐️

If you have any questions, just make an issue, I'll answer you as soon as possible.
### Versions mínimas recomendadas

- Ruby >= 3.1
- Node.js >= 18 (recomendado 20+)
- Bun >= 1.0 si eliges `--package-manager=bun`
- ### Optional flags

- `--skip-devise`: no instala Devise ni genera el modelo `User`. Omite la inyección de parámetros permitidos y `name_of_person`.
- `--skip-active-storage`: no instala Active Storage ni configura `variant_processor = :vips`. Omite la dependencia `ruby-vips`.
- `--package-manager=bun|yarn|npm|pnpm`: selecciona el gestor de paquetes (por defecto `bun`).

### Troubleshooting

- VIPS no instalado: `brew install vips` (macOS) o `apt-get install libvips` (Ubuntu).
- Puertos en uso: Vite usa 3036/5173 según config; Rails 3000. Cambia puertos o cierra procesos ocupando los puertos.
- CSP en producción: si usas CSP estricta, permite orígenes para assets servidos por Vite y ajusta `config/environments/production.rb`.

### CSP y Vite (producción y desarrollo)

Rails incluye una política CSP por defecto. Si activas una CSP estricta, asegúrate de permitir la carga de assets generados por Vite:

`config/initializers/content_security_policy.rb` (ejemplo):

```ruby
Rails.application.config.content_security_policy do |policy|
  policy.default_src :self
  policy.font_src    :self, :data, :https
  policy.img_src     :self, :data, :https
  policy.object_src  :none
  policy.script_src  :self, :https
  policy.style_src   :self, :https, :unsafe_inline

  # En producción, sirve assets desde la ruta pública (Vite build)
  # y permite hotlinking a CDNs si los usas.
end

# Permitir 'unsafe-eval' en dev si es necesario para Vite HMR
if Rails.env.development?
  Rails.application.config.content_security_policy do |policy|
    policy.script_src :self, :https, :unsafe_eval
    # Si Vite corre en localhost:5173
    policy.connect_src :self, "http://localhost:5173", "ws://localhost:5173"
  end
end
```

En producción, no necesitas puertos de HMR; sólo asegúrate que los assets precompilados estén permitidos por CSP.
