import { Application } from "@hotwired/stimulus"
import Dialog from '@stimulus-components/dialog'
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application
application.register('dialog', Dialog)
export { application }
