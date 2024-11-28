# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@stimulus-components/dialog", to: "@stimulus-components--dialog.js" # @1.0.1
pin "@rails/request.js", to: "@rails--request.js.js" # @0.0.11
pin "@stimulus-components/chartjs", to: "@stimulus-components--chartjs.js" # @6.0.1
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@kurkle/color", to: "@kurkle--color.js" # @0.3.4
pin "chart.js", to: "https://ga.jspm.io/npm:chart.js@4.2.1/dist/chart.js"
