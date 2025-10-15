// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import { getFirestore } from "firebase/firestore";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyDM3zWo03qPDa-WC4BBdKGzaVk5fblJqDg",
  authDomain: "hobbi-project.firebaseapp.com",
  projectId: "hobbi-project",
  storageBucket: "hobbi-project.firebasestorage.app",
  messagingSenderId: "381956448123",
  appId: "1:381956448123:web:d5645e21bd8e0097d827de",
  measurementId: "G-9BQYSWMGP3"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
const db = getFirestore(app);

export { db };