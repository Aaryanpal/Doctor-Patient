import { Application } from "@hotwired/stimulus"
import Dialog from '@stimulus-components/dialog'
import Chart from '@stimulus-components/chartjs'


const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application
application.register('dialog', Dialog)
application.register('chart', Chart)
export { application }
