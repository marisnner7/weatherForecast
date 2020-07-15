import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Find your city here", "Forecast for the next 10 days"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };