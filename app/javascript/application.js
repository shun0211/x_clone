// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false // Disable Turbo Drive
import "controllers"
// import * as bootstrap from "bootstrap"
// import './src/likes'