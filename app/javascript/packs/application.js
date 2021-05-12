// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap'
import '../stylesheets/application'
import "chartkick/chart.js"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


const state = {
  page: 0
}

document.addEventListener("turbolinks:load", function() {
  window.addEventListener('scroll', (e) => {
    const { scrollHeight, scrollTop, clientHeight } = document.documentElement
    if(scrollTop + clientHeight > scrollHeight - 5){
      setTimeout(() => {
        state.page += 1
        getPosts()
      }, 2000)
    }
  })
})

function getPosts(){
  const container = document.querySelector('.main-wrapper')

  fetch(`/posts/page/${state.page}`, {
    method: 'GET',
    headers: {
        'Accept': 'text/html',
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
    }
  })
  .then(data => data.text())
  .then(html => {
    if (html !== '') {
      const row = document.createElement('div')
      row.className = 'row'
      row.innerHTML = html
      container.appendChild(row)
    }
  })
  .catch(console.error)
}
