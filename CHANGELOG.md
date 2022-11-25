### Changes in November 2022

- Added a missing gem `turbo-rails` to add turbo_frame tags functionality. Also, I forgot to initialize `window.Turbo from import { Turbo } from "@hotwired/turbo-rails";` in order of turbo_frame works correctly. 
- Some files were changed and fixed because some lines were duplicated.
- Added the option to add hotwired and stimulus when creating a new project. This is optional.
- Some rules of prettier and eslint were added to the eslintrc.json file.