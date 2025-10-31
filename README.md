This is a rails template with <a href="https://vuejs.org/" target="_blank">VueJS</a> and <a href="https://vitejs.dev/" target="_blank">ViteJS</a> as roll up. Also you can choose between CSS Frameworks as: <a href="https://tailwindcss.com/" target="_blank">Tailwind CSS</a>, <a href="https://getbootstrap.com/" target="_blank">Bootstrap</a>, or <a href="https://bulma.io/" target="_blank">Bulma</a>.

This is the best option to start a project with Ruby on Rails 7 or 8 + Vite. You can make a fast project and start working on it without any problem. Now you can choose between Tailwind CSS, Bootstrap or Bulma.

Now you have the option to start the project with <a href="https://react.dev/" target="_blank">React JS (19)</a>, with the preference of choosing different CSS Frameworks.

This template starts with Active Storage by default when you create it. If you don't want, just remove it.

### JS Frameworks

- To start a project without Vue or React just add the flag `--normal` to command line.
- `VueJS 3` to start a project with Vue just add the flag `--vue` to command line.
- `ReactJS 19` to start a project with React just add the flag `--react` to command line.

### CSS Frameworks

- `template.rb` has <a href="https://tailwindcss.com/" target="_blank">Tailwind CSS</a> as default Framework CSS. [Start](https://github.com/IsraelDCastro/rails-vite-tailwindcss-template#rails-tailwind-css-template)
- `template_bootstrap.rb` has <a href="https://getbootstrap.com/" target="_blank">Bootstrap</a> 5 as default Framework CSS. [Start](https://github.com/IsraelDCastro/rails-vite-tailwindcss-template/blob/master/README_BOOTSTRAP.md#rails-bootstrap-template)
- `template_bulma.rb` has <a href="https://bulma.io/" target="_blank">Bulma</a> as default Framework CSS. [Start](https://github.com/IsraelDCastro/rails-vite-tailwindcss-template/blob/master/README_BULMA.md#rails-bulma-template)

# Rails Tailwind CSS Template

## Installation

Make sure you have `vips` in your brew list, or run `brew install vips`.

When you generate the application:

- **Rails 7**: use `--skip-webpack-install --skip-javascript` to avoid conflicts with ViteJS⚡️.
- **Rails 8**: only `--skip-javascript` is needed because webpack/esbuild is no longer part of the default stack.

## Ruby on Rails 7/8 + ViteJS + Tailwind CSS

##### From GitHub without Vue or React

```bash
# Rails 7
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m https://raw.githubusercontent.com/IsraelDCastro/rails-vite-tailwindcss-template/master/template.rb --normal

# Rails 8
rails new my_app --skip-javascript -d <database_you_want> -m https://raw.githubusercontent.com/IsraelDCastro/rails-vite-tailwindcss-template/master/template.rb --normal
```

##### Making a git clone of the project without Vue or React

```bash
# Rails 7
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m template.rb --normal

# Rails 8
rails new my_app --skip-javascript -d <database_you_want> -m template.rb --normal
```
When you clone the repo just be sure to be inside the project when you run the command, from outside be sure to put the correct file direction.

## Ruby on Rails 7/8 + Vue 3 + ViteJS + Tailwind CSS

##### From GitHub with vue

```bash
# Rails 7
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m https://raw.githubusercontent.com/IsraelDCastro/rails-vite-tailwindcss-template/master/template.rb --vue

# Rails 8
rails new my_app --skip-javascript -d <database_you_want> -m https://raw.githubusercontent.com/IsraelDCastro/rails-vite-tailwindcss-template/master/template.rb --vue
```

##### Making a git clone of the project with vue

```bash
# Rails 7
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m template.rb --vue

# Rails 8
rails new my_app --skip-javascript -d <database_you_want> -m template.rb --vue
```
When you clone the repo just be sure to be inside the project when you run the command, from outside be sure to put the correct file direction.

## Ruby on Rails 7/8 + ReactJS 19 + ViteJS + Tailwind CSS

##### From GitHub with react

```bash
# Rails 7
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m https://raw.githubusercontent.com/IsraelDCastro/rails-vite-tailwindcss-template/master/template.rb --react

# Rails 8
rails new my_app --skip-javascript -d <database_you_want> -m https://raw.githubusercontent.com/IsraelDCastro/rails-vite-tailwindcss-template/master/template.rb --react
```

##### Making a git clone of the project with react

```bash
# Rails 7
rails new my_app --skip-webpack-install --skip-javascript -d <database_you_want> -m template.rb --react

# Rails 8
rails new my_app --skip-javascript -d <database_you_want> -m template.rb --react
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
### Minimum recommended versions

- Ruby >= 3.1
- Node.js >= 18 (recommended 20+)
- Bun >= 1.0 if you choose `--package-manager=bun`
- ### Optional flags

- `--skip-devise`: does not install Devise or generate the `User` model. Skips permitted parameters injection and `name_of_person`.
- `--skip-active-storage`: does not install Active Storage or set `variant_processor = :vips`. Skips the `ruby-vips` dependency.
- `--package-manager=bun|yarn|npm|pnpm`: selects the package manager (default `bun`).

### Troubleshooting

- VIPS not installed: `brew install vips` (macOS) or `apt-get install libvips` (Ubuntu).
- Ports in use: Vite uses 3036/5173 depending on config; Rails 3000. Change ports or stop processes using those ports.
- CSP in production: if you use a strict CSP, allow origins for assets served by Vite and adjust `config/environments/production.rb`.

### CSP and Vite (production and development)

Rails includes a default CSP policy. If you enable a strict CSP, make sure to allow loading assets generated by Vite:

`config/initializers/content_security_policy.rb` (example):

```ruby
Rails.application.config.content_security_policy do |policy|
  policy.default_src :self
  policy.font_src    :self, :data, :https
  policy.img_src     :self, :data, :https
  policy.object_src  :none
  policy.script_src  :self, :https
  policy.style_src   :self, :https, :unsafe_inline

  # In production, serve assets from the public path (Vite build)
  # and allow hotlinking to CDNs if you use them.
end

# Allow 'unsafe-eval' in dev if needed for Vite HMR
if Rails.env.development?
  Rails.application.config.content_security_policy do |policy|
    policy.script_src :self, :https, :unsafe_eval
    # If Vite runs on localhost:5173
    policy.connect_src :self, "http://localhost:5173", "ws://localhost:5173"
  end
end
```

In production, you don't need HMR ports; just ensure precompiled assets are allowed by CSP.
