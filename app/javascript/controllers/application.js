// app/javascript/controllers/application_controller.js
import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    this.setCSRFToken()
  }

  setCSRFToken() {
    const token = document.querySelector('meta[name="csrf-token"]').content
    if (token) {
      // CSRFトークンをリクエストヘッダーに設定
      document.querySelectorAll('form').forEach(form => {
        form.setAttribute('data-csrf-token', token)
      })
      // 他のAJAXリクエストにもCSRFトークンを設定する場合、以下のように
      // 例: fetchのヘッダーに追加する場合
      fetch.defaults.headers['X-CSRF-Token'] = token
    }
  }
}
