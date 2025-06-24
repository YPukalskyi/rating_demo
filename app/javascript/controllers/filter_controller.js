import { Controller } from "@hotwired/stimulus"

// Connects to data-controller='filter'
export default class extends Controller {
  static targets = ['form', 'target', 'source']

  connect() {
    this.prepareTerm()
  }

  handleSearchField(event) {
    let enterPressed = event.key == 'Enter' || event.keyCode == 13

    if (enterPressed) {
      this.filter()
    } else {
      this.prepareTerm()
    }
  }

  prepareTerm() {
    this.targetTarget.value = this.sourceTarget.value
  }

  filter() {
    this.formTarget.requestSubmit()
  }
}
