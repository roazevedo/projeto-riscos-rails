// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
window.bootstrap = bootstrap
import "chartkick"
import "Chart.bundle"
import Swal from 'sweetalert2'
window.Swal = Swal;
