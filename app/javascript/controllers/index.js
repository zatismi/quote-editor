// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import CarouselController from "./carousel_controller"
application.register("carousel", CarouselController)

import ColorThemeController from "./color_theme_controller"
application.register("color-theme", ColorThemeController)

import RemovalsController from "./removals_controller"
application.register("removals", RemovalsController)

import ToastController from "./toast_controller"
application.register("toast", ToastController)
