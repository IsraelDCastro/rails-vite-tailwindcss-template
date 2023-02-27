### Changes in Febrary 2023

##### 27/02/2023
- `image_processing` was removed, it was `ruby_vips` instead in each templates..
- Change the active_storage config from `ImageMagick` to `Vips` as default.

##### 08/02/2023
- devise and name_of_person gems were added by default for Bulma template.
- Other changes.

### Changes in January 2023

##### 31/01/2023
- devise and name_of_person gems were added by default for Bootstrap template.
- Other changes.

##### 05/01/2023
- devise and name_of_person gems were added by default for Tailwind CSS template.
- _form.scss was added for Tailwind CSS template.
- Other changes.

### Changes in November 2022

- Added a missing gem `turbo-rails` to add turbo_frame tags functionality. Also, I forgot to initialize `window.Turbo from import { Turbo } from "@hotwired/turbo-rails";` in order of turbo_frame works correctly. 
- Some files were changed and fixed because some lines were duplicated.
- Added the option to add hotwired and stimulus when creating a new project. This is optional.
- Some rules of prettier and eslint were added to the eslintrc.json file.