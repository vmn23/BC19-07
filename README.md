# PfindRX

PfindRX is a platform that helps users navigate the confusing world of over-the-counter medications by identifying the drugs they see on the shelf, and presenting the medications in an e-commerce style way.

# Architecture

The platform is split into two components: a backend that identifies medications in an image, and a mobile app that is the sole interface to the backend.

The backend is written in Node.js and Python, using Express.js to serve the app, and OpenCV to perform the recognition. The backend is deployed to Heroku, and is live at [https://ct-tech-pirates.herokuapp.com](https://ct-tech-pirates.herokuapp.com)

The frontend is written in Flutter, a cross-platform native mobile app development framework.

## Installation & Usage

In order to test the mobile app, Flutter and Android Studio must be installed. This can be done by following the official Flutter guide found [here.](https://flutter.dev/docs/get-started/install)

Once Flutter is installed, launch Android Stduio, pointing it to the frontend directory of this repo. Ensure that an Android emulator is available, and simply hit "run" to build and run the emulator.
