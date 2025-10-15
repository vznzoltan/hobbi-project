import { 
  collection, 
  addDoc, 
  getDocs, 
  doc, 
  updateDoc, 
  deleteDoc, 
  query, 
  orderBy 
} from 'firebase/firestore';
import { db } from '../firebase.js';

const COLLECTION_NAME = 'items';

export const itemsService = {
  // Új item hozzáadása
  async createItem(itemData) {
    try {
      const docRef = await addDoc(collection(db, COLLECTION_NAME), {
        ...itemData,
        createdAt: new Date(),
        updatedAt: new Date()
      });
      return { id: docRef.id, ...itemData };
    } catch (error) {
      console.error('Hiba az item hozzáadásakor:', error);
      throw error;
    }
  },

  // Összes item lekérése
  async getAllItems() {
    try {
      const q = query(collection(db, COLLECTION_NAME), orderBy('createdAt', 'desc'));
      const querySnapshot = await getDocs(q);
      const items = [];
      querySnapshot.forEach((doc) => {
        items.push({ id: doc.id, ...doc.data() });
      });
      return items;
    } catch (error) {
      console.error('Hiba az item-ek lekérésekor:', error);
      throw error;
    }
  },

  // Item frissítése
  async updateItem(itemId, itemData) {
    try {
      const itemRef = doc(db, COLLECTION_NAME, itemId);
      await updateDoc(itemRef, {
        ...itemData,
        updatedAt: new Date()
      });
      return { id: itemId, ...itemData };
    } catch (error) {
      console.error('Hiba az item frissítésekor:', error);
      throw error;
    }
  },

  // Item törlése
  async deleteItem(itemId) {
    try {
      await deleteDoc(doc(db, COLLECTION_NAME, itemId));
      return true;
    } catch (error) {
      console.error('Hiba az item törlésekor:', error);
      throw error;
    }
  }
};
