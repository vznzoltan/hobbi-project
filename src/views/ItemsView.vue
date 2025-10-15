<template>
  <div class="items-container">
    <h1>Item-ek</h1>
    
    <button @click="showAddForm = true" class="btn">
      Új item hozzáadása
    </button>

    <div v-if="loading">Betöltés...</div>
    <div v-if="error" class="error">{{ error }}</div>

    <div v-if="!loading && !error" class="items-list">
      <div v-if="items.length === 0">
        <p>Nincsenek item-ek</p>
      </div>
      
      <div v-else>
        <div v-for="item in items" :key="item.id" class="item">
          <h3>{{ item.title }}</h3>
          <p>{{ item.description }}</p>
          <button @click="editItem(item)">Szerkesztés</button>
          <button @click="deleteItem(item.id)">Törlés</button>
        </div>
      </div>
    </div>

    <div v-if="showAddForm || editingItem" class="modal">
      <ItemForm 
        :item="editingItem"
        @save="handleSave"
        @cancel="closeModal"
      />
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { itemsService } from '../services/itemsService.js';
import ItemForm from '../components/ItemForm.vue';

const items = ref([]);
const loading = ref(false);
const error = ref('');
const showAddForm = ref(false);
const editingItem = ref(null);

// Item-ek betöltése
const loadItems = async () => {
  loading.value = true;
  error.value = '';
  try {
    items.value = await itemsService.getAllItems();
  } catch (err) {
    error.value = 'Hiba történt az item-ek betöltésekor';
  } finally {
    loading.value = false;
  }
};

// Item szerkesztése
const editItem = (item) => {
  editingItem.value = { ...item };
  showAddForm.value = false;
};

// Item törlése
const deleteItem = async (itemId) => {
  if (confirm('Biztosan törölni szeretnéd ezt az item-et?')) {
    try {
      await itemsService.deleteItem(itemId);
      await loadItems(); // Lista frissítése
    } catch (err) {
      error.value = 'Hiba történt az item törlésekor';
      console.error(err);
    }
  }
};

// Item mentése
const handleSave = async (itemData) => {
  try {
    if (editingItem.value) {
      // Szerkesztés
      await itemsService.updateItem(editingItem.value.id, itemData);
    } else {
      // Új item
      await itemsService.createItem(itemData);
    }
    await loadItems(); // Lista frissítése
    closeModal();
  } catch (err) {
    error.value = 'Hiba történt az item mentésekor';
    console.error(err);
  }
};

// Modal bezárása
const closeModal = () => {
  showAddForm.value = false;
  editingItem.value = null;
};


// Komponens betöltésekor
onMounted(() => {
  loadItems();
});
</script>

<style scoped>
.items-container {
  padding: 20px;
}

.btn {
  padding: 10px 20px;
  margin: 10px 0;
  background-color: #42b883;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.error {
  color: red;
  background-color: #ffe6e6;
  padding: 10px;
  border-radius: 4px;
  margin: 10px 0;
}

.item {
  border: 1px solid #ddd;
  padding: 15px;
  margin: 10px 0;
  border-radius: 4px;
}

.item button {
  margin: 5px;
  padding: 5px 10px;
  background-color: #6c757d;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.modal {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: white;
  padding: 20px;
  border: 1px solid #ddd;
  border-radius: 4px;
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}
</style>
