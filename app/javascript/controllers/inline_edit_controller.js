import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["name", "form", "input"]

    connect() {
        this.nameTarget.addEventListener("click", this.edit.bind(this))
    }

    edit() {
        this.nameTarget.classList.add("hidden")
        this.formTarget.classList.remove("hidden")
        this.inputTarget.focus()
    }

    save(event) {
        event.preventDefault()
        this.formTarget.submit()
    }
}