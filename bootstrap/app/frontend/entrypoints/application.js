import "./main.scss";
import "@popperjs/core";
import "bootstrap"

import { createApp } from 'vue';
import Home from "../components/views/Home.vue";

if (document.querySelector('#home')) {
  const home = createApp(Home);
  home.mount('#home');
}