# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "chartkick", to: "chartkick.js"
pin "Chart.bundle", to: "Chart.bundle.js"
pin "sweetalert2" # @11.14.5
# config/importmap.rb
pin "date-fns", to: "https://ga.jspm.io/npm:date-fns@2.29.3/esm/index.js"
# config/importmap.rb
pin "flatpickr", to: "https://ga.jspm.io/npm:flatpickr@4.6.13/dist/flatpickr.js"
pin "flatpickr/dist/l10n/pt", to: "https://ga.jspm.io/npm:flatpickr@4.6.13/dist/l10n/pt.js"
