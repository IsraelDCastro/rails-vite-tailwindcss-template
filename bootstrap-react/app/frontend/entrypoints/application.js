import "./main.scss";
import "@popperjs/core";
import "bootstrap";

import React, {createElement} from 'react';
import { createRoot } from 'react-dom/client';
import App from '@/components/views/home';

const domContainer = document.querySelector('#home');
const root = createRoot(domContainer);
root.render(createElement(App));
